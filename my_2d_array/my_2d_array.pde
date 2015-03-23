cell[][] grid;

int i = 20;
int j = 20;

void setup()
{
  size(400, 400);
  grid = new cell[i][j];
  
  for(int a = 0; a<i; a++)
  {
    for(int b = 0; b<j; b++)
    {
      grid[a][b] = new cell(20*a, 20*b, 20, 20, a+b);
    }
  }
}

void draw()
{
  background(255);
  
  for(int a = 0; a<i; a++)
  {
    for(int b = 0; b<j; b++)
    {
      grid[i][j].display();
    }
  }
}

class cell
{
  int x;
  int y;
  int w;
  int h;
  int alpha;
  
  cell(int tempX, int tempY, int tempW, int tempH, int tempAlpha)
  { 
    x=tempX;
    y=tempY;
    w=tempW;
    h=tempH;
    alpha = tempAlpha;
  }
 
  
  void display()
  {
    stroke(255);
    fill(128+127*sin(alpha));
    rect(x, y, w, h);
  }
}
