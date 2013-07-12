
public class AnimSprite {

  private PImage []images;
  private int imageCount;
  private float currentImage;
  private int playX, playY,sizeX,sizeY;
  private float playSpeed;
  private PImage backPlane;
  private boolean playing;
  
  public AnimSprite() {
    currentImage=0;
    playX = 0;
    playY = 0;
    playSpeed = 1; //
    sizeX = 0;
    sizeY = 0;
    playing = true;
  }
  
  public void loadImages(String path, String extension, int count) {
    imageCount = count;
    images = new PImage[count];
    for (int i=0;i<count;i++) {
      images[i] = loadImage(path+i+"."+extension);
    }  
    sizeX = images[0].width;
    sizeY = images[0].height;
  }
  
  public void displayImage(int img,int x,int y) {
    image(images[img],x,y);
  }
 
  public void setPlayPos(int x, int y,int mode) {
    switch(mode) {
      case CORNER:
        playX = x;
        playY = y; 
        break;
      case CENTER:
        playX = x - images[0].width/2;
        playY = y - images[0].height/2;    
        break; 
    }
    
  }
  
  public void setPlaySpeed(int speed) {
    // 0% - 500%
    playSpeed = map(speed,0,500,0,5);
    
  }
  
  public void setPlay(boolean p) {
    playing = p; 
  }
  public boolean isPlaying() {
    return playing; 
  }
  public void play() {
    //gravar fundo no inicio
    /*
    if (backPlane==null) {
      backPlane = get(playX-2,playY-2,images[0].width+2,images[0].height+2);
    }
    //mostrar fundo anterior
    set(playX,playY,backPlane);    
    */
    
    if (currentImage>=imageCount) {
      currentImage = 0; //loops 
    }
    image(images[(int)currentImage],playX,playY);
    if (playing) {
      currentImage+=(1.0*playSpeed);
    }
  }
  
  public void reversePlay() {
     if (currentImage<=0) {
      currentImage = imageCount-1; //loops 
    }
    image(images[(int)currentImage],playX,playY);
    currentImage-=(1.0*playSpeed);
  }
  
  public boolean insideBoundingBox(int x,int y) {
    //println("AnimSprite inside");
    if (x>=playX && x<=playX+sizeX && y>=playY && y<=playY+sizeY) {
      return true; 
    }
    else return false;
  }
  
}
