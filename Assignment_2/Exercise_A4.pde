// Michael Lam
// March 9, 2018
// Beautiful, growing, colourful circles.

// Last updated May 26, 2018
// - Canvas size decreased to accomodate Assignment 2
// - Colours now match those of example image found in exercise instructions
//    - Circles now begin as red
//    - Changed saturation to be constant (255)
// - Size of circles now increase at different rates

class Exercise_A4 {
  int n = 0;
  float circleSize1 = 0, circleSize2 = 0;
  
  void draw() {
    background(0);
    colorMode(HSB);
    noStroke();
    n += 1;
    circleSize1 += 0.4;
    circleSize2 += 0.2;
    fill(n % 255, 255, 255);
    ellipse(300, 0 + n, circleSize1, circleSize1);
    ellipse(0 + n, 300, circleSize2, circleSize2);
  }
}