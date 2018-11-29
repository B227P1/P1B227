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
    
    for(int i = 0; i<starCount; i++){
      int x = round(random(0,width));
      int y = round(random(0,height));
      image(images[6],x,y);
    }
  }
  
  
}

class Star {
  PVector position;
  
  void setPosition(PVector position){
    this.position = position;
  }
  
  
    
  
}
