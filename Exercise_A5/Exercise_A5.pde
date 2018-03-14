// Michael Lam
// March 13, 2018
// Colourful circles drawn diagonally.

float a = 0; // Moves circles horizontally
float c = 0; // Changes colour of circles
float x = 0; // Draws circles horizontally
float y = 0; // Draws circles vertically

void setup(){
  background(0);
  size(600, 800);
  strokeWeight(1);
  colorMode(HSB);
}

void draw() {
  c += 4;
  x += 1;
  y += 15;
  fill(50 + c % 255, 50 + c % 255, 255);
  ellipse(a+x, 0+y, 75, 75);
  if (y == 825) {
    c = 0; // Resets colours
    y = 0; // Resets y position of circles back to top
    a += 2; // Increases the x position of circles to the right
  }
}

// Code is probably garbage but it's 1AM.
