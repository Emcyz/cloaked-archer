int maxPrev = 10;
int prev;

void setup()
{
  size(400,400);
}

float mainRadius = 20;
float alpha = 0;

void draw()
{
  
  float radius = mainRadius;
  
  fill(255,255,255,alpha);
  ellipse(mouseX, mouseY, radius, radius);
  
  if(pmouseX != mouseX || pmouseY != mouseY)
  {
    alpha *= 0.75;
    radius *= 0.75;
    fill(255,255,255,alpha);
    ellipse(pmouseX, pmouseY, radius, radius);
    
    prev++;
  }
  
  
}


