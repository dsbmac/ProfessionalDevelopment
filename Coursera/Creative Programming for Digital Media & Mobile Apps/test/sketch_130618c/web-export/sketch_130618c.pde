PShape square;  

void setup() {  
  size(200, 100, P2D);   
  square = createShape(RECT, 0, 0, 80, 80);
}

void draw() {
  shape(square, 10, 10);
}

