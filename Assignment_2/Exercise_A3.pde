// Michael Lam
// March 9, 2018
// Set A, Exercise 3: Beautiful circles that follow the mouse.

// Last updated May 31, 2018
// - Added stroke() and strokeWeight() so it remains drawn on the circles if menuBar() runs

class Exercise_A3 {
  void draw() {
    stroke(0);
    strokeWeight(1);
    fill(mouseX, mouseY, 255);
    ellipse(mouseX, mouseY, 50, 50);
  }
}