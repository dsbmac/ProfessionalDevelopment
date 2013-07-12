/* @pjs preload="images/arvore1.png, images/arvore2.png, images/arvore3.png, images/arvore4.png, images/arvore5.png, images/borboleta/borboleta0.png, images/borboleta/borboleta1.png, images/borboleta/borboleta10.png, images/borboleta/borboleta11.png, images/borboleta/borboleta12.png, images/borboleta/borboleta13.png, images/borboleta/borboleta14.png, images/borboleta/borboleta15.png, images/borboleta/borboleta16.png, images/borboleta/borboleta17.png, images/borboleta/borboleta18.png, images/borboleta/borboleta19.png, images/borboleta/borboleta2.png, images/borboleta/borboleta20.png, images/borboleta/borboleta21.png, images/borboleta/borboleta22.png, images/borboleta/borboleta23.png, images/borboleta/borboleta24.png, images/borboleta/borboleta3.png, images/borboleta/borboleta4.png, images/borboleta/borboleta5.png, images/borboleta/borboleta6.png, images/borboleta/borboleta7.png, images/borboleta/borboleta8.png, images/borboleta/borboleta9.png, images/cenoura.png, images/coelho.png, images/coelho_so.png, images/cogumelo.png, images/cogumelo1.png, images/fundo.png, images/galho.png, images/mocho.png, images/mocho_so.png, images/nuvem1.png, images/nuvem2.png, images/relva.png, images/sapo.png"; 
 */



//para o som
Maxim maxim;
AudioPlayer player1,playerSapo,playerMocho,playerCoelho;
AudioPlayer playerRight;


PImage fundo;
PImage relva;
PImage [] nuvens = new PImage[2];
PImage [] arvores = new PImage[5];
//posições das árvores
int [][]arvoresPos = { {450,100}, 
                       {150,50},
                       {300,50},
                       {10,50},
                       {600,80}};
int [][]nuvensPos = { {50,0}, 
                      {600,0}};


//Sprite arv;

int sizeMult = 2;
int backColor = 255;
boolean dragging = false;
boolean borboletaPlay = true;

Sprite sapo;
Sprite cogumelo;
Sprite mochoCompleto;
Sprite mochoGalho;
Sprite mocho;

Sprite coelho;
Sprite coelhoCenoura;
Sprite coelhoCompleto;
Sprite borboletaParada;

Sprite toMove;

/* pos: sapo,mocho,coelho, borboleta */
int [][]spritePosStart = { {10,10}, 
                           {100,10},
                           {170,10},
                           {240,0}};
                           
int [][]spritePosEnd = { {680,200}, 
                         {160,240},
                         {280,340}};


int [][]floresPos = { {630,370},
                      {520,400},  
                      {340,370},  
                      {130,380}};
boolean animBorboleta;
Borboleta borboleta;

void setup() {
  /* som */
  maxim = new Maxim(this);
  player1 = maxim.loadFile("floresta_mono.wav");
  player1.setLooping(true);  
  
  playerSapo = maxim.loadFile("sapo_mono.wav");
  playerSapo.setLooping(true);
  
  playerMocho = maxim.loadFile("mocho_mono.wav");
  playerMocho.setLooping(true);
 
  playerCoelho = maxim.loadFile("coelho_mono.wav");
  playerCoelho.setLooping(true);
  
  playerRight = maxim.loadFile("right.wav");
  
 
  /* carregar imagens */
  fundo = loadImage("images/fundo.png");
  //println("Fundo:"+fundo.width+"x"+fundo.height);
  
  relva = loadImage("images/relva.png");
  //carregar árvores e nuvens
  for (int i=1;i<=5;i++) {
    arvores[i-1] = loadImage("images/arvore"+i+".png"); 
  }
  for (int i=1;i<=2;i++) {
    nuvens[i-1] = loadImage("images/nuvem"+i+".png"); 
  }
  
  //size(fundo.width/sizeMult-5,fundo.height/sizeMult);
  size(912,527);
  //desenhar todo o fundo
  //drawBackground();
    
  //desenhar sprites
  
  cogumelo = new Sprite("images/cogumelo.png");
  cogumelo.setPosition(660,260,CORNER);
  cogumelo.setSize(50);
  cogumelo.draw();
  
  mochoGalho = new Sprite ("images/galho.png");
  mochoGalho.setPosition(158,284,CORNER);
  mochoGalho.setSize(40);
  mochoGalho.draw();
  
  coelhoCenoura = new Sprite ("images/cenoura.png");
  coelhoCenoura.setPosition(325,372,CORNER);
  coelhoCenoura.setSize(25);
  coelhoCenoura.draw();
  
  //sprites animais
  
  sapo = new Sprite("images/sapo.png");
  sapo.setPosition(spritePosStart[0][0],spritePosStart[0][1],CORNER);
  sapo.setSize(25);
  //sapo.setBorders(true);
  sapo.draw();
  
  mocho = new Sprite ("images/mocho_so.png");
  mocho.setPosition(spritePosStart[1][0],spritePosStart[1][1],CORNER);
  mocho.setSize(10);
  mocho.draw();
  
  mochoCompleto = new Sprite ("images/mocho.png");
  mochoCompleto.setPosition(spritePosEnd[1][0],spritePosEnd[1][1],CORNER);
  mochoCompleto.setSize(10);
  mochoCompleto.draw();
  
  coelhoCompleto = new Sprite ("images/coelho.png");
  coelhoCompleto.setPosition(spritePosEnd[2][0],spritePosEnd[2][1],CORNER);
  coelhoCompleto.setSize(25);
  //coelhoCompleto.draw();
 
  coelho = new Sprite ("images/coelho_so.png");
  coelho.setPosition(spritePosStart[2][0],spritePosStart[2][1],CORNER);
  coelho.setSize(25);
  coelho.draw();
  
  borboletaParada = new Sprite ("images/borboleta/borboleta0.png");
  borboletaParada.setPosition(spritePosStart[3][0],spritePosStart[3][1],CORNER);
  borboletaParada.setSize(100);
  borboletaParada.draw();
  
  borboleta = new Borboleta(spritePosStart[3][0],spritePosStart[3][1]);
  borboleta.setDestinationVector(floresPos);
  borboleta.moverVector();
  animBorboleta = false;
}

