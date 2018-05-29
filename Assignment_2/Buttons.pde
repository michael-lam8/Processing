class Buttons {
  int x, y;
  String buttonText;
  
  Buttons(int tempX, int tempY, String tempText) {
    x = tempX;
    y = tempY;
    buttonText = tempText;
  }

  void draw() {
    fill(255, 110);
    rect(x, y, 200, 60, 12);
    fill(255);
    text(buttonText, x, y);
  }
}