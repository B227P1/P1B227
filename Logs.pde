class Logs {
  PImage[] oldImg = new PImage[2];  // stores the images used in this class
  int pageState = 0;

  Logs() { // loads the above mentioned images
    oldImg[0] = loadImage("2nd.png");
    oldImg[1] = loadImage("16th.png");
  }




  void render() {
    
    // draws the background, the Wizard Lizard, and the hat that is currently equipped
    image(images[4], 0, 0, width, height);
    image(images[8], width*-0.1, height*0.8, 255, 185);
    Customization.equipHat(width*-0.78, height*1.47, 0.5, -20);
    
    // draws the images of the two different days that can be checked out, based on the pageState (this is controlled in void mouseClicked())
    imageMode(CENTER);
    switch(pageState) {
    case 0:
      break;
    case 1:
      image(oldImg[0], width/2, height/2, 380, 380);
      break;
    case 2:
      image(oldImg[1], width/2, height/2, 380, 380);
      break;
    }
    imageMode(CORNER);
    
    // draws the "November" text on top of the calendar
    textAlign(CENTER);
    textSize(65);
    fill(200);
    text("November",width/2,width*0.35);
  }

  // the methods below determine if the cursor is hovered over either one of the interactive days (the 2nd and the 16th )
  boolean thHovered() {
    if (mouseX>width*0.19 && mouseX<width*0.30 && mouseY>height*0.47 && mouseY<height*0.55 && appState == 5) {
      return true;
    } else {
      return false;
    }
  }

  boolean ndHovered() {
    if (mouseX>width*0.19 && mouseX<width*0.30 && mouseY>height*0.29 && mouseY<height*0.37 && appState == 5) {
      return true;
    } else {
      return false;
    }
  }
}
