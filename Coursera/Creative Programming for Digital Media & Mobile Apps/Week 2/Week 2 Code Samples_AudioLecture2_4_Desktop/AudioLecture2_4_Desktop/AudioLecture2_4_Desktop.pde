//The MIT License (MIT) - See Licence.txt for details

//Copyright (c) 2013 Mick Grierson, Matthew Yee-King, Marco Gillies


/** Test sketch for the android API
 */
Maxim maxi;
AudioPlayer player;
boolean buttonOn;

void setup() {
  size(500, 500);
  maxi = new Maxim(this);
  player = maxi.loadFile("ping.wav");
  player.setLooping(true);
  buttonOn = false;
}

void draw() {
  float ratio =0;
  // set the fill colour for the stop/ start
  // button
  if (buttonOn){
    fill(255, 0, 0);
  }
  else {
    fill(0, 255, 0);
  }
  // draw the stop/ start button
  rect(0, 0, width, height/2);
  
  // did they move the mouse around
  // in the bottom half of the screen
  // (/ move their finger around)
  if (mouseY > height/ 2) {
    ratio = (float) mouseX / (float) width;
    ratio *= 2;
    player.speed(ratio);
  }
  fill(ratio * 127);
  rect(0, height/2, width, height/2);
  
}

void mousePressed() {
  // check if the pressed
  // the button
  if (mouseY < height/2){
    // toggle the boolean
    // to the opposite state
    buttonOn = !buttonOn;
    // now change the state
    // of the player based on the 
    // new state of the boolean
    if (buttonOn){
        player.cue(0);
        player.play();
    }
    else {
      player.stop();
    }
  } 
}

