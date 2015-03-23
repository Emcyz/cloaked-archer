class Cell
{
  float x,y;
  float w,h;
  float angle;

  Cell(float tempX, float tempY, float tempW, float tempH, float tempAngle)
  {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    angle = tempAngle;
  } 
  
  // Oscillation means increase angle
  void oscillate()
  {
    angle += 0.02; 
  }

  void display()
  {
    stroke(255);
    // Color calculated using sine wave
    fill(127+127*sin(angle));
    rect(x,y,w,h); 
  }
}
