// Author: Mike Kelly
// Date: December 7th, 2012
// 
// Class: Platform - creates platforms for the Jumper to bounce off of
// Some code was adapted from our mini-golf game
class Platform{
  // Variables
  float x1, x2, y1;
  float yvel;
  color c, cur;
  
  
  // Constructor
  Platform(int i_x1, int i_x2, int i_y1, color i_c){
    this.x1 = i_x1;
    this.x2 = i_x2;
    this.y1 = i_y1;
    this.c = i_c;
    this.cur = i_c;
    this.yvel = 0;
  }
  
  
  /////////////
  // Methods //
  /////////////
  
  // Draws this platform on the screen
  void drawPlatform(){
    noFill();
    stroke(cur);
    strokeWeight(10);
    line(x1,y1,x2,y1);
    cur = lerpColor(cur, c, 0.1);
  }
  
  // Moves platform for next frame, based on Y-velocity of the Jumper object
  void updatePlatform(Jumper j){
    if(j.yvel <= 0){
      this.yvel = -j.yvel;
    }
    // When the Jumper goes down, do not continue to move the platform
    else if(j.yvel > 0){
      this.yvel = 0;
    }
    
    // Updates Y position based on its own Y velocity
    this.y1 += this.yvel;
  }
  
  // Flashes Platform when hit
  void hit(){
    this.cur = color(255);
  }
  
}
