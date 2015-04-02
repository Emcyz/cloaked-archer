Ball myball = new Ball(50, 10, 0.75, 0.95);

int deleteFreq = 2;
int delete = deleteFreq;



void setup()
{
  size(400,400);
  frameRate(60);
  noStroke();
}

void draw()
{
  background(100);
  
  myball.ballDisplay(mouseX, mouseY);
  if(pmouseX != mouseX || pmouseY != mouseY)
  {
    myball.createPrevCircle();
  }
  
  delete--;
  if(delete==0)
  {
    delete = deleteFreq;
    
    myball.deleteCircle();
  }
}
