// Michael Lam
// March 2018

// Importing Interfascia library
import interfascia.*;
GUIController c;
IFButton additionBtn, subtractionBtn, multiplicationBtn, divisionBtn, resetBtn, menuBtn;

// Declaring variables
PFont arialFont;
int score, keystroke, userCorrect, userIncorrect, userAnswer, selectedQuestion, operator, randNum1, randNum2, divNum;
String userInput = "", operatorText, randNumText1, randNumText2, divNumText;

// Initial setup
void setup() {
  size(600, 600);
  arialFont = createFont("Arial", 32, true);
  newMathQuestion();
  btnSetup();
}

// Interfascia button setup
void btnSetup() {
  c = new GUIController (this);
  additionBtn = new IFButton ("Addition", 30, 20, 80, 17);
  subtractionBtn = new IFButton ("Subtraction", 110, 20, 80, 17);
  multiplicationBtn = new IFButton ("Multiplication", 190, 20, 80, 17);
  divisionBtn = new IFButton ("Division", 270, 20, 80, 17);
  resetBtn = new IFButton ("Reset", 350, 20, 80, 17);
  menuBtn = new IFButton ("Main Menu", 430, 20, 80, 17);

  additionBtn.addActionListener(this);
  subtractionBtn.addActionListener(this);
  multiplicationBtn.addActionListener(this);
  divisionBtn.addActionListener(this);
  resetBtn.addActionListener(this);
  menuBtn.addActionListener(this);
  
  c.add (additionBtn);
  c.add (subtractionBtn);
  c.add (multiplicationBtn);
  c.add (divisionBtn);
  c.add (resetBtn);
  c.add (menuBtn);
}

// Main menu
void draw() {
  surface.setTitle("Assignment 1 - Main Menu"); // Sets window title
  background(255);
  textFont(arialFont);
  textAlign(CENTER, CENTER);
  fill(0);
  text("Welcome!", width/2, height/2-20);
  text("Select a game mode above.", width/2, height/2+20);
  if (selectedQuestion == 1) {
    additionQuestion();
  } else if (selectedQuestion == 2) {
    subtractionQuestion();
  } else if (selectedQuestion == 3) {
    multiplicationQuestion();
  } else if (selectedQuestion == 4) {
    divisionQuestion();
  } else if (selectedQuestion == 0) { // May remove
    // Returns to draw() screen when Back button is clicked.
  }
}

// Runs code when buttons are clicked
void actionPerformed (GUIEvent e) {
  if (e.getSource() == additionBtn) {
    selectedQuestion = 1;
  } else if (e.getSource() == subtractionBtn) {
    selectedQuestion = 2;
  } else if (e.getSource() == multiplicationBtn) {
    selectedQuestion = 3;
  } else if (e.getSource() == divisionBtn) {
    selectedQuestion = 4;
  } else if (e.getSource() == resetBtn) {
    newMathQuestion();
    score = 0;
    userCorrect = 0;
    userIncorrect = 0;
    userInput = "";
  } else if (e.getSource() == menuBtn) {
    selectedQuestion = 0;
  }
}

// Addition game mode
void additionQuestion() {
  surface.setTitle("Assignment 1 - Addition");
  background(255);
  fill(0);
  //text("Correct: " + userCorrect + " Incorrect: " + userIncorrect + " Score: " + score, 100, 500);
  text("Correct: " + userCorrect + " Incorrect: " + userIncorrect + " Score: " + score, width/2, 500);
  userAnswer = int(userInput);
  operator = 1;
  text(randNumText1 + " + " + randNumText2 + " = " + userInput, width/2, 100);
}

// Subtraction game mode
void subtractionQuestion() {
  surface.setTitle("Assignment 1 - Subtraction");
  background(255);
  fill(0);
  text("Correct: " + userCorrect + " Incorrect: " + userIncorrect + " Score: " + score, width/2, 500);
  userAnswer = int(userInput);
  operator = 2;
  text(divNum + " - " + randNum2 + " = " + userInput, width/2, 100);
}

// Multiplication game mode
void multiplicationQuestion() {
  surface.setTitle("Assignment 1 - Multiplication");
  background(255);
  fill(0);
  text("Correct: " + userCorrect + " Incorrect: " + userIncorrect + " Score: " + score, width/2, 500);
  userAnswer = int(userInput);
  operator = 3;
  text(randNumText1 + " * " + randNumText2 + " = " + userInput, width/2, 100);
}

// Division game mode
void divisionQuestion() {
  surface.setTitle("Assignment 1 - Division");
  background(255);
  fill(0);
  text("Correct: " + userCorrect + " Incorrect: " + userIncorrect + " Score: " + score, width/2, 500);
  userAnswer = int(userInput);
  operator = 4;
  text(divNum + " ÷ " + randNum2 + " = " + userInput, width/2, 100);
}

// Allows for keyboard input
void keyPressed() {
  // Allows only for numbers to be inputted
  keystroke = int(key);
  keystroke = keystroke - 48;
  if (keystroke >= 0 && keystroke <= 9) {
    userInput += key;
  }
  if (key == BACKSPACE) { // Deletes characters when backspace is pressed
    if (userInput.length()>0) { // NOTE: Crashes when no text entered and backspaced
      userInput = userInput.substring(0, userInput.length()-2);
    }
  }
  if (key == RETURN || key == ENTER) { // Checks answer when enter is pressed
    checkAnswer();
  }
}

// NOTE: Add functionality to display correct answer, then change question
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
      // fill(0);
      // text("Correct answer: " + (randNum1 + randNum2), 100, 300);
      }
    }
  if (operator == 2) {
    if (userAnswer == divNum - randNum2) {
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
    if (userAnswer == divNum / randNum2) {
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

// Creates new integers
void newMathQuestion() {
  randNum1 = (int) random(1, 30);
  randNum2 = (int) random(20);
  operatorText = str(operator);
  randNumText1 = str(randNum1);
  randNumText2 = str(randNum2);
  divNum = randNum1 * randNum2;
}