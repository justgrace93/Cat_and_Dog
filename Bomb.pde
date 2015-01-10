class Bomb{
  float mX;
  float mY;
  int bSpeed = 2;
  int bSize = 20;
  boolean gone = false;
  
  int state = 0;

 Bomb() {
    mX = width/2;
    mY = 50;
  }

  void display() {
    fill(255);
    rect(mX, mY, bSize, bSize);
  }

  void move() {
    
 if (state == 0) {
    mX = mX + bSpeed;

    if (mX > width-50) {
      mX = width-50;
      state = 1;
    }
  } else if (state == 1) {
    mY = mY + bSpeed;
    if (mY > height-50) {
      mY = height-50;
      state = 2;
    }
  } else if (state == 2) {
    mX = mX - bSpeed;
    if (mX < 50) {
      mX = 50;
      state = 3;
    }
  } else if (state == 3) {
    mY = mY - bSpeed;
    if (mY < 50) {
      mY = 50;
      state=0;
    }
  } else if (state ==4){
    mY = -1000;
    mX = -1000;
}

  }
}
