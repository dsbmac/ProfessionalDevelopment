//The MIT License (MIT) - See Licence.txt for details

//Copyright (c) 2013 Mick Grierson, Matthew Yee-King, Marco Gillies

Maxim maxim;
AudioPlayer player;
float[] spec;
int xPos;
boolean playit;

void setup()
{
  size(500, 500);
  maxim = new Maxim(this);
  // the sine.wav file contains a rising sine tone
  // to illustrate the meaning of the spectral data
  player = maxim.loadFile("sine.wav");
  // tell the player to analyse its output
  player.setAnalysing(true);
  background(0);
  xPos = 0;
  playit = false;
}

void draw()
{
  if (playit) {
    player.play();
    // get the analysis output from the player
    spec = player.getPowerSpectrum();
    // we will draw 1x1 pixel dots
    strokeWeight(1);
    if (spec!=null) {// got something to plot!
      // iterate over the values in the spectrum, plotting them down the screen
      for (int i=0; i< spec.length; i++) {
        // set the colour based on the power in this band
        stroke(255 * spec[i]);
        point(xPos, i);
      }
    }
    // move along the screen 
    xPos += 1;
    // wipe the screen when we get to the end
    if (xPos > width) {
      xPos = 0;
      background(0);
    }
  }
}

// in mobile safari, we have to trigger the audio playback
// from a finger tap
void mousePressed(){
  playit = !playit;
  
  if (playit){
    player.play();
  }
  else {
    player.stop();
  }
}


