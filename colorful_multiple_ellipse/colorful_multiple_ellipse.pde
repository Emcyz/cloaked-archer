float[] x = new float [200];
float[] y = new float [200];
float[] v = new float [200];
float[] a = new float [200];
int[] c = new int [200];

boolean OneExist = false;
boolean ZeroExist = true;

void setup()
{
  size(400,800);
  frameRate(60);
  noStroke();
  for(int i = 0; i < 200; i++)
  {
    makeOne(i);
  }
}

void draw()
{
  background(255, 255, 255);

  if(ZeroExist)
  {
    makeEllipse(0);
  }
    
  for (int i = 0; i < 99; i++)
  {
    fallEllipse(i);
  }
  
  if(y[99] >= height/50)
  {
    OneExist = true;
  }
  
  if(y[99] > height)
  {
    ZeroExist = false;
    for(int i = 0; i < 100; i++)
    {
      makeOne(i);
    }
  }
  
  if(OneExist)
  {
    makeEllipse(100);
  }
  
  for(int i = 100; i < 199; i++)
  {
    fallEllipse(i);
  }
  
  if(y[199] >= height/50)
  {
    ZeroExist = true;
  }
  
  if(y[199] + v[199] > height)
  {
    OneExist = false;
    for(int i = 100; i < 200; i++)
    {
      makeOne(i);
    }
  }
}

void makeOne(int i)
{
  x[i] = random(4,76);
  y[i] = 0;
  v[i] = 0;
  if(i <= 99)
  {
    a[i] = 1;
  } else {
    a[i] = 2;
  }
  c[i] = int(random(0,0xffffff)) | 0xff000000;
}

void makeEllipse(int i)
{
  fill(c[i]);
  ellipse(x[i]*5, y[i], 20, 20);
  
  y[i] += v[i];
  v[i] += a[i];
}

void fallEllipse(int i)
{
  if(y[i] > height/50)
  {
    fill(c[i+1]);
    ellipse(x[i + 1]*5, y[i + 1], 20, 20);
    
    y[i + 1] += v[i + 1];
    v[i + 1] += a[i + 1];
  }
}
