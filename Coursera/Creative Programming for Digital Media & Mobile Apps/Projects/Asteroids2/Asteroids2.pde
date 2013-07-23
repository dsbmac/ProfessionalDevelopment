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
int time;

// audio stuff

Maxim maxim;
AudioPlayer soundtrack, droidSound, wallSound;
AudioPlayer[] crateSounds;


Physics physics; // The physics handler: we'll see more of this later
// rigid bodies for the droid and two crates
Body droid;
Body [] crates;
// the start point of the catapult 
Vec2 startPoint;
// a handler that will detect collisions
CollisionDetector detector; 

PImage crateImage, ballImage, tip, debris_image, nebula_image; 

int score = 0;

class ImageInfo {
  int center, size, radius, lifespan;
  boolean animated;
  ImageInfo(int c, int s, int r, int l, boolean a) {
    center = c;
    size = s;
    radius = r;
    lifespan = l;
    animated = a;
  }
  int get_center() {
    return 0;
  }
  
}
void init_images() {
  debris_image = loadImage("debris2_blue.png");
  nebula_image = loadImage("nebula_blue.png");
  imageMode(CENTER);
}

void init_sounds() {
  maxim = new Maxim(this);
  soundtrack = maxim.loadFile("soundtrack.wav");
  soundtrack.cue(0);
  soundtrack.speed(0.1);
  //soundtrack.play();  
}

void setup() {
  size(WIDTH,HEIGHT);
  frameRate(60);
  time = 0;
  init_images();
  init_sounds(); 
}

void draw_background() {
  int[] center = {int(debris_image.width/2), int(debris_image.height/2)};
  int wtime = (time / 8) % center[0]; 
  image(nebula_image, width/2, height/2, width, height);
  image(debris_image, width/2+1.25*wtime, height/2, width, height);
  image(debris_image, 1.25*wtime, height/2, width, height);
}

void draw() {
  time +=1;
  draw_background();
}
  
