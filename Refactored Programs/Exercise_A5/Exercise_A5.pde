// Michael Lam
// March 13, 2018
// Colourful circles drawn diagonally.

// Last updated May 31, 2018
// - Removed variable a as x can be used instead

float c = 0; // Changes colour of circles
float x = 0; // Draws circles horizontally
float y = 0; // Draws circles vertically

void draw() {
  stroke(0);
  strokeWeight(1);
  colorMode(HSB);
  c += 4;
  x += 1;
  y += 15;
  fill(c % 255, 255, 255);
  ellipse(x, 0 + y, 75, 75);
  if (y == 825) {
    c = 0; // Resets colours
    y = 0; // Resets y position of circles back to top
    x += 2; // Increases the x position of circles to the right
  }
}