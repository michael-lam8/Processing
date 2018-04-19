// Michael Lam
// April 2018

// Look for NOTES before final submission.

// Importing Interfascia library
import interfascia.*;
GUIController c;
IFButton additionBtn, subtractionBtn, multiplicationBtn, divisionBtn, resetBtn, menuBtn, pongBtn;

// Declaring variables for math
int mathScore, keystroke, userCorrect, userIncorrect, userAnswer, selectedMode, operator, randNum1, randNum2, divNum;
String userInput = "", operatorText, randNumText1, randNumText2, divNumText;

// Declaring variables for Pong
boolean gameStart = false;
float ballX = 150, ballY = 150, speedX = random(3, 5), speedY = random(3, 5);
int pongScore = 0, leftPaddleSize = 150, rightPaddleSize = 150;

// Initial setup
void setup() {
  size(600, 600);
  PFont arialFont;
  arialFont = createFont("Arial", 32, true);
  textFont(arialFont);
  textAlign(CENTER, CENTER);
  ellipseMode(CENTER);
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
  pongBtn = new IFButton ("Pong", 510, 20, 80, 17);

  additionBtn.addActionListener(this);
  subtractionBtn.addActionListener(this);
  multiplicationBtn.addActionListener(this);
  divisionBtn.addActionListener(this);
  resetBtn.addActionListener(this);
  menuBtn.addActionListener(this);
  pongBtn.addActionListener(this);

  c.add (additionBtn);
  c.add (subtractionBtn);
  c.add (multiplicationBtn);
  c.add (divisionBtn);
  c.add (resetBtn);
  c.add (menuBtn);
  c.add (pongBtn);
}

// Main menu
void draw() {  
  background(255);
  fill(0);
  text("Welcome!", width/2, height/2-20);
  text("Select a game mode above.", width/2, height/2+20);
  if (selectedMode == 1) {
    additionQuestion();
  } else if (selectedMode == 2) {
    subtractionQuestion();
  } else if (selectedMode == 3) {
    multiplicationQuestion();
  } else if (selectedMode == 4) {
    divisionQuestion();
  } else if (selectedMode == 5) {
    runPong();
  } else if (selectedMode == 0) {
    // Returns to draw() when Main Menu button is clicked.
    surface.setTitle("Assignment 1 - Main Menu"); // Sets window title
  }
}

// Runs code when buttons are clicked
void actionPerformed (GUIEvent e) {
  if (e.getSource() == additionBtn) {
    selectedMode = 1;
  } else if (e.getSource() == subtractionBtn) {
    selectedMode = 2;
  } else if (e.getSource() == multiplicationBtn) {
    selectedMode = 3;
  } else if (e.getSource() == divisionBtn) {
    selectedMode = 4;
  } else if (e.getSource() == resetBtn) {
    newMathQuestion();
    mathScore = 0;
    userCorrect = 0;
    userIncorrect = 0;
    userInput = "";
    resetPong();
  } else if (e.getSource() == pongBtn) {
    selectedMode = 5;
  } else if (e.getSource() == menuBtn) {
    selectedMode = 0;
  }
}

// Addition game mode
void additionQuestion() {
  surface.setTitle("Assignment 1 - Addition");
  resetPong();
  background(255);
  text("Correct: " + userCorrect + " Incorrect: " + userIncorrect + " Score: " + mathScore, width/2, 500);
  userAnswer = int(userInput);
  operator = 1;
  text(randNumText1 + " + " + randNumText2 + " = " + userInput, width/2, 100);
}

// Subtraction game mode
void subtractionQuestion() {
  surface.setTitle("Assignment 1 - Subtraction");
  resetPong();
  background(255);
  text("Correct: " + userCorrect + " Incorrect: " + userIncorrect + " Score: " + mathScore, width/2, 500);
  userAnswer = int(userInput);
  operator = 2;
  text(divNum + " - " + randNum2 + " = " + userInput, width/2, 100);
}

// Multiplication game mode
void multiplicationQuestion() {
  surface.setTitle("Assignment 1 - Multiplication");
  resetPong();
  background(255);
  text("Correct: " + userCorrect + " Incorrect: " + userIncorrect + " Score: " + mathScore, width/2, 500);
  userAnswer = int(userInput);
  operator = 3;
  text(randNumText1 + " * " + randNumText2 + " = " + userInput, width/2, 100);
}

