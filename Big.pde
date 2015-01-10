class Big{
  float bigX;
  float bigY;
  int bigSize = 10;
  boolean gone = false;
  
  Big(float x, float y){
    bigX = x;
    bigY = y;
  }
  
  void display(){
  fill(205, 51, 51);
  ellipse(bigX, bigY, bigSize, bigSize);
  }
  
  void move(){
  }
}
  
