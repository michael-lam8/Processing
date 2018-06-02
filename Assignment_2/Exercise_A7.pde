// Michael Lam
// March 18, 2018
// Set A, Exercise 7: A 29x16 grid of beautiful, small circles. And a big circle.

// Last updated June 2, 2018
// - Added additional documentation
// - Updated spacing to make code easier to read

class Exercise_A7 {
  // Declaring variables
  int x, y;

  void draw() {
    // Setting properties
    background(255);
    colorMode(HSB, 360, 100, 100);
    
    // Draws grid of circles
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
    
    // Draws large circle with a radial gradient
    for (int k = 255; k > 0; k--) {
      noStroke();
      fill(50 + k % 255, 255, 255);
      ellipse(300, 465, k, k);
    }
    
    // Resets colour mode for background and menuBar()
    colorMode(RGB, 255, 255, 255);
  }
}