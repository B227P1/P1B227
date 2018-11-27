class MCButton {
  int textR = 255, textG = 255, textB = 255; 
  PVector start = new PVector(width/2, height/2), size = new PVector(200, 100);
  String Text;
  

  MCLabel Label = new MCLabel(); 

// sets the color of the text in the button
  void setTColor(int textR, int textG, int textB) {
    Label.setTColor(textR, textG, textB);
    render();
  }

// sets the text in the button
  void setText(String Text) {
    Label.setText(Text);
    this.Text = Text;
    render();
  } 

// sets the color of the button
  void setBColor(int textR, int textG, int textB) {
    this.textR = textR;
    this.textG = textG;
    this.textB = textB;
    render();
  }

// sets the position and the size of the button
  void setPosSize(PVector start, PVector size) {
    this.start = start;
    this.size = size;
    render();
  }

// determines what happens when the curor is over the button
  boolean mouseHovered() {
    if (mouseX > start.x-size.x && mouseX < start.x+size.x && mouseY > start.y-size.y && mouseY < start.y+size.y) {
      return true;
    }
    return false;
  }

// renders the button
  void render() {
    rectMode(RADIUS);
    fill(textR, textG, textB);

    rect(start.x, start.y, size.x, size.y);

    Label.setPosSize(start, size);
  }
}
