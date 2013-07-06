Maxim maxim;

PShape board;  // The PShape object

void setup() {
  size(400, 400, P2D);
  int s = 200;
  // Creating a custom PShape as a square, by
  // specifying a series of vertices.
  board = createShape();    
  board.beginShape(LINES);
  board.vertex(width/3, 0);
  board.vertex(width/3, 400);  
  endShape();
  
  board.endShape(CLOSE);
}

void draw() {
  shape(board, 25, 25);
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

