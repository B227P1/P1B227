class MCButton {
  int textR = 255, textG = 255, textB = 255; 
  PVector start = new PVector(width/2, height/2), size = new PVector(200, 100);
  String Text;
  

  MCLabel Label = new MCLabel(); 

  void setTColor(int textR, int textG, int textB) {
    Label.setTColor(textR, textG, textB);
    render();
  }

  void setText(String Text) {
    Label.setText(Text);
    this.Text = Text;
    render();
  } 

  void setBColor(int textR, int textG, int textB) {
    this.textR = textR;
    this.textG = textG;
    this.textB = textB;
    render();
  }

  void setPosSize(PVector start, PVector size) {
    this.start = start;
    this.size = size;
    render();
  }

  boolean mouseHovered() {
    if (mouseX > start.x-size.x && mouseX < start.x+size.x && mouseY > start.y-size.y && mouseY < start.y+size.y) {
      return true;
    }
    return false;
  }

  void render() {
    rectMode(RADIUS);
    fill(textR, textG, textB);

    rect(start.x, start.y, size.x, size.y);

    Label.setPosSize(start, size);
  }
}
