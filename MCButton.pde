class MCButton { 
  Boolean ColorOnHover = false; //boolean used to enable or disable the function of having it change color on mouse hover
  int buttonOutlineSize = 1; //sets the stroke width of the rectangle making up the button
  color buttonColor = color(255), buttonAltColor = color(0), buttonOutlineColor = color(150); //sets the default color for the button, button color on mouse hover, and the button stroke color of the rectangle making up the button
  PVector start = new PVector(width/2, height/2), size = new PVector(200, 100); //start vector is where the center of the button should be and size is the size of the button in radius 

  MCLabel Label = new MCLabel(); //instantiates a new MCLabel as Label for text on button

  // returns true when the curor is over the button
  boolean mouseHovered() {
    if (mouseX > start.x-size.x && mouseX < start.x+size.x && mouseY > start.y-size.y && mouseY < start.y+size.y) { 
      return true;
    } else {
      return false;
    }
  }

  //Render functon that works like draw, if it gets called in draw it draws the class to the screen
  void render() {
    rectMode(RADIUS); //makes sure the rect mode is set to radius 
    if (mouseHovered() || !ColorOnHover) { //checks if the button is hovered or the color on hover function should not be disabled 
      fill(buttonColor);
    } else {
      fill(buttonAltColor);
    }

    stroke(buttonOutlineColor); //sets outline color of the rectangle making up the button 
    strokeWeight(buttonOutlineSize); //sets outline gerth of the rectangle making up the button 

    rect(start.x, start.y, size.x, size.y); //draws the rectangle making up the button

    Label.start = start; //makes sure the button and label has the same start vector
    Label.size = size; //makes sure the button and label has the same size vector
    Label.render(); //renders the label on top of button
  }
}
