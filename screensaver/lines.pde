class Lines {
  float xpos;
  float ypos;
  float strokeW;
  float lineLength;

  Lines(float tempX, float tempY, float tempStroke, float tempLength) {
    xpos = tempX;
    ypos = tempY;
    strokeW = tempStroke;
    lineLength = tempLength;
  }
  void display() {
    float i = random(100);
    strokeW = random(7);
    lineLength = random(1, 20);
    stroke(-frameCount*500);
    if (xpos > width || xpos < 0 || ypos > height || ypos < 0) {
      xpos = random(width);
      ypos = random(height);
    } else {
      if (i>75) {
        strokeWeight(strokeW);
        moveLeft(xpos, ypos, lineLength);
      } else if (i>50) {
        strokeWeight(strokeW);
        moveRight(xpos, ypos, lineLength);
      } else if (i>25) {
        strokeWeight(strokeW);
        moveUp(xpos, ypos, lineLength);
      } else if (i>0) {
        strokeWeight(strokeW);
        moveDown(xpos, ypos, lineLength);
      }
    }
  }

  void moveRight(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX+i, startY);
      xpos = startX+i;
      ypos = startY;
    }
  }
  void moveLeft(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX-i, startY);
      xpos = startX-i;
      ypos = startY;
    }
  }
  void moveUp(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX, startY-i);
      xpos = startX;
      ypos = startY-i;
    }
  }
  void moveDown(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX, startY+i);
      xpos = startX;
      ypos = startY+i;
    }
  }
  void moveUpRight(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX+i, startY-i);
      xpos = startX+i;
      ypos = startY-i;
    }
  }
}

