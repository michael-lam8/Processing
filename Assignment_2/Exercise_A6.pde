// Michael Lam
// March 13, 2018
// Set A, Exercise 6: Beautiful circles that follow the mouse.

// Last updated June 2, 2018
// - Added additional documentation
// - Updated spacing to make code easier to read

class Exercise_A6 {
  // Declaring variables
  float x;
  float y;

  void draw() {
    // Setting properties
    background(255);
    noStroke();
    colorMode(HSB);
    
    // Draws grid of circles based on mouse coordinates
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