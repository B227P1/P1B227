// Class for everything on the main screen

class MainScreen {
int starCount;
String adviceText;  
  
  
  void setStarCount(int starCount){
    this.starCount = starCount;
  }
  
  void changeAdviceText(String adviceText){
    this.adviceText = adviceText;
  }
  
  
  void render(){
    image(images[0],0,0,width,height);
   // text(adviceText,0,0);
    // TESTING PUSH
    }
  }
  
  
}

class Star {
  PVector position;
  
  void setPosition(PVector position){
    this.position = position;
  }
  
  
    
  
}
