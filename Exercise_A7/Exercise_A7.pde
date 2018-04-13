// Michael Lam
// March 18, 2018
// A 16x16 grid of beautiful, small circles. And a big circle.

int x;
int y;

void setup() {
  size(342, 675);
  background(255);
  colorMode(HSB, 360, 100, 100);
}

void draw() {
  y = 0; // Resets y coordinate at each loop.
  for (int i = 0; i < 16; i++) {
    y += 20; // Draws circles 20px vertically apart from each other.
    x = 0; // Resets x coordinate at each loop.
    for (int j = 0; j < 16; j++) {
      x += 20; // Draws circles 20px horizontally apart from each other.
      stroke(0);
      fill (y, x, x+y);
      ellipse(x, y, 20, 20);
    }
  }
  for (int k = 255; k > 0; k--) {
    noStroke();
    fill(50 + k % 255, 50 + k % 255, 255);
    ellipse(171, 500, k, k);
  }
}
