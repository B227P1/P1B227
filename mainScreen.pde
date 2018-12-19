// Class for everything on the main screen
class MainScreen {
  boolean enter = true; // determines if the user has just entered this screen. This is needed so that the Wizard Lizard can praise the user, when they have over 10 stars (the praise happens when the user enters the screen)

  // draws the stars on the screen, based on how many stars the user has (variable "starCount")
  void setStarPositions() {
    int j = 0;
    int k = 0; // k is used to determine which row a star is. This is needed to make the stars stay in the window, by putting them in a new row, when there is 5 in one already. (this happens from line 12 to 15)
    for (int i = 0; i < starCount; i++) {
      shape(starShape, j*60+120, k*50+30, 30, 30);
      j++;
      if (j>5) {
        j = 0;
        k++;
      }
    }
  }  


  void render() {
    
    // draws the background image, the Wizard Lizard, and the hat that is currently equipped
    image(images[0], 0, 0, width, height);
    imageMode(CENTER);
    image(images[8], width*0.23, height*0.835, 275, 205);
    imageMode(CORNER);
    Customization.equipHat(width*-0.5, height*1.09, 0.6, -20);
    
    // when the user enters the screen, this checks if the user has at least 10 stars, and if they do, it makes the Wizard Lizard praise the user (by calling the showAdvice() function)
    if (enter && starCount>9) {
      showAdvice(width*0.496, height*0.583, 320, 200, 0, 45);
    }
    // turns "enter" back to false, so that the Wizard Lizard doesn't keep praising the user (which would essentially freeze the program, as showAdvice() uses noLoop() )
    if (enter) {
      enter = false;
    }
  }
}
