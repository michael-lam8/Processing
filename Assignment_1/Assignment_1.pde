// Michael Lam
// April 2018

// Look for NOTES before final submission.

// Importing Interfascia library
import interfascia.*;
GUIController c;
IFButton additionBtn, subtractionBtn, multiplicationBtn, divisionBtn, resetBtn, menuBtn, pong1Btn, pong2Btn;

// Declaring variables for math
int mathScore, keystroke, userCorrect, userIncorrect, userAnswer, selectedMode, operator, randNum1, randNum2, divNum;
String userInput = "", operatorText, randNumText1, randNumText2, divNumText;

// Declaring variables for Pong
boolean gameStart = false;
float ballX = 300, ballY = 200, speedX = random(3, 5), speedY = random(3, 5);
int pongScore = 0, pongScore2 = 0, rightPaddleSize = 150, leftPaddleY, rightPaddleY;

// Initial setup
void setup() {
  size(600, 600);
  PFont sfFont;
  sfFont = createFont("SanFranciscoDisplay-Semibold", 32, true);
  textFont(sfFont);
  textAlign(CENTER, CENTER);
  ellipseMode(CENTER);
  newMathQuestion();
  btnSetup();
}

// Interfascia button setup
void btnSetup() {
  c = new GUIController (this);
  menuBtn = new IFButton ("\nMain Menu", 0, 0, 100, 50);
  additionBtn = new IFButton ("Addition", 100, 0, 100, 25);
  subtractionBtn = new IFButton ("Subtraction", 200, 0, 100, 25);
  multiplicationBtn = new IFButton ("Multiplication", 300, 0, 100, 25);
  divisionBtn = new IFButton ("Division", 400, 0, 100, 25);
  resetBtn = new IFButton ("\nReset", 500, 0, 100, 50);
  pong1Btn = new IFButton ("1P Pong", 100, 25, 200, 25);
  pong2Btn = new IFButton ("2P Pong", 300, 25, 200, 25);

  additionBtn.addActionListener(this);
  subtractionBtn.addActionListener(this);
  multiplicationBtn.addActionListener(this);
  divisionBtn.addActionListener(this);
  resetBtn.addActionListener(this);
  menuBtn.addActionListener(this);
  pong1Btn.addActionListener(this);
  pong2Btn.addActionListener(this);

  c.add (additionBtn);
  c.add (subtractionBtn);
  c.add (multiplicationBtn);
  c.add (divisionBtn);
  c.add (resetBtn);
  c.add (menuBtn);
  c.add (pong1Btn);
  c.add (pong2Btn);
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
    runPong1();
  } else if (selectedMode == 6) {
    runPong2();
  } else if (selectedMode == 0) {
    // Returns to draw() when Main Menu button is clicked.
    surface.setTitle("Main Menu"); // Sets window title
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
    pongScore = 0;
  } else if (e.getSource() == pong1Btn) {
    selectedMode = 5;
  } else if (e.getSource() == pong2Btn) {
    selectedMode = 6;
  } else if (e.getSource() == menuBtn) {
    selectedMode = 0;
  }
}

// Addition game mode
void additionQuestion() {
  surface.setTitle("Addition");
  resetPong();
  pongScore = 0;
  background(255);
  text("Correct: " + userCorrect + " Incorrect: " + userIncorrect + " Score: " + mathScore, width/2, 500);
  userAnswer = int(userInput);
  operator = 1;
  text(randNumText1 + " + " + randNumText2 + " = " + userInput, width/2, 100);
}

// Subtraction game mode
void subtractionQuestion() {
  surface.setTitle("Subtraction");
  resetPong();
  pongScore = 0;
  background(255);
  text("Correct: " + userCorrect + " Incorrect: " + userIncorrect + " Score: " + mathScore, width/2, 500);
  userAnswer = int(userInput);
  operator = 2;
  text(divNum + " - " + randNum2 + " = " + userInput, width/2, 100);
}

// Multiplication game mode
void multiplicationQuestion() {
  surface.setTitle("Multiplication");
  resetPong();
  pongScore = 0;
  background(255);
  text("Correct: " + userCorrect + " Incorrect: " + userIncorrect + " Score: " + mathScore, width/2, 500);
  userAnswer = int(userInput);
  operator = 3;
  text(randNumText1 + " * " + randNumText2 + " = " + userInput, width/2, 100);
}

// Division game mode
void divisionQuestion() {
  surface.setTitle("Division");
  resetPong();
  pongScore = 0;
  background(255);
  text("Correct: " + userCorrect + " Incorrect: " + userIncorrect + " Score: " + mathScore, width/2, 500);
  userAnswer = int(userInput);
  operator = 4;
  text(divNum + " ÷ " + randNum2 + " = " + userInput, width/2, 100);
}

