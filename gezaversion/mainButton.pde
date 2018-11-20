class mainButton {
  int xpos,ypos;
  int bWidth,bHeight;
  String text;
  int textR, textG, textB;
  int buttR, buttG, buttB;
  
  
  void setBColor(int buttR, int buttG, int buttB){
    this.buttR = buttR;
    this.buttG = buttG;
    this.buttB = buttB;
  }
  
  void setTColor(int textR, int textG, int textB){
    this.textR = textR;
    this.textG = textG;
    this.textB = textB;
  }
  
  void setText(String text){
    this.text = text;
  }
  
  void display(){
    fill(buttR,buttG,buttB);
    rect(xpos,ypos,bWidth,bHeight,5);
    stroke(textR,textG,textB);
    text(text,xpos,ypos);
  }
}
    
