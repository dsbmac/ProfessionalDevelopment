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
Vec2 SCREEN_CENTER = new Vec2(WIDTH/2, HEIGHT/2);
int time;
int score = 0;
boolean started;
PImage ballImage, debris_image, debris_image2, nebula_image;
Ship my_ship;
int MISSILE_SIZE = 20;

// audio stuff
Maxim maxim;
AudioPlayer soundtrack, droidSound, wallSound;
AudioPlayer[] crateSounds;

Physics physics; // The physics handler: we'll see more of this later
// rigid bodies for the droid and two crates
Body ship;
Body [] sprites;

// a handler that will detect collisions
CollisionDetector detector; 

//helpers
Vec2 calc_radian_vector(Vec2 v, float angle, float length) {  
  int x = int(v.x + cos(angle) * length);
  int y = int(v.y + sin(angle) * length);
  Vec2 bearing = new Vec2(x, y);
  return bearing;
}

// Classes
class ImageInfo {
  PImage image;
  Vec2 center, size;
  int radius, lifespan;
  boolean animated;
  ImageInfo(PImage i, Vec2 c, int r, int l, boolean a) {
    image = i;
    center = c;
    size = new Vec2(image.width, image.height);
    radius = r;
    lifespan = l;
    animated = a;
  }
  Vec2 get_center() {
    return center;
  }
  Vec2 get_size() {
    return size;
  }
  int get_radius() {
    return radius;
  }
  int get_lifespan() {
    return lifespan;
  }
  boolean get_animated() {
    return animated;
  }  
}
  
//Ship class
class Ship {
  Vec2 pos, vel, image_center;
  float angle;
  PImage image;
  ImageInfo info;
  int angle_vel, radius;
  boolean thrust_status;
  AudioPlayer thrust_sound;
  int dist_flown;
  Body hull;
  float SHIP_ANGLE_VEL = PI/20;
    
  // Constructor
  Ship(Vec2 p, Vec2 v, float a, PImage i, ImageInfo inf) {
    pos = p;
    vel = v;
    angle = a;
    angle_vel = 0;
    image = i;
    info = inf;
    image_center = inf.get_center();
    thrust_status = false;
    thrust_sound = maxim.loadFile("thrust.wav");
    thrust_sound.cue(0);
    thrust_sound.speed(0.1);
    radius = info.get_radius();
    dist_flown = 0;
    hull = physics.createCircle(SCREEN_CENTER.x, SCREEN_CENTER.y, radius/2);    
    int crateSize = 70;  
    //hull = physics.createRect(SCREEN_CENTER.x, SCREEN_CENTER.y-crateSize, SCREEN_CENTER.x+crateSize, SCREEN_CENTER.y);
  }
  // Methods  
  boolean get_thrust_status() {
    return thrust_status;    
  }  
  Vec2 get_position() {
    return pos;      
  }  
  void set_image_center(Vec2 ctr) {
    image_center = ctr;      
  }  
  void turn(boolean right) {
    // !!! refactor to make the turn constant on/off instead of reacting to the keyboard    
    if (right) {      
      angle += SHIP_ANGLE_VEL;
    } else {
      angle -= SHIP_ANGLE_VEL;
    }
    hull.setAngle(angle);      
  }  
  void fire_missile() {
    int x = int(pos.x + cos(angle) * (1.3 * 2*radius));
    int y = int(pos.y + sin(angle) * (1.3 * 2*radius));
    //int x = 100;
    //int y = 100;
    Vec2 mpos = new Vec2(x, y);
    
    Vec2 mpos2 = calc_radian_vector(pos, angle, 2*radius);
    //physics.createCircle(mpos.x, mpos.y, MISSILE_SIZE);    
    physics.createCircle(mpos2.x, mpos2.y, MISSILE_SIZE);
  }  
  void apply_thrust() {
    Vec2 hullCenter = hull.getWorldCenter();    
    Vec2 impulse = new Vec2();
    Vec2 bearing = calc_radian_vector(hullCenter, angle, radius/2);
    impulse.set(hullCenter);
    impulse = impulse.sub(bearing);
    impulse = impulse.mul(0.07);
    hull.applyImpulse(impulse, hullCenter);    
  }  
  void set_thrust(boolean keyStatus) {      
    if (keyStatus) {      
      thrust_status = true;
      thrust_sound.play();
      apply_thrust();
                  
    } else {
      image_center.x -= info.size.x;
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
    pos = physics.worldToScreen(hull.getWorldCenter());
    angle = physics.getAngle(hull);        
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-radians(angle));    
    //image(image.get(0, 0, int(info.get_size().x/2), int(info.get_size().y)), 0, 0);
    popMatrix();       
    Vec2 tip = calc_radian_vector(pos, angle, radius/2);    
    line(pos.x, pos.y, tip.x, tip.y);
  }    
}
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
  debris_image2 = loadImage("debris2_blue.png");
  nebula_image = loadImage("nebula_blue.png");
  ballImage = loadImage("tux_droid.png");
  //imageMode(CENTER);
}
void init_sounds() {
  maxim = new Maxim(this);
  soundtrack = maxim.loadFile("soundtrack.wav");
  soundtrack.cue(0);
  soundtrack.speed(0.1);
  //soundtrack.play();  
}
void init_ship() {
  Vec2 v1 = new Vec2(width/2, height/2);
  Vec2 v2 = new Vec2(0, 0);
  PImage s = loadImage("double_ship.png");
  ImageInfo i = new ImageInfo(s, v2, 70, 20, false);
  my_ship = new Ship(v1, v2, 0.0, s, i);
}
void init_physics() {
  physics = new Physics(this, width, height, 0, 0, width*1.2, height*1.2, width, height, 100);  
//  physics.setCustomRenderingMethod(this, "myCustomRenderer");
  physics.setDensity(10.0);  
  detector = new CollisionDetector (physics, this);
}
void draw_background() {
  Vec2 center = new Vec2(int(debris_image.width/2), int(debris_image.height/2));
  int wtime = int((time / 8) % center.x); 
  image(nebula_image, 0, 0, width, height);
  //fix wrap around
  image(debris_image, width/2+1.25*wtime, 0, width, height);
  image(debris_image2, 1.25*wtime-width/2, 0, 1.1*width, 1.1*height);
}
void draw() {
  time +=1;
  draw_background();
  text("angle: " + (my_ship.angle*180/PI) + ", pos:" + my_ship.pos, 20, 20);  
  myCustomRenderer(physics.getWorld());
}
void myCustomRenderer(World world) {
  my_ship.update(world);  
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
