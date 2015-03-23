float x, y;
float x_speed, y_speed;
color col;

boolean isExist = false;

void setup()
{
  size(800, 600);
  noStroke();
}

void draw()
{
  final float accel = 0.5;
  final int radius = 10;
  final float alpha = -0.55;
  final float fric = 0.01;
  
  background(255);
  
  if(isExist)
  {
    fill(col);
    ellipse(x, y, radius*2, radius*2);
    
    float next_y_coord = y+y_speed;
    if(next_y_coord < height - radius)
    {
      y += y_speed;
      y_speed += accel - fric*y_speed;
    }
    else
    {
      y = height - radius;
      y_speed += alpha;
    }
    
    float next_x_coord = x + x_speed;
    if(radius < next_x_coord && next_x_coord < width - radius)
    {
      x += x_speed;
      x_speed -= fric*x_speed;
    }
    else if(next_x_coord <= radius)
    {
      x=radius;
      x_speed *=alpha;
    }
    else
    {
      x= width-radius;
      x_speed*= alpha;
    }
  }
}

int prev_mouseX, prev_mouseY;
boolean isPressing= false;

void mousePressed()
{
  prev_mouseX = mouseX;
  prev_mouseY = mouseY;
  isPressing = true;
}

void mouseReleased()
{
  if(isPressing)
  {
    x = mouseX;
    y = mouseY;
    x_speed = (mouseX - prev_mouseX)/10.0f;
    y_speed = (mouseY - prev_mouseY)/10.0f;
    col = int(random(0,0xffffff)) | 0xff000000;
    isExist = true;
    
    isPressing = false;
  }
}
