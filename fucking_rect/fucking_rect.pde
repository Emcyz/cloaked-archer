void setup()
{
  size(400,200);
  noStroke();
  rectMode(CENTER);
  colorMode(RGB,width,width,width);
}

void draw()
{
  background(0);
  fill(width - mouseX, width - mouseX, width - mouseX, width - mouseX);
  rect((width+mouseX)/4, height/2, (width - mouseX)/2, (width - mouseX)/2);
  fill(mouseX, mouseX, mouseX, mouseX);
  rect(width/2 + mouseX/4, height/2, mouseX/2, mouseX/2);
}
