class Fish {

  float fX;
  float fY;
  float fSpeedX = 0;
  float fSpeedY = 0;
  int fSize = 3;
  boolean gone = false;


  Fish(float x, float y, float speedY, float speedX) {
    fX = x;
    fY = y;
    fSpeedY = speedY;
    fSpeedX = speedX;
  }

  void display() {
    fill(0, 229, 238);
    rect(fX, fY, fSize, fSize);
  }

  void move() {
    fY+=fSpeedY;
    fX+=fSpeedX;
  }
}

