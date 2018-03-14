// Michael Lam
// March 8, 2018
// Last updated March 14, 2018.
// Beautiful, colourful arcs. Vinay.

void setup() {
  size(800, 600);
  background(255);
}

void draw(){
  noFill();
  strokeWeight(16);
  stroke(255, 0 ,0);
  arc(400, 300, 600, 600, PI-QUARTER_PI, PI+HALF_PI);
  strokeWeight(12);
  stroke(0, 255 ,0);
  arc(285, 348, 450, 450, PI-QUARTER_PI, PI+HALF_PI);
  strokeWeight(14);
  stroke(0, 0, 255);
  arc(321, 312, 500, 500, PI-QUARTER_PI, PI+HALF_PI);
  strokeWeight(16);
  stroke(255, 0, 255);
  arc(400, 350, 650, 650, PI-QUARTER_PI, PI+HALF_PI);
  strokeWeight(16);
  stroke(255, 0 ,0);
  arc(250+50, 300+50, 600, 600, 0, PI-HALF_PI);
  strokeWeight(12);
  stroke(0, 255 ,0);
  arc(300+50, 348+50, 450, 450, 0, PI-HALF_PI);
  strokeWeight(14);
  stroke(0, 0, 255);
  arc(321+50, 312+50, 500, 500, 0, PI-HALF_PI);
  strokeWeight(16);
  stroke(255, 0, 255);
  arc(222+50, 290+50, 650, 650, 0, PI-HALF_PI);
}

/* Issues
- Bad coding practices.
- Arcs are not similar.
*/
