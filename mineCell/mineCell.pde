cell[][] grid;

int a = 20;
int b = 20;

void setup()
{
  size(400,400);
  grid = new cell[a][b];
  for(int i = 0; i < a; i++)
  {
    for(int j = 0; j < b; j++)
    {
      grid[i][j] = new cell(i*20, j*20, 20, 20, i+j);
    }
  }
}

void draw()
{
  background(0);
  
  for(int i = 0; i < a; i++)
  {
    for(int j = 0; j < b; j++)
    {
      grid[i][j].o();
      grid[i][j].d();
    }
  }
}

class cell
{
  float x,y;
  float w,h;
  float angle;
  
  cell(float temtX, float temtY, float temtW, float temtH, float temtAngle)
  {
    x = temtX;
    y = temtY;
    w = temtW;
    h = temtH;
    angle = temtAngle;
  }

  void o()
  {
    angle += 0.02;
  }
  
  void d()
  {
    stroke(255);
    fill(127*(1+sin(angle)));
    rect(x,y,w,h);
  }
}
