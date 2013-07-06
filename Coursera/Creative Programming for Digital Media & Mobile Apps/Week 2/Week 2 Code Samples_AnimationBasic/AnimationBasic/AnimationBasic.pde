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
    images = loadImages("Animation_data/movie", ".jpg", 134);
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


