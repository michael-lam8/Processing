// Michael Lam
// March 9, 2018
// Last updated March 14, 2018.
// Beautiful, growing, colourful circles.

float x = 0;
float y = 0;

void setup() {
  size(600, 800);
  background(0);
  noStroke();
  colorMode(HSB);
}

void draw() {
  x += 0.6;
  y += 0.6;
  fill(50 + x % 255, 50 + x % 255, 255);
  ellipse(300, 0+y, x, y);
  ellipse(0+x, 400, x, y);
}
