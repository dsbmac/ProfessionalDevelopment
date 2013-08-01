//The MIT License (MIT) - See Licence.txt for details

//Copyright (c) 2013 Mick Grierson, Matthew Yee-King, Marco Gillies

import org.jbox2d.util.nonconvex.*;
import org.jbox2d.dynamics.contacts.*;
import org.jbox2d.testbed.*;
import org.jbox2d.collision.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.p5.*;
import org.jbox2d.dynamics.*;


// Globals
int WIDTH = 1024;
int HEIGHT = 768;
int REVERSE_Y = -1;
int ASTEROID_INTERVAL = 20;
int ASTEROID_SPAWN_MARGIN = 8;
Vec2 SCREEN_CENTER = new Vec2(WIDTH/2, HEIGHT/2);
int EXPLOSION_SPEED = 1;
int MISSILE_SIZE = 5;
int ASTEROID_SIZE = 38;
Vec2 MISSILE_IMPULSE = new Vec2(20,0);
Vec2 ASTEROID_IMPULSE = new Vec2(10,0);
float MISSILE_IMPULSE_FACTOR = 20;
float ASTEROID_IMPULSE_FACTOR = 5;
float THRUST_FACTOR = 1;
int SHIP_RADIUS = 35;
Vec2 THRUSTER_IMPULSE = new Vec2(20, 0);
AABB aabb;

int time;
int score, shots = 0;
boolean started, trashDay;
PImage ballImage, debris_image, debris_image2, nebula_image, missile_image, asteroid_image,
 explosionImage;
ImageInfo asteroidInfo, missileInfo, explosionInfo;
// audio stuff
Maxim maxim;
AudioPlayer soundtrack, droidSound, wallSound, missileSound, explosionSound;
ArrayList<AudioPlayer> missileSounds = new ArrayList<AudioPlayer>();

Physics physics; // The physics handler: we'll see more of this later
// rigid bodies for the droid and two crates
Ship my_ship;
ArrayList<Sprite> missileGroup = new ArrayList<Sprite>();
ArrayList<Sprite> asteroidGroup = new ArrayList<Sprite>();
ArrayList<Sprite> explosionGroup = new ArrayList<Sprite>();
ArrayList<ArrayList<Sprite>> sprites = new ArrayList<ArrayList<Sprite>>(1);
ArrayList<Body> trash;
// a handler that will detect collisions
CollisionDetector detector; 

void setup() {
  size(WIDTH,HEIGHT);
  frameRate(60);
  time = 0;
  maxim = new Maxim(this);  
  init_physics();
  init_ship();    
  init_images();
  init_sounds();
  started = true;
}
// init helpers    
void init_images() {
  debris_image = loadImage("debris2_blue.png");  
  debris_image2 = loadImage("debris2_blue.png"); // this second image is for a seamless background
  nebula_image = loadImage("nebula_blue.png");
  missile_image = loadImage("shot2.png");
  explosionImage = loadImage("explosion_alpha.png");    
  explosionInfo = new ImageInfo(explosionImage, 20, 24, true);
  missileInfo = new ImageInfo(missile_image, MISSILE_SIZE, 0, false);
  asteroid_image = loadImage("asteroid_blue.png");
  asteroidInfo = new ImageInfo(asteroid_image, ASTEROID_SIZE, 0, false);
  ballImage = loadImage("tux_droid.png");  
}
void init_sounds() {
  maxim = new Maxim(this);
  soundtrack = maxim.loadFile("soundtrack.wav");
  soundtrack.cue(0);
  soundtrack.speed(0.1);
  soundtrack.play();
  missileSound = maxim.loadFile("missile.wav");
  missileSound.speed(1);  
  explosionSound = maxim.loadFile("explosion.wav");
  explosionSound.speed(0.1);
}
void init_ship() {    
  ImageInfo inf = new ImageInfo(loadImage("double_ship.png"), SHIP_RADIUS, 0, false);
  my_ship = new Ship(SCREEN_CENTER, new Vec2(0,0), 0, inf);
}
void init_physics() {
  physics = new Physics(this, width, height, 0, 0, width*1.2, height*1.2, width, height, 100);  
  physics.setCustomRenderingMethod(this, "myCustomRenderer");
  physics.setDensity(10.0);  
  physics.setBullet(true);
  detector = new CollisionDetector (physics, this);
  sprites.add(missileGroup);
  sprites.add(asteroidGroup);
  sprites.add(explosionGroup);
  THRUSTER_IMPULSE = physics.screenToWorld(THRUSTER_IMPULSE);
  trash = new ArrayList<Body>();
  trash.add(null);
  trash.add(null);
}
void draw_background() {
  Vec2 center = new Vec2(int(debris_image.width/2), int(debris_image.height/2));
  int wtime = int((time / 8) % center.x); 
  image(nebula_image, 0, 0, width, height);
  //fix wrap around
  image(debris_image, width/2+1.25*wtime, 0, width, height);
  image(debris_image2, 1.25*wtime-width/2, 0, 1.1*width, 1.1*height);
}
 
