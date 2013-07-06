
Maxim maxim;

ArrayList<PShape> sprites = new ArrayList<PShape>();
IntList answerRGB;
IntList guess;

void setup()
{
  size(640, 960);
  
  background(100); 
  play();
}

void play() {
 answerRound();
 userGuess();
 compare();   
}

void answerRound() {
  pickAnswer();
  showAnswer();
}

void pickAnswer() {
  for (int i=0; i<3; i++) {
  answerRGB.append(int(random(256)));  
  }  
}

void showAnswer() {
  fill(answerRGB[0], answerRGB[1], answerRGB[2]);
  PShape answer = ellipse(width/2, height/2, lvl1CircleSize, lvl1CircleSize);
  sprites.add(answer);    
}

void draw()
{
  for (int i=0; i<sprites.size();i++) {
    sprites.get(i);    
  }
  line(0,0,100,100);
}

void mouseDragged()
{
}

void mousePressed()
{
}

void mouseReleased()
{
}


