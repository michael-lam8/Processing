// Michael Lam
// June 1st, 2018
// Assignment 2: A program that contains all Processing exercises and allows selected access using a login system.

// userABtn, userBBtn, superUserBtn, ex1Btn, ex2Btn, ex3Btn, ex4Btn, ex5Btn, ex6Btn, ex7Btn, ex9Btn, ex10Btn, ex12Btn, backBtn;

// Declaring variables
Boolean incorrectAttempt = false, switchUsersClicked = false;
int loginScreen = 0, userLoggedIn = 0, switchUsersScreen = 0;
String passwordInput = "", asterisks = "", fieldHint = "Password";

// Declaring arrays
Password[] userLogin = new Password[3];
String[] users = {"User A", "User B", "Super User"};

// Declaring UI elements
PFont sfFont;
PImage userAImg, userBImg, superUserImg, backgroundImg, returnImg, enterImg, dropdownImg, cancelImg;

// Initial setup
void setup() {
  surface.setTitle("Assignment 2");
  size(600, 600); // P2D mode? or smooth()
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
  dropdownImg = loadImage("dropdown.png");
  cancelImg = loadImage("cancel.png");
  userLogin[0] = new Password(users[0], "Hello");
  userLogin[1] = new Password(users[1], "World!");
  userLogin[2] = new Password(users[2], "P@s$w0rd123");
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
  if (loginScreen == 1) {
    userALogin();
    surface.setTitle("Login to User A");
  } else if (loginScreen == 2) {
    userBLogin();
    surface.setTitle("Login to User B");
  } else if (loginScreen == 3) {
    superUserLogin();
    surface.setTitle("Login to Super User");
  } else if (loginScreen == 0) {
    surface.setTitle("Login to...");
  }
  if (userLoggedIn == 1) {
    userAMenu();
  } else if (userLoggedIn == 2) {
    userBMenu();
  } else if (userLoggedIn == 3) {
    superUserMenu();
  }
}

// User A login process
void userALogin() {
  image(backgroundImg, 300, 300, width, height);
  image(userAImg, 180, 250, 125, 125);
  text("User A", 310, 220);
  showLoginElements();
}

// User B login process
void userBLogin() {
  image(backgroundImg, 300, 300, width, height);
  image(userBImg, 180, 250, 125, 125);
  text("User B", 310, 220);
  showLoginElements();
}

// Super User login process
void superUserLogin() {
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
  text(asterisks, 368, 280);
  image(enterImg, 500, 280, 22, 35);
  image(cancelImg, 300, 450, 35, 35);
  textSize(10);
  fill(225);
  text(fieldHint, 368, 280);
  text("Cancel", 300, 480);
  if (incorrectAttempt == true) {
    text("Incorrect password. Please try again.", 300, 350);
  }
  fill(255); // Resets text colour
  textSize(14); // Resets font size
}

// Compares user password input with its encrypted equivalent 
void checkPassword() {
  if (loginScreen == 1) {
    if (userLogin[0].comparePassword(passwordInput)) {
      userLoggedIn = 1;
    } else {
      incorrectAttempt = true;
    }
  } else if (loginScreen == 2) {
    if (userLogin[1].comparePassword(passwordInput)) {
      userLoggedIn = 2;
    } else {
      incorrectAttempt = true;
    }
  } else if (loginScreen == 3) {
    if (userLogin[2].comparePassword(passwordInput)) {
      userLoggedIn = 3;
    } else {
      incorrectAttempt = true;
    }
  }
  passwordInput = "";
  asterisks = "";
  fieldHint = "Password";
}

