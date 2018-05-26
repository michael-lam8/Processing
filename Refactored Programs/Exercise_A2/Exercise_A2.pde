// Michael Lam
// March 8, 2018
// Beautiful, colourful arcs. Vinay.

// Last updated May 26, 2018
// - Canvas size decreased to accomodate Assignment 2
// - Arc coordinates changed in response to size change
// - Matched arc colours with those of the provided example in the exercise instructions

void setup() {
  size(600, 600);
  background(255);
}

void draw(){
  noFill();
  strokeWeight(16);
  stroke(250, 128, 128);
  arc(400, 300, 600, 600, PI-QUARTER_PI, PI+HALF_PI);
  strokeWeight(12);
  stroke(128, 250, 128);
  arc(285, 348, 450, 450, PI-QUARTER_PI, PI+HALF_PI);
  strokeWeight(14);
  stroke(128, 146, 250);
  arc(321, 312, 500, 500, PI-QUARTER_PI, PI+HALF_PI);
  strokeWeight(16);
  stroke(192, 128, 250);
  arc(400, 350, 650, 650, PI-QUARTER_PI, PI+HALF_PI);
  strokeWeight(16);
  stroke(250, 128, 128);
  arc(250, 300, 600, 600, 0, PI-HALF_PI);
  strokeWeight(12);
  stroke(128, 200, 128);
  arc(300, 348, 450, 450, 0, PI-HALF_PI);
  strokeWeight(14);
  stroke(128, 96, 250);
  arc(321, 312, 500, 500, 0, PI-HALF_PI);
  strokeWeight(16);
  stroke(192, 100, 250);
  arc(222, 290, 650, 650, 0, PI-HALF_PI);
}