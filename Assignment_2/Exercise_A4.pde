// Michael Lam
// March 9, 2018
// Set A, Exercise 4: Beautiful, growing, colourful circles.

// Last updated June 2, 2018
// - Added additional documentation
// - Updated spacing to make code easier to read

class Exercise_A4 {
  // Declaring variables
  int n = 0;
  float circleSize1 = 0, circleSize2 = 0;

  void draw() {
    // Setting properties
    colorMode(HSB);
    noStroke();
    
    // Increases sizes of circles, and changes the colour and coordinates
    n += 1;
    circleSize1 += 0.4;
    circleSize2 += 0.2;
    
    // Draws circles
    fill(n % 255, 255, 255);
    ellipse(300, 0 + n, circleSize1, circleSize1);
    ellipse(0 + n, 300, circleSize2, circleSize2);
    
    // Resets variables if user quits exercise
    if (exerciseRunning == false) {
      n = 0;
      circleSize1 = 0;
      circleSize2 = 0;
      background(0);
    }
  }
}