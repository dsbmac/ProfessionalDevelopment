PShape board;  // The PShape object

void setup() {
  size(768, 1024, P2D);
  // Creating a custom PShape as a square, by
  // specifying a series of verticeboard.
  board = createShape();
  beginShape();
  line(20, 0, 20, 60);
  endShape();
  board.endShape(CLOSE);
}

void draw() {
  shape(board, 100, 100);
}

