  
//globals

float PHI = 1.618;
int UNIT_SIZE = 50;
  ArrayList<MyPoint> points = new ArrayList<MyPoint>();

class MyPoint {
  PVector point;
  float angle;
  MyPoint(int x, int y, float ang) {
    point = new PVector(x, y);
    angle = ang;
  }
  PVector getPoint() {
    return point;
  }
  float getAngle() {
    return angle;
  }
}

// takes a position and creates the Pvector for the top coordinate of the triangle
PVector make_vector(int x, int y, float angle, float vector_length) {    
  //float resultX = x - (cos(angle) * PHI*UNIT_SIZE);
  //float resultY = y - (sin(angle) * PHI*UNIT_SIZE);
  float radians = convert_to_radians(angle);
  println("cos(angle): " + cos(radians));
  int result_x = int(vector_length * cos(radians));
  int result_y = int(vector_length * sin(radians));
  PVector result = new PVector(result_x, result_y);
  return result;  
}

// takes a position and angle draws a triangle
void make_triangle(int x, int y, float angle) {
  rotate(convert_to_radians(angle));
  PVector top = make_vector(0, 0, -36, PHI*UNIT_SIZE);
  triangle(0, 0, top.x, top.y, sq(PHI)*UNIT_SIZE, 0);
}  

void make_fat_diamond(int x, int y, float angle) {
  translate(x, y);
  make_triangle(x, y, angle);
  translate(sq(PHI)*UNIT_SIZE, 0);
  make_triangle(x, y, angle+180);  
}

//converts an angle to radians
// println(convert_to_radians(180) //==3.1415927
float convert_to_radians(float degrees) {
  float result = 0.0174532925 * degrees;
  return result;  
} 

// takes an int level and draws the penrose fractal
void draw_penrose(int level) {
  MyPoint p = new MyPoint(0, 0, 0.0);
  points.add(p);
  //println(points.get(0).x);
  
  make_fat_diamond(width/2, height/2, 0.0);    
}

void setup() {
  size(640, 480);
  draw_penrose(1); 
  
}

void draw() {
}
  


