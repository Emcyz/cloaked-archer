Bug mybug;

PFont f;

void setup()
{
  size(500,500);
  frameRate(60);
  
  mybug = new Bug(20, 1, 3);
  mybug.makeBugFollow();
  
  f = createFont("Arial", 30, true);
}


int time;

int Margin_Turn;

boolean youFail = false;
boolean getReady = true;

void draw()
{
  if(getReady)
  {
    GameStart();
  }
  
  if(!(youFail || getReady))
  {
    background(100);
    noStroke();
    
    for(int i = 0; i < 3; i++)
    {
      c[i] = 0;
      s[i] = 0;
    }
    
    mybug.displayBasic();
    
    mybug.displayFollow();
  
    Margin_Turn++;
    
    if(keyPressed)
    {
      if((key == 'a' || key == 'A') && Margin_Turn > timeLevel)
      {
        mybug.directLeft();
        Margin_Turn = 0;
      }
      
      if((key == 's' || key == 'S') && Margin_Turn > timeLevel)
      {
        mybug.directDown();
        Margin_Turn = 0;
      }
      
      if((key == 'd' || key == 'D') && Margin_Turn > timeLevel)
      {
        mybug.directRight();
        Margin_Turn = 0;
      }
      
      if((key == 'w' || key == 'W') && Margin_Turn > timeLevel)
      {
        mybug.directUp();
        Margin_Turn = 0;
      }
    }

    if(time==timeLevel)
    {
      time = 0;
      
      mybug.followMove();
      
      mybug.move();
    }

    time++;
    mybug.feedTimeInc();

    mybug.makeFeed();
    mybug.displayFeed();
    mybug.eatFeed();
    youFail = mybug.isDie();
  }

  if(youFail)
  {
    fill(255);
    //rect(width*2/5, height/4, width/5, height/4);//
    //rect(width/5, height/2, width*3/5, height/4);//
    
    textFont(f);
    textAlign(CENTER);
    text("You Fail", width/2, height/6);
    text("left Click Anywhere To Restart", width/2, height/2);
    
    for(int i = 0; i < 3; i++)
    {
      overBox[i] = false;
    }
  }
  
  if(mousePressed && youFail)
  {
    mybug.reset();
    time = 0;

    getReady = true;
    youFail = false;
  }
}

int feedX;
int feedY;

int boxSize = 30;
int[] dx = new int[3];
int[] dy = new int[3];
int[] c = new int[3];
int[] s = new int[3];

boolean[] overBox = new boolean[3];

void GameStart()
{
  background(130);

  if(!mousePressed)
  {
    for(int i = 0; i < 3; i++)
    {
      if(dx[i] - boxSize/2 < mouseX && mouseX < dx[i] + boxSize/2
      && dy[i] - boxSize/2 < mouseY && mouseY < dy[i] + boxSize/2)
      {
        s[i] = 255;
        overBox[i] = true;
      } else {
        s[i] = 0;
        overBox[i] = false;
      }
      c[i] = 0;
    }
  }
  
  textFont(f);
  textAlign(CENTER);
  text("Select Difficulty", width/2, height/5);
  text("Easy", width/4, height/2);
  text("Normal", width/2, height/2);
  text("Hard", width*3/4, height/2);
  rectMode(CENTER);
  
  fill(c[0]);
  stroke(s[0]);
  rect(width/4, height*3/7, boxSize, boxSize);
  dx[0] = width/4;
  dy[0] = height*3/7;
  
  fill(c[1]);
  stroke(s[1]);
  rect(width/2, height*3/7, boxSize, boxSize);
  dx[1] = width/2;
  dy[1] = height*3/7;
  
  fill(c[2]);
  stroke(s[2]);
  rect(width*3/4, height*3/7, boxSize, boxSize);
  dx[2] = width*3/4;
  dy[2] = height*3/7;
}

int[] difficulty = {8, 6, 4};
int timeLevel;

void mousePressed()
{
  if(getReady)
  {
    for(int i = 0; i < 3; i++)
    {
      if(overBox[i])
      {
        c[i] = 150;
      }
    }
  }
}

void mouseReleased()
{
  if(getReady)
  {
    for(int i = 0; i < 3; i++)
    {
      if(overBox[i])
      {
        timeLevel = difficulty[i];
        getReady = false;
      }
    }
  }
}
