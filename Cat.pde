class Cat {
float catX, catY, catW, catInitX, catInitY;
int speed;

//boolean keyboard move cat
boolean up;
boolean down;
boolean left;
boolean right;

int life;


Cat(int x, int y,  int l) {
  speed = 5;
  catW = 25;
      
    this.catX = x;
    this.catY = y;
    life = l;
  } 

void display() {
fill(255, 165, 0);  
ellipse(catX,catY,catW,catW);   
  }

void move(){
   if( right ) {
         catX += 5;
      }
       if( left ) {
         catX -= 5;
      }
       if( up ) {
         catY -= 5;
      }
       if (down) {
         catY += 5;
      }
      
      //keep in range
      if( catY < catW ){
          catY = catW;
        }
        else if( catY > height-catW ){
          catY = height-catW;
        }
        if( catX < width/2+catW/2+2 ){
          catX = width/2+catW/2+2;
        }
        else if( catX > width-catW ){
          catX = width-catW;
        }
        
  }

}
