// Michael Lam
// March 9, 2018
// Set A, Exercise 4: Beautiful, growing, colourful circles.

// Last updated June 2, 2018
// - Added additional documentation
// - Updated spacing to make code easier to read

// Declaring variables
int n = 0;
float circleSize1 = 0, circleSize2 = 0;

// Initial setup
void setup() {
  size(600, 600);
  background(0);
  noStroke();
  colorMode(HSB);
}

void draw() {
  // Increases sizes of circles, and changes the colour and coordinates
  n += 1;
  circleSize1 += 0.4;
  circleSize2 += 0.2;

  // Draws circles
  fill(n % 255, 255, 255);
  ellipse(300, 0 + n, circleSize1, circleSize1);
  ellipse(0 + n, 300, circleSize2, circleSize2);
}