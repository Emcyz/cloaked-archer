Ball myball = new Ball(0, 0, 50, 10, 0xffffffff, 0.75, 0.95);

void setup()
{
  size(600, 400);
  noStroke();
}

final int DeletionFreq = 2;
int TimeOutForDelete = DeletionFreq;

void draw()
{
  background(180);

  if (pmouseX != mouseX || pmouseY != mouseY)
  {
    myball.createAfterImage(mouseX, mouseY);
  }

  TimeOutForDelete--;
  if (TimeOutForDelete == 0)
  {
    TimeOutForDelete = DeletionFreq;
    myball.deleteAfterImage();
  }

  myball.display();
}
