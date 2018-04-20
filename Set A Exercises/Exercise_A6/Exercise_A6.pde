// Michael Lam
// March 13, 2018
// Last updated March 18, 2018.
// Beautiful circles that follow the mouse.

float x;
float y;

void setup() {
  size(600, 800);
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
        fill(50 + x % 255, 50 + x % 255, 255);
        ellipse(x, y, 15, 15);
      } else {
        fill(255); // Colours circles white when x & y > mouse coordinates.
        ellipse(x, y, 15, 15);
      }
    }
  }
}

/* Issues
- Colour pattern does not match. Adding max values to colorMode affects program.
*/