// Main drawing function
void draw() {
  time +=1;
  draw_background();
//  text("angle: " + (my_ship.getAngle()*180/PI) + ", pos:" + my_ship.getPosition() + "boundingBox: ", 20, 20);  
//  text("mouseX: " + mouseX + ", " + mouseY + ", worldX: " 
  //+ physics.screenToWorld(new Vec2(mouseX, mouseY)), 20, 40); 
  myCustomRenderer(physics.getWorld());
}
void myCustomRenderer(World world) {
  if (!trash.isEmpty()) {
    takeOutTrash(world);
  }
  my_ship.update(world);
  for (int i=0; i<sprites.size(); i++) {
    processSpriteGroup(sprites.get(i), world);
  }
  asteroidSpawner();
}
void collision(Body b1, Body b2, float impulse) {
  collectTrash(b1, b2, impulse);
}  


void keyPressed() {  
  if (key == CODED) {
      switch (keyCode) {
         case UP:
           my_ship.set_thrust(true);
           break;
         case LEFT:
           my_ship.turn(false);
           break;
         case RIGHT:
           my_ship.turn(true);
           break;                    
         default:
           break;
      }      
    } else {
      switch (key) {
        case ' ':
          my_ship.fire_missile();
        break;
        default:
          break;
      }
    }  
}
void keyReleased() {
  if (key == CODED) {
    switch (keyCode) {
       case UP:
         my_ship.set_thrust(false);
         break;
       default:
         break;
    }      
  }
}
void mouseClicked() {
  //spawnAsteroid(new Vec2(mouseX, mouseY));
  //void explode(Vec2 pos, Vec2 impulse, PImage explosionImage, ImageInfo explosionInfo) 
  explode(new Vec2(mouseX, mouseY), new Vec2(0,0), explosionImage, explosionInfo);
  
}


// Classes
class ImageInfo {
  PImage image;
  Vec2 center, size;
  int radius, lifespan;
  boolean animated;
  ImageInfo(PImage i, int rd, int ls, boolean ani) {
    image = i;    
    size = new Vec2(image.width, image.height);
    center = new Vec2(size.x/2, size.y/2);
    radius = rd;
    lifespan = ls;
    animated = ani;
  }
  PImage getImage() {
    return image;
  }
  Vec2 getCenter() {
    return center;
  }
  Vec2 getSize() {
    return size;
  }
  int getRadius() {
    return radius;
  }
  int getLifespan() {
    return lifespan;
  }
  boolean getAnimated() {
    return animated;
  }  
}
  
class Sprite {
  Body body;
  Vec2 screenPosition, worldPosition, impulse, frameSize;
  float angle, angle_velocity, age;
  int id;
  ImageInfo imageInfo;
  AudioPlayer sound;
  PImage image;
  Sprite(Vec2 pos, Vec2 imp, float ang, float ang_vel, ImageInfo info, AudioPlayer snd) {
    screenPosition = pos;        
    impulse = imp;
    angle = ang;
    angle_velocity = ang_vel;
    age = 0.0;
    imageInfo = info;
    image = info.getImage();
    if (info.animated) {
      frameSize = new Vec2(image.width/info.getLifespan(), image.height);  
    } else {
      frameSize = info.size;
    }    
    sound = snd; 
    sound.cue(0);
    sound.speed(1);
    sound.setLooping(false);
    //println("pos: " + screenPosition + ", radius: " + info.getRadius());
    body = physics.createCircle(screenPosition.x, screenPosition.y, info.getRadius());
    body.setAngle(angle);
    body.setAngularVelocity(ang_vel);
    //println("sprite_angVel: " + body.getAngularVelocity());
  }
  Vec2 getPosition() {
    return screenPosition;
  }
  float getAngle() {
    return angle;      
  }
  float getRadius() {
    return imageInfo.getRadius();      
  }  
  ImageInfo getImageInfo() {
    return imageInfo;      
  }
  void playSound() {
    sound.cue(0);
    sound.play();
  }  
  boolean update() {
    int spriteIndex = 1;
    if (imageInfo.animated) {            
      spriteIndex = int(age);            
      float xVal = (spriteIndex * image.width/imageInfo.lifespan) + image.width/2.0;
      float yVal = image.height/2;
      Vec2 screenposition = new Vec2(int(xVal), int(yVal));            
    }
    screenPosition = physics.worldToScreen(body.getWorldCenter()); 
    angle = physics.getAngle(body);        
    pushMatrix();
    translate(screenPosition.x, screenPosition.y);
    rotate(-angle);
    imageMode(CENTER);
    if (imageInfo.animated) {
      image(image.get(0 + int(spriteIndex*frameSize.x), 0, int(frameSize.x), int(frameSize.y)), 0, 0);
    } else {
      image(image.get(0, 0, int(imageInfo.getSize().x), int(imageInfo.getSize().y)), 0, 0);
    } 
    imageMode(CORNER);
    popMatrix();       
//    Vec2 tip = radian_vector(screenPosition, new Vec2(imageInfo.getRadius(), 0), angle);    
//    line(screenPosition.x, screenPosition.y, tip.x, tip.y);
    if (imageInfo.animated) {
      age += EXPLOSION_SPEED;
    } else {
      age +=1;
    }    
    return imageInfo.lifespan != 0 && age > imageInfo.lifespan;
  }
}  

