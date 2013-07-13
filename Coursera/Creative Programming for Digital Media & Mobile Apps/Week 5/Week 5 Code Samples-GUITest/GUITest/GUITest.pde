
Button b;
Toggle t; 
Slider s, sup, sdown;
MultiSlider ms, msvert;
RadioButtons r;
RadioButtons r2;

void setup()
{
   size(640, 480);
   
   PImage ButtonInactive = loadImage("ButtonInactive.png");
   PImage ButtonActive = loadImage("ButtonActive.png");
   
   // name, pos.x, pos.y, width, height
   b = new Button("button", 100, 10, 50, 30);
   b.setInactiveImage(ButtonInactive);
   b.setActiveImage(ButtonActive);
   t = new Toggle("toggle", 100, 100, 50, 30);
   
   // name, value, min, max, pos.x, pos.y, width, height
   s = new Slider("slider", 20, 0, 100, 100, 150, 200, 20, HORIZONTAL);
   
   sup = new Slider("up", 20, 0, 100, 450, 150, 20, 100, UPWARDS);
   sdown = new Slider("down", 100, 0, 100, 500, 150, 20, 100, DOWNWARDS);
   
   s.setInactiveColor(color(120, 80, 80));
   String [] sliderNames = {"red", "green", "blue", "conker"};
   // name,s min, max, pos.x, pos.y, width, height
   ms = new MultiSlider(sliderNames.length, 0, 255, 100, 300, 200, 10, HORIZONTAL);
   ms.setNames(sliderNames);
   //String [] sliderNamesVert = new String[20];
   //for (int i = 0; i < sliderNamesVert.length; i++)
   //  sliderNamesVert[i] = "";
   msvert = new MultiSlider(20, 0, 255, 400, 300, 10, 100, UPWARDS);
   String [] radioNames = {"one", "two", "three"};
   r = new RadioButtons(radioNames.length, 100, 400, 50, 30, HORIZONTAL);
   
   PImage [] inactiveButtons = {ButtonInactive, ButtonInactive, ButtonInactive};
   PImage [] activeButtons = {ButtonActive, ButtonActive, ButtonActive};
   
   for (int j = 0; j < inactiveButtons.length; j++)
     r.setInactiveImage(j,inactiveButtons[j]);
   //r.setInactiveImages(inactiveButtons);
   
   for (int j = 0; j < activeButtons.length; j++)
     r.setActiveImage(j,activeButtons[j]);
   
   r2 = new RadioButtons(radioNames.length, 10, 350, 50, 30, VERTICAL);
}

void draw()
{
   background(ms.get(0), ms.get(1), ms.get(2)); 
   //println(ms.get(0));
   
   if(t.get())
   {
     ellipse(width/2, height/2, s.get(), s.get());
   }
    
   b.display();
   t.display();
   s.display();
   sup.display();
   sdown.display();
   ms.display();
   msvert.display();
   r.display();
   r2.display();
}

void mousePressed()
{
  if(b.mousePressed())
  {
    println("hello");
  }  
  t.mousePressed();
  s.mousePressed();
  sup.mousePressed();
  sdown.mousePressed();
  ms.mousePressed();
  msvert.mousePressed();
  r.mousePressed();
  r2.mousePressed();
}


void mouseDragged()
{
  if(b.mouseDragged())
  {
    println("hello");
  }  
  t.mouseDragged();
  s.mouseDragged();
  sup.mouseDragged();
  sdown.mouseDragged();
  ms.mouseDragged();  
  msvert.mouseDragged();
  r.mouseDragged();
  r2.mouseDragged();
}

void mouseReleased()
{
  if(b.mouseReleased())
  {
    println("hello");
  }  
  t.mouseReleased();
  s.mouseReleased();
  sup.mouseReleased();
  sdown.mouseReleased();
  ms.mouseReleased();
  msvert.mouseReleased();
  r.mouseReleased();
  if(r2.mouseReleased())
  {
    println(r2.get());
  }
}
