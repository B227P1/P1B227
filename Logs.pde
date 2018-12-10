/*class Logs {
  PImage[] oldImg = new PImage[3];  
  byte[] oldInput = new byte[3];
  int inputState;

  Logs() {
    oldImg[0] = loadImage("2nd.png");
    oldImg[1] = loadImage("16th.png");
  }

  switch(inputState) {
  case 0:
    break;
  case 1:
    image(oldImg[0], width*0.19, height*0.51, 296, 298);
    break;
  case 2:
    image(oldImg[1], width*0.19, height*0.51, 296, 298);
    break;
  }

  void render() {
    image(images[4], 0, 0, width, height);
  }

  /* boolean 16thHovered() {
   if (mouseX>width*0.19 && mouseX<width*0.30 && mouseY>height*0.47 && mouseY<height*0.55 && appState == 5) {
   return true;
   } else {
   return false;
   }
   }
   
   boolean 2ndHovered() {
   if (mouseX>width*0.19 && mouseX<width*0.30 && mouseY>height*0.29 && mouseY<height*0.37 && appState ==5) {
   return true;
   } else {
   return false;
   }
   } */
