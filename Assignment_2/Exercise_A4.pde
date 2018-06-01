// Michael Lam
// March 9, 2018
// Set A, Exercise 4: Beautiful, growing, colourful circles.

// Last updated May 31, 2018
// - Variables now reset when exiting and re-entering the exercise

class Exercise_A4 {
  int n = 0;
  float circleSize1 = 0, circleSize2 = 0;

  void draw() {
    colorMode(HSB);
    noStroke();
    n += 1;
    circleSize1 += 0.4;
    circleSize2 += 0.2;
    fill(n % 255, 255, 255);
    ellipse(300, 0 + n, circleSize1, circleSize1);
    ellipse(0 + n, 300, circleSize2, circleSize2);
    if (exerciseRunning == false) {
      n = 0;
      circleSize1 = 0;
      circleSize2 = 0;
      background(0);
    }
  }
}