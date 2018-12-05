//Custom function to create text depending on how wide i want it instead of just font size
class MCLabel {
  color textColor = color (0);
  String Text = "Sample Text"; 
  PVector start = new PVector(width/2, height*0.1), size = new PVector(width, height*0.2);
  int textsize = 1;

  void render() {
    textAlign(CENTER, CENTER);
    fill(textColor);

    textsize = 1;
    textSize(textsize);
    while (textWidth(Text)/2<size.x && ((textDescent()+textAscent())/2<size.y)) {
      textsize++;
      textSize(textsize);
    }

    textSize(textsize-1);
    fill(textColor);
    text(Text, start.x, start.y);
  }
}