void draw() {
  player1.play();
  
  moveNuvens();
  drawBackground();
  
  cogumelo.draw();
  mochoGalho.draw();
  coelhoCenoura.draw();
  
  sapo.draw();
  mocho.draw();
  //mochoCompleto.draw();
  coelho.draw();
  //coelhoCompleto.draw();
  if (animBorboleta) {
    borboleta.mover();
    borboleta.show();  
  }
  else
    borboletaParada.draw();
  
}

void mouseReleased() {
  
  //verificar qual foi largado
  if (toMove!=null) {
    if (toMove == mocho) {
      if ( mochoCompleto.insideBoundingBox(mouseX,mouseY) ) {
        playerRight.play();
        playerMocho.play();
        //println("mocho certo");      
      }
      else {
        playerMocho.stop(); 
      }
    }
    if (toMove == sapo) {
      if ( mouseX >= spritePosEnd[0][0] && mouseX <= spritePosEnd[0][0]+sapo.width() &&
           mouseY >= spritePosEnd[0][1] && mouseY <= spritePosEnd[0][1]+sapo.height() )
      {
        playerRight.play();
        playerSapo.play();
        //println("sapo certo");      
      }
      else {
        playerSapo.stop();
      }
    }
    
    if (toMove == coelho) {
      if ( coelhoCompleto.insideBoundingBox(mouseX,mouseY) ) {
        playerRight.play();
        playerCoelho.play();
        //println("coelho certo");      
      }
      else {
        playerCoelho.stop(); 
      }
      
    }
    
    if (toMove == borboletaParada) {
      for (int i=0;i<floresPos.length;i++) {        
        if (dist(mouseX,mouseY,floresPos[i][0]+30,floresPos[i][1]+60) < 30) {
          playerRight.play();
          animBorboleta = true;
        }
      }  
      
    }
    
  }
  
  //if (!dragging) { 
    toMove = null;
  //}
  //dragging = false;
    
}

void mouseDragged() {
  //float m = map(mouseX,0,width,0,200);
  //estrela.setPlaySpeed( (int) m);
  if (toMove!=null) {
    toMove.setPosition(mouseX,mouseY,CENTER);
  }
  //println(mouseX+"x"+mouseY);
  dragging = true;
}

 


void mousePressed() {
  //println(mouseX+"x"+mouseY);
  playerRight.stop();
  if (mochoGalho.insideBoundingBox(mouseX,mouseY) ) {
    toMove = mochoGalho; 
  }
  
  if ( cogumelo.insideBoundingBox(mouseX,mouseY) ) {
    //println("Cogumelo");
   // toMove = cogumelo;
  }
  else
    if ( sapo.insideBoundingBox(mouseX,mouseY) ) {
      toMove = sapo;
     // println("Sapo");
      /*
      if (playerSapo.isPlaying() ) {
        playerSapo.stop();
      }
      else {
        playerSapo.play();
      }
      */
    }
    else 
      if (mocho.insideBoundingBox(mouseX,mouseY) ) {
        toMove = mocho;
        //println("Mocho");
        /*
        if (playerMocho.isPlaying() ) {
          playerMocho.stop();
        }
        else {
          playerMocho.play();
        }
        */
      }
     else
        if (coelho.insideBoundingBox(mouseX,mouseY) ) {
        toMove = coelho;
        //println("Coelho");
        /*
        if (playerCoelho.isPlaying() ) {
          playerCoelho.stop();
        }
        else {
          playerCoelho.play();
        }
        */
      }
      else
      if (borboletaParada.insideBoundingBox(mouseX,mouseY) || borboleta.insideBoundingBox(mouseX,mouseY)) {
        toMove = borboletaParada;
        animBorboleta=false;
      }
      
}

void moveNuvens() {
  for (int i=0;i<nuvensPos.length;i++) {
    nuvensPos[i][0]++;
    if (nuvensPos[i][0]>width) {
      nuvensPos[i][0]=-nuvens[i].width;
    }
  }
}

void drawBackground() {
    background(255);
    
    image(fundo,0,0,fundo.width/sizeMult,fundo.height/sizeMult);
    image(relva,0,height-relva.height/sizeMult,relva.width/sizeMult,relva.height/sizeMult);
    
     for (int i=0;i<nuvens.length;i++) {
      image(nuvens[i],nuvensPos[i][0],nuvensPos[i][1],nuvens[i].width/sizeMult,nuvens[i].height/sizeMult); 
    }
    
    for (int i=0;i<arvores.length;i++) {
      //image(arvores[i],i*200/sizeMult,0,arvores[i].width/sizeMult,arvores[i].height/sizeMult); 
      image(arvores[i],arvoresPos[i][0],arvoresPos[i][1],arvores[i].width/sizeMult,arvores[i].height/sizeMult);
    }
}
