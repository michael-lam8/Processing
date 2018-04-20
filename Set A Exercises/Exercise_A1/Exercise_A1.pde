// Michael Lam
// March 7, 2018
// Last updated March 14, 2018.
// A beautiful scenery, minus the sun.

void setup() {
 size(800, 600);
 noStroke();
}

void draw(){
  // Sky
  fill(119, 176, 245);
  rect(0, 0, 800, 300);
  // Sun
  fill(252, 245, 0);
  ellipse(200, 300, 150, 150);
  // Grass
  fill(28, 234, 92);
  rect(0, 300, 800, 300);
  // House
  fill(240, 97, 123);
  rect(550, 250, 150, 125);
  // Door
  fill(255, 255, 255);
  rect(612, 325, 25, 50);
  // Doorknob
  fill(0);
  ellipse(620, 350, 5, 5);
  // Roof
  fill(0);
  triangle(625, 175, 525, 275, 725, 275);
  // Sun lines
  stroke(252, 245, 0);
  strokeWeight(4);
  line(100, 298, 300, 298);
  line(200, 195, 200, 298);
  line(150, 205, 200, 298);
  line(250, 205, 200, 298);
  line(115, 230, 200, 298);
  line(280, 230, 200, 298);
  line(105, 265, 200, 285);
  line(295, 265, 200, 285);
}
