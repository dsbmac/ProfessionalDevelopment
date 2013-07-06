//The MIT License (MIT) - See Licence.txt for details

//Copyright (c) 2013 Mick Grierson, Matthew Yee-King, Marco Gillies

Maxim maxim;
AudioPlayer player;
boolean playit;

void setup()
{
  size(500, 500);
  maxim = new Maxim(this);
  player = maxim.loadFile("bass_snare.wav");
  player.setAnalysing(true);
  player.setLooping(true);
  playit = false;
}

void draw()
{
  background(0);
  // in js mode, we need to keep calling play
  // to get the latest analysis data
  if (playit){
    player.play();
    float pow = player.getAveragePower();
    fill(255, pow * 255, 0);
    rect(0, 0, pow * width, height);
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



