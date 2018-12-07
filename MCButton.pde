class MCButton { 
  Boolean ColorOnHover = false;
  color buttonColor = color(255), buttonAltColor = color(0);
  PVector start = new PVector(width/2, height/2), size = new PVector(200, 100);

  MCLabel Label = new MCLabel(); 

  // determines what happens when the curor is over the button
  boolean mouseHovered() {
    if (mouseX > start.x-size.x && mouseX < start.x+size.x && mouseY > start.y-size.y && mouseY < start.y+size.y) { 
      return true;
    } else {
      return false;
    }
  }

  // renders the button
  void render() {
    rectMode(RADIUS);
    if (mouseHovered() || !ColorOnHover) {
      fill(buttonColor);
    } else {
      fill(buttonAltColor);
    }

    rect(start.x, start.y, size.x, size.y);

    Label.start = start;
    Label.size = size;
    Label.render();
  }
}
