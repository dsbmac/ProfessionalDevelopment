
float magnify = 200; // This is how big we want the rose to be.
float phase = 0; // Phase Coefficient : this is basically how far round the circle we are going to go

int elements = 128;// This is the number of points and lines we will calculate at once. 1000 is alot actually. 
float thresamp = 0.35;// try increasing this if it jumps around too much
int amp =0;  // Amp Coefficient : this is basically how far from the origin we are.

color[] palette = {#FF4EDE, #B233D4, #570B85, #9AD42E, #1FC3CC};

void setup() {
  //The size is iPad Portrait.
  //If you want landscape, you should swap the values.
  // comment out if you are on Android!
  size(768, 1024);
  rectMode(CENTER);
  background(0);
  colorMode(HSB);
}

void draw() {
  float power = 0;
  
  amp += 0.05;//get the mouse Y coordinate and use it to set the current amp coefficient
  float spacing = TWO_PI/elements; // this is how far apart each 'node' will be - study it. 
  translate(width*0.5, height*0.5);// we translate the whole sketch to the centre of the screen, so 0,0 is in the middle.
  fill(0, 50);
  rect(0, 0, width, height);
  noFill();
  strokeWeight(2);
  for (int i = 0; i < elements;i++) {
    stroke(i*2, 255, 255, 50);
    pushMatrix();
    rotate(spacing*i*phase);
    translate(sin(spacing*amp*i)*magnify, 0);
    rotate(-(spacing*i*phase));
    //line(0, i*(power*10)-(width/4),0,i*(power*10)-(height/4));
    rotate(i);
    //noStroke();
    //fill(i*2,255,255,10);
    //ellipse(0,0,i*(power*10),i*(power*10));
    line(0, i*(power*10)-200, 0, 0);
    popMatrix();
    stroke(255, 0, 0);
  }
}

void mousePressed() {
  amp = millis();
}

void mouseReleased() {
  amp = millis() - amp;
  println(amp);
}

