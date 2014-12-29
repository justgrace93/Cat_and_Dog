class Dog {
float dogX, dogY, dogW, dogInitX, dogInitY;
int speed;

//boolean keyboard move dog
boolean up;
boolean down;
boolean left;
boolean right;

int life;

Dog(int x, int y,  int l) {
  speed = 5;
  dogW = 25;
      
    this.dogX = x;
    this.dogY = y;
    life = l;
  } 

void display() {
fill(205, 133, 63);  
ellipse(dogX,dogY,dogW,dogW);   
  }

void move(){
   if( right ) {
         dogX += 5;
      }
       if( left ) {
         dogX -= 5;
      }
       if( up ) {
         dogY -= 5;
      }
       if (down) {
         dogY += 5;
      }
      
       if( dogY < dogW ){
          dogY = dogW;
        }
        else if( dogY > height-dogW ){
          dogY = height-dogW;
        }
        if( dogX > width/2-dogW/2-2 ){
          dogX = width/2-dogW/2-2;
        }
        else if( dogX < dogW ){
          dogX = dogW;
        }
  }

}
