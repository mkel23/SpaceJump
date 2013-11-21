// Author: Mike Kelly
// Date: December 7th, 2012
//
// **NOTE** This code is not adapted from the sample code, it is mine.
// Dr. Liffiton has approved this code.
//
// SpaceJump, similar to DoodleJump
// Use the left and right arrow keys to control your Jumper
// Press 'space' to start playing, press 'r' at anytime to restart


// Declare objects globally
Jumper j1;
ScoreDisplay s;
boolean beginning;
PImage backImg, backOverImg; // Background images
ArrayList platforms;
boolean isHarder;

void setup(){
  size(400, 400);
  
  // Load background images
  backImg = loadImage("/src/img/background.png");
  backOverImg = loadImage("src/img/backgroundOver.png");
  
  background(backImg); // Sets background to the background image
  smooth(); // Turn smoothing on
  
  j1 = new Jumper(width/2, 10, 5.0, color(86, 185, 7), 10);
  
  platforms = new ArrayList();
  
  for(int i=1; i<=8; i++){
    createPlatform(height-(i*40)); // Space out the platforms in the beginning
  }
  
  s = new ScoreDisplay();
  
  beginning = true;
  isHarder = false;
}

void draw(){
  // Clear window
  background(backImg);
  
  // Draw jumper object on the screen
  j1.drawJumper();
  
  for(int i=platforms.size()-1; i>=0; i--){
    Platform p = (Platform) platforms.get(i);
    p.drawPlatform();
    p.updatePlatform(j1);
    // Platforms come in from the top of the screen
    if(p.y1>height-3){
      platforms.remove(i);
      createPlatform(-3);
    }
  }
  
  // Makes the game harder
  if(s.getScore() > 5000){
    harderLevel();
  }
  
  // Let the user get ready
  if(beginning == true){
    fill(255);
    textSize(18);
    textAlign(RIGHT);
    text("Press 'space' to play ", width/2, 3*height/4);
    PImage img = loadImage("/src/img/SJLogo.png");
    image(img, width/2+5, 280);
  }
  
  s.drawScore();
  
  // Update the jumper
  // Only once the user has pressed 'space' to play
  if(beginning == false){
    j1.moveJumper(platforms);
  }
  
  s.updateScore(j1);
  
  // If off the screen
  if(j1.getHeight() > height){
    gameOver();
  }
  
  // Controls: Right and Left arrow keys, move 5 pixels each
  if(beginning == false){
    if(keyPressed && keyCode == RIGHT){
      j1.moveX(5);
    }
    else if(keyPressed && keyCode == LEFT){
      j1.moveX(-5);
    }
  }
}

// Creates the amount of platforms specified
void createPlatform(int yval){
    int randx1 = int(random(width));
    while(randx1 >= width-80){
      randx1 = int(random(width)); // Makes sure that platforms are on the screen
    }
    float r, g, b;
    r = random(150, 200);
    g = random(80, 150);
    b = random(150, 200);
    Platform pnew = new Platform(randx1, randx1+80, yval, color(r, g, b));
    platforms.add(pnew);
}

void gameOver(){
  background(backOverImg);
  fill(255);
  textSize(24);
  textAlign(CENTER);
  text("GAME OVER!", width/2, height/2);
  textSize(16);
  text("Your score was " + s.getScore() + "!", width/2, height/2 + 40);
  textSize(14);
  textAlign(RIGHT);
  text("Press 'r' to replay", width-20, height-20);
}

// Increases difficulty of gameplay
void harderLevel(){
  if(isHarder == false){
    isHarder = true;
    for(int i=0; i<3; i++){
      platforms.remove(i);
    }
  }
}


// Replay the game
void keyPressed(){
  if(key == 'r' && j1.getHeight() > height){
    setup();
  }
  else if(key == ' '){
    beginning = false;
  }
}
