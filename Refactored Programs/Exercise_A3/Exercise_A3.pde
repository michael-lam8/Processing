// Michael Lam
// March 9, 2018
// Beautiful circles that follow the mouse.

// Last updated May 26, 2018
// - Canvas size decreased to accomodate Assignment 2

void setup() {
 size(600, 600);
 background(0);
}

void draw() {
  fill(mouseX, mouseY, 255);
  ellipse(mouseX, mouseY, 50, 50);
}