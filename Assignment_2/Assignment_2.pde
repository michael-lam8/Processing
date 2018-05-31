// Michael Lam
// June 1st, 2018
// Assignment 2: A program that contains all Processing exercises and allows selected access using a login system.

// Declaring variables
Boolean incorrectAttempt = false, switchUsersClicked = false;
int loginScreen = 0, userLoggedIn = 0, userSwitching = 0, superUserScreen = 1, menuActive = 0, menuBarY = 8, runExercise = 0;
String passwordInput = "", asterisks = "", fieldHint = "Password";

// Declaring arrays
Buttons[] button = new Buttons[12];
Password[] userLogin = new Password[3];
String[] users = {"User A", "User B", "Super User"};

// Declaring UI elements
PFont sfFont;
PImage userAImg, userBImg, superUserImg, backgroundImg, returnImg, enterImg, dropdownImg, cancelImg;

// Declaring instances
Exercise_A1 exercise1 = new Exercise_A1();
Exercise_A2 exercise2 = new Exercise_A2();
Exercise_A3 exercise3 = new Exercise_A3();
Exercise_A4 exercise4 = new Exercise_A4();
Exercise_A5 exercise5 = new Exercise_A5();
Exercise_A6 exercise6 = new Exercise_A6();
Exercise_A7 exercise7 = new Exercise_A7();
Exercise_B8 exercise8 = new Exercise_B8();
Exercise_B9 exercise9 = new Exercise_B9();
Exercise_B10 exercise10 = new Exercise_B10();
Exercise_B12 exercise12 = new Exercise_B12();
Password password = new Password();
ProgramSetup program = new ProgramSetup();

