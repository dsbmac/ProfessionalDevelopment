
Maxim maxim;

ArrayList<PShape> sprites = new ArrayList<PShape>();
FloatList answerRGB = new FloatList();
FloatList guessRGB = new FloatList();
int LVL1CIRCLESIZE = 300;
int score;
PShape answerShape;
boolean showAnswer;
boolean userTurn;
boolean gameOver;

void setup()
{
  size(640, 960, P2D);
  
  background(0); 
  play();  
}

void play() {
  score = 0;  
  gameOver = false;
  answerRound();
  userGuess(); 
}

void answerRound() {
  pickAnswer();
  showAnswer();
}

void pickAnswer() {
  for (int i=0; i<3; i++) {
    answerRGB.append(random(255));  
  }  
}

void showAnswer() {
  fill(answerRGB.get(0), answerRGB.get(1), answerRGB.get(2));
  stroke(answerRGB.get(0), answerRGB.get(1), answerRGB.get(2));
  PShape answer = createShape(ELLIPSE, 0, 0, LVL1CIRCLESIZE, LVL1CIRCLESIZE);
  sprites.add(answer);
  answerShape = answer;  
  showAnswer = true;
}

void userGuess() {
  
}

void calculateScore() {
  float x = 0;
  for (int i=0; i<3; i++) {
    x += abs(answerRGB.get(i) - guessRGB.get(i));      
  }
  score = 100 - int(x / 3 / 255 * 100);
  gameOver = true;
}

void draw()
{
  background(0); 
  for (int i=0; i<sprites.size();i++) {
    shape(sprites.get(i), (width-LVL1CIRCLESIZE)/2, (height-LVL1CIRCLESIZE)/2);   
  }
  fill(guessRGB.get(0), guessRGB.get(1), guessRGB.get(2));
  ellipse(50,50,50,50);
  
  String s = "RGB: " + guessRGB.get(0) + ", " + guessRGB.get(1) + ", " + guessRGB.get(2);
  textSize(32);
  text(s, 50,100);
  
  String s2 = mouseX + ", " + mouseY;
  textSize(32);
  text(s2, width /2, 300);
  
  String s3 = "RGB: " + answerRGB.get(0) + ", " + answerRGB.get(1) + ", " + answerRGB.get(2);
  textSize(32);
  text(s3, 50, 800);
  
  
  if (gameOver) {
    fill(255);
    textSize(64);
    text(score, width/2, 100);    
  }  
}

void mouseDragged() { 
  if (mouseX > 0 && mouseX < width && mouseY > 0 && mouseY < height) {
    float red = map(mouseX, 0, width, 0, 255);
    float blue = map(mouseY, 0, width, 0, 255);
    float green = map(dist(mouseX,mouseY,width/2,height/2), 0, 575, 0, 255);
    guessRGB.set(0, red);
    guessRGB.set(1, blue);
    guessRGB.set(2, green); 
  }
    
}

void mousePressed()
{
  
}

void mouseClicked()
{
  if (mouseX > width/2-LVL1CIRCLESIZE/2 && mouseX < width/2+LVL1CIRCLESIZE/2) {
    userTurn = false;
    calculateScore();    
  }
}

