float angle = 0.0;
void setup() {
  size(300, 300);
  smooth();
}
void draw() { 
  background(255);
  translate(mouseX, mouseY);
  fill(random(0, 255), random(0, 255), random(0, 255), random(0, 255));
  //if(mousePressed)
  scale(abs(sin(angle) * 2));

  frog();
  angle += 0.1;
}
void frog() {
  ellipse(50, 60, 80, 60);
  arc(50, 60, 60, 30, 0, PI);
  ellipse(50-30, 60-30, 32, 32);
  ellipse(50+30, 60-30, 32, 32);
  fill(0);
  ellipse(50-20, 60-30, 5, 5);
  ellipse(50+20, 60-30, 5, 5);
}
