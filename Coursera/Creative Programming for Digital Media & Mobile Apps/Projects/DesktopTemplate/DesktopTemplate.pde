Maxim maxim;

int SCREENWIDTH = 640;
int SCREENHEIGHT = 640;
float XMARGINFACTOR = 0.1;
float STROKEWEIGHTFACTOR = 0.2;

int smallBoardMargin = 5;
int largeBoardSize = int(SCREENWIDTH-2*XMARGINFACTOR*SCREENWIDTH);
int smallBoardSize = int((largeBoardSize-(0.5*STROKEWEIGHTFACTOR*SCREENWIDTH)) / 3);
int YMARGIN = int(SCREENWIDTH * 0.1);
StringDict shapes = new StringDict();
int[][][][] masterBoard = new int[3][3][3][3]; 
 
void setup()
{
  size(640, 960, P2D);     
    
}

void createShapes() {
  PShape largeBoard = createBoardShape(largeBoardSize);
  PShape[] arr = new PShape[1];
  arr[0] = largeBoard;  
  PShape xPiece = createXShape(smallBoardSize);
  PShape oPiece = createOShape(smallBoardSize);
}

PShape createBoardShape(int size) {
  int weight = size/20;
  int space = size / 3;
  PShape board, l1,l2,l3,l4;  
  
  board = createShape(GROUP);
  strokeWeight(weight);
  stroke(0);
  l1 = createShape(LINE, space, 0, space, size);  
  l2 = createShape(LINE, 2*space, 0, 2*space, size);
  l3 = createShape(LINE, 0, space, size, space);
  l4 = createShape(LINE, 0, 2*space, size, 2*space);
  
  board.addChild(l1);
  board.addChild(l2);
  board.addChild(l3);
  board.addChild(l4);
  
  return board;
}

PShape createOShape(int size) {
  int weight = int(size*STROKEWEIGHTFACTOR);
  PShape piece;  
  strokeWeight(weight);
  stroke(0,255,0);
  noFill();
  piece = createShape(ELLIPSE, 0, 0, size, size);
  
  return piece;
}

PShape createXShape(int size) {
  int weight = int(size*STROKEWEIGHTFACTOR);
  PShape piece,l1,l2;  
  
  piece = createShape(GROUP);
  strokeWeight(weight);
  stroke(255,0,0);
  l1 = createShape(LINE, 0, 0, size, size);  
  l2 = createShape(LINE, size, 0, 0 , size);
  
  piece.addChild(l1);
  piece.addChild(l2);
  
  return piece;
}

void draw()
{
// code that happens every frame
  PShape board = createBoardShape(largeBoardSize);
  PShape smallBoard = createBoardShape(smallBoardSize);
  int xSize = int((smallBoardSize * (1-2*XMARGINFACTOR))/3);
  PShape x = createXShape(xSize);
  PShape o = createOShape(xSize);
  int margin = int(SCREENWIDTH * XMARGINFACTOR);
  shape(board, margin, margin);
  shape(smallBoard, margin, margin);
  shape(x, margin, margin);
  shape(o, margin, margin);
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

