// Michael Lam
// March 13, 2018
// Set A, Exercise 6: Beautiful circles that follow the mouse.

// Last updated June 2, 2018
// - Added additional documentation

// Declaring variables
float x;
float y;

// Initial setup
void setup() {
  size(600, 600, P2D);
  background(255);
  noStroke();
  colorMode(HSB);
}

void draw() {
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