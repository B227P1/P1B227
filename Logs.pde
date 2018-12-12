class Logs {
  PImage[] oldImg = new PImage[3];  
  byte[] oldInput = new byte[3];
  int inputState = 0;

  Logs() {
    oldImg[0] = loadImage("2nd.png");
    oldImg[1] = loadImage("16th.png");
  }




  void render() {
    image(images[4], 0, 0, width, height);
    image(images[8], width*-0.1, height*0.8, 255, 185);
    Customization.equipHat(width*-0.78, height*1.47, 0.5, -20);
    imageMode(CENTER);
    switch(inputState) {
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
    textAlign(CENTER);
    textSize(65);
    fill(200);
    text("November",width/2,width*0.35);
  }


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