//Ship class
class Ship {
  Vec2 position, vel, image_center, tip;
  float angle;
  PImage image;
  ImageInfo imageInfo;
  int angle_vel, radius;
  boolean thrust_status;
  AudioPlayer thrust_sound;
  int dist_flown;
  Body body;
  float SHIP_ANGLE_VEL = PI/20;
    
  // Constructor
  Ship(Vec2 p, Vec2 v, float a, ImageInfo inf) {
    position = p;
    vel = v;
    angle = a;
    angle_vel = 0;
    image = inf.image;
    imageInfo = inf;
    image_center = inf.getCenter();
    thrust_status = false;
    thrust_sound = maxim.loadFile("thrust.wav");
    thrust_sound.cue(0);
    thrust_sound.speed(1);
    radius = imageInfo.getRadius();
    dist_flown = 0;
    body = physics.createCircle(SCREEN_CENTER.x, SCREEN_CENTER.y, radius);    
    int crateSize = 70;  
    tip = radian_vector(position, new Vec2(radius,0), angle);
    //body = physics.createRect(SCREEN_CENTER.x, SCREEN_CENTER.y-crateSize, SCREEN_CENTER.x+crateSize, SCREEN_CENTER.y);
  }
  // Methods  
  boolean get_thrust_status() {
    return thrust_status;    
  }  
  Vec2 getPosition() {
    return position;      
  }
  float getAngle() {
    return angle;      
  }
  float getRadius() {
    return radius;      
  }  
  ImageInfo getImageInfo() {
    return imageInfo;      
  }  
  void set_image_center(Vec2 ctr) {
    image_center = ctr;      
  } 
  void turn(boolean right) {
    // !!! refactor to make the turn constant on/off instead of reacting to the keyboard    
    if (right) {      
      angle -= SHIP_ANGLE_VEL;
    } else {
      angle += SHIP_ANGLE_VEL;
    }
    body.setAngle(angle);      
  }  
  void fire_missile() {
    shots += 1;   
    Vec2 mPos = radian_vector(position, new Vec2(radius+MISSILE_SIZE+2, 0), angle);
    float angle = physics.getAngle(body);
    float angle_velocity = 0.0;   
    Sprite missile = new Sprite(mPos, MISSILE_IMPULSE, angle, angle_velocity, missileInfo, missileSound);
    missileGroup.add(missile);
    Vec2 bearing = radian_vector(missile.getPosition(), new Vec2(missile.getRadius(),0), missile.getAngle());
    apply_impulse(missile.body, bearing, MISSILE_IMPULSE_FACTOR);
    missileSound.cue(0);
    missileSound.play();
  }
  void apply_thrust() {      
    Vec2 bearing = radian_vector(my_ship.getPosition(), new Vec2(my_ship.getRadius(),0), my_ship.getAngle());
    ////println(THRUSTER_IMPULSE + ", " + new Vec2(my_ship.getRadius(),0));
    apply_impulse(body, bearing, 1);    
  }
  void set_thrust(boolean keyStatus) {      
    if (keyStatus) {      
      thrust_status = true;
      thrust_sound.play();
      apply_thrust();                  
    } else {
      image_center.x -= imageInfo.size.x;
      thrust_status = false;
      thrust_sound.stop();
      thrust_sound.cue(0);
    }
  }      
  void update(World world) {    
    // get the droids position and rotation from
    // the physics engine and then apply a translate 
    // and rotate to the image using those values
    // (then do the same for the crates)
    position = physics.worldToScreen(body.getWorldCenter()); 
    angle = physics.getAngle(body);        
    pushMatrix();
    translate(position.x, position.y);
    rotate(-angle);
    imageMode(CENTER);    
    image(image.get(0, 0, int(imageInfo.getSize().x/2), int(imageInfo.getSize().y)), 0, 0);
    imageMode(CORNER);
    popMatrix();       
//    tip = radian_vector(position, new Vec2(radius, 0), angle);    
//    line(position.x, position.y, tip.x, tip.y);        
  }
}

