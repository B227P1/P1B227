// Class for everything on the main screen

class MainScreen {
  //int starCount; might delete
  String adviceText;  


  void setStarPositions() {
    int j = 0;
    int k = 0;
    for (int i = 0; i < starCount; i++) {
      shape(starShape, j*50+50,k*50+30, 30, 30);
      j++;
      if(j>7){
        j = 0;
        k++;
      }
    }
  }  


  void render() {
    image(images[0], 0, 0, width, height);
    //text(adviceText,0,0);
    //println(isLizardHovered(),width/2,height/2);
    imageMode(CENTER);
    image(images[8],width*0.23,height*0.835,275,205);
    imageMode(CORNER);
    
    Customization.equipHat(width*-0.5,height*1.09,0.6,-20);
  }
  
  
  boolean isLizardHovered() {
    if (dist(mouseX, mouseY, width/4, height/6*4.5)<50) { //placeholder values
      return true;
    } else {
      return false;
    }
  }
}
