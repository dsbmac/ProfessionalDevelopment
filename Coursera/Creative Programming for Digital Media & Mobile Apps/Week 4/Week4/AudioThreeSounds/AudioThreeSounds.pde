Maxim maxim;
// three audio players for the three sounds
AudioPlayer ping1, ping2, rumble;

void setup() {
  maxim = new Maxim(this);
  // load each sound in turn
  ping1 = maxim.loadFile("ping1.wav");
  ping2 = maxim.loadFile("ping2.wav");
  rumble = maxim.loadFile("rumble.wav");
  // we don't want the sounds to loop
  ping1.setLooping(false);
  ping2.setLooping(false);
  rumble.setLooping(false);
}

void draw() {
  // nothing to draw - its all about the audio this time!
}

void mousePressed() {
  // call the playSound function which is defined below
  playSound((int) random(1, 4));// pass in a random number
}


void playSound(int sound) {
  println("playing sound "+sound);

  // choose which sound to play
  // by checking the value of the 'sound' 
  // parameter

  if (sound == 1) {
    // rewind to the start, set speed then play!
    ping1.cue(0);
    ping1.speed(random(0.1, 2));
    ping1.play();
  }

  if (sound == 2) {
    ping2.cue(0);
    ping2.speed(random(0.1, 2));
    ping2.play();
  }
  if (sound == 3) {
    rumble.cue(0);
    rumble.speed(random(0.1, 2));
    rumble.play();
  }
}

