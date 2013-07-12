float ZOOMFACTOR = 0.7;
int WIDTH = 600;
int HEIGHT = 400;

Button rotateButton;
Table table;
PImage img;

void setup() {
  size(WIDTH, HEIGHT);
  table = loadTable("item_sizesu.csv", "header");

  println(table.getRowCount() + " total rows in table"); 

  for (TableRow row : table.rows()) {
    
    //int item = row.getInt("item");
    String value = row.getString("Value");
    String item = row.getString("Item");    
    
    println(item + " (" + value + ")");
  }
 
  img = loadImage("327px-Logo_man.svg.png");
  
}

void draw() {
  image(img, 0, 0);
}

void mouseReleased() {
 if (zoomButton.mouseReleased()) {
   zoomIn(); 
 }
}

void zoomIn() {
  img.resize(img.width*ZOOMFACTOR, img.height*ZOOMFACTOR);
  
}