// helpers
void processSpriteGroup(ArrayList<Sprite> group, World world) {
  for (int i=0; i<group.size(); i++) {
     if(group.get(i).update()) {
       deleteSprite(group.get(i).body, world);   
     }
  }
}
    
Vec2 radian_vector(Vec2 v1, Vec2 v2, float angle) {  
  //this is incorrectly implemented. didn't acocount for y position  
  float x = v1.x + (cos(angle) * v2.x);
  float y = v1.y - (sin(angle) * v2.x);
  return new Vec2(int(x), int(y));  
}
void apply_impulse(Body body, Vec2 bearing, float factor) {
  Vec2 impulse = new Vec2();  
  impulse.set(physics.screenToWorld(bearing));
  Vec2 center = body.getWorldCenter();   
  //impulse.set(bearing);
  impulse = impulse.sub(center);      
  impulse = impulse.mul(factor);  
  body.applyImpulse(impulse, center);
  ////println("impulse: " + impulse + ", bearing: " + bearing + ", center:" + center);
}
void add_vector(Body body, Vec2 vector, float factor) {
  Vec2 center = body.getWorldCenter();    
  //Vec2 bearing = radian_vector(center, vector, physics.getAngle(body));
  //bearing.y *= -1;  
  Vec2 impulse = new Vec2();
  impulse.set(vector);
  impulse = impulse.sub(center);      
  impulse = impulse.mul(factor);  
  body.applyImpulse(impulse, center);
}
float myGetAngle(Body body) {
  return physics.getAngle(body) * -1;
}
void update_image(Body body, PImage image, ImageInfo info) {  
  Vec2 position = physics.worldToScreen(body.getWorldCenter()); 
  float angle = physics.getAngle(body);        
  pushMatrix();
  translate(position.x, position.y);
  rotate(-angle);
  imageMode(CENTER);    
  image(image.get(0, 0, int(info.getSize().x/2), int(info.getSize().y)), 0, 0);
  imageMode(CORNER);
  popMatrix();
}
void spawnAsteroid() {  
  Vec2 position  = new Vec2(random(0, width), random(0, height));
  while (dist(position.x,position.y, my_ship.getPosition().x, my_ship.getPosition().y) 
  < my_ship.getRadius() * ASTEROID_SPAWN_MARGIN) { //safety spawn margin
    position = new Vec2(random(0, width), random(0, height));
  } 
  float angle = 0;
  float angle_velocity = random(PI);   
  //println("asteroid info: " + asteroidInfo.getRadius()); 
  Sprite asteroid = new Sprite(position, ASTEROID_IMPULSE, angle, angle_velocity, asteroidInfo, missileSound);  

  asteroidGroup.add(asteroid);
  Vec2 bearing = radian_vector(asteroid.getPosition(), new Vec2(asteroid.getRadius(),0), asteroid.getAngle());
  apply_impulse(asteroid.body, bearing, ASTEROID_IMPULSE_FACTOR);  
}
void deleteSprite(Body body, World wolrd) {  
  OUTERMOST: for(int i=0; i<sprites.size(); i++) {
    for(int j=0; j<sprites.get(i).size(); j++) {
      if (body == sprites.get(i).get(j).body) {
        sprites.get(i).remove(j);      
        break OUTERMOST;      
      }      
    }
  }  
  physics.removeBody(body);  
}
void explode(Vec2 pos, Vec2 impulse, PImage image, ImageInfo info) {
  float ang = random(TWO_PI);    
  //Sprite(Vec2 pos, Vec2 imp, float ang, float ang_vel, ImageInfo info, AudioPlayer snd) {
  Sprite explosion = new Sprite(pos, impulse, 0.0, 0.0, info, explosionSound);  
  explosionGroup.add(explosion);
  explosion.playSound();
}
void collectTrash(Body b1, Body b2, float impulse) {
  //println("collectTrash...");
  //println("trash.size: " + trash.size());
  if (b1 != my_ship.body && b1.getMass() > 0) {    
    trash.set(0, b1);    
  }
  if (b2 != my_ship.body && b2.getMass() > 0) {
    trash.set(1, b2);    
  }      
}
void takeOutTrash(World world) {  
  for(int i=0; i<trash.size(); i++) {
    //println(trash.get(i)) ;
    if(trash.get(i) != null) {
      deleteSprite(trash.get(i), world);      
      trash.set(i, null);    
    }      
  }    
}
void asteroidSpawner() {
  if (((millis() / 1000) % ASTEROID_INTERVAL == 0)) {
    spawnAsteroid();
  }
}


