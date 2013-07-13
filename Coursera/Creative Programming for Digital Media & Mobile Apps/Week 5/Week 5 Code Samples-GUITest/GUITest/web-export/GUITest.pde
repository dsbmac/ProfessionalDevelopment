
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
   
   s.setInactiveColour(color(120, 80, 80));
   String [] sliderNames = {"red", "green", "blue", "conker"};
   // name,s min, max, pos.x, pos.y, width, height
   ms = new MultiSlider(sliderNames, 0, 255, 100, 300, 200, 10, HORIZONTAL);
   //String [] sliderNamesVert = new String[20];
   //for (int i = 0; i < sliderNamesVert.length; i++)
   //  sliderNamesVert[i] = "";
   msvert = new MultiSlider(20, 0, 255, 400, 300, 10, 100, UPWARDS);
   String [] radioNames = {"one", "two", "three"};
   r = new RadioButtons(radioNames, 100, 400, 50, 30, HORIZONTAL);
   
   PImage [] inactiveButtons = {ButtonInactive, ButtonInactive, ButtonInactive};
   PImage [] activeButtons = {ButtonActive, ButtonActive, ButtonActive};
   r.setInactiveImages(inactiveButtons);
   r.setActiveImages(activeButtons);
   
   r2 = new RadioButtons(radioNames, 10, 350, 50, 30, VERTICAL);
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

int HORIZONTAL = 0;
int VERTICAL   = 1;
int UPWARDS    = 2;
int DOWNWARDS  = 3;

class Widget
{

  
  PVector pos;
  PVector extents;
  String name;

  color inactiveColour = color(60, 60, 100);
  color activeColour = color(100, 100, 160);
  color bgColour = inactiveColour;
  color lineColour = color(255);
  
  
  
  void setInactiveColour(color c)
  {
    inactiveColour = c;
    bgColour = inactiveColour;
  }
  
  color getInactiveColour()
  {
    return inactiveColour;
  }
  
  void setActiveColour(color c)
  {
    activeColour = c;
  }
  
  color getActiveColour()
  {
    return activeColour;
  }
  
  void setLineColour(color c)
  {
    lineColour = c;
  }
  
  color getLineColour()
  {
    return lineColour;
  }
  
  String getName()
  {
    return name;
  }

  Widget(String t, int x, int y, int w, int h)
  {
    pos = new PVector(x, y);
    extents = new PVector (w, h);
    name = t;
  }

  void display()
  {
  }

  boolean isClicked()
  {
    
    if (mouseX > pos.x && mouseX < pos.x+extents.x 
      && mouseY > pos.y && mouseY < pos.y+extents.y)
    {
      return true;
    }
    else
    {
      return false;
    }
  }
  
  boolean mousePressed()
  {
    return isClicked();
  }
  
  boolean mouseDragged()
  {
    return isClicked();
  }
  
  
  boolean mouseReleased()
  {
    return isClicked();
  }
}

class Button extends Widget
{
  PImage activeImage = null;
  PImage inactiveImage = null;
  PImage currentImage = null;
  
  Button(String nm, int x, int y, int w, int h)
  {
    super(nm, x, y, w, h);
  }
  
  void setInactiveImage(PImage img)
  {
    if(currentImage == inactiveImage || currentImage == null)
    {
      inactiveImage = img;
      currentImage = inactiveImage;
    }
    else
    {
      inactiveImage = img;
    }
  }
  
  void setActiveImage(PImage img)
  {
    if(currentImage == activeImage || currentImage == null)
    {
      activeImage = img;
      currentImage = activeImage;
    }
    else
    {
      activeImage = img;
    }
  }

  void display()
  {
    if(currentImage != null)
    {
      float imgHeight = (extents.x*currentImage.height)/currentImage.width;
      image(currentImage, pos.x, pos.y, extents.x, imgHeight);
    }
    else
    {
      pushStyle();
      stroke(lineColour);
      fill(bgColour);
      rect(pos.x, pos.y, extents.x, extents.y);
  
      fill(lineColour);
      textAlign(CENTER, CENTER);
      text(name, pos.x + 0.5*extents.x, pos.y + 0.5* extents.y);
      popStyle();
    }
  }
  
  boolean mousePressed()
  {
    if (super.mousePressed())
    {
      bgColour = activeColour;
      if(activeImage != null)
        currentImage = activeImage;
      return true;
    }
    return false;
  }
  
