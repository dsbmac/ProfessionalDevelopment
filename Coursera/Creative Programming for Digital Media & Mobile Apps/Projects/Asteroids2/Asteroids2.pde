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

Boolean started;

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

PImage crateImage, ballImage, tip, debris_image, nebula_image; 

int score = 0;

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
  Boolean thrust_status;
  AudioPlayer thrust_sound;
  int dist_flown;
  Body debug_circle;
  
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
    debug_circle = physics.createCircle(SCREEN_CENTER.x, SCREEN_CENTER.y, radius/2);
    
  }

  Vec2 get_position() {
    return pos;      
  }
  
  void set_image_center(Vec2 ctr) {
    image_center = ctr;      
  }
  
  void draw() {    
    imageMode(CENTER);
    //image(image, SCREEN_CENTER.x/2, SCREEN_CENTER.y/2);
    image(image.get(0, 0, int(info.get_size().x/2), int(info.get_size().y)), SCREEN_CENTER.x, SCREEN_CENTER.y);
    imageMode(CORNERS);          
  }
  
  void update_thrust(boolean keyStatus) {
      
    if (keyStatus) {
      image_center.x += info.size.x;
      thrust_status = true;
      thrust_sound.play();
      Vec2 impulse = new Vec2(0, 10);
      //impulse.set(debug_circle.getWorldCenter());
      //impulse = impulse.sub(droid.getWorldCenter());
      impulse = impulse.mul(2);
      debug_circle.applyImpulse(impulse, debug_circle.getWorldCenter());          
    } else {
      image_center.x -= info.size.x;
      thrust_status = false;
      thrust_sound.stop();
      thrust_sound.cue(0);
    }
  }    
    
  void update(World world) {
    //global dist_flown                
      
    angle += angle_vel;               
    
    int newX = int((pos.x + vel.x) % WIDTH);
    int newY = int((pos.y + vel.y) % HEIGHT);
    Vec2 newPos = new Vec2(newX, newY);
    dist_flown += dist(newPos.x, newPos.y, pos.x, pos.y);
    pos = newPos;
    //int newVelX = 
    //vel = [x * (1 - FRICTION)  for x in self.vel]  #friction        
    //forward = [math.cos(self.angle), math.sin(self.angle)]        
    //if self.thrust:            
     //   self.vel = [self.vel[i] + forward[i] * THRUST  for i in range(2)]      
  }
      
   
}
    
void init_images() {
  debris_image = loadImage("debris2_blue.png");
  nebula_image = loadImage("nebula_blue.png");
  //imageMode(CENTER);
}

void init_sounds() {
  maxim = new Maxim(this);
  soundtrack = maxim.loadFile("soundtrack.wav");
  soundtrack.cue(0);
  soundtrack.speed(0.1);
  //soundtrack.play();  
}


Ship my_ship;

void setup() {
  size(WIDTH,HEIGHT);
  frameRate(60);
  time = 0;
  maxim = new Maxim(this);

  physics = new Physics(this, width, height, 0, 0, width*2, height*2, width, height, 100);  
  //physics.setCustomRenderingMethod(this, "myCustomRenderer");
  physics.setDensity(10.0);  
  detector = new CollisionDetector (physics, this);
  
  Vec2 v1 = new Vec2(width/2, height/2);
  Vec2 v2 = new Vec2(0, 0);
  PImage s = loadImage("double_ship.png");  
  ImageInfo i = new ImageInfo(s, v2, 70, 20, false);
  my_ship = new Ship(v1, v2, 0.0, s, i);  
  
  init_images();
  init_sounds();
  started = true;
}

void draw_background() {
  int[] center = {int(debris_image.width/2), int(debris_image.height/2)};
  int wtime = (time / 8) % center[0]; 
  image(nebula_image, 0, 0, width, height);
  image(debris_image, width/2+1.25*wtime, 0, width, height);
  image(debris_image, 1.25*wtime, 0, width, height);
}

void draw() {
  time +=1;
  draw_background();
  my_ship.draw();
}

void myCustomRenderer(World world) {
  stroke(0);
  
}
void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      my_ship.update_thrust(true);
    }  
  }  
}

void keyReleased() {
  if (key == CODED) {
    if (keyCode == UP) {
      my_ship.update_thrust(false);
    }  
  }
}
