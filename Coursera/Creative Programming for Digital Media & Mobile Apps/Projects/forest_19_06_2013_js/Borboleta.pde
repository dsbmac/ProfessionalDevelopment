public class Borboleta {

  private float pX, pY;
  private int cX, cY;
  //destino
  private int tX, tY;
  private int circIncX;
  private boolean bottom;
  private boolean circ;
  //centro do circulo que engloba a origem e destino 
  private float mX, mY;
  //raio do circulo
  private float r;
  //declive para a reta da origem e destino
  private float m;
  //tipo de movimento - linear ou circular
  private int movimento;

  private AnimSprite borboleta;

  private boolean vectorMove;
  private int [][]destVector;
  private int vectorIndex;
  //define valor de espera entre movimento - frames
  private int espera;

  public Borboleta(int posX, int posY) {
    //sprite animado
    borboleta = new AnimSprite();
    borboleta.loadImages("images/borboleta/borboleta", "png", 24);
    borboleta.setPlayPos(posX, posY, CORNER);
    borboleta.setPlaySpeed(100);

    //movimentos
    pX = posX;
    pY = posX;
    circIncX = 1;
    bottom = false;
    circ = false;
    //newDestination();
    vectorIndex = 0;
    vectorMove = false;
    espera = 1000;
  } 


  public void setDestinationVector(int [][]positions) {
    destVector = positions;
  }


  private void newDestination() {
    tX = (int) random(0, width);
    tY = (int) random(0, height);
    
    movimento = (int) random(0, 6);
    
    espera = (int) random(0,150);
    m = (tY-pY) / (tX-pX);
    r = dist(tX, tY, pX, pY) / 2.0;
    mX = (pX + tX) / 2.0;
    mY = (pY + tY) / 2.0;
    /*
    println("m:"+m);
     
    print("T:"+tX+"x"+tY);
    println("P:"+pX+"x"+pY);
    */
  }

  private void vectorDestination() {
    espera = (int) random(0,150);
    tX = destVector[vectorIndex][0];
    tY = destVector[vectorIndex][1];
    vectorIndex++;
    if (vectorIndex>=destVector.length) {
      //println("index"+vectorIndex);
      vectorIndex = 0;
      movimento = 0;
    }
    else {
      movimento = (int) random(0, 6);
    }

    m = (tY-pY) / (tX-pX);
    r = dist(tX, tY, pX, pY) / 2.0;
    mX = (pX + tX) / 2.0;
    mY = (pY + tY) / 2.0;
    /*
    println("m:"+m);
     
    print("Vector T:"+tX+"x"+tY);
    println("Vector P:"+pX+"x"+pY);
    println("Vector E:"+espera);
    */
  }

  private void randomVectorDestination() {
    int nextMove = (int) random(0, 6);
    if (nextMove > 3 ) {
      newDestination(); 
    }
    else {
      vectorDestination(); 
    }
  }


  public void moveCircular() {
    //println("Linear E:"+espera);
    if (pX != tX || pY != tY) {
      if (!circ) {
        setCircDirection();
        //println("circ dir");
        circ = true;
      }

      pX+=circIncX;
      float temp = r*r - (pX-mX)*(pX-mX);
      if (temp<0) {
        //println("P:"+pX+"x"+pY);    
        circIncX *= -1;
        bottom = !bottom;
        pY = mY - circIncX;
      }
      if (bottom) {
        pY = round ( sqrt( r*r - (pX-mX)*(pX-mX) ) + mY);
      }
      else {
        pY = round (-sqrt( r*r - (pX-mX)*(pX-mX) ) + mY);
      }
    }
    else {
      //ja chegou ao destino - mudar de destino
      circ = false;
      if (espera == 0) {
        //println("End Circ P:"+pX+"x"+pY);
        if (vectorMove)
          randomVectorDestination();
        else
          newDestination();
      }
      else {
        espera--; 
      }
      //println("Circ E:"+espera);
    }
  }


  public void setCircDirection() {
    if (pY > mY) {
      bottom = true;
    }
    else {
      bottom = false;
    }
    if (pX > tX) {
      circIncX = -1;
    }
    else {
      circIncX = 1;
    }
    //println(bottom);
  }


  public void moveLinear() {
    //println("Linear E:"+espera);
    if (pX != tX || pY != tY) { 
      if (pX > tX) {
        pX--;
      }
      else
        if (pX < tX) {
          pX++;
        }
      pY = round(m*(pX-tX)+tY);
      //println("L");
    }
    else {
      //ja chegou ao destino - mudar de destino
      if (espera == 0 ) {
        //println("End Linear P:"+pX+"x"+pY);
        if (vectorMove)
          randomVectorDestination();
        else
          newDestination();
      }
      else {
        espera--; 
      }
      //println("Linear E:"+espera);
    }
  }

  public void moveSimples() {
    if (pX > tX) {
      pX--;
    } 
    else 
      if (pX < tX) {
      pX++;
    }
    if (pY > tY) {
      pY--;
    }
    else
      if (pY < tY) {
        pY++;
      }
    /*
  if (pX!=tX || pY!=tY)
     println("P:"+pX+"x"+pY);
     */
  }
  
  public void show() {
    borboleta.play();
  }
  
  public void moverVector() {
    vectorMove = true;
    randomVectorDestination();
  }
  
  public void mover() {
    if (movimento>3) { 
      moveCircular();
    }
    else {
      moveLinear();
    }
    borboleta.setPlayPos(pX, pY, CORNER);
  }
  
  public boolean insideBoundingBox(int x,int y) {
    return borboleta.insideBoundingBox(x,y);
  }
  
}

