// Michael Lam
// April 23, 2018
// Assignment 1: A program containing math equations for user to solve and Pong

// Last updated May 26, 2018
// - Removed Interfascia library
// - Changed "Pong - Multiplayer" to "Pong - Two Players" for clarification

class Exercise_B8 {
  // Declaring variables for math
  int mathScore, keystroke, userCorrect, userIncorrect, userAnswer, selectedMode, operator, randNum1 = (int) random(1, 30), randNum2 = (int) random(20), divNum = randNum1 * randNum2;
  String userInput = "", operatorText = str(operator), randNumText1 = str(randNum1), randNumText2 = str(randNum2), divNumText;

  // Declaring variables for Pong
  boolean gameStart = false;
  float ballX = 300, ballY = 200, speedX = random(3, 5), speedY = random(3, 5);
  int pongScore = 0, pongScore2 = 0, rightPaddleSize = 150, leftPaddleY = 225, rightPaddleY = 225;

  // Main menu
  void draw() {
    textSize(16);
    textFont(sfFont);
    rectMode(CORNER);
    textAlign(CENTER, CENTER);
    ellipseMode(CENTER);
    noStroke();
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
      runPong1P();
    } else if (selectedMode == 6) {
      runPong2P();
    } else if (selectedMode == 0) {
      // Returns to draw() when Main Menu button is clicked.
    }
    displayNavBtn();
  }

  // Displays navigation buttons at top of screen
  void displayNavBtn() {
    textSize(7);
    stroke(186);
    fill(245);
    rect(0, 0, 100, 50);
    rect(100, 0, 100, 25);
    rect(200, 0, 100, 25);
    rect(300, 0, 100, 25);
    rect(400, 0, 100, 25);
    rect(500, 0, 100, 50);
    rect(100, 25, 200, 25);
    rect(300, 25, 200, 25);
    fill(0);
    text("Main Menu", 50, 25);
    text("Addition", 150, 12.5);
    text("Subtraction", 250, 12.5);
    text("Multiplication", 350, 12.5);
    text("Division", 450, 12.5);
    text("Reset", 550, 25);
    text("Pong - Single Player", 200, 37.5);
    text("Pong - Two Players", 400, 37.5);
    textSize(16);
  }

  // Addition game mode
  void additionQuestion() {
    resetPong();
    pongScore = 0;
    background(255);
    text("Score: " + mathScore, width/2, 480);
    text("Correct: " + userCorrect + "   Incorrect: " + userIncorrect, width/2, 520);
    userAnswer = int(userInput);
    operator = 1;
    text(randNumText1 + " + " + randNumText2 + " = " + userInput, width/2, height/2);
  }

  // Subtraction game mode
  void subtractionQuestion() {
    resetPong();
    pongScore = 0;
    background(255);
    text("Score: " + mathScore, width/2, 480);
    text("Correct: " + userCorrect + "   Incorrect: " + userIncorrect, width/2, 520);
    userAnswer = int(userInput);
    operator = 2;
    text(divNum + " - " + randNum2 + " = " + userInput, width/2, height/2);
  }

  // Multiplication game mode
  void multiplicationQuestion() {
    resetPong();
    pongScore = 0;
    background(255);
    text("Score: " + mathScore, width/2, 480);
    text("Correct: " + userCorrect + "   Incorrect: " + userIncorrect, width/2, 520);
    userAnswer = int(userInput);
    operator = 3;
    text(randNumText1 + " * " + randNumText2 + " = " + userInput, width/2, height/2);
  }

  // Division game mode
  void divisionQuestion() {
    resetPong();
    pongScore = 0;
    background(255);
    text("Score: " + mathScore, width/2, 480);
    text("Correct: " + userCorrect + "   Incorrect: " + userIncorrect, width/2, 520);
    userAnswer = int(userInput);
    operator = 4;
    text(divNum + " ÷ " + randNum2 + " = " + userInput, width/2, height/2);
  }

  // Single player Pong
  void runPong1P() {
    background(37);
    fill(37);
    rect(-1, 50, 601, 550); // Displays top border to leave room for buttons
    fill(250);
    text("Score: 0", width/2, 100);
    text("Click to start.", width/2, height/2-20);
    text("Move the paddle with the mouse.", width/2, height/2+20);
    fill(250);
    ellipse(ballX, ballY, 20, 20);
    rect(0, 50, 10, 550);
    rect(width-30, 225, 10, rightPaddleSize);

    if (gameStart == true) {
      // Clears text and allows paddle movement
      fill(37);
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
  void runPong2P() {
    background(37);
    fill(250);
    text(pongScore, width-150, 100);
    text(pongScore2, 150, 100);
    text("Click to start.", width/2, height/2-40);
    text("Left player moves with W and S.", width/2, height/2);
    text("Right player moves with arrow keys.", width/2, height/2+40);
    fill(250);
    ellipse(ballX, ballY, 20, 20);
    rect(20, 225, 10, 150);
    rect(width-30, 225, 10, 150);

    if (gameStart == true) {
      // Clears text and allows paddle movement
      fill(37);
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
    leftPaddleY = 225;
    rightPaddleY = 225;
  }

  // Checks user answer, then runs corresponding code
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

  // Creates new integers when user answers or manually resets game
  void newMathQuestion() {
    randNum1 = (int) random(1, 30);
    randNum2 = (int) random(20);
    operatorText = str(operator);
    randNumText1 = str(randNum1);
    randNumText2 = str(randNum2);
    divNum = randNum1 * randNum2;
  }

  // Resets everything when Reset button is clicked
  void resetAll() {
    newMathQuestion();
    mathScore = 0;
    userCorrect = 0;
    userIncorrect = 0;
    userInput = "";
    resetPong();
    pongScore = 0;
  }

  void mouseClicked() {
    if (mouseX > 0 && mouseX < 100 && mouseY > 0 && mouseY < 50) {
      selectedMode = 0;
    } else if (mouseX > 100 && mouseX < 200 && mouseY > 0 && mouseY < 25) {
      selectedMode = 1;
    } else if (mouseX > 200 && mouseX < 300 && mouseY > 0 && mouseY < 25) {
      selectedMode = 2;
    } else if (mouseX > 300 && mouseX < 400 && mouseY > 0 && mouseY < 25) {
      selectedMode = 3;
    } else if (mouseX > 400 && mouseX < 500 && mouseY > 0 && mouseY < 25) {
      selectedMode = 4;
    } else if (mouseX > 500 && mouseX < 600 && mouseY > 0 && mouseY < 50) {
      resetAll();
    } else if (mouseX > 100 && mouseX < 300 && mouseY > 25 && mouseY < 50) {
      selectedMode = 5;
    } else if (mouseX > 300 && mouseX < 500 && mouseY > 25 && mouseY < 50) {
      selectedMode = 6;
    }
    // Starts game only when Pong screen is active and mouse is within game area
    if (selectedMode == 5 & mouseY > 50 || selectedMode == 6 && mouseY > 50) {
      gameStart = true;
    }
  }

  void keyPressed() {
    if (selectedMode < 5 && selectedMode > 0) { // Allows only numbers to be inputted in math modes
      keystroke = int(key);
      keystroke = keystroke - 48;
      if (keystroke >= 0 && keystroke <= 9) {
        userInput += key;
      } else if (key == BACKSPACE) { // Deletes characters when backspace is pressed
        userInput = userInput.substring(0, max(0, userInput.length()-1));
      } else if (key == RETURN || key == ENTER) { // Checks answer when enter is pressed
        checkAnswer();
      }
    } else if (selectedMode == 6 && gameStart == true) { // Allows controls for two players when 2P Pong is active
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
}