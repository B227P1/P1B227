// Class for everything on the main screen

class MainScreen {
  //int starCount; might delete
  String adviceText;  


  void setStarPositions() {
    for (int i = 0; i < starCount; i++) {
      shape(starShape, i*50+50, 30, 30, 30);
    }
  }  


  void render() {
    image(images[0], 0, 0, width, height);
    //text(adviceText,0,0);
    //println(isLizardHovered(),width/2,height/2);
    imageMode(CENTER);
    image(images[8],width/4,height/6*5,245,175);
    imageMode(CORNER);
    
  }
  
  
  boolean isLizardHovered() {
    if (dist(mouseX, mouseY, width/4, height/6*4.5)<50) { //placeholder values
      return true;
    } else {
      return false;
    }
  }
}
