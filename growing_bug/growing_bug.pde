void setup()
{
  size(500,500);
  noStroke();
  frameRate(30);
  followX[0] = radius/2;
  followY[0] = radius/2;
}

int followCircleCount = 1;
int followCircleInc = 3;
int[] followX = new int[1000];
int[] followY = new int[1000];

int basicX = 20;
int basicY = 20;

int radius = 20;
int time;
int feedTime;

boolean left;
boolean down;
boolean right = true;
boolean up;

boolean feedExist = false;

void draw()
{
  background(100);
  
  fill(255,255,255);
  ellipse(basicX + radius/2, basicY + radius/2, radius, radius);
  
  for(int i = 0; i < followCircleCount; i++)
  {
    fill(255,255,255);
    ellipse(followX[i], followY[i], radius, radius);
  }

  
  if(keyPressed)
  {
    if((key == 'a' || key == 'A') && !right)
    {
      up = false;
      left = true;
      down = false;
      right = false;
    }
    
    if((key == 's' || key == 'S') && !up)
    {
      up = false;
      left = false;
      down = true;
      right = false;
    }
    
    if((key == 'd' || key == 'D') && !left)
    {
      up = false;
      left = false;
      down = false;
      right = true;
    }
    
    if((key == 'w' || key == 'W') && !down)
    {
      up = true;
      left = false;
      down = false;
      right = false;
    }
  }
  
  time++;
  
  if(time==3)
  {
    time = 0;
    
    for(int i = followCircleCount-1; i >=0; i--)
    {
      followX[i+1] = followX[i];
      followY[i+1] = followY[i];
    }
    
    followX[0] = basicX + radius/2;
    followY[0] = basicY + radius/2;
    
    bugMove();
  }
  
  
  feedTime++;
  
  
  if(feedExist)
  {
    feedTime = 0;
    displayFeed();
  }
  
  if(feedTime >= 30)
  {
    makeFeed();
    feedExist = true;
  }
  
  if(basicX + radius/2 == feedX * radius + radius/2
   && basicY + radius/2 == feedY * radius + radius/2
   && feedExist)
  {
    feedExist = false;
    followCircleCount += followCircleInc;
    for(int i = followCircleCount - followCircleInc;
        i < followCircleCount; i++)
    {
      followX[i+1] = followX[i];
      followY[i+1] = followY[i];
    }
  }
}

int feedX;
int feedY;

void makeFeed()
{
  feedX = int(random(0, width/radius));
  feedY = int(random(0, height/radius));
}

void displayFeed()
{
  fill(0,255,0);
  ellipse(feedX * radius + radius/2, feedY * radius + radius/2,
  radius, radius);
}

void bugMove()
{
  if(up)
  {
    basicY -= radius;
  }
  if(left)
  {
    basicX -= radius;
  }
  if(down)
  {
    basicY += radius;
  }
  if(right)
  {
    basicX += radius;
  }
}
