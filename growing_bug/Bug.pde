class Bug
{
  int[] followX = new int[1000];
  int[] followY = new int[1000];
  
  int basicX;
  int basicY;
  int radius;
  int followCount;
  int followCountInc;
  int feedX;
  int feedY;
  int feedTime;
  
  boolean left;
  boolean down;
  boolean right = true;
  boolean up;
  
  boolean feedExist = false;
  
  Bug(int radiusIndex, int followCountIndex, int followCountIncIndex)
  {
    radius = radiusIndex;
    
    basicX = radius;
    basicY = radius;
    
    followCount = followCountIndex;
    followCountInc = followCountIncIndex;
  }
  
  void makeBugFollow()
  {
    followX[0] = basicX - radius/2;
    followY[0] = basicY + radius/2;
  }
  
  void feedTimeInc()
  {
    feedTime++;
  }
  
  void move()
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
  
  void followMove()
  {
    for(int i = followCount-1; i >=0; i--)
    {
      followX[i+1] = followX[i];
      followY[i+1] = followY[i];
    }
    
    followX[0] = basicX + radius/2;
    followY[0] = basicY + radius/2;
  }
  
  void displayBasic()
  {
    fill(245,170,7);
    ellipse(basicX + radius/2, basicY + radius/2, radius, radius);
  }
  
  void displayFollow()
  {
    for(int i = 0; i < followCount; i++)
    {
      fill(255,255,255);
      ellipse(followX[i], followY[i], radius, radius);
    }
  }
  
  void directLeft()
  {
    if(!right)
    {
      up = false;
      left = true;
      down = false;
      right = false;
    }
  }
  
  void directDown()
  {
    if(!up)
    {
      up = false;
      left = false;
      down = true;
      right = false;
    }
  }
  
  void directRight()
  {
    if(!left)
    {
      up = false;
      left = false;
      down = false;
      right = true;
    }
  }
  
  void directUp()
  {
    if(!down)
    {
      up = true;
      left = false;
      down = false;
      right = false;
    }
  }
  
  void makeFeed()
  {
    if(feedTime >= 30)
    {
      feedExist = true;
      feedX = int(random(0, width/radius));
      feedY = int(random(0, height/radius));
    }
  }
  
  void displayFeed()
  {
    if(feedExist)
    {
      feedTime = 0;
      
      fill(0,255,0);
      ellipse(feedX * radius + radius/2, feedY * radius + radius/2,
      radius, radius);
    }
  }
  
  void eatFeed()
  {
    if(basicX + radius/2 == feedX * radius + radius/2
     && basicY + radius/2 == feedY * radius + radius/2
     && feedExist)
    {
      feedExist = false;
      followCount += followCountInc;
      for(int i = followCount - followCountInc;
          i < followCount; i++)
      {
        followX[i+1] = followX[i];
        followY[i+1] = followY[i];
      }
    }
  }
  
  boolean isDie()
  {
    for(int i = 0; i < followCount; i++)
    {
      if(followX[i] == basicX + radius/2
      && followY[i] == basicY + radius/2)
      {
        return true;
      }
    }
    
    if(basicX + radius/2 > width || basicY + radius/2 > height
    || basicX + radius/2 < 0 || basicY + radius/2 < 0)
    {
      return true;
    }
    
    return false;
  }
  
  void reset()
  {
        
    left = false;
    down = false;
    right = true;
    up = false;
    
    feedExist = false;
    feedTime = 0;
    
    followCount = 1;
    followCountInc = 3;
    
    basicX = 20;
    basicY = 20;
    
    radius = 20;
  }
}
