class Ball
{
  float mainRadius;
  int maxPrev;
  
  float alphaDec, radiusDec;
  
  int prev;
  float[] prevX, prevY;
  
  Ball(float mainRadius_Set, int maxPrev_Set,
   float alphaDec_Set, float radiusDec_Set)
  {
    mainRadius = mainRadius_Set;
    maxPrev = maxPrev_Set;
    alphaDec = alphaDec_Set;
    radiusDec = radiusDec_Set;
    
    prevX = new float[maxPrev];
    prevY = new float[maxPrev];
  }
  
  void ballDisplay(int x, int y)
  {
    float alpha = 255;
    float radius = mainRadius;
    
    fill(255,255,255,alpha);
    ellipse(x, y, radius, radius);
    for(int i = prev - 1; i >= 0; i--)
    {
      alpha *= 0.75;
      radius *= 0.95;
      
      fill(255,255,255,alpha);
      ellipse(prevX[i], prevY[i], radius, radius);
    }
  }
  
  void createPrevCircle()
  {
    if(prev < maxPrev)
    {
      prevX[prev] = pmouseX;
      prevY[prev] = pmouseY;
      prev++;
    }
  }
  
  void deleteCircle()
  {
    if(prev > 0)
    {
      prev--;
      for(int i =  0; i < prev; i++)
      {
        prevX[i] = prevX[i+1];
        prevY[i] = prevY[i+1];
      }
    }
  }
}