// Division game mode
void divisionQuestion() {
  surface.setTitle("Assignment 1 - Division");
  resetPong();
  background(255);
  text("Correct: " + userCorrect + " Incorrect: " + userIncorrect + " Score: " + mathScore, width/2, 500);
  userAnswer = int(userInput);
  operator = 4;
  text(divNum + " ÷ " + randNum2 + " = " + userInput, width/2, 100);
}

// Pong
void runPong() {
  surface.setTitle("Assignment 1 - Pong");
  background(37);
  fill(37);
  stroke(255);
  rect(-1, 50, 601, 550); // Displays top border to leave room for buttons
  fill(250);
  text("Score: 0", width/2, 100);
  text("Click to begin.", width/2, height/2);
  fill(250);
  ellipse(ballX, ballY, 20, 20);
  rect(0, 50, 10, 550);
  rect(width-30, height/2-75, 10, rightPaddleSize);

  if (gameStart == true) {
    // Clears text and allows paddle movement
    fill(37);
    stroke(255);
    rect(-1, 50, 601, 550);
    fill(250);
    text("Score: " + pongScore, width/2, 100);
    ellipse(ballX, ballY, 20, 20);
    rect(0, 50, 10, 550);
    rect(width-30, mouseY-rightPaddleSize/2, 10, rightPaddleSize);
    
    // Initializes ball movement
    ballX = ballX + speedX;
    ballY = ballY + speedY;

    if (ballX > width-30 && ballY < mouseY+rightPaddleSize/2 && ballY > mouseY-rightPaddleSize/2) { // Rebounces wall when right paddle is hit
      speedX *= -1;
      ballX += speedX;
      rightPaddleSize -= 10;
      rightPaddleSize = constrain(rightPaddleSize, 50, 150);
      pongScore += 1;
    } else if (ballX < 20) { // Rebounced ball when left wall is hit
      speedX *= -1.05;
      ballX += speedX;
    } else if (ballY > height || ballY < 60) { // Rebounces ball when top/bottom is hit
      speedY *= -1;
      ballY += speedY;
    } else if (ballX > width) { // Resets the game if ball passes right paddle
      resetPong();
    }
  }
}

void resetPong() {
  gameStart = false;
  ballX = 150;
  ballY = 150;
  speedX = random(3, 5);
  speedY = random(3, 5);
  pongScore = 0;
  rightPaddleSize = 150;
}

// Starts Pong when mouse is pressed
void mousePressed() {
  // Starts game only when Pong is displayed and mouse is within game area
  if (selectedMode == 5 && mouseY > 50) {
    gameStart = true;
  }
}

// Keyboard input
void keyPressed() {
  // Allows only for numbers to be inputted in math modes
  if (selectedMode < 5 && selectedMode > 0) {
    keystroke = int(key);
    keystroke = keystroke - 48;
    if (keystroke >= 0 && keystroke <= 9) {
      userInput += key;
    }
    if (key == BACKSPACE) { // Deletes characters when backspace is pressed
      userInput = userInput.substring(0, max(0, userInput.length()-1));
    }
    if (key == RETURN || key == ENTER) { // Checks answer when enter is pressed
      checkAnswer();
    }
  }
}

// NOTE: Add functionality to display correct answer, then change question
void checkAnswer() {
  if (operator == 1) {
    if (userAnswer == randNum1 + randNum2) {
      mathScore += 10;
      userCorrect += 1;
      userInput = "";
      newMathQuestion();
    } else {
      if (mathScore > 0) {
        mathScore -= 10;
      }
      userIncorrect += 1;
      userInput = "";
      newMathQuestion();
    }
  }
  if (operator == 2) {
    if (userAnswer == divNum - randNum2) {
      mathScore += 10;
      userCorrect += 1;
      userInput = "";
      newMathQuestion();
    } else {
      if (mathScore > 0) {
        mathScore -= 10;
      }
      userIncorrect += 1;
      userInput = "";
      newMathQuestion();
    }
  }
  if (operator == 3) {
    if (userAnswer == randNum1 * randNum2) {
      mathScore += 10;
      userCorrect += 1;
      userInput = "";
      newMathQuestion();
    } else {
      if (mathScore > 0) {
        mathScore -= 10;
      }
      userIncorrect += 1;
      userInput = "";
      newMathQuestion();
    }
  }
  if (operator == 4) {
    if (userAnswer == divNum / randNum2) {
      mathScore += 10;
      userCorrect += 1;
      userInput = "";
      newMathQuestion();
    } else {
      if (mathScore > 0) {
        mathScore -= 10;
      }
      userIncorrect += 1;
      userInput = "";
      newMathQuestion();
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