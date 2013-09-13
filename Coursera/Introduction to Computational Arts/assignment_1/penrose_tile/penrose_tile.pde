//globals
float PHI = (1 + sqrt(5)) / 2;
int UNIT_SIZE = 50;
color blue = #0000FF;
color red = #FF0000;

class MyTriangle {
  PVector a, b, c;
  color couleur;
  MyTriangle(color clr, PVector aa, PVector bb, PVector cc) {
    a= aa;
    b = bb;
    c = cc;
    couleur = clr;
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
  color get_color() {
    return couleur;
  }
}

ArrayList<MyTriangle> sub_divide(ArrayList<MyTriangle> triangles) {
  ArrayList<MyTriangle> result = new ArrayList<MyTriangle>();
  for (int i=0; i<triangles.size(); i++) {
    MyTriangle triangle = triangles.get(i);
    if (triangle.get_color() == red) {
      //subdivide red triangle
      println("inside sub_divide if");
      PVector p = PVector.sub(triangle.get_a(), triangle.get_b());
      p.div(PHI);
      p.add(triangle.get_a());
      MyTriangle t1 = new MyTriangle(red, triangle.get_c(), p, triangle.get_b());
      MyTriangle t2 = new MyTriangle(blue, p, triangle.get_c(), triangle.get_a());
      result.add(t1);
      result.add(t2);
    }   
  }
  return result;  
}

// takes a position and creates the Pvector for the top coordinate of the triangle
PVector make_vector(float x, float y, float angle, float vector_length) {    
  float radians = convert_to_radians(angle);
  int result_x = int(vector_length * cos(radians));
  int result_y = int(vector_length * sin(radians));
  PVector result = new PVector(result_x, result_y);
  return result;  
}

// takes a color, x, y, and angle and returns a MyTriangle
MyTriangle make_triangle(color couleur, int x, int y, float angle) {
  PVector a = new PVector(x, y);
  PVector c = PVector.sub(a, make_vector(a.x, a.y, 72.0+angle, PHI*UNIT_SIZE));
  PVector b = PVector.sub(a, make_vector(a.x, a.y, 72.0+36.0+angle, PHI*UNIT_SIZE));
  MyTriangle triangle = new MyTriangle(couleur, a, b, c);
  return triangle;
}  

//converts an angle to radians
// convert_to_radians(180) -> 3.1415927
float convert_to_radians(float degrees) {
  float result = 0.0174532925 * degrees;
  return result;  
}

// takes an int level and draws the penrose fractal
void draw_penrose(ArrayList<MyTriangle> starter_triangles, int level) {
  ArrayList<MyTriangle> triangles = new ArrayList<MyTriangle>();
  for (int i=0; i<level; i++) {
    triangles = sub_divide(starter_triangles);
  }    
  draw_triangles(triangles);
} 

// initializes the triangles arraylist with a wheel of triangles
ArrayList<MyTriangle> make_wheel() {
  ArrayList<MyTriangle> triangles = new ArrayList<MyTriangle>();
  color couleur;
  for (int i=0; i<10; i++) {
    float angle = 360/10*i;
    MyTriangle triangle = make_triangle(red,
     int(width/2), int(height/2), angle);
     triangles.add(triangle);
  }
  return triangles;
}

// takes a MyTriangle and shades in the triangle area and outlines 2 sides  
void draw_triangle(MyTriangle triangle) {
  if (triangle.get_color() == red) {
  
  // fill triangle area
  strokeWeight(0);
  fill(triangle.get_color());
  triangle(
   triangle.get_a().x, triangle.get_a().y,
   triangle.get_b().x, triangle.get_b().y, 
   triangle.get_c().x, triangle.get_c().y);
   
  // draw outlines
  strokeWeight(2);
  line(triangle.get_a().x, triangle.get_a().y,
   triangle.get_b().x, triangle.get_b().y);  
  line(triangle.get_a().x, triangle.get_a().y,
   triangle.get_c().x, triangle.get_c().y);
  } 
}

void draw_triangles(ArrayList<MyTriangle> triangles) {
  for (int i=0; i<triangles.size(); i++) {
    println("i: " + i);
    MyTriangle triangle = triangles.get(i); 
    draw_triangle(triangle);
  }  
}

ArrayList<MyTriangle> init_triangles() {
  ArrayList<MyTriangle> result = new ArrayList<MyTriangle>();
  MyTriangle triangle = make_triangle(red, int(width/2), int(height/2), 0.0);
  //ArrayList<MyTriangle> wheel = make_wheel();
  //result.addAll(wheel);
  result.add(triangle);
  return result;
}

void setup() {
  size(640, 480);
  ArrayList<MyTriangle> triangles = init_triangles();
  draw_penrose(triangles, 1);   
}

void draw() {
}
  


