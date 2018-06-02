// Michael Lam
// March 7, 2018
// Set A, Exercise 1: A beautiful scenery, minus the sun.

// Last updated June 2, 2018
// - Added additional documentation
// - Updated spacing to make code easier to read

class Exercise_A1 {
  void draw() {
    // Setting properties
    rectMode(CORNER);
    
    // Sky
    fill(119, 176, 245);
    rect(0, 0, width, height);
    
    // Sun
    fill(252, 245, 0);
    ellipse(200, 300, 150, 150);
    
    // Grass
    fill(28, 234, 92);
    rect(0, 300, width, 300);
    
    // House
    fill(240, 97, 123);
    rect(400, 250, 150, 125);
    
    // Door
    fill(255, 255, 255);
    rect(462, 325, 25, 50);
    
    // Doorknob
    fill(0);
    ellipse(470, 350, 5, 5);
    
    // Roof
    triangle(475, 175, 375, 275, 575, 275);
    
    // Sun rays
    stroke(252, 245, 0);
    strokeWeight(4);
    line(100, 298, 300, 298);
    line(200, 195, 200, 295);
    line(150, 205, 200, 295);
    line(250, 205, 200, 295);
    line(115, 230, 200, 295);
    line(280, 230, 200, 295);
    line(105, 265, 200, 285);
    line(295, 265, 200, 285);
    noStroke(); // Resets stroke property to prevent drawing an outline on other shapes
  }
}