// Michael Lam
// March 9, 2018
// Beautiful circles that follow the mouse.

// Last updated May 26, 2018
// - Canvas size decreased to accomodate Assignment 2

class Exercise_A3 {
  void draw() {
    background(0);
    fill(mouseX, mouseY, 255);
    ellipse(mouseX, mouseY, 50, 50);
  }
}