// All Examples Written by Casey Reas and Ben Fry

// unless otherwise stated.

size(640, 320);

smooth();

background(0);

strokeWeight(5);



for(int i = 0; i < width; i++) {

  float r = random(255);

  float x = random(0, width);

  stroke(r, 100);

  line(i, 0, x, height);

}
