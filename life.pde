class Life{
  float lX;
  float lY;
  int lSize = 10;
  boolean gone = false;
  
  Life(float x, float y){
    lX = x;
    lY = y;
  }
  
  void display(){
  fill(255, 174, 185);
  rect(lX, lY, lSize, lSize);
  }
  
  void move(){
  }
}
  
