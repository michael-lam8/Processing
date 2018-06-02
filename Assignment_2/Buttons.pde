// Michael Lam
// May 28, 2018
// This class creates identical buttons for the exercises when drawn, but allows customization with its coordinates and text.

// Last updated June 2, 2018
// - Added additional documentation

class Buttons {
  // Declaring variables
  int x, y;
  String buttonText;

  // Empty constructor to allow calling functions
  Buttons() {
  }

  // Constructor that creates variable exercise buttons
  Buttons(int tempX, int tempY, String tempText) {
    x = tempX;
    y = tempY;
    buttonText = tempText;
  }

  // Draws buttons when called, with variables set when creating the instance
  void draw() {
    fill(255, 110);
    rect(x, y, 200, 60, 12);
    fill(255);
    text(buttonText, x, y);
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
}