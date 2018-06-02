// Michael Lam & Vinay Meldrum
// May 4, 2018
// Set B, Exercise 12: This program loads text files and displays a specified characteristics, such as its character count.

// Last updated May 15, 2018
// - Refactored code in preparation for Assignment 2
// - Bug fix: program no longer halts at start and displays all characteristics
// - All text files are now used simultaneously rather than being randomly chosen as per the instructions
// - Changed function names to match closer with variable names
// - Corrected spelling mistakes

// Declaring variables
String othelloChar, illiadChar, romeoChar, odysseyChar, hamletChar, macbethChar;
String[][] fileText = new String[6][];
int numberOfCapital, numberOfVowels, maxLetters, punctuationCount, amountOfWords, index;

// Initial setup
void setup() {
  // Loading files and converting them to one string
  fileText[0] = loadStrings("othello.txt");
  fileText[1] = loadStrings("illiad.txt");
  fileText[2] = loadStrings("romeoAndJuliet.txt");
  fileText[3] = loadStrings("theOdyssey.txt");
  fileText[4] = loadStrings("hamlet.txt");
  fileText[5] = loadStrings("macbeth.txt");
  othelloChar = join(fileText[0], "");
  illiadChar = join(fileText[1], "");
  romeoChar = join(fileText[2], "");
  odysseyChar = join(fileText[3], "\n");
  hamletChar = join(fileText[4], "");
  macbethChar = join(fileText[5], "").toLowerCase();

  background(0);
  size(600, 600);
  characterCount();
  capitalCharacters();
  vowels();
  wordCount();
  punctuation();
  mostUsedLetter();
}

// Not used in program
void draw() {
  noLoop();
}

// Determines the number of characters in othello.txt
void characterCount() {
  text("Number of characters in othello.txt: " + othelloChar.length() + " characters", 100, 200);
}

// Determines the amount of capital characters in illiad.txt
void capitalCharacters() {
  for (int i = 0; i < illiadChar.length(); i++) {
    char c = illiadChar.charAt(i);
    if (c >= 'A' && c <= 'Z') {
      numberOfCapital++;
    }
  }
  text("Number of capital letters in illiad.txt: " + numberOfCapital, 100, 250);
}


// Determines the amount of vowels in romeoAndJuliet.txt
void vowels() {
  for (int i = 0; i < romeoChar.length(); i++) {
    char c = romeoChar.charAt(i);
    if (c == 'a' || c == 'A' || c == 'e' || c == 'E' || c == 'i' || c == 'I' || c == 'o' || c == 'O' || c == 'u' || c == 'U') {
      numberOfVowels++;
    }
  }
  text("Number of vowels in romeoAndJuliet.txt: " + numberOfVowels, 100, 300);
}

// Determines the amount of words in theOdyssey.txt
void wordCount() {
  String[] odysseyWords = splitTokens(odysseyChar);
  amountOfWords = odysseyWords.length;
  text("Number of words in theOdyssey.txt: " + amountOfWords, 100, 350);
}

// Determines the amount of punctuation marks in hamlet.txt
void punctuation() {
  for (int i = 0; i < hamletChar.length(); i++) {
    char c = hamletChar.charAt(i);
    if (c == '\'' || c == ':' || c ==  ';' || c == '.' || c == ',' || c == '!' || c == '?') {
      punctuationCount++;
    }
  }
  text("Number of punctuation marks in hamlet.txt: " + punctuationCount, 100, 400);
}

// Determines the most frequently occurring letter in macbeth.txt
void mostUsedLetter() {
  char[] lowercaseArray = macbethChar.toCharArray();
  int[] allLetters = new int [26];
  for (int i = 0; i < lowercaseArray.length; i++) {
    if (lowercaseArray[i] >= 'a' && lowercaseArray[i] <='z') {
      // ASCII value. Subtract a from anything and you get the correct index. a - b = 1. a - a = 0.
      allLetters[lowercaseArray[i]-'a']++;
    }
  } // maxLetters, index
  for (int i = 0; i < allLetters.length; i++) {
    if (allLetters[i] > maxLetters) {
      maxLetters = allLetters[i];
      index = i;
    }
  }
  char mostOccurringLetter = char('a' + index);
  text("Most occurring letter in macbeth.txt: " + mostOccurringLetter + " has occured " + maxLetters + " times.", 100, 450);
}