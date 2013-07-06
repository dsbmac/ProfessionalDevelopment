Maxim maxim;
AudioPlayer player;
AudioPlayer player2;

void setup()
{
  size(640, 960);
  
  background(0);
  maxim = new Maxim(this);
  player = maxim.loadFile("mykbeat.wav");
  player2 = maxim.loadFile("beat2.wav");
  player.setLooping(false); 
}

void draw()
{
// code that happens every frame
}

void mouseDragged()
{
// code that happens when the mouse moves
// with the button down
}

void mousePressed()
{

// code that happens when the mouse button
// is pressed
  player.cue(0);
  player.play();
  player2.play();
}

void mouseReleased()
{
// code that happens when the mouse button
// is released
}

