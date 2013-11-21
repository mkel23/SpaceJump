// Author: Mike Kelly
// Date: December 7th, 2012
// 
// Class: Jumper - defines the type for the main jumper character
class Jumper{
  // Variables
  float xpos, ypos;
  float yvel; // Change in Y coordinate from the center of the Jumper
  color c; // Color of the Jumper
  int rad; // Radius of the circle when drawing the Jumper
  float checkyvel; // Initial gravity
  PImage jumperImg; // Jumper image
  
  // Constructor
  Jumper(float i_xpos, float i_ypos, float i_yvel, color i_c, int i_rad){
    this.xpos = i_xpos;
    this.ypos = i_ypos;
    this.yvel = i_yvel;
    this.checkyvel = i_yvel;
    this.c = i_c;
    this.rad = i_rad;
    jumperImg = loadImage("/src/img/Buzz.png"); // Load jumper image
  }
  
  
  
  /////////////
  // Methods //
  /////////////
  
  // Draw this Jumper on the screen as an ellipse
  void drawJumper(){
    fill(this.c);
    noStroke();
    image(jumperImg, this.xpos, this.ypos);
    //ellipse(this.xpos, this.ypos, this.rad*2, this.rad*2);
  }
  
  // Move the Jumper object to its position for the next frame
  void moveJumper(ArrayList pList){
    // Collision detection
    for(int i=pList.size()-1; i>=0 ; i--){
        Platform p = (Platform) pList.get(i);
        /*if(((this.xpos+rad/2) >= p.x1 && (this.xpos) <= p.x2) && abs(p.y1 - (this.ypos+rad)) < 3){
          yvel = -4;
          p.hit();
        }*/
        if(((this.xpos+jumperImg.width/2) >= p.x1 && (this.xpos+jumperImg.width/2) <= p.x2) && abs(p.y1 - (this.ypos+jumperImg.height)) < 3){
          yvel = -(checkyvel-1);
          p.hit();
        }        
      }
    
    // Update the position based on the velocity
    this.ypos += this.yvel;
    
    // Gravity, checks to make sure gravity is constant
    if(this.yvel < this.checkyvel){
      this.yvel += 0.1;
    }
    
    // If character goes off the right of the screen, continue to the left
    if(this.xpos > width){
      this.xpos = rad/2;
    }
    // If character goes off the left of the screen, continue on the right
    else if(this.xpos < 0){
      this.xpos = width - (rad/2);
    }
  }
  
  // Move the Jumper object a certain number of pixels in the x direction
  // Inputs:
  //    distance: float value of number of pixels to move
  void moveX(float distance){
    this.xpos = this.xpos + distance;
  }

  // @Return: this.yvel - the velocity of the Jumper object
  float getVel(){
    return this.yvel;
  }
  
  // @Return: this.ypos - the Y position of the center of the Jumper object
  float getHeight(){
    return this.ypos;
  }
  
}
