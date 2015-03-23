void setup() {
  size(640, 360);
  noStroke();
  colorMode(RGB, height, height, height);
  rectMode(CENTER);
}

void draw() {
  background(0.0);

  float r1 = map(mouseX, 0, width, 0, height);
  float r2 = mouseX/2;
  
  fill(r1);
  rect(width/2 + r2/2, height/2, r2, r1);
}