// Single player Pong
void runPong1() {
  surface.setTitle("1P Pong");
  background(37);
  fill(37);
  stroke(255);
  rect(-1, 50, 601, 550); // Displays top border to leave room for buttons
  fill(250);
  text("Score: 0", width/2, 100);
  text("Click to begin.", width/2, height/2-20);
  text("Move the paddle with the mouse.", width/2, height/2+20);
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
    ballX += speedX;
    ballY += speedY;

    if (ballX > width-30 && ballY < mouseY+rightPaddleSize/2 && ballY > mouseY-rightPaddleSize/2) { // Rebounces wall when right paddle is hit
      speedX *= -1;
      ballX += speedX;
      rightPaddleSize -= 10;
      rightPaddleSize = constrain(rightPaddleSize, 50, 150);
      pongScore += 1;
    } else if (ballX < 20) { // Rebounces ball when left wall is hit
      speedX *= -1.05;
      ballX += speedX;
    } else if (ballY > height || ballY < 60) { // Rebounces ball when top/bottom is hit
      speedY *= -1;
      ballY += speedY;
    } else if (ballX > width) { // Resets game if ball passes right paddle
      resetPong();
      pongScore = 0;
    }
  }
}

// Two player Pong
void runPong2() {
  surface.setTitle("2P Pong");
  background(37);
  fill(37);
  stroke(255);
  rect(-1, 50, 601, 550); // Displays top border to leave room for buttons
  fill(250);
  text(pongScore2, 150, 100);
  text(pongScore, width-150, 100);
  text("Click to begin.", width/2, height/2-40);
  text("Left player moves with W and S.", width/2, height/2);
  text("Right player moves with ↑ and ↓.", width/2, height/2+40);
  fill(250);
  ellipse(ballX, ballY, 20, 20);
  rect(20, height/2-75, 10, 150);
  rect(width-30, height/2-75, 10, 150);

  // For some reason only works when set within this function
  leftPaddleY = height/2-75;
  rightPaddleY = height/2-75;

  if (gameStart == true) {
    // Clears text and allows paddle movement
    fill(37);
    stroke(255);
    rect(-1, 50, 601, 550);
    fill(250);
    text(pongScore2, 150, 100);
    text(pongScore, width-150, 100);
    ellipse(ballX, ballY, 20, 20);
    rect(20, leftPaddleY, 10, 150);
    leftPaddleY = constrain(leftPaddleY, 50, height-150);
    rect(width-30, rightPaddleY, 10, 150);
    rightPaddleY = constrain(rightPaddleY, 50, height-150);

    // Initializes ball movement
    ballX += speedX;
    ballY += speedY;

    if (ballX > width-30 && ballY > rightPaddleY && ballY < rightPaddleY+150 || ballX < 30 && ballY > leftPaddleY && ballY < leftPaddleY+150) { // Rebounces wall when paddle is hit
      speedX *= -1.05;
      ballX += speedX;
    } else if (ballY > height || ballY < 60) { // Rebounces ball when top/bottom is hit
      speedY *= -1;
      ballY += speedY;
    } else if (ballX > width) { // Resets setup and awards point to left player
      resetPong();
      pongScore2 += 1;
    } else if (ballX < 0) { // Resets setup and awards point to right player
      resetPong();
      pongScore += 1;
    }
  }
}

// Resets Pong setup
void resetPong() {
  gameStart = false;
  ballX = 300;
  ballY = 200;
  speedX = random(3, 5);
  speedY = random(3, 5);
  rightPaddleSize = 150;
  leftPaddleY = height/2-75;
  rightPaddleY = height/2-75;
}

// Starts game when mouse is pressed
void mousePressed() {
  // Starts game only when Pong is active and mouse is within game area
  if (selectedMode == 5 || selectedMode == 6 && mouseY > 50) {
    gameStart = true;
  }
}

// Keyboard input
void keyPressed() {
  // Allows only numbers to be inputted in math modes
  if (selectedMode < 5 && selectedMode > 0) {
    keystroke = int(key);
    keystroke = keystroke - 48;
    if (keystroke >= 0 && keystroke <= 9) {
      userInput += key;
    } else if (key == BACKSPACE) { // Deletes characters when backspace is pressed
      userInput = userInput.substring(0, max(0, userInput.length()-1));
    } else if (key == RETURN || key == ENTER) { // Checks answer when enter is pressed
      checkAnswer();
    }
  } else if (selectedMode == 6 && gameStart == true) { // Allows simultaneous controls when 2P Pong is active
    if (key == 'w') {
      leftPaddleY -= 20;
    } else if (key == 's') {
      leftPaddleY += 20;
    } else if (keyCode == UP) {
      rightPaddleY -= 20;
    } else if (keyCode == DOWN) {
      rightPaddleY += 20;
    }
  }
}

void checkAnswer() {
  if (operator == 1) {
    if (userAnswer == randNum1 + randNum2) {
      correctAnswer();
    } else {
      incorrectAnswer();
    }
  }
  if (operator == 2) {
    if (userAnswer == divNum - randNum2) {
      correctAnswer();
    } else {
      incorrectAnswer();
    }
  }
  if (operator == 3) {
    if (userAnswer == randNum1 * randNum2) {
      correctAnswer();
    } else {
      incorrectAnswer();
    }
  }
  if (operator == 4) {
    if (userAnswer == divNum / randNum2) {
      correctAnswer();
    } else {
      incorrectAnswer();
    }
  }
}

// Runs code if user's answer is correct
void correctAnswer() {
  mathScore += 10;
  userCorrect += 1;
  userInput = "";
  newMathQuestion();
}

// Runs code if user's answer is incorrect
void incorrectAnswer() {
  if (mathScore > 0) {
    mathScore -= 10;
  }
  userIncorrect += 1;
  userInput = "";
  newMathQuestion();
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