// Michael Lam
// June 1st, 2018
// Assignment 2: A program that contains all Processing exercises and allows selected access using a login system.

// userABtn, userBBtn, superUserBtn, ex1Btn, ex2Btn, ex3Btn, ex4Btn, ex5Btn, ex6Btn, ex7Btn, ex9Btn, ex10Btn, ex12Btn, backBtn;

// Declaring variables
Boolean userLoggedIn = false, incorrectAttempt = false;
int loginScreen = 0;
String passwordInput = "", passwordField = "", fieldHint = "Password";

// Declaring arrays
Password[] userPassword = new Password[3];
String[] users = {"userA", "userB", "superUser"};

// Declaring UI elements
PFont sfFont;
PImage userAImg, userBImg, superUserImg, backgroundImg, returnImg, enterImg, cancelImg;


// Initial setup
void setup() {
  size(600, 600); // P2D mode? or smooth()
  surface.setTitle("Assignment 2");
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  imageMode(CENTER);
  sfFont = createFont("SanFranciscoDisplay-Semibold.otf", 14, true);
  textFont(sfFont);
  userAImg = loadImage("userA.png");
  userBImg = loadImage("userB.png");
  superUserImg = loadImage("superUser.png");
  backgroundImg = loadImage("background.png");
  returnImg = loadImage("return.png"); // Currently not used
  enterImg = loadImage("enter.png");
  cancelImg = loadImage("cancel.png");
  userPassword[0] = new Password(users[0], "Hello");
  userPassword[1] = new Password(users[1], "World!");
  userPassword[2] = new Password(users[2], "P@s$w0rd123");
}

// Login screen
void draw() {
  image(backgroundImg, 300, 300, width, height);
  fill(255);
  image(userAImg, 125, 250, 125, 125);
  text("User A", 125, 335);
  image(userBImg, 300, 250, 125, 125);
  text("User B", 300, 335);
  image(superUserImg, 475, 250, 125, 125);
  text("Super User", 475, 335);
  surface.setTitle("Login to...");
  if (loginScreen == 1) {
    userALogin();
  } else if (loginScreen == 2) {
    userBLogin();
  } else if (loginScreen == 3) {
    superUserLogin();
  }
}

// User A login process
void userALogin() {
  surface.setTitle("Login to User A");
  image(backgroundImg, 300, 300, width, height);
  image(userAImg, 180, 250, 125, 125);
  text("User A", 310, 220);
  showLoginElements();
}

// User B login process
void userBLogin() {
  surface.setTitle("Login to User B");
  image(backgroundImg, 300, 300, width, height);
  image(userBImg, 180, 250, 125, 125);
  text("User B", 310, 220);
  showLoginElements();
}

// Super User login process
void superUserLogin() {
  surface.setTitle("Login to Super User");
  image(backgroundImg, 300, 300, width, height);
  image(superUserImg, 180, 250, 125, 125);
  text("Super User", 340, 220);
  showLoginElements();
}

// Displays login UI elements
void showLoginElements() {
  fill(255, 100); // 
  rect(368, 280, 200, 35); // Password field box
  fill(255);
  text(passwordField, 368, 280);
  image(enterImg, 500, 280, 22, 35);
  image(cancelImg, 300, 450, 35, 35);
  textSize(10);
  fill(225);
  text(fieldHint, 368, 280);
  text("Cancel", 300, 480);
  if (incorrectAttempt == true) {
    text("Incorrect password. Please try again.", 300, 350);
  }
  textSize(14); // Resets font size
}

void checkPassword() {
  if (loginScreen == 1) {
    if (userPassword[0].comparePassword(passwordInput)) {
      userLoggedIn = true;
    } else {
      incorrectAttempt = true;
    }
  } else if (loginScreen == 2) {
    if (userPassword[1].comparePassword(passwordInput)) {
      userLoggedIn = true;
    } else {
      incorrectAttempt = true;
    }
  } else if (loginScreen == 3) {
    if (userPassword[2].comparePassword(passwordInput)) {
      userLoggedIn = true;
    } else {
      incorrectAttempt = true;
    }
  }
  passwordInput = "";
  passwordField = "";
  fieldHint = "Password";
}

void mouseClicked() {
  if (loginScreen == 0) {
    if (dist(mouseX, mouseY, 125, 250) < 62.5) {
      loginScreen = 1;
    } else if (dist(mouseX, mouseY, 300, 250) < 62.5) {
      loginScreen = 2;
    } else if (dist(mouseX, mouseY, 475, 250) < 62.5) {
      loginScreen = 3;
    }
  } else if (loginScreen >= 1) {
    if (mouseX > 489 && mouseX < 489+22 && mouseY > 262.5 && mouseY < 262.5+35) { // Runs code if enter button is clicked
      checkPassword();
    } else if (mouseX > 282.5 && mouseX < 282.5+35 && mouseY > 432.5 && mouseY < 432.5+35) {
      loginScreen = 0;
      draw();
    }
  }
}

void keyPressed() {
  if (userLoggedIn == false) {
    if (key == BACKSPACE) {
      passwordInput = passwordInput.substring(0, max(0, passwordInput.length()-1));
      if (passwordField.length() < 18) {
        passwordField = passwordField.substring(0, max(0, passwordField.length()-1)); // BUG: Stops working if asterisks exceed 18 characters
      }
    } else if (key == RETURN || key == ENTER) {
      checkPassword();
    } else if (key == ESC) {
      key = 0; // Prevents ESC from quitting program
      loginScreen = 0;
    } else if (key != CODED) {
      incorrectAttempt = false;
      if (passwordField.length() <= 17) {
        passwordInput += key;
        passwordField += "*";
        fieldHint = "";
      } else {
        passwordInput += key;
        fieldHint = "";
      }
    }
  }
}