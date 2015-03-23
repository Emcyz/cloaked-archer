float x, y;
float xv, yv;
color c;
float fric = 0.99;
float alpha = -0.55;
float a = 0.5;
int radius = 10;

boolean exist = false;

void setup()
{
  size(400,400);
  noStroke();
}

void draw()
{
  
  background(255);
  
  if(exist)
  {
    fill(c);
    ellipse(x, y, radius*2, radius*2);
    if(radius < xv + x && xv + x < width - radius)
    {
      x+=xv;
      xv*=fric;
    }
    else if(xv + x <= radius)
    {
      x = radius;
      xv *= alpha;
    }
    if(xv + x >= width - radius)
    {
      x = width - radius;
      xv *= alpha;
    }
    if(yv + y < height - radius)
    {
      y+=yv;
      yv+=a;
    }
    else
    {
      y = height - radius;
      yv *= alpha;
    }
  }
}

int pr_x;
int pr_y;
boolean pressing;

void mousePressed()
{
  pr_x = mouseX;
  pr_y = mouseY;
  pressing = true;
}

void mouseReleased()
{
  if(pressing)
  {
    xv= (mouseX - pr_x)/10;
    yv= (mouseY - pr_y)/10;
    x= mouseX;
    y= mouseY;
    c = int(random(0,0xffffff)) | 0xff000000;
    exist = true;
  }
}