  boolean mouseReleased()
  {
    if (super.mouseReleased())
    {
      bgColour = inactiveColour;
      if(inactiveImage != null)
        currentImage = inactiveImage;
      return true;
    }
    return false;
  }
}

class Toggle extends Button
{
  boolean on = false;

  Toggle(String nm, int x, int y, int w, int h)
  {
    super(nm, x, y, w, h);
  }


  boolean get()
  {
    return on;
  }

  void set(boolean val)
  {
    on = val;
    if (on)
    {
      bgColour = activeColour;
      if(activeImage != null)
        currentImage = activeImage;
    }
    else
    {
      bgColour = inactiveColour;
      if(inactiveImage != null)
        currentImage = inactiveImage;
    }
  }

  void toggle()
  {
    set(!on);
  }

  
  boolean mousePressed()
  {
    return super.isClicked();
  }

  boolean mouseReleased()
  {
    if (super.mouseReleased())
    {
      toggle();
      return true;
    }
    return false;
  }
}

class RadioButtons extends Widget
{
  Toggle [] buttons;
  
  RadioButtons (String [] nm, int x, int y, int w, int h, int orientation)
  {
    super(nm[0], x, y, w*nm.length, h);
    buttons = new Toggle[nm.length];
    for (int i = 0; i < buttons.length; i++)
    {
      int bx, by;
      if(orientation == HORIZONTAL)
      {
        bx = x+i*w;
        by = y;
      }
      else
      {
        bx = x;
        by = y+i*h;
      }
      buttons[i] = new Toggle(nm[i], bx, by, w, h);
    }
  }
  
  
  
  void setInactiveImage(PImage img)
  {
    for (int i = 0; i < buttons.length; i++)
    {
      buttons[i].setInactiveImage(img);
    }
  }
  
  void setInactiveImages(PImage [] imgs)
  {
    for (int i = 0; i < buttons.length; i++)
    {
      buttons[i].setInactiveImage(imgs[i]);
    }
  }
  
  void setActiveImage(PImage img)
  {
    for (int i = 0; i < buttons.length; i++)
    {
      buttons[i].setActiveImage(img);
    }
  }
  
  void setActiveImages(PImage [] imgs)
  {
    for (int i = 0; i < buttons.length; i++)
    {
      buttons[i].setActiveImage(imgs[i]);
    }
  }

  void set(String buttonName)
  {
    for (int i = 0; i < buttons.length; i++)
    {
      if(buttons[i].getName().equals(buttonName))
      {
        buttons[i].set(true);
      }
      else
      {
        buttons[i].set(false);
      }
    }
  }
  
  String get()
  {
    for (int i = 0; i < buttons.length; i++)
    {
      if(buttons[i].get())
      {
        return buttons[i].getName();
      }
    }
    return "";
  }

  void display()
  {
    for (int i = 0; i < buttons.length; i++)
    {
      buttons[i].display();
    }
  }

  boolean mousePressed()
  {
    for (int i = 0; i < buttons.length; i++)
    {
      if(buttons[i].mousePressed())
      {
        return true;
      }
    }
    return false;
  }
  
  boolean mouseDragged()
  {
    for (int i = 0; i < buttons.length; i++)
    {
      if(buttons[i].mouseDragged())
      {
        return true;
      }
    }
    return false;
  }

  boolean mouseReleased()
  {
    for (int i = 0; i < buttons.length; i++)
    {
      if(buttons[i].mouseReleased())
      {
        for(int j = 0; j < buttons.length; j++)
        {
          if(i != j)
            buttons[j].set(false);
        }
        buttons[i].set(true);
        return true;
      }
    }
    return false;
  }
}

class Slider extends Widget
{
  float minimum;
  float maximum;
  float val;
  int textWidth = 60;
  int orientation = HORIZONTAL;

  Slider(String nm, float v, float min, float max, int x, int y, int w, int h, int ori)
  {
    super(nm, x, y, w, h);
    val = v;
    minimum = min;
    maximum = max;
    orientation = ori;
    if(orientation == HORIZONTAL)
      textWidth = 60;
    else
      textWidth = 20;
    if(name == "")
      textWidth = 0;
  }

  float get()
  {
    return val;
  }

  void set(float v)
  {
    val = v;
    val = constrain(val, minimum, maximum);
  }

