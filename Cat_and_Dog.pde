Cat cat;
Dog dog;
Bone[] bList;
Fish[] fList;

Bomb bomb;
Life clife;
Life dlife;
Big dBig;
Big cBig;
Small dSmall;
Small cSmall;

//Game Status
final int GAME_START   = 0;
final int GAME_RUN = 1;
final int GAME_PAUSE   = 2;
final int GAME_CAT_WIN     = 3;
final int GAME_DOG_WIN    = 4;
int status;      

int countBoneFrame;
int boneNum;
int countFishFrame;
int fishNum;

//cat life state
final int C_FOUR_LIFE = -1;
final int C_THREE_LIFE = 0;
final int C_TWO_LIFE   = 1;
final int C_ONE_LIFE   = 2;
final int C_NO_LIFE  = 3;
int CatlifeState;


//dog life state
final int D_FOUR_LIFE = -1;
final int D_THREE_LIFE = 0;
final int D_TWO_LIFE   = 1;
final int D_ONE_LIFE   = 2;
final int D_NO_LIFE  = 3;
int DoglifeState;



void setup(){
  
status = GAME_START;
  
size(640,480);
rectMode(CENTER);

cat = new Cat(width-20, height/2,3);
dog = new Dog(20, height/2,3);
bList = new Bone[30];
fList = new Fish[30];

bomb = new Bomb();
dlife = new Life(random(width/2),random(height));
clife = new Life(random(width/2,width),random(height));
dBig = new Big(random(width/2),random(height));
cBig = new Big(random(width/2,width),random(height));
dSmall = new Small(random(width/2),random(height));
cSmall = new Small(random(width/2,width),random(height));

reset();
}

void draw(){
background(50,50,50);
noStroke();

switch(status){
case GAME_START:
printTxt("Cat & Dog", "Press ENTER to Start ", 240, 60, 20 );
break;

case GAME_RUN:
background(50,50,50);
drawLine();

drawCatLife();
drawDogLife();

cat.display();
cat.move();

dog.display();
dog.move();

drawBone();
drawFish();

checkCatHit();
checkDogHit();

countBoneFrame+=4;
countFishFrame+=4;

//----------
bomb.display();
bomb.move();

dlife.display();
clife.display();

dBig.display();
cBig.display();

dSmall.display();
cSmall.display();
break;

case GAME_PAUSE:
printTxt("PAUSE", "Press ENTER to Resume", 240, 60, 20 );
break;

case GAME_CAT_WIN:
 printTxt("CAT WINS!", "goodbye pup", 240, 60, 20 );
break;

case GAME_DOG_WIN:
printTxt("DOG WINS", "see you kitty", 240, 60, 20 );
break;
}
}

void drawLine(){
  fill(108,123, 139);
  rect(width/2, height/2, 10, height);
}
//----------keypress_function----------//

void keyPressed() {
  shootBone(30);
  shootFish(30);
  statusCtrl();
  
    if (key == CODED ) {
      switch( keyCode )
      {
        case UP:
          cat.up = true;
          break;
          
        case DOWN:
           cat.down = true;
           break;
           
        case LEFT:
            cat.left = true;
            break;
            
        case RIGHT:
             cat.right = true;
             break;

     
    }}
   if(key == 'W' || key == 'w'){
       dog.up = true;
     }
     if(key == 'S' || key == 's'){
       dog.down = true;
     }
     if(key == 'A' || key == 'a'){
     dog.left = true;
     }
     if(key == 'D' || key == 'd'){
      dog.right = true;
     }
}
    


void keyReleased() {
  if (key == CODED) {
      switch( keyCode )
      {
        case UP:
          cat.up = false;
          break;
          
        case DOWN:
          cat.down = false;
          break;
          
        case LEFT:
          cat.left = false;
          break;
          
        case RIGHT:
          cat.right = false;
          break;
      }
  }
   if(key == 'W' || key == 'w'){
       dog.up = false;
     }
     if(key == 'S' || key == 's'){
       dog.down = false;
     }
     if(key == 'A' || key == 'a'){
     dog.left = false;
     }
     if(key == 'D' || key == 'd'){
      dog.right = false;
     }
}

//----------BONE------------//

void drawBone(){
  
  for (int i=0; i<bList.length-1; i++){
    Bone bone = bList[i];
    if(bone!=null && !bone.gone){
      bone.move();
      bone.display();
      if(bone.bY<0|| bone.bX>width||bone.bX<0){
        removeBone(bone);
      }
    }}}
      
