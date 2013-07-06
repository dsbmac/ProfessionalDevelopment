//The MIT License (MIT) - See Licence.txt for details

//Copyright (c) 2013 Mick Grierson, Matthew Yee-King, Marco Gillies



// Create a variable to hold our image
PImage img;

void setup()
{
  // load the image  from file
  img = loadImage("movie44.jpg");
  // set the size of the screen to be 
  // the same as the image
  size(img.width, img.height);
}

void draw()
{
  // display the image
  image(img, 0, 0);
}
