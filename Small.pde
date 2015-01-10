class Small{
  float smallX;
  float smallY;
  int smallSize = 10;
  boolean gone = false;
  
  Small(float x, float y){
    smallX = x;
    smallY = y;
  }
  
  void display(){
  fill(255, 215, 0);
  ellipse(smallX, smallY, smallSize, smallSize);
  }
  
  void move(){
  }
}
  