void shootBone(int frame) {
  if ( key == '2' && countBoneFrame > frame) {
 bList[boneNum]= new Bone(dog.dogX, dog.dogY, 0, 3); 
      if (boneNum<bList.length-2) {
        boneNum+=1;
      } else {
        boneNum = 0;
      }
    }    
  if ( key == '1' && countBoneFrame > frame) {
      bList[boneNum  ]= new Bone(dog.dogX, dog.dogY, 0.0, 1.5);
      bList[boneNum+1]= new Bone(dog.dogX, dog.dogY, -0.5, 1.5);
      bList[boneNum+2]= new Bone(dog.dogX, dog.dogY, 0.5, 1.5); 
      if (boneNum<bList.length-6) {
        boneNum+=3;
      } else {
        boneNum = 0;
      }
    }
    countBoneFrame = 0;
  }

//-------FISH----------//
void drawFish(){
  
  for (int i=0; i<fList.length-1; i++){
    Fish fish = fList[i];
    if(fish!=null && !fish.gone){
      fish.move();
      fish.display();
      if(fish.fY<0|| fish.fX>width||fish.fX<0){
        removeFish(fish);
      }
    }}}
      
void shootFish(int frame) {
  if ( key == '.' && countFishFrame > frame) {
      fList[fishNum]= new Fish(cat.catX, cat.catY, 0, -3);
      if (fishNum<fList.length-2) {
        fishNum+=1;
      } else {
        fishNum = 0; 
    } 
    }
     if ( key == ',' && countFishFrame > frame) {
      fList[fishNum  ]= new Fish(cat.catX, cat.catY, 0, -1.5);
      fList[fishNum+1]= new Fish(cat.catX, cat.catY, -0.5, -1.5);
      fList[fishNum+2]= new Fish(cat.catX, cat.catY, 0.5, -1.5); 
      if (fishNum<fList.length-6) {
        fishNum+=3;
      } else {
        fishNum = 0;
      }
    countFishFrame = 0;
  }
}
//--------LIFE--------//
void drawDogLife() {
  fill(230, 74, 96);
  text("LIFE:", 33, 25);
  
int x = 78; 
int y = 21;
int spacing = 25; 
int endCircle = 128; 

switch (DoglifeState){
  case D_FOUR_LIFE:
   endCircle = 153;
   break;
  case D_THREE_LIFE:
   endCircle = 128;
   break;
  case D_TWO_LIFE:
   endCircle = 103;
   break;
  case D_ONE_LIFE:
   endCircle = 78;
   break;
  case D_NO_LIFE:
   endCircle = 0;
   status = GAME_CAT_WIN;
   break;
}

while(x <= endCircle) { 
rect(x, y ,10, 10); 
x = x + spacing; 
} 
}

void drawCatLife() {
  fill(219, 112, 147);
  text("LIFE:", 535-30, 463);
  
int x = 580-30; 
int y = 459;
int spacing = 25; 
int endCircle = 630-30; 

switch (CatlifeState){
  case C_FOUR_LIFE:
   endCircle = 655-30;
   break;
  case C_THREE_LIFE:
   endCircle = 630-30;
   break;
  case C_TWO_LIFE:
   endCircle = 605-30;
   break;
  case C_ONE_LIFE:
   endCircle = 580-30;
   break;
  case C_NO_LIFE:
   endCircle = 535-30;
   status = GAME_DOG_WIN;
   break;
}

while(x <= endCircle) { 
rect(x, y ,10, 10); 
x = x + spacing; 
} 
}
//-----CHECKHIT-------//
void checkCatHit() {
  
  int catSize = 25;
  for (int i=0; i<bList.length-1; i++) {
    Bone bone = bList[i];
    if (bone!= null && !bone.gone 
 
    && bList[i].bX <= cat.catX + catSize
    && bList[i].bX >= cat.catX - catSize 
    && bList[i].bY <= cat.catY + catSize 
    && bList[i].bY >= cat.catY - catSize  ) {

      removeBone(bList[i]);
      
      CatlifeState++;
    cat.catX = width-20;
    cat.catY = height/2;

    }
  }
    if(bomb!=null && !bomb.gone
  && bomb.mX <= cat.catX + catSize
  && bomb.mX >= cat.catX - catSize
  && bomb.mY <= cat.catY + catSize
  && bomb.mY >= cat.catY - catSize){
    
    removeBomb();
    
    CatlifeState++;
    cat.catX = width-20;
    cat.catY = height/2;
  }
  if(clife != null && !clife.gone
  && clife.lX <= cat.catX + catSize
  && clife.lX >= cat.catX - catSize
  && clife.lY <= cat.catY + catSize
  && clife.lY >= cat.catY - catSize){
    
    removeClife();
    
    CatlifeState--;
}
  if(cBig != null && !cBig.gone
  && cBig.bigX <= cat.catX + catSize
  && cBig.bigX >= cat.catX - catSize
  && cBig.bigY <= cat.catY + catSize
  && cBig.bigY >= cat.catY - catSize){
//------------------------------------------------chage size here   
cat.catW+=15;
removeCbig();

}
  if(cSmall != null && !cSmall.gone
  && cSmall.smallX <= cat.catX + catSize
  && cSmall.smallX >= cat.catX - catSize
  && cSmall.smallY <= cat.catY + catSize
  && cSmall.smallY >= cat.catY - catSize){
//------------------------------------------------chage size here  
cat.catW-=15;
removeCsmall();

}

}