void userAMenu() {
  surface.setTitle("Menu – Logged in as User A");
  image(backgroundImg, 300, 300, width, height);
  image(userAImg, 42, 42, 50, 50);
  text("User A", 125, 40);
  image(dropdownImg, 190, 42, 25, 16);
  fill(255, 110);
  rect(175, 170, 200, 61, 12.5); // Exercise 1 box
  rect(420, 170, 200, 61, 12.5); // Exercise 2 box
  rect(175, 265, 200, 61, 12.5); // Exercise 3 box
  rect(420, 265, 200, 61, 12.5); // Exercise 4 box
  rect(175, 360, 200, 61, 12.5); // Exercise 5 box
  rect(420, 360, 200, 61, 12.5); // Exercise 6 box
  rect(300, 455, 200, 61, 12.5); // Exercise 7 box
  fill(255);
  text("Exercise 1", 175, 170);
  text("Exercise 2", 420, 170);
  text("Exercise 3", 175, 265);
  text("Exercise 4", 420, 265);
  text("Exercise 5", 175, 360);
  text("Exercise 6", 420, 360);
  text("Exercise 7", 300, 455);
  if (switchUsersClicked) {
    switchUsers();
    switchUsersScreen = 1;
  }
}

void userBMenu() {
}

void superUserMenu() {
}

void switchUsers() {
  fill(0, 200);
  rect(300, 300, width, height);
  fill(38);
  rect(132.5, 300, 265, height);
  fill(255);
  if (switchUsersScreen == 1) {
    image(userAImg, 42, 42, 50, 50);
    text("User A", 125, 40);
  }
  image(enterImg, 190, 42, 16, 25);
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
  } else if (loginScreen >= 1 && loginScreen <= 3) {
    if (mouseX > 489 && mouseX < 489+22 && mouseY > 262.5 && mouseY < 262.5+35) { // Runs code if enter button is clicked
      checkPassword();
    } else if (mouseX > 282.5 && mouseX < 282.5+35 && mouseY > 432.5 && mouseY < 432.5+35) { // Cancel button
      loginScreen = 0;
      passwordInput = "";
      asterisks = "";
      fieldHint = "Password";
      incorrectAttempt = false;
    }
  }
  if (userLoggedIn == 1) {
    if (mouseX > 75 && mouseX < 75+200 && mouseY > 139.5 && mouseY < 139.5+61) {
      println("Exercise 1");
      // Use if switchUsersClicked == false to prevent Exercise from opening when switch users panel is open
    } else if (mouseX > 320 && mouseX < 320+200 && mouseY > 139.5 && mouseY < 139.5+61) {
      println("Exercise 2");
    } else if (mouseX > 75 && mouseX < 75+200 && mouseY > 234.5 && mouseY < 234.5+61) {
      println("Exercise 3");
    } else if (mouseX > 320 && mouseX < 320+200 && mouseY > 234.5 && mouseY < 234.5+61) {
      println("Exercise 4");
    } else if (mouseX > 75 && mouseX < 75+200 && mouseY > 329.5 && mouseY < 329.5+61) {
      println("Exercise 5");
    } else if (mouseX > 320 && mouseX < 320+200 && mouseY > 329.5 && mouseY < 329.5+61) {
      println("Exercise 6");
    } else if (mouseX > 200 && mouseX < 200+200 && mouseY > 424.5 && mouseY < 424.5+61) {
      println("Exercise 7");
    } else if (mouseX > 0 && mouseX < 205 && mouseY > 0 && mouseY < 70) {
      switchUsersClicked = true;
    }
    if (switchUsersScreen == 1) {
      if (mouseX > 0 && mouseX < 205 && mouseY > 0 && mouseY < 70 || mouseX > 205 && mouseX < width && mouseY > 0 && mouseY < height) {
        switchUsersClicked = false;
        switchUsersScreen = 0;
      }
    }
  }
}

void keyPressed() {
  if (userLoggedIn == 0) {
    if (key == BACKSPACE) {
      passwordInput = passwordInput.substring(0, max(0, passwordInput.length()-1));
      if (asterisks.length() <= 17) {
        asterisks = asterisks.substring(0, max(0, asterisks.length()-1)); // BUG: Stops working if asterisks exceed 18 characters
      }
    } else if (key == RETURN || key == ENTER) {
      checkPassword();
    } else if (key == ESC) {
      key = 0; // Prevents ESC from quitting program
      loginScreen = 0;
    } else if (key != CODED) {
      incorrectAttempt = false;
      if (asterisks.length() <= 17) {
        passwordInput += key;
        asterisks += "*";
        fieldHint = "";
      } else {
        passwordInput += key;
        fieldHint = "";
      }
    }
  }
}