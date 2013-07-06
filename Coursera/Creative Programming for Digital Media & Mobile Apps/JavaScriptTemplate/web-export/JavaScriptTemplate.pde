//The MIT License (MIT) - See Licence.txt for details

//Copyright (c) 2013 Mick Grierson, Matthew Yee-King, Marco Gillies


Maxim maxim;


void setup()
{
  size(640, 960);
  
  background(0);


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
}

void mouseReleased()
{
// code that happens when the mouse button
// is released
}

//The MIT License (MIT) - See Licence.txt for details

//Copyright (c) 2013 Mick Grierson, Matthew Yee-King, Marco Gillies



// an array of images to store the 
// animation
PImage [] images;
// the current position within the
// animation
int currentPosition = 0;

void setup()
{
    // load the images
    // They need to be named the form:
    // Animation_data/movieX.jpg
    // where X is a number that says where
    // the image is in the sequence
    // The first parameter is the filename up to the number
    // the second is the file extension
    // the third is the number of the last image
    images = loadImages("data/Animation_data", ".jpg", 134);
    // set the size of the screen to be 
    // the same as the image
    size(images[0].width, images[0].height);
}

void draw()
{
  // draw the current image
  image(images[currentPosition], 0, 0);
  // move to the next image
  currentPosition += 1;
  // when you get to the end, loop
  if(currentPosition >= images.length)
  {
     currentPosition = 0;
  }
  
}

// when the mouse is pressed, return 
// to the beginning
void mousePressed()
{
  currentPosition = 0;
}


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

