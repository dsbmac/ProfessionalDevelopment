
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
int WIDTH = 640;
int HEIGHT = 960;
float XCTR = WIDTH/2;
float YCTR = HEIGHT/2;
int timer = 0;

void setup()
{
  size(WIDTH, HEIGHT, P2D);
  
  background(0); 
  play();  
}

void play() {
  answerRGB.clear();
  guessRGB.set(0, 0);
  guessRGB.set(1, 0);
  guessRGB.set(2, 0);
  score = 0;  
  gameOver = false;
  showAnswer = false;
  userTurn = false;
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
  timer = minute()*60 + second();
}

void checkHide() { //timer for answer
  int alarm = minute()*60 + second();
  if (!gameOver && alarm-timer > 1) {
     showAnswer = false;
     userTurn = true;       
  }
}

void userGuess() {
  if (userTurn && mouseX > 0 && mouseX < width && mouseY > 0 && mouseY < height) { //if the mouse is on screen
    float red = map(mouseX, 0, width, 0, 255);
    float blue = map(mouseY, 0, height, 0, 255);
    float green = map(dist(mouseX,mouseY,width/2,height/2), 0, 575, 0, 255);
    guessRGB.set(0, red);
    guessRGB.set(1, blue);
    guessRGB.set(2, green);
  }  
}

void calculateScore() {
  userTurn = false;
  gameOver = true;
  float x = 0;
  for (int i=0; i<3; i++) {
    x += abs(answerRGB.get(i) - guessRGB.get(i));      
  }
  score = 100 - int(x / 3 / 255 * 100); 
}

void draw()
{
  background(0);
  
  //draw answer
  checkHide();  
  if (showAnswer || gameOver) {
    for (int i=0; i<sprites.size();i++) {
      shape(sprites.get(i), (width-LVL1CIRCLESIZE)/2, (height-LVL1CIRCLESIZE)/2);   
    }  
  }  
  if (userTurn && !gameOver) {
    fill(guessRGB.get(0), guessRGB.get(1), guessRGB.get(2));
    stroke(255);
    ellipse(XCTR, YCTR, LVL1CIRCLESIZE, LVL1CIRCLESIZE);    
  }  
//  String s = "RGB: " + guessRGB.get(0) + ", " + guessRGB.get(1) + ", " + guessRGB.get(2);
//  textSize(32);
//  text(s, 50,100);
//  
//  String s2 = mouseX + ", " + mouseY;
//  textSize(32);
//  text(s2, width /2, 300);
//  
//  String s3 = "RGB: " + answerRGB.get(0) + ", " + answerRGB.get(1) + ", " + answerRGB.get(2);
//  textSize(32);
//  text(s3, 50, 800);
//  
//  String bools = "gameOver: " + gameOver + ", showAns: " + showAnswer + ", user: " + userTurn;
//  textSize(12);
//  fill(255);
//  text(bools, 20, 200);
  
  //display score
  if (gameOver) {
    
    fill(255);
    textSize(64);
    text(score, width/2-40, 200);
      
    //show user's guess
    fill(guessRGB.get(0), guessRGB.get(1), guessRGB.get(2));
    stroke(255);
    line(XCTR-LVL1CIRCLESIZE/2, YCTR, XCTR+LVL1CIRCLESIZE/2, YCTR);
    arc(XCTR, YCTR, LVL1CIRCLESIZE, LVL1CIRCLESIZE, 0, PI);
  }  
}

void mouseDragged() { //sets the user's guess color
  if (userTurn) {
    userGuess();        
  }    
}

void mouseClicked() //if clicked inside circle will submit answer
{
  if (gameOver) {
    play(); 
  } else {
    if (userTurn && mouseX > width/2-LVL1CIRCLESIZE/2 && mouseX < width/2+LVL1CIRCLESIZE/2) {
      calculateScore();    
    }  
  }  
}

