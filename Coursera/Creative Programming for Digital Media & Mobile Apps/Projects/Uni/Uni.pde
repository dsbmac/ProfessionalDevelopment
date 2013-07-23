// Constants
int WIDTH = 640;
int HEIGHT = 360;
float ZOOMFACTOR = 0.7;
float ZOOMINLIMIT = 0.0;
float ZOOMOUTLIMIT = 100.0;
int STARTSIZE = int(HEIGHT * 0.4);

float sx1 = 1;
float sy1 = 1;
float sz1 = 1;
float p1 = 0.5;

Table table;
PImage img, img2;
Sprite [] sprites;

//creates a sprite for animation
class Sprite {
  PImage image;
  String value, item, imgFilename;
  Float perspective, trans;
  Sprite (PImage i, String v, String itm, String ifn, float p, float t) {
    image = i;
    value = v;
    item = itm;
    imgFilename = ifn;
    perspective = p;
    trans = t;
  }  
}

void setup() {
  size(WIDTH, HEIGHT, P3D);
  table = loadTable("item_sizes.csv", "header");

  println(table.getRowCount() + " total rows in table"); 

  for (TableRow row : table.rows()) {  
    //int item = row.getInt("item");
    String value = row.getString("Value");
    String item = row.getString("Item");    
    
    println(item + " (" + value + ")");
  }
 
  img = loadImage("327px-Logo_man.svg.png");
  img2 = loadImage("Golf-ball.png");
}

void draw() {
  lights();
  background(204);
  float ratio = img.width / STARTSIZE;
  
  float cameraY = height/2.0;
  float fov = mouseX/float(width) * PI/2;
  float cameraZ = cameraY / tan(fov / 2.0);
  float aspect = float(width)/float(height);
  if (mousePressed) {
    fov *= 2;
  }
  
  perspective(3.14*p1, aspect, cameraZ/10.0, cameraZ*10.0);
  image(img, 0, 0,STARTSIZE,int(img.width/ratio));
  perspective(3.14*p1, aspect, cameraZ/8.0, cameraZ*10.0);
  image(img2, 0, 0, STARTSIZE, int(img.width/ratio));
    
  translate(width/2+200, height/2, 0);
  scale(sx1, sy1, sz1);
  box(30, 30, 0);
}

void mouseReleased() {
  p1 += 0.01; 
}

void zoomIn() {
  //img.resize(img.width*ZOOMFACTOR, img.height*ZOOMFACTOR);  
}

void processSprites() {
//  if (fov > 3.14) {
//    //remove from array
//  }
}
