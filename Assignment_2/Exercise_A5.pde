// Michael Lam
// March 13, 2018
// Set A, Exercise 5: Colourful circles drawn diagonally.

// Last updated May 31, 2018
// - Variables now reset when exiting and re-entering the exercise
// - Removed variable a as x can be used instead
// - Removed redundant code added as a temporary solution when the bug in which the circles did not remain on screen was present

class Exercise_A5 {
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
    if (exerciseRunning == false) {
      c = 0;
      x = 0;
      y = 0;
      background(0);
    }
  }
}