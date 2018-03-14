// Michael Lam
// March 13, 2018
// Last updated March 14, 2018.
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
  x = 0;
  while (x < width) {
    x += 16; // Draws circles 20px horizontally apart from each other.
    y = 0;
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
- Colour pattern does not match.
- x and y for some reason need to be set before each while; changing its value
  changes where the circles begin to draw.
*/
