// Michael Lam
// March 18, 2018
// A 29x16 grid of beautiful, small circles. And a big circle.

// Last updated May 26, 2018
// - Canvas size increased to accomodate Assignment 2
// - There are more circles, and the coordinates of the larger circle changed in response to canvas size
// - Colours are now more vibrant
//    - Changed saturation to be constant (255)

int x, y;

void setup() {
  size(600, 600);
  background(255);
  colorMode(HSB, 360, 100, 100);
}

void draw() {
  y = 0; // Resets y coordinate at each loop.
  for (int i = 0; i < 16; i++) {
    y += 20; // Draws circles 20px vertically apart from each other.
    x = 0; // Resets x coordinate at each loop.
    for (int j = 0; j < 29; j++) {
      x += 20; // Draws circles 20px horizontally apart from each other.
      stroke(0);
      fill(y, 255, 255);
      ellipse(x, y, 20, 20);
    }
  }
  for (int k = 255; k > 0; k--) {
    noStroke();
    fill(50 + k % 255, 255, 255);
    ellipse(300, 465, k, k);
  }
}