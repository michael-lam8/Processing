// Michael Lam
// May 31, 2018
// This class sets program attributes, loads all files and creates class instances. The following code can be put in the setup function of Assignment_2.pde, but was separated due to its length to condense the code.

class ProgramSetup {
  void setup() {
    // Sets initial window title
    surface.setTitle("Assignment 2");
    
    // Sets object alignment
    textAlign(CENTER, CENTER);
    rectMode(CENTER);
    imageMode(CENTER);
    
    // Sets global font
    sfFont = createFont("SanFranciscoDisplay-Semibold.otf", 14, true);
    textFont(sfFont);
    
    // Loading images
    userAImg = loadImage("userA.png");
    userBImg = loadImage("userB.png");
    superUserImg = loadImage("superUser.png");
    backgroundImg = loadImage("background.png");
    returnImg = loadImage("return.png");
    enterImg = loadImage("enter.png");
    dropdownImg = loadImage("dropdown.png");
    cancelImg = loadImage("cancel.png");

    // Creates users and their password
    userLogin[0] = new Password(users[0], "Hello");
    userLogin[1] = new Password(users[1], "World!");
    userLogin[2] = new Password(users[2], "P@s$w0rd123");

    // Creates buttons for Exercises
    button[0] = new Buttons(175, 170, "Exercise 1");
    button[1] = new Buttons(420, 170, "Exercise 2");
    button[2] = new Buttons(175, 265, "Exercise 3");
    button[3] = new Buttons(420, 265, "Exercise 4");
    button[4] = new Buttons(175, 360, "Exercise 5");
    button[5] = new Buttons(420, 360, "Exercise 6");
    button[6] = new Buttons(300, 455, "Exercise 7");
    button[7] = new Buttons(175, 257, "Exercise 8");
    button[8] = new Buttons(420, 257, "Exercise 9");
    button[9] = new Buttons(175, 342, "Exercise 10/11");
    button[10] = new Buttons(420, 342, "Exercise 12");
  }
}