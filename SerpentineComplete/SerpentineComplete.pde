Serpent serpent;
Apple apple;
boolean isDead;
int score;

// Runs when the program is first launched
public void setup() {
  
  // Set the window size
  size(800, 800);
  
  reset();
 
 //remove borders 
 noStroke();
 
 frameRate(20); //<>//
}


// Runs repeatedly while the program is running
public void draw() { 
  background(51);

  if(!isDead) {
   isDead = serpent.isDead(); 
  }

  displayInstruction();
  
  apple.drawMe();
  serpent.drawMe();
 
  serpent.slither();
  
  if(serpent.eat(apple)) {
    score += 3;
    apple.spawnApple(serpent);
  } //<>//
}

public void reset() {
 score = 0;
 serpent = new Serpent();
 apple = new Apple(serpent);
 isDead = false;
}

// ==================================================
// Inputs
// ==================================================

public void keyPressed() { 
  if (key==TAB || key==ENTER) {
   reset(); 
  }
  if (key==CODED) {
    if (keyCode==UP && !serpent.isMoveY) {
      serpent.speedY = -20;
      serpent.speedX = 0;
    }
    if (keyCode==DOWN && !serpent.isMoveY) {
      serpent.speedY = 20;
      serpent.speedX = 0;
    }
    if (keyCode==LEFT && !serpent.isMoveX) {
      serpent.speedX = -20;
      serpent.speedY = 0;
    }
    if (keyCode==RIGHT && !serpent.isMoveX) {
      serpent.speedX = 20;
      serpent.speedY = 0;
    }
  }
}

public void displayInstruction() {
 textSize(32);
 fill(60, 150, 60);
 if(isDead) {
  textAlign(CENTER);
  text("Score: " + score, width / 2, (height / 2) - 25);
  text("Press  tab or enter to restart", width / 2, (height / 2) + 25);
 }
 else {
   textAlign(LEFT);
   text("Score: " + score, 10, 35);
 }
}
