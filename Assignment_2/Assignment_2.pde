// Michael Lam
// June 1st, 2018
// Assignment 2: A program that contains all Processing exercises and allows selected access using a login system.

// userABtn, userBBtn, superUserBtn, ex1Btn, ex2Btn, ex3Btn, ex4Btn, ex5Btn, ex6Btn, ex7Btn, ex9Btn, ex10Btn, ex12Btn, backBtn;

// Declaring variables
String passwordInput = "";

// Initial setup
void setup() {
  size(600, 600);
  textAlign(CENTER, CENTER);
}

void draw() {
  background(255);
  fill(0);
  ellipse(100, 100, 100, 100);
  text("User A", 100, 175);
}

void mousePressed() {
  if (dist(mouseX, mouseY, 100, 100) < 100) {
    text("Hello world.", 400, 400);
    // Display password field and hide other buttons
  }
}