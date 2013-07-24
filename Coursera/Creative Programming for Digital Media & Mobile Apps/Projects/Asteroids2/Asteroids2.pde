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
PVector SCREEN_CENTER = new PVector(WIDTH/2, HEIGHT/2);
int time;

Boolean started;

// audio stuff

Maxim maxim;
AudioPlayer soundtrack, droidSound, wallSound;
AudioPlayer[] crateSounds;


Physics physics; // The physics handler: we'll see more of this later
// rigid bodies for the droid and two crates
Body droid, ship;
Body [] crates;
Body [] sprites;
// the start point of the catapult 
Vec2 startPoint;
// a handler that will detect collisions
CollisionDetector detector; 

PImage crateImage, ballImage, tip, debris_image, nebula_image; 

int score = 0;

class ImageInfo {
  PImage image;
  PVector center, size;
  int radius, lifespan;
  boolean animated;
  ImageInfo(PImage i, PVector c, int r, int l, boolean a) {
    image = i;
    center = c;
    size = new PVector(image.width, image.height);
    radius = r;
    lifespan = l;
    animated = a;
  }
  PVector get_center() {
    return center;
  }
  PVector get_size() {
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
  PVector pos, vel, image_center;
  float angle;
  PImage image;
  ImageInfo info;
  int angle_vel;
  Boolean thrust_status;
  AudioPlayer thrust_sound;
  
  Ship(PVector p, PVector v, float a, PImage i, ImageInfo inf) {
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
    
  }

  PVector get_position() {
    return pos;      
  }
  
  void set_image_center(PVector ctr) {
    image_center = ctr;      
  }
  
  void draw() {    
    imageMode(CENTER);
    //image(image, SCREEN_CENTER.x/2, SCREEN_CENTER.y/2);
    image(image.get(0, 0, int(info.get_size().x/2), int(info.get_size().y)), SCREEN_CENTER.x, SCREEN_CENTER.y);
    imageMode(CORNERS);
    //ellipse(SCREEN_CENTER.x/2, SCREEN_CENTER.y/2, 55, 55);         
  }
  
  void update_thrust(boolean keyStatus) {
      
    if (keyStatus) {
      image_center.x += info.size.x;
      thrust_status = true;
      thrust_sound.play();      
    } else {
      image_center.x -= info.size.x;
      thrust_status = false;
      thrust_sound.stop();
      thrust_sound.cue(0);
    }       
    
    
  }
    
//    def __init__(self, pos, vel, angle, image, info):
//        self.pos = [pos[0],pos[1]]
//        self.vel = [vel[0],vel[1]]
//        self.thrust = False
//        self.angle = angle
//        self.angle_vel = 0
//        self.image = image
//        self.image_center = info.get_center()
//        self.image_size = info.get_size()
//        self.radius = info.get_radius()
//    
//    def init_shields(self):
//        result = set([])
//        for i in range(1):
//            pos = [self.pos[0] + self.radius + shield_info.get_center()[0], self.pos[1]]
//            
//            result.add(Sprite(pos, self.vel, 0, 0, shield_image, shield_info))
//            
//        sprites['shields'] = result
//    
//    def get_position(self):
//        return self.pos
//    
//    def get_radius(self):
//        return self.radius
//    
//    def get_image_center(self):
//        return self.image_center[:]
//    
//    def set_image_center(self, size):
//        self.image_center = size
//        
//    def set_ship_image(thrusters=False):
//        self.image_center = info.get_center() + self.image_size/2        
//    
//    def shoot(self):        
//        global shots
//        shots +=1        
//        forward = [math.cos(self.angle), math.sin(self.angle)]    
//        pos = [self.pos[i] + forward[i] * (1.3 * self.radius)   for i in range(2)]
//        vel = [self.vel[i] + MISSILE_THRUST * forward[i]  for i in range(2)] 
//        ang = self.angle
//        ang_vel = self.angle_vel
//        
//        missile = Sprite(pos, vel, ang, ang_vel, missile_image, missile_info, missile_sound)
//        missile_group.add(missile)
//      
//    def draw(self,canvas):  
//        
//        canvas.draw_image(self.image, self.image_center, self.image_size, self.pos, self.image_size, self.angle)
//        
//    def update(self):
//        global dist_flown                
//        
//        self.angle += self.angle_vel               
//        newPos = [(self.pos[i] + self.vel[i]) % WINDOW_SIZE[i]  for i in range(2)]
//        dist_flown += int(dist(newPos, self.pos))
//        self.pos = newPos
//        self.vel = [x * (1 - FRICTION)  for x in self.vel]  #friction        
//        forward = [math.cos(self.angle), math.sin(self.angle)]        
//        if self.thrust:            
//            self.vel = [self.vel[i] + forward[i] * THRUST  for i in range(2)]     
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

  physics = new Physics(this, width, height, 0, -10, width*2, height*2, width, height, 100);  
  
  //physics.setCustomRenderingMethod(this, "myCustomRenderer");
  physics.setDensity(10.0);  
  
  PVector v1 = new PVector(width/2, height/2);
  PVector v2 = new PVector(0, 0);
  PImage s = loadImage("double_ship.png");
  
  ImageInfo i = new ImageInfo(s, v2, 10, 20, false);
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
