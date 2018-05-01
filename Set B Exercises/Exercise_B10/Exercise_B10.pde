String sentence = "Whatever you put here, it must always be school appropriate.";
String sentenceLength = sentence;
String[] sentenceArray = new String[sentenceLength.length()];
int numberOfCapital;

void setup() {
  size(600, 600);
  lengthOfSentence();
  initializingSentenceArray();
  capitalLetters();
}

void draw() {
  text(sentence, 100, 100);
  noLoop(); //draw doesn't need to happen for this exercise
}

void lengthOfSentence() {
  text("Length of the sentence: " + sentenceLength.length(), 100, 200);
}

void initializingSentenceArray() {
  for (int i = 0; i < sentence.length(); i++) {
    sentenceArray = (split(sentence, ' '));
  }
}
void capitalLetters() {
  for (int i = 0; i < sentenceArray.length; i++) {
    if (sentenceArray[i] == "(?=[A-Z])") {
      numberOfCapital++;
    }
  }
  text("Number of capital letters: " + numberOfCapital, 100, 300);
}


/* Using the above block of text as a starting point, create a program that displays the following:
 
 The length (in characters) of the sentence (e.g. 60 characters)
 The number of capital letters in the sentence (e.g. 1)
 The number of vowels in the sentence (always exclude 'y') (e.g. 20)
 The number of words in the sentence (e.g. 10)
 The number of punctuation marks in the sentence (count ', :, ;, ., ,, !, ? only) (e.g. 2)
 The most used letter in the sentence (e.g. e : 6)
 You can either have the answers printed to the screen using text() or to the console using println().
 */