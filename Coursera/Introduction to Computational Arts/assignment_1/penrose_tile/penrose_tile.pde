//globals
float PHI = (1 + sqrt(5)) / 2;
int UNIT_SIZE = 100;
color blue = #00ADA7;
color red = #C24366;

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
    PVector a, b, c;
    a = triangle.get_a();
    b = triangle.get_b();
    c = triangle.get_c();
    if (triangle.get_color() == red) {
      //subdivide red triangle
      PVector p = PHI_vector(b, a);
      MyTriangle t1 = new MyTriangle(red, c, p, b);
      MyTriangle t2 = new MyTriangle(blue, p, c, a);
      result.add(t1);
      result.add(t2);
    } 
    else {
      PVector q, r;
      q = PHI_vector(a, b);
      r = PHI_vector(c, b);
      MyTriangle t1 = new MyTriangle(blue, r, c, a);
      MyTriangle t2 = new MyTriangle(blue, q, r, b);
      MyTriangle t3 = new MyTriangle(red, r, q, a);
      result.add(t1);
      result.add(t2);
      result.add(t3);
    }
  }
  return result;
}

// creates a new PVector subdivision based on PHI
PVector PHI_vector(PVector x, PVector y) {
  PVector result;
  result = PVector.sub(x, y);
  result.div(PHI);
  result.add(y);
  return result;
}

void sub_divide_blue(ArrayList<MyTriangle> triangles) {
}

// takes an int level and draws the penrose fractal
void draw_penrose(ArrayList<MyTriangle> triangles, int level) {
  //ArrayList<MyTriangle> triangles = new ArrayList<MyTriangle>();
  for (int i=0; i<level; i++) {
    triangles = sub_divide(triangles);
  }
  draw_triangles(triangles);
} 

// initializes the triangles arraylist with a wheel of triangles
ArrayList<MyTriangle> make_wheel() {
  ArrayList<MyTriangle> triangles = new ArrayList<MyTriangle>();
  color couleur;
  for (int i=0; i<10; i++) {
    float angle = 360/10*i;
    boolean isMirror = i%2 == 0;
    MyTriangle triangle = make_triangle(red, 
    int(width/2), int(height/2), angle, isMirror);
    triangles.add(triangle);
  }
  return triangles;
}

// takes a color, x, y, and angle and returns a MyTriangle
MyTriangle make_triangle(color couleur, int x, int y, float angle, 
boolean isMirror) {
  PVector a = new PVector(x, y);
  PVector c = PVector.sub(a, make_vector(a.x, a.y, 72.0+angle, PHI*UNIT_SIZE));
  PVector b = PVector.sub(a, make_vector(a.x, a.y, 72.0+36.0+angle, PHI*UNIT_SIZE));
  if (isMirror) {
    PVector swap = b;
    b = c;
    c = swap;
  } 
  MyTriangle triangle = new MyTriangle(couleur, a, b, c);

  return triangle;
} 

// takes a position and creates the Pvector for the top coordinate of the triangle
PVector make_vector(float x, float y, float angle, float vector_length) {    
  float radians = convert_to_radians(angle);
  int result_x = int(vector_length * cos(radians));
  int result_y = int(vector_length * sin(radians));
  PVector result = new PVector(result_x, result_y);
  return result;
}

//converts an angle to radians
// convert_to_radians(180) -> 3.1415927
float convert_to_radians(float degrees) {
  float result = 0.0174532925 * degrees;
  return result;
}

// takes a MyTriangle and shades in the triangle area and outlines 2 sides  
void draw_triangle(MyTriangle triangle) {
  // shade in triangle area
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

void draw_triangles(ArrayList<MyTriangle> triangles) {
  println("size: " + triangles.size());
  for (int i=0; i<triangles.size(); i++) {
    println("i: " + i);
    MyTriangle triangle = triangles.get(i);
    println("color: " + triangle.get_color());
    println("a: " + triangle.get_a());
    println("b: " + triangle.get_b());
    println("c: " + triangle.get_c());
    draw_triangle(triangle);
  }
}

ArrayList<MyTriangle> init_triangles() {
  ArrayList<MyTriangle> result = new ArrayList<MyTriangle>();
  MyTriangle triangle = make_triangle(red, int(width/2), int(height/2), 0.0, false);
  ArrayList<MyTriangle> wheel = make_wheel();
  result.addAll(wheel);
  //result.add(triangle);
  return result;
}

void setup() {
  size(640, 480);
  ArrayList<MyTriangle> triangles = init_triangles();
  draw_penrose(triangles, 3);
}

void draw() {
}

