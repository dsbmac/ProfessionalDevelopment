//The MIT License (MIT) - See Licence.txt for details

//Copyright (c) 2013 Mick Grierson, Matthew Yee-King, Marco Gillies


/** Test sketch for the android API
 */
Maxim maxi;
AudioPlayer player;

void setup() {
  maxi = new Maxim(this);
  player = maxi.loadFile("mykbeat.wav"); 
}

void draw() {
  float ratio = (float) mouseX / (float) width;
  ratio *= 2;
  player.speed(ratio);
}

void mousePressed(){
  player.cue(0);
  player.play();
}