void checkDogHit() {
  
  int dogSize = 25;
  for (int i=0; i<fList.length-1; i++) {
    Fish fish = fList[i];
    if (fish!= null && !fish.gone 
 
    && fList[i].fX <= dog.dogX + dogSize
    && fList[i].fX >= dog.dogX - dogSize 
    && fList[i].fY <= dog.dogY + dogSize 
    && fList[i].fY >= dog.dogY - dogSize  ) {

      removeFish(fList[i]);
      
      DoglifeState++;
      dog.dogX = 20;
      dog.dogY = height/2;

    }
  }
  
  if(bomb!=null && !bomb.gone
  && bomb.mX <= dog.dogX + dogSize
  && bomb.mX >= dog.dogX - dogSize
  && bomb.mY <= dog.dogY + dogSize
  && bomb.mY >= dog.dogY - dogSize){
    
    removeBomb();
    DoglifeState++;
     dog.dogX = 20;
     dog.dogY = height/2;
  }
    if(dlife != null && !dlife.gone
  && dlife.lX <= dog.dogX + dogSize
  && dlife.lX >= dog.dogX - dogSize
  && dlife.lY <= dog.dogY + dogSize
  && dlife.lY >= dog.dogY - dogSize){
    
    removeDlife();
    
    DoglifeState--;
}
  if(dBig != null && !dBig.gone
  && dBig.bigX <= dog.dogX + dogSize
  && dBig.bigX >= dog.dogX - dogSize
  && dBig.bigY <= dog.dogY + dogSize
  && dBig.bigY >= dog.dogY - dogSize){
//------------------------------------------------change size here 
dog.dogW+=15;

removeDbig();

}
  if(dSmall != null && !dSmall.gone
  && dSmall.smallX <= dog.dogX + dogSize
  && dSmall.smallX >= dog.dogX - dogSize
  && dSmall.smallY <= dog.dogY + dogSize
  && dSmall.smallY >= dog.dogY - dogSize){
//------------------------------------------------change size here
 dog.dogW-= 15;

removeDsmall();

}
}


//-------reset--------//

void reset() {
  for (int i=0; i<bList.length-1; i++) {
    bList[i] = null;
  }
  for (int i=0; i<fList.length-1; i++) {
    fList[i] = null;
  }
  
  countBoneFrame = 30;
  boneNum = 0;
  countFishFrame = 30;
  fishNum = 0;
}

//----remove stuff-----//
void removeBone(Bone obj) {
  obj.gone = true;
  obj.bX = 2000;
  obj.bY = 2000;
}

void removeFish(Fish obj) {
  obj.gone = true;
  obj.fX = 2000;
  obj.fY = 2000;
}

void removeBomb(){
 bomb.gone = true;
 bomb.state = 4;
}

void removeClife(){
clife.gone = true;
clife.lX = -1000;
clife.lY = -1000;
}
void removeDlife(){
dlife.gone = true;
dlife.lX = -1000;
dlife.lY = -1000;
}

void removeCbig(){
  cBig.gone = true;
  cBig.bigX = 1000;
  cBig.bigY = 1000;
}
void removeDbig(){
  dBig.gone = true;
  dBig.bigX = 1000;
  dBig.bigY = 1000;
}

void removeCsmall(){
  cSmall.gone = true;
  cSmall.smallX = 1000;
  cSmall.smallY = 1000;
}
void removeDsmall(){
  dSmall.gone = true;
  dSmall.smallX = 1000;
  dSmall.smallY = 1000;
}

void printTxt(String A, String B, int numOfY, int SizeA, int SizeB){

textAlign(CENTER);
fill(135, 206, 255);

textSize(SizeA); //60
text(A ,width/2, numOfY); //240

textSize(SizeB);//20
text(B, width/2, numOfY+40);

}

void statusCtrl() {
  if (key == ENTER) {
    switch(status) {

    case GAME_START:
      status = GAME_RUN;
      
      CatlifeState = C_THREE_LIFE;
      DoglifeState = D_THREE_LIFE;
      break;
    case GAME_RUN:
      status = GAME_PAUSE;
      break;
    case GAME_PAUSE:
      status = GAME_RUN;
      break;
    case GAME_DOG_WIN:
    reset();
     status=GAME_START;
     break;
     case GAME_CAT_WIN:
     status = GAME_START;
    break; 
    }
  }
}