  void display()
  {
    pushStyle();
    textAlign(LEFT, TOP);
    fill(lineColour);
    text(name, pos.x, pos.y);
    stroke(lineColour);
    noFill();
    if(orientation ==  HORIZONTAL){
      rect(pos.x+textWidth, pos.y, extents.x-textWidth, extents.y);
    } else {
      rect(pos.x, pos.y+textWidth, extents.x, extents.y-textWidth);
    }
    noStroke();
    fill(bgColour);
    float sliderPos; 
    if(orientation ==  HORIZONTAL){
        sliderPos = map(val, minimum, maximum, 0, extents.x-textWidth-4); 
        rect(pos.x+textWidth+2, pos.y+2, sliderPos, extents.y-4);
    } else if(orientation ==  VERTICAL || orientation == DOWNWARDS){
        sliderPos = map(val, minimum, maximum, 0, extents.y-textWidth-4); 
        rect(pos.x+2, pos.y+textWidth+2, extents.x-4, sliderPos);
    } else if(orientation == UPWARDS){
        sliderPos = map(val, minimum, maximum, 0, extents.y-textWidth-4); 
        rect(pos.x+2, pos.y+textWidth+2 + (extents.y-textWidth-4-sliderPos), extents.x-4, sliderPos);
    };
    popStyle();
  }

  
  boolean mouseDragged()
  {
    if (super.mouseDragged())
    {
      if(orientation ==  HORIZONTAL){
        set(map(mouseX, pos.x+textWidth, pos.x+extents.x-4, minimum, maximum));
      } else if(orientation ==  VERTICAL || orientation == DOWNWARDS){
        set(map(mouseY, pos.y+textWidth, pos.y+extents.y-4, minimum, maximum));
      } else if(orientation == UPWARDS){
        set(map(mouseY, pos.y+textWidth, pos.y+extents.y-4, maximum, minimum));
      };
      return true;
    }
    return false;
  }

  boolean mouseReleased()
  {
    if (super.mouseReleased())
    {
      if(orientation ==  HORIZONTAL){
        set(map(mouseX, pos.x+textWidth, pos.x+extents.x-10, minimum, maximum));
      } else if(orientation ==  VERTICAL || orientation == DOWNWARDS){
        set(map(mouseY, pos.y+textWidth, pos.y+extents.y-10, minimum, maximum));
      } else if(orientation == UPWARDS){
        set(map(mouseY, pos.y+textWidth, pos.y+extents.y-10, maximum, minimum));
      };
      return true;
    }
    return false;
  }
}

class MultiSlider extends Widget
{
  Slider [] sliders;
  /*
  MultiSlider(String [] nm, float min, float max, int x, int y, int w, int h, int orientation)
  {
    super(nm[0], x, y, w, h*nm.length);
    sliders = new Slider[nm.length];
    for (int i = 0; i < sliders.length; i++)
    {
      int bx, by;
      if(orientation == HORIZONTAL)
      {
        bx = x;
        by = y+i*h;
      }
      else
      {
        bx = x+i*w;
        by = y;
      }
      sliders[i] = new Slider(nm[i], 0, min, max, bx, by, w, h, orientation);
    }
  }
  */
  MultiSlider(int numSliders, float min, float max, int x, int y, int w, int h, int orientation)
  {
    super("", x, y, w, h*numSliders);
    sliders = new Slider[numSliders];
    for (int i = 0; i < sliders.length; i++)
    {
      int bx, by;
      if(orientation == HORIZONTAL)
      {
        bx = x;
        by = y+i*h;
      }
      else
      {
        bx = x+i*w;
        by = y;
      }
      sliders[i] = new Slider("", 0, min, max, bx, by, w, h, orientation);
    }
  }

  void set(int i, float v)
  {
    if(i >= 0 && i < sliders.length)
    {
      sliders[i].set(v);
    }
  }
  
  float get(int i)
  {
    if(i >= 0 && i < sliders.length)
    {
      return sliders[i].get();
    }
    else
    {
      return -1;
    }
    
  }

  void display()
  {
    for (int i = 0; i < sliders.length; i++)
    {
      sliders[i].display();
    }
  }

  
  boolean mouseDragged()
  {
    for (int i = 0; i < sliders.length; i++)
    {
      if(sliders[i].mouseDragged())
      {
        return true;
      }
    }
    return false;
  }

  boolean mouseReleased()
  {
    for (int i = 0; i < sliders.length; i++)
    {
      if(sliders[i].mouseReleased())
      {
        return true;
      }
    }
    return false;
  }
}


