// Michael Lam
// March 13, 2018
// Set A, Exercise 6: Beautiful circles that follow the mouse.

// Last updated May 26, 2018
// - Canvas size decreased to accomodate Assignment 2
// - Colours are now more vibrant
//    - Changed saturation to be constant (255)
// - Changed renderer to P2D to prevent circle outlines from appearing when mouse moves away

class Exercise_A6 {
  float x;
  float y;

  void draw() {
    background(255);
    noStroke();
    colorMode(HSB);
    x = 0; // Resets x coordinate at each loop.
    while (x < width) {
      x += 16; // Draws circles 20px horizontally apart from each other.
      y = 0; // Resets y coordinate at each loop.
      while (y < height) {
        y += 16; // Draws circles 20px vertically apart from each other.
        if (x < mouseX && y < mouseY) {
          fill(x % 255, 255, 255);
          ellipse(x, y, 15, 15);
        } else {
          fill(255); // Colours circles white when x & y > mouse coordinates.
          ellipse(x, y, 15, 15);
        }
      }
    }
  }
}