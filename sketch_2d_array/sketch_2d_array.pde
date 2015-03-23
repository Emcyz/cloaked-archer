Cell[][] grid;

int a = 20;
int b = 20;

void setup()
{
  size(400,400);
  grid = new Cell[a][b];
  for (int i = 0; i < a; i++)
  {
    for (int j = 0; j < b; j++)
    {
      grid[i][j] = new Cell(i*20, j*20, 20, 20, i+j);
    }
  }
}

void draw()
{
  background(0);
  
  for (int i = 0; i < a; i++)
  {
    for (int j = 0; j < b; j++)
    {
      // Oscillate and display each object
      grid[i][j].oscillate();
      grid[i][j].display();
    }
  }
}
