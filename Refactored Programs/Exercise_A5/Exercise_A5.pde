// Michael Lam
// March 13, 2018
// Set A, Exercise 5: Colourful circles drawn diagonally.

// Last updated June 2, 2018
// - Added additional documentation
// - Added setup() to separate properties from visuals
// - Updated spacing to make code easier to read

// Declaring variables
float c = 0; // Changes colour of circles
float x = 0; // Draws circles horizontally
float y = 0; // Draws circles vertically

// Inital setup
void setup() {
  size(600, 600);
  background(0);
  stroke(0);
  strokeWeight(1);
  colorMode(HSB);
}

void draw() {
  // Increases coordinates and changes the colour
  c += 4;
  x += 1;
  y += 15;

  // Draws circles
  fill(c % 255, 255, 255);
  ellipse(x, 0 + y, 75, 75);

  // Sets variables to continue drawing circles at the top of screen once they reach bottom
  if (y == 825) {
    c = 0; // Resets colours
    y = 0; // Resets y position of circles back to top
    x += 2; // Increases the x position of circles to the right
  }
}