// Initial setup
void setup() {
  size(600, 600);
  smooth(8);
  program.setup();
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
  if (runExercise == 1) {
    exercise1.draw();
  } else if (runExercise == 2) {
    exercise2.draw();
  } else if (runExercise == 3) {
    exercise3.draw();
  } else if (runExercise == 4) {
    exercise4.draw();
  } else if (runExercise == 5) {
    exercise5.draw();
  } else if (runExercise == 6) {
    exercise6.draw();
  } else if (runExercise == 7) {
    exercise7.draw();
  } else if (runExercise == 8) {
    exercise8.draw();
  } else if (runExercise == 9) {
    exercise9.draw();
  } else if (runExercise == 10) {
    exercise10.setup();
  } else if (runExercise == 12) {
    exercise12.setup();
  }
  if (runExercise >= 1) {
    menuActive = 0;
    menuBar();
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

// Displays exercises available to User A
void userAMenu() {
  surface.setTitle("Logged in as User A");
  showUserAMenuElements();
  image(userAImg, 42, 42, 50, 50);
  text("User A", 125, 40);
  image(dropdownImg, 190, 42, 25, 16);
  if (switchUsersClicked) {
    switchUsers();
    image(userAImg, 42, 42, 50, 50);
    text("User A", 125, 40);
    image(userBImg, 42, 125, 50, 50);
    text("User B", 125, 123);
    image(superUserImg, 42, 192, 50, 50);
    text("Super User", 154, 190);
    image(enterImg, 190, 42, 16, 25);
  }
}

// Displays exercises available to User B
void userBMenu() {
  surface.setTitle("Logged in as User B");
  showUserBMenuElements();
  image(userBImg, 42, 42, 50, 50);
  text("User B", 125, 40);
  image(dropdownImg, 190, 42, 25, 16);
  if (switchUsersClicked) {
    switchUsers();
    image(userBImg, 42, 42, 50, 50);
    text("User B", 125, 40);
    image(userAImg, 42, 125, 50, 50);
    text("User A", 125, 123);
    image(superUserImg, 42, 192, 50, 50);
    text("Super User", 154, 190);
    image(enterImg, 190, 42, 16, 25);
  }
}

// Displays exercises available to Super User
void superUserMenu() {
  surface.setTitle("Logged in as Super User");
  if (superUserScreen == 1) {
    showUserAMenuElements();
    image(enterImg, 565, 300, 42, 66);
  } else {
    showUserBMenuElements();
    image(returnImg, 35, 300, 42, 66);
  }
  image(superUserImg, 42, 42, 50, 50);
  text("Super User", 154, 40);
  image(dropdownImg, 240, 42, 25, 16);
  if (switchUsersClicked) {
    switchUsers();
    image(superUserImg, 42, 42, 50, 50);
    text("Super User", 154, 40);
    image(userAImg, 42, 125, 50, 50);
    text("User A", 125, 123);
    image(userBImg, 42, 192, 50, 50);
    text("User B", 125, 190);
    image(enterImg, 240, 42, 16, 25);
  }
}

// Displays background and User A exercise buttons
void showUserAMenuElements() {
  image(backgroundImg, 300, 300, width, height);
  for (int i = 0; i < 7; i++) {
    button[i].draw();
  }
}

// Displays background and User B exercise buttons
void showUserBMenuElements() {
  image(backgroundImg, 300, 300, width, height);
  for (int i = 7; i <= 10; i++) {
    button[i].draw();
  }
}

// Displays a bar at top of screen when running an exercise to allow user to quit
void menuBar() {
  if (mouseX > 0 && mouseX < width && mouseY > 0 && mouseY < menuBarY) {
    menuBarY = 30;
    rectMode(CENTER);
    textAlign(CENTER, CENTER);
    noStroke();
    fill(38);
    rect(300, 15, width, menuBarY);
    fill(255);
    textSize(10);
    if (runExercise != 10) {
      text("Exercise " + runExercise, 300, 15);
    } else {
      text("Exercise 10/11", 300, 15);
    }
    text("Close", 560, 15);
    if (mouseX > 525 && mouseX < width && mouseY > 0 && mouseY < menuBarY && mousePressed) {
      returnToMenu();
    }
  } else {
    menuBarY = 8;
  }
}

// Resets any attribute or variable that may have been changed when running an exercise
void returnToMenu() {
  runExercise = 0;
  menuActive = 1;
  colorMode(RGB, 255, 255, 255);
  stroke(0);
  strokeWeight(1);
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  textSize(14);
}

// Displays a panel that allows switching between users
void switchUsers() {
  fill(0, 200);
  rect(300, 300, width, height);
  fill(38);
  rect(132.5, 300, 265, height);
  fill(255);
  textSize(12);
  text("Log out", 75, 575);
  text("Exit", 195, 575);
  stroke(152);
  line(10, 80, 256, 80);
  line(10, 550, 256, 550);
  textSize(14);
  stroke(0);
}

// Runs following code if mouse is clicked
void mouseClicked() {
  if (loginScreen == 0) {
    if (dist(mouseX, mouseY, 125, 250) < 62.5) { // Runs User A login
      loginScreen = 1;
    } else if (dist(mouseX, mouseY, 300, 250) < 62.5) { // Runs User B login
      loginScreen = 2;
    } else if (dist(mouseX, mouseY, 475, 250) < 62.5) { // Runs Super User login
      loginScreen = 3;
    }
  } else if (loginScreen >= 1 && loginScreen <= 3) {
    if (mouseX > 489 && mouseX < 489+22 && mouseY > 262.5 && mouseY < 262.5+35) { // Runs when enter button is clicked
      password.checkPassword();
    } else if (mouseX > 282.5 && mouseX < 282.5+35 && mouseY > 432.5 && mouseY < 432.5+35) { // Runs when cancel button is clicked
      if (userSwitching == 0) { // If cancelling from initial login process
        loginScreen = 0;
        password.resetPasswordField();
      } else if (userSwitching == 1) { // If User A is switching accounts
        userLoggedIn = 1;
        switchUsersClicked = true;
        password.resetPasswordField();
      } else if (userSwitching == 2) { // If User B is switching accounts
        userLoggedIn = 2;
        switchUsersClicked = true;
        password.resetPasswordField();
      } else if (userSwitching == 3) { // If Super User is switching accounts
        userLoggedIn = 3;
        switchUsersClicked = true;
        password.resetPasswordField();
      }
    }
  }
  if (userLoggedIn == 1) {
    if (menuActive == 1) {
      checkIfSetAClicked();
      if (mouseX > 0 && mouseX < 265 && mouseY > 0 && mouseY < 70) { // Opens Switch Users panel if user icon/name is clicked
        switchUsersClicked = true;
        menuActive = 2;
      }
    } else if (menuActive == 2) {
      if (mouseX > 0 && mouseX < 265 && mouseY > 0 && mouseY < 70 || mouseX > 265 && mouseX < width && mouseY > 0 && mouseY < height) { // Returns to menu
        switchUsersClicked = false;
        menuActive = 1;
      } else if (mouseX > 0 && mouseX < 265 && mouseY > 80 && mouseY < 160) {
        switchUsersClicked = false;
        userLoggedIn = 0;
        loginScreen = 2;
        userSwitching = 1;
      } else if (mouseX > 0 && mouseX < 265 && mouseY > 160 && mouseY < 240) {
        switchUsersClicked = false;
        userLoggedIn = 0;
        loginScreen = 3;
        userSwitching = 1;
      }
    }
  } else if (userLoggedIn == 2) {
    if (menuActive == 1) {
      checkIfSetBClicked();
      if (mouseX > 0 && mouseX < 265 && mouseY > 0 && mouseY < 70) {
        switchUsersClicked = true;
        menuActive = 2;
      }
    } else if (menuActive == 2) {
      if (mouseX > 0 && mouseX < 265 && mouseY > 0 && mouseY < 70 || mouseX > 265 && mouseX < width && mouseY > 0 && mouseY < height) {
        switchUsersClicked = false;
        menuActive = 1;
      } else if (mouseX > 0 && mouseX < 265 && mouseY > 80 && mouseY < 160) {
        switchUsersClicked = false;
        userLoggedIn = 0;
        loginScreen = 1;
        userSwitching = 2;
      } else if (mouseX > 0 && mouseX < 265 && mouseY > 160 && mouseY < 240) {
        switchUsersClicked = false;
        userLoggedIn = 0;
        loginScreen = 3;
        userSwitching = 2;
      }
    }
  } else if (userLoggedIn == 3) {
    if (menuActive == 1) {
      if (superUserScreen == 1) {
        checkIfSetAClicked();
        if (mouseX > 544 && mouseX < 544+42 && mouseY > 267 && mouseY < 267+66) {
          superUserScreen = 2;
        }
      } else if (superUserScreen == 2) {
        checkIfSetBClicked();
        if (mouseX > 14 && mouseX < 14+42 && mouseY > 267 && mouseY < 267+66) {
          superUserScreen = 1;
        }
      }
      if (mouseX > 0 && mouseX < 265 && mouseY > 0 && mouseY < 70) {
        switchUsersClicked = true;
        menuActive = 2;
      }
    } else if (menuActive == 2) {
      if (mouseX > 0 && mouseX < 265 && mouseY > 0 && mouseY < 70 || mouseX > 265 && mouseX < width && mouseY > 0 && mouseY < height) {
        switchUsersClicked = false;
        menuActive = 1;
      } else if (mouseX > 0 && mouseX < 265 && mouseY > 80 && mouseY < 160) {
        switchUsersClicked = false;
        userLoggedIn = 0;
        loginScreen = 1;
        userSwitching = 3;
      } else if (mouseX > 0 && mouseX < 265 && mouseY > 160 && mouseY < 240) {
        switchUsersClicked = false;
        userLoggedIn = 0;
        loginScreen = 2;
        userSwitching = 3;
      }
    }
  }
  if (menuActive == 2) {
    if (mouseX > 0 && mouseX < 135 && mouseY > 550 && mouseY < height) {
      switchUsersClicked = false;
      userLoggedIn = 0;
      loginScreen = 0;
      userSwitching = 0;
    } else if (mouseX > 135 && mouseX < 265 && mouseY > 550 && mouseY < height) {
      exit();
    }
  }
  if (runExercise == 8) {
    exercise8.mouseClicked();
  }
}

// Allows regular key input
void keyPressed() {
  if (userLoggedIn == 0) {
    if (key == BACKSPACE) {
      passwordInput = passwordInput.substring(0, max(0, passwordInput.length()-1));
      if (passwordInput.length() >= 18) {
        asterisks = "*******************";
      }
      asterisks = asterisks.substring(0, max(0, asterisks.length()-1));
    } else if (key == RETURN || key == ENTER) {
      password.checkPassword();
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
  if (runExercise == 8) {
    exercise8.keyPressed();
  }
  if (runExercise >= 1) {
    if (key == ESC) {
      key = 0; // Prevents ESC from quitting program
      returnToMenu();
    }
  }
}

// Verifies whether any User A exercise buttons were clicked
void checkIfSetAClicked() {
  if (mouseX > 75 && mouseX < 75+200 && mouseY > 140 && mouseY < 140+60) {
    runExercise = 1;
  } else if (mouseX > 320 && mouseX < 320+200 && mouseY > 140 && mouseY < 140+60) {
    runExercise = 2;
  } else if (mouseX > 75 && mouseX < 75+200 && mouseY > 235 && mouseY < 235+60) {
    runExercise = 3;
  } else if (mouseX > 320 && mouseX < 320+200 && mouseY > 235 && mouseY < 235+60) {
    runExercise = 4;
  } else if (mouseX > 75 && mouseX < 75+200 && mouseY > 330 && mouseY < 330+60) {
    runExercise = 5;
  } else if (mouseX > 320 && mouseX < 320+200 && mouseY > 330 && mouseY < 330+60) {
    runExercise = 6;
  } else if (mouseX > 200 && mouseX < 200+200 && mouseY > 425 && mouseY < 425+60) {
    runExercise = 7;
  }
}

// Verifies whether any User B exercise buttons were clicked
void checkIfSetBClicked() {
  if (mouseX > 75 && mouseX < 75+200 && mouseY > 227 && mouseY < 227+60) {
    exercise8.selectedMode = 0; // Resets to Main Menu each time Exercise 8 is opened
    runExercise = 8;
  } else if (mouseX > 320 && mouseX < 320+200 && mouseY > 227 && mouseY < 227+60) {
    exercise9.resetLines();
    runExercise = 9;
  } else if (mouseX > 75 && mouseX < 75+200 && mouseY > 312 && mouseY < 312+60) {
    runExercise = 10;
  } else if (mouseX > 320 && mouseX < 320+200 && mouseY > 312 && mouseY < 312+60) {
    runExercise = 12;
  }
}