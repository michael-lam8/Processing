// Michael Lam
// March 9, 2018
// Last updated March 14, 2018.
// Beautiful circles that follow the mouse.

void setup() {
 size(800, 600);
 background(0);
}

void draw() {
  fill(mouseX, mouseY, 255);
  ellipse(mouseX, mouseY, 50, 50);
}
