//The MIT License (MIT) - See Licence.txt for details

//Copyright (c) 2013 Mick Grierson, Matthew Yee-King, Marco Gillies

Maxim maxim;
AudioPlayer player;
Accelerometer accel;
PFont arial;
boolean playit = false;

void setup()
{
  maxim = new Maxim(this);
  player = maxim.loadFile("mybeat.wav");
  player.play();

  accel = new Accelerometer();
  arial = loadFont("arial.vlw");
  textFont(arial, 48);
}

void draw()
{  
  if (playit) {
    player.play();
    // set the background
    // colour based on the 3 accelerometer values
    int r, g, b;
    r = (int) (accel.getX() + 10) * 10;
    g = (int) (accel.getY() + 10) * 10;
    b = (int) (accel.getZ() + 10) * 10;
    background(r, g, b);

    // set the speed of the player with the 
    // accelerometer
    // the hard way... 
    //float speed = accel.getX(); // -10 - 10
    //speed = speed + 10; // 0 - 20
    //speed = speed / 10; // 0 - 2 
    // or the easy way ! :
    float speed = map(accel.getX(), -10, 10, 0, 2);
    player.speed(speed);


    // display the accelerometer values
    // on the screen using the text function
    fill(255);
    text(accel.getX(), 100, 100);
    text(accel.getY(), 100, 200);
    text(accel.getZ(), 100, 300);
  }
}

void mousePressed()
{
  playit = !playit;
  if (playit) {
    player.play();
  }
  else {
    player.stop();
  }
}


