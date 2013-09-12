  
//globals
float GOLDEN_RATIO = (1 + sqrt(5)) / 2;
int UNIT_SIZE = 50;
String blue = "#0000FF";
String red = "#FF0000";
ArrayList<MyTriangle> points = new ArrayList<MyTriangle>();

class MyTriangle {
  PVector a, b, c;
  String clr;
  MyTriangle(String x, PVector aa, PVector bb, PVector cc) {
    a= aa;
    b = bb;
    c = cc;
    clr = x;
  }
  PVector get_a() {
    return a;
  }
  PVector get_b() {
    return b;
  }
  PVector get_c() {
    return c;
  }
  String get_color() {
    return clr;
  }
}

ArrayList<MyTriangle> sub_divide(ArrayList<MyTriangle> triangles) {
  ArrayList<MyTriangle> result = new ArrayList<MyTriangle>();
  for (int i=0; i<triangles.size(); i++) {
    MyTriangle triangle = triangles.get(i);
    if (triangle.get_color() == red) {
       //subdivide red triangle
       PVector p = PVector.sub(triangle.get_a(), triangle.get_b());
       p.div(GOLDEN_RATIO);
       p.add(triangle.get_a());
       MyTriangle t1 = new MyTriangle(red, triangle.get_c(), p, triangle.get_b());
       MyTriangle t2 = new MyTriangle(blue, p, triangle.get_c(), triangle.get_a());       
    }   
  }
return result;
    
}
//// takes a position and creates the Pvector for the top coordinate of the triangle
//PVector make_vector(int x, int y, float angle, float vector_length) {    
//  //float resultX = x - (cos(angle) * PHI*UNIT_SIZE);
//  //float resultY = y - (sin(angle) * PHI*UNIT_SIZE);
//  float radians = convert_to_radians(angle);
//  println("cos(angle): " + cos(radians));
//  int result_x = int(vector_length * cos(radians));
//  int result_y = int(vector_length * sin(radians));
//  PVector result = new PVector(result_x, result_y);
//  return result;  
//}

//// takes a position and angle draws a triangle
//void make_triangle(int x, int y, float angle) {
//  rotate(convert_to_radians(angle));
//  PVector top = make_vector(0, 0, -36, PHI*UNIT_SIZE);
//  triangle(0, 0, top.x, top.y, sq(PHI)*UNIT_SIZE, 0);
//}  
//
//void make_fat_diamond(int x, int y, float angle) {
//  translate(x, y);
//  make_triangle(x, y, angle);
//  translate(sq(PHI)*UNIT_SIZE, 0);
//  make_triangle(x, y, angle+180);  
//}
//
////converts an angle to radians
//// convert_to_radians(180) -> 3.1415927
//float convert_to_radians(float degrees) {
//  float result = 0.0174532925 * degrees;
//  return result;  
//} 
//
//// takes an int level and draws the penrose fractal
//void draw_penrose(int level) {
//  MyPoint initial_pt = new MyPoint(0, 0, 0.0);
//  points.add(initial_pt);
//  //println(points.get(0).x);
//  for (int i=0; i<level; i++) {
//    make_fat_diamond(width/2, height/2, 0.0);
//  }    
//}

void setup() {
  size(640, 480);
  draw_penrose(1); 
  
}

void draw() {
}
  


