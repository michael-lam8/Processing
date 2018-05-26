// Michael Lam
// March 7, 2018
// A beautiful scenery, minus the sun.

// Last updated May 26, 2018
// - Canvas size decreased to accomodate Assignment 2
// - House coordinates moved in response to size change

void setup() {
 size(600, 600);
}

void draw(){
  fill(119, 176, 245);
  rect(0, 0, width, height); // Sky
  fill(252, 245, 0);
  ellipse(200, 300, 150, 150); // Sun
  fill(28, 234, 92);
  rect(0, 300, width, 300); // Grass
  fill(240, 97, 123);
  rect(400, 250, 150, 125); // House
  fill(255, 255, 255);
  rect(462, 325, 25, 50); // Door
  fill(0);
  ellipse(470, 350, 5, 5); // Doorknob
  triangle(475, 175, 375, 275, 575, 275); // Roof
  stroke(252, 245, 0); // Sun rays
  strokeWeight(4);
  line(100, 298, 300, 298);
  line(200, 195, 200, 295);
  line(150, 205, 200, 295);
  line(250, 205, 200, 295);
  line(115, 230, 200, 295);
  line(280, 230, 200, 295);
  line(105, 265, 200, 285);
  line(295, 265, 200, 285);
  noStroke();
}