public class Sprite {
  private int pX,pY,sizeX,sizeY;
  private PImage bitmap;
  private boolean border;
  
  public Sprite(String imagePath) {
    bitmap = loadImage(imagePath);
    //println("New Sprite:"+bitmap.width+"x"+bitmap.height);
    pX = 0;
    pY = 0;
    sizeX = bitmap.width;
    sizeY = bitmap.height;
  }
  
  public void setPosition(int x, int y, int mode) {
    switch(mode) {
      case CORNER:
        pX = x;
        pY = y; 
        break;
      case CENTER:
        pX = x - sizeX/2;
        pY = y - sizeY/2;    
        break; 
    }
  }
  
  public void draw() {
    if (border) {
      stroke(255,0,0);
      //remover preenchimento
      fill(255,0);
      rect(pX,pY,sizeX,sizeY);
    }
    image(bitmap,pX,pY,sizeX,sizeY);    
  }
  
  public void setBorders(boolean on) {
    border = on;
  }
  
  public int width() {
    return sizeX;
  }
  public int height() {
    return sizeY;
  }
  public void setSize(int percent) {
    //sizeX = bitmap.width;
    //println("size before:"+sizeX+"x"+sizeY);
    float ratio = (float) sizeX / sizeY;
    //println("Ratio"+ratio);
    sizeX = percent*sizeX / 100;
    sizeY = (int) (sizeX / ratio);
    //println("size:"+sizeX+"x"+sizeY);
  }
  
  public boolean insideBoundingBox(int x,int y) {
    if (x>=pX && x<=pX+sizeX && y>=pY && y<=pY+sizeY) {
      return true; 
    }
    else return false;
  }
}
