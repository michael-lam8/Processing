// Michael Lam
// March 2018

// Importing Interfascia library
import interfascia.*;
GUIController c;
IFButton additionBtn, subtractionBtn, multiplicationBtn, divisionBtn, resetBtn;

// Declaring variables
PFont arialFont;
int score;
int keystroke;
int userCorrect;
int userIncorrect;
int userAnswer;
int selectedQuestion;
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
// Maybe add a main menu button
  additionBtn = new IFButton ("Addition", 30, 20, 80, 17);
  subtractionBtn = new IFButton ("Subtraction", 110, 20, 80, 17);
  multiplicationBtn = new IFButton ("Multiplication", 190, 20, 80, 17);
  divisionBtn = new IFButton ("Division", 270, 20, 80, 17);
  resetBtn = new IFButton ("Reset", 350, 20, 80, 17);

  additionBtn.addActionListener(this);
  subtractionBtn.addActionListener(this);
  multiplicationBtn.addActionListener(this);
  divisionBtn.addActionListener(this);
  resetBtn.addActionListener(this);
  c.add (additionBtn);
  c.add (subtractionBtn);
  c.add (multiplicationBtn);
  c.add (divisionBtn);
  c.add (resetBtn);
}

void draw() {
  background(255);
  textFont(arialFont);
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
  }
}

void additionQuestion() {
  background(255);
  fill(0);
  text("Correct: " + userCorrect + " Incorrect: " + userIncorrect + " Score: " + score, 100, 500);
  userAnswer = int(userInput);
  operator = 1;
  text(randNumText1 + " + " + randNumText2 + " = " + userInput, 100, 100);
  fill(255);
  rect(500, 500, 100, 100);
  if (mousePressed) {
    if (mouseX > 500 && mouseX < (500 + 100) && mouseY > 500 && mouseY < (500 + 100)) {
      selectedQuestion = 0;
    }
  }
}

void subtractionQuestion() {
  background(255);
  fill(0);
  text("Correct: " + userCorrect + " Incorrect: " + userIncorrect + " Score: " + score, 100, 500);
  userAnswer = int(userInput);
  operator = 2;
  text(randHighNumText1 + " - " + randLowNumText1 + " = " + userInput, 100, 100);
}

void multiplicationQuestion() {
  background(255);
  fill(0);
  text("Correct: " + userCorrect + " Incorrect: " + userIncorrect + " Score: " + score, 100, 500);
  userAnswer = int(userInput);
  operator = 3;
  text(randNumText1 + " * " + randNumText2 + " = " + userInput, 100, 100);
}

// Fix: this currently does remainder.
void divisionQuestion() {
  background(255);
  fill(0);
  text("Correct: " + userCorrect + " Incorrect: " + userIncorrect + " Score: " + score, 100, 500);
  userAnswer = int(userInput);
  operator = 4;
  text(randHighNumText1 + " % " + randLowNumText1 + " = " + userInput, 100, 100); // Broken
}

void keyPressed() {
  keystroke = int(key);
  keystroke = keystroke - 48;
  if (keystroke >= 0 && keystroke <= 9) {
    userInput += key;
  }
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