//Custom function to create text depending on how wide i want it instead of just font size
class MCLabel {
  int textR = 0, textG = 0, textB = 0; 
  String Text = "Sample Text"; 
  PVector start = new PVector(width/2, height*0.1), size = new PVector(width, height*0.2);
  int textsize = 1;


  void setTColor(int textR, int textG, int textB) {
    this.textR = textR;
    this.textG = textG;
    this.textB = textB;
    render();
  }

  void setText(String Text) {
    this.Text = Text;
    render();
  } 

  void setPosSize(PVector start, PVector size) {
    this.start = start;
    this.size = size;
    render();
  }

  void render() {
    textAlign(CENTER, CENTER);
    fill(textR, textG, textB);

    textsize = 1;
    textSize(textsize);
    while (textWidth(Text)/2<size.x && ((textDescent()+textDescent())/2<size.y)) {
      textsize++;
      textSize(textsize);
    }

    textSize(textsize-1);
    fill(textR, textG, textB);
    text(Text, start.x, start.y);
  }
}
