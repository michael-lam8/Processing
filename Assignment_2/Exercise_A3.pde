// Michael Lam
// March 9, 2018
// Set A, Exercise 3: Beautiful circles that follow the mouse.

// Last updated June 2, 2018
// - Added additional documentation
// - Updated spacing to make code easier to read

class Exercise_A3 {
  void draw() {
    // Setting properties
    stroke(0);
    strokeWeight(1);
    
    // Drawing circles and changing the colour based on mouse coordinates
    fill(mouseX, mouseY, 255);
    ellipse(mouseX, mouseY, 50, 50);
  }
}