class Bone {

  float bX;
  float bY;
  float bSpeedX = 0;
  float bSpeedY = 0;
  int bSize = 3;
  boolean gone = false;


  Bone(float x, float y, float speedY, float speedX) {
    bX = x;
    bY = y;
    bSpeedY = speedY;
    bSpeedX = speedX;
  }

  void display() {
    fill(255, 255, 240);
    rect(bX, bY, bSize, bSize);
  }

  void move() {
    bY+=bSpeedY;
    bX+=bSpeedX;
  }
}

