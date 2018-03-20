// Michael Lam
// March 2018

PFont arialFont;
boolean correctAnswer = false;
int score;
int operator = 2;//(int) random(4);
int randNum1 = (int) random(10);
int randNum2 = (int) random(10);
int randSubNum1 = (int) random(10, 20);
int randSubNum2 = (int) random(10);
String operatorText = str(operator);
String randNumText1 = str(randNum1);
String randNumText2 = str(randNum2);
String randSubNumText1 = str(randSubNum1);
String randSubNumText2 = str(randSubNum2);
String userInput = "";


void setup() {
  size(600, 600);
  background(255);
  arialFont = createFont("Arial", 32, true);
}

// Note: move code later to separate function to distinguish different screens.
void draw() {
  textFont(arialFont);
  fill(0);
  if (operator == 1) {
    text(randNumText1 + " + " + randNumText2 + " = " + userInput, 100, 100);
    if (userInput.equals(randNum1 + randNum2)) {
      text("wow good job Vinay!!", 100, 300);
    }
  } else if (operator == 2) {
    text(randSubNumText1 + " - " + randSubNumText2 + " = " + userInput, 100, 100);
    if (userInput.equals(randSubNum1 - randSubNum2)) {
      text("wow good job Vinay!!", 100, 300);
    }
  } else if (operator == 3) {
    text(randNumText1 + " * " + randNumText2 + " = " + userInput, 100, 100);
    if (userInput.equals(randNum1 * randNum2)) {
      text("wow good job Vinay!!", 100, 300);
    }
  } else {
    text(randNumText1 + " / " + randNumText2 + " = " + userInput, 100, 100);
    if (userInput.equals(randNum1 / randNum2)) {
      text("wow good job Vinay!!", 100, 300);
    }
  }
}

void keyPressed() {
 userInput += key;
 if (key == BACKSPACE) {
   // println ("BACKSPACE");
 }
  if (key == RETURN || key == ENTER) {
      // println ("ENTER");
      if (userInput.equals(randNum1)) {
        println("wow good job Vinay!");
        correctAnswer = true;
        userInput = "";
      } // if
      else {
        correctAnswer = false;
      }
  }
}
/*
1. A "multi-screen" program (can click between them, or use the keyboard to swap between them)
2. On one "screen", solve a math-based problem (not a game, cannot "solve boredom")
3. A non-Math-class problem to solve (not a game, cannot "solve boredom")
*/