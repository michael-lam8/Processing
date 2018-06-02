// Michael Lam
// March 8, 2018
// Set A, Exercise 2: Beautiful, colourful arcs.

// Last updated June 2, 2018
// - Removed duplicate code
// - Added additional documentation
// - Updated spacing to make code easier to read

class Exercise_A2 {
  void draw() {
    // Setting properties
    background(255);
    noFill();
    
    // Red arcs
    strokeWeight(16);
    stroke(250, 128, 128);
    arc(400, 300, 600, 600, PI-QUARTER_PI, PI+HALF_PI);
    arc(250, 300, 600, 600, 0, PI-HALF_PI);
    
    // Green arcs
    strokeWeight(12);
    stroke(128, 250, 128);
    arc(285, 348, 450, 450, PI-QUARTER_PI, PI+HALF_PI);
    arc(300, 348, 450, 450, 0, PI-HALF_PI);
    
    // Blue arcs
    strokeWeight(14);
    stroke(128, 146, 250);
    arc(321, 312, 500, 500, PI-QUARTER_PI, PI+HALF_PI);
    arc(321, 312, 500, 500, 0, PI-HALF_PI);
    
    // Purple arcs
    strokeWeight(16);
    stroke(192, 128, 250);
    arc(400, 350, 650, 650, PI-QUARTER_PI, PI+HALF_PI);
    arc(222, 290, 650, 650, 0, PI-HALF_PI);
  }
}