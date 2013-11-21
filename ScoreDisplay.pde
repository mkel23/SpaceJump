// Author: Mike Kelly
// Date: December 7th, 2012
//
// Class: ScoreDisplay - shows the score based on height
class ScoreDisplay{
  // Variables
  int score;
  
  // Constructor
  ScoreDisplay(){
    this.score = 0;
  }
  
  
  /////////////
  // Methods //
  /////////////
  
  // Draws the score on the screen
  void drawScore(){
    fill(255);
    textAlign(RIGHT);
    // Upper-right-hand corner
    text(score, width-5, 20);
  }
  
  // Updates the score based on height
  void updateScore(Jumper j){
    if(int(j1.getVel()) < 0){
      this.score += int(-j1.getVel())*2;
    }
  }
  
  // @Return: this.score - the current score of the jumper
  int getScore(){
    return this.score;
  }
}
