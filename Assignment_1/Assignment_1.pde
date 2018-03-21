// Michael Lam
// March 2018

PFont arialFont;
int score;
int userCorrect;
int userIncorrect;
int userAnswer;
int operator;
int randNum1;
int randNum2;
int randHighNum1;
int randLowNum2;
String userInput = "";
String operatorText;
String randNumText1;
String randNumText2;
String randHighNumText1;
String randLowNumText1;

void setup() {
  size(600, 600);
  arialFont = createFont("Arial", 32, true);
  newMathQuestion();
}

// Note: move code later to separate function to distinguish different screens.
void draw() {
  background(255);
  textFont(arialFont);
  fill(0);
  text("Correct: " + userCorrect + " Incorrect: " + userIncorrect + " Score: " + score, 100, 500);
  userAnswer = int(userInput);
  if (operator == 1) {
    text(randNumText1 + " + " + randNumText2 + " = " + userInput, 100, 100);
  } else if (operator == 2) {
    text(randHighNumText1 + " - " + randLowNumText1 + " = " + userInput, 100, 100);
  } else if (operator == 3) {
    text(randNumText1 + " * " + randNumText2 + " = " + userInput, 100, 100);
  } else {
    text(randHighNumText1 + " % " + randLowNumText1 + " = " + userInput, 100, 100); // Broken
  }
}

void keyPressed() {
 userInput += key;
 if (key == BACKSPACE) {
    if (userInput.length()>0) { // Crashes when no text entered and backspaced
      userInput = userInput.substring(0, userInput.length()-2);
    }
 }
 if (key == RETURN || key == ENTER) {
    checkAnswer();
 }
}

void checkAnswer() {
 if (operator == 1) {
   if (userAnswer == randNum1 + randNum2) {
     score += 10;
     userCorrect += 1;
     userInput = "";
     newMathQuestion();
     } else {
      if (score > 0) {
        score -= 10;
      }
      userIncorrect += 1;
      userInput = "";
    }
  }
  if (operator == 2) {
   if (userAnswer == randHighNum1 - randLowNum2) {
     score += 10;
     userCorrect += 1;
     userInput = "";
     newMathQuestion();
     } else {
      if (score > 0) {
        score -= 10;
      }
      userIncorrect += 1;
      userInput = "";
    }
  }
  if (operator == 3) {
   if (userAnswer == randNum1 * randNum2) {
     score += 10;
     userCorrect += 1;
     userInput = "";
     newMathQuestion();
     } else {
      if (score > 0) {
        score -= 10;
      }
      userIncorrect += 1;
      userInput = "";
    }
  }
  if (operator == 4) {
   if (userAnswer == randHighNum1 % randLowNum2) {
     score += 10;
     userCorrect += 1;
     userInput = "";
     newMathQuestion();
     } else {
      if (score > 0) {
        score -= 10;
      }
      userIncorrect += 1;
      userInput = "";
    }
  }
}

void newMathQuestion() {
  operator = 1; //(int) random(4); // Delete random when making different screens
  randNum1 = (int) random(10);
  randNum2 = (int) random(10);
  randHighNum1 = (int) random(10, 20);
  randLowNum2 = (int) random(10);
  operatorText = str(operator);
  randNumText1 = str(randNum1);
  randNumText2 = str(randNum2);
  randHighNumText1 = str(randHighNum1);
  randLowNumText1 = str(randLowNum2);
}

/*
1. A "multi-screen" program (can click between them, or use the keyboard to swap between them)
2. On one "screen", solve a math-based problem (not a game, cannot "solve boredom")
3. A non-Math-class problem to solve (not a game, cannot "solve boredom")
*/