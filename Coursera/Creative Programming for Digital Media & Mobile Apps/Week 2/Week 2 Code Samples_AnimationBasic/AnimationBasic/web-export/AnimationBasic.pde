
boolean playing = false;
int currentPosition = 0;
PImage [] images;



void setup()
{
    size(960, 640);
    images = loadImages("Animation_data/Tache_", ".jpg", 41);
}

void draw()
{
  float imageWidth = (height*images[currentPosition].width)/images[currentPosition].height;
  image(images[currentPosition], 0, 0, imageWidth, height);
  currentPosition += 1;
  if(currentPosition >= images.length)
  {
     currentPosition = 0;
  }
  
}


PImage [] loadImages(String stub, String extension, int numImages)
{
  PImage [] images = new PImage[0];
  for(int i =0; i < numImages; i++)
  {
    PImage img = loadImage(stub+i+extension);
    if(img != null)
    {
      images = (PImage [])append(images,img);
    }
    else
    {
      break;
    }
  }
  return images;
}

