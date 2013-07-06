Maxim maxim;
AudioPlayer player;


void setup()
{
  maxim = new Maxim(this);
  player = maxim.loadFile("ping.wav");
  player.setLooping(false);
}


void draw() {
}

void mousePressed() {
  player.cue(0);
  player.play();
  player.speed(random(0.1, 2));
}

