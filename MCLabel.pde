//Custom function to create text depending on how wide i want it instead of just font size
class MCLabel {
  //sets default values for label so its easier to playwith without getting an error
  color textColor = color (0);
  String Text = "Sample Text"; 
  PVector start = new PVector(width/2, height*0.1), size = new PVector(width, height*0.2); //start vector is where the center of the text should be and size is the size of the text in radius 
  int textsize; //declares for later use

  //Render functon that works like draw, if it gets called in draw it draws the class to the screen
  void render() {
    textAlign(CENTER, CENTER); //makes sure its set to the Double center setting for text
    fill(textColor); //sets the fill to the color of textColor

    textsize = 1; //resets the textsize
    textSize(textsize);
    while (textWidth(Text)*0.5<size.x && ((textDescent()+textAscent())*0.75<size.y)) { //keeps expanding the text till it overfills the height or width of the boudning box defined by the vector; size
      textsize++;
      textSize(textsize);
    } 

    textSize(textsize-1); //subtracts 1 to make sure its inside the box
    text(Text, start.x, start.y); //renders the text
  }
}
