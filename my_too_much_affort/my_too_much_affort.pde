int prev = 0;
int maxPrev = 10;

float[] prevX = new float[maxPrev];
float[] prevY = new float[maxPrev];

int delFreq = 2;
int delete = delFreq;

void setup()
{
  size(400,400);
  noStroke();
}

float mainRadius = 50;
float alpha = 255;

void draw()
{
  background(100);
  

  
  if(pmouseX != mouseX || pmouseY != mouseY)
  {
    if(prev < maxPrev)
    {
      prevX[prev] = pmouseX;
      prevY[prev] = pmouseY;
      prev++;

    }
  }
  
  delete--;
  if(delete==0)
  {
    delete = delFreq;
    if(prev > 0)
    {
      prev--;
      for (int i = 0; i < prev; i++)
        {
          prevX[i] = prevX[i + 1];
          prevY[i] = prevY[i + 1];
        }
    }
  }


  float radius = mainRadius;
  float alpha = 255;
  
  fill(255,255,255,255);
  ellipse(mouseX,mouseY,radius,radius);
  
  for(int i = prev-1; i >= 0; i--)
  {
    radius *= 0.95;
    alpha *= 0.75;
    fill(255,255,255,alpha);
    ellipse(prevX[i],prevY[i],radius,radius);
  }
}
