float ballSpeedHorizon = 10;
float gravity = 1;
float ballSpeedVert = 0;
float airfriction=0.0001;
float friction=0.1;
color racketColor = color(0);
float racketWidth = 100;
float racketHeight = 10;
int racketBounceRate = 20;
float ballX,ballY;
float ballSize=20;
int ballColor=color(0);
int changeScr=0;
int score=15;
void setup(){
size(500,500);
ballX=width/2;
ballY=height/2;
}
void draw(){
  if (changeScr ==0)
  {
    initialScreen();
  }
    if(changeScr ==1)
    {
    putScore();
    printScore();
    gameScreen();
    }
    if (changeScr ==2 || score==0){
      gameOverScreen();
      restart();
     }
    }
void putScore(){
  background(255);
  if(ballY > (height-ballSize*2/3)){
    score-=1;
  }
    if(ballY < (0+ballSize*2/3) && score<=14){
    score+=1;
    }
}
void printScore(){
  fill(#DE1BC4);
  textSize(30);
  text(score,50,50);
}

void initialScreen(){
  background(0);
  textSize(15);
  textAlign(CENTER);
  text("Let's Play by Clicking",width/2,height/2);
}
void gameScreen(){
    drawBall();
   drawRacket();
   applyGravity();
   applyHorizontalSpeed();
   keepInScreen();
   watchRacketBounce();
 }
 void drawBall()
 {
   fill(ballColor);
   ellipse(ballX,ballY,ballSize,ballSize);
 }
  void drawRacket()
  {
    fill(racketColor);
    rectMode(CENTER);
    rect(mouseX,mouseY,racketWidth,racketHeight);
  }
  void watchRacketBounce()
  {
    float overhead = mouseY - pmouseY;
    if((ballX+(ballSize/2) > mouseX-(racketWidth/2)) && (ballX-(ballSize/2) < mouseX+(racketWidth/2))){
    if(dist(ballX, ballY, ballX, mouseY)<=(ballSize/2)+abs(overhead)){
      makeBounceBottom(mouseY);
      if(overhead<0){
        ballY+=overhead;
        ballSpeedVert+=overhead;
      }
    }
    }
  }
  void applyGravity()
{
  ballSpeedVert += gravity;
  ballY += ballSpeedVert;
  ballSpeedVert -= (ballSpeedVert * airfriction);
  
}
void makeBounceBottom(float surface)
{
  ballY = surface - (ballSize/2);
  ballSpeedVert *= -1;
  ballSpeedVert -= (ballSpeedVert * friction);
}
  void makeBounceTop(float surface)
  {
    ballY = surface+(ballSize/2);
    ballSpeedVert *= -1;
    ballSpeedVert -= (ballSpeedVert*friction);
}
void keepInScreen(){
  
  if(ballY + (ballSize/2) > height){
    makeBounceBottom(height);
  }
  if(ballY - (ballSize/2) < 0){
    makeBounceTop(0);
  }
  if (ballX-(ballSize/2) < 0){
    makeBounceLeft(0);
  }
    if(ballX+(ballSize/2) >width){
      makeBounceRight(width);
}
}
void applyHorizontalSpeed()
{
  ballX += ballSpeedHorizon;
  ballSpeedHorizon -= (ballSpeedHorizon * airfriction);
}
void makeBounceLeft(float surface)
{
  ballX = surface+(ballSize/2);
  ballSpeedHorizon*=-1;
  ballSpeedHorizon -= (ballSpeedHorizon * friction);
}
void makeBounceRight(float surface)
{
  ballX = surface-(ballSize/2);
  ballSpeedHorizon*=-1;
  ballSpeedHorizon -= (ballSpeedHorizon * friction);
}
void gameOverScreen(){
  background(0);
  textAlign(CENTER);
  fill(255);
  textSize(30);
  text("Game Over",width/2,height/2);
  textSize(15);
  text("Click to Restart",width/2,height/2+50);
}
public void mousePressed(){
  if(changeScr==0){
    startgame();
  }
    if(changeScr==2 || score==0){
       gameOverScreen();
     }
    }
  
void startgame(){
  changeScr=1;
}
void restart(){
  changeScr = 2;
  if(mousePressed){
    changeScr=1;
  }
  score=15;
  ballX=width/2;
  ballY=height/2;
}

  
   
