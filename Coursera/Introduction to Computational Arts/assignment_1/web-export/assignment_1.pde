// An exploration in a color palette.
// The overall shape hints at another shape when the sub shapes are taken
// as a whole.

//constants
var PHI = 1.618;
var UNIT_SIZE = 55;
var radius = 55;

void setup() {
  size(480,640);
  
  var margin = max(width, height)*0.05;   
  var row_top_area = ((height-2*margin)/5);
  var golden_height = (height-2*margin)/PHI+margin;
  var row_bottom_area = ((height-golden_height-2*margin)/5);
  var column = (width-2*margin)/4;
  
  line(0, golden_height, width, golden_height);
  rectMode(CENTER);  
  strokeWeight(margin);
  fill(#5B402F);
  
  //draw border
  rect(width/2, height/2, width, height);
  fill(100);
  var colors = {#7AC0A8, #F2E0B1, #F09B2D, #F07315};
  
  //draw circles
  strokeWeight(1);
  for(var i=0; i<5; i++) {
    for (var j=0; j<4; j++) {
      fill(colors[Math.floor((Math.random()*colors.length))]);
      rect(column*j + margin + UNIT_SIZE, row_top_area*i+UNIT_SIZE+margin, UNIT_SIZE, UNIT_SIZE, radius);
    }  
  }  
}
 
void draw() {
  //instructions in here happen over and over again
}

