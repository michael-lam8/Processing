// Michael Lam, Vinay Meldrum
// May 1, 2018
// Randomly creates 50 points and draws it to the nearest wall

// Declaring variables
float[] xLines = new float[49];
float[] yLines = new float[49];
int top_bottom;

// Initial setup
void setup() {
  size(600, 600);
}

// Creates random point and draws a line to nearest wall
void draw() {
  xValues();
  yValues();
  decidingWall();
}

// Randomly creates a point along the x-axis
void xValues() {
  for (int i = 0; i < xLines.length; i++) {
    xLines[i] += (int)random(width);
  }
}

// Randomly creates a point along the y-axis
void yValues() {
  for (int i = 0; i < yLines.length; i++) {
    yLines[i] += (int)random(height);
  }
}

// Decides where closest wall is to point and draws a line accordingly
void decidingWall() {
  for (int i = 0; i < xLines.length; i++) {
    delay(10);
    top_bottom = (int)random(1, 2);
    if (yLines[i] < 300) {
      line(random(width), 0, xLines[i], yLines[i]);
    } else if (yLines[i] > 300) {
      line(random(width), 600, xLines[i], yLines[i]);
    } else if (yLines[i] == 300) {
      if (top_bottom == 1) {
        line(random(width), 0, xLines[i], yLines[i]);
      } else if (top_bottom == 2) {
        line(random(width), 600, xLines[i], yLines[i]);
      }
    }
  }
}