
class Alarm {
  float angle;
  int Hour=12, Minute=60, HourLength, MinuteLength;
  PVector offset, LilHand, BigHand, Mouse;


  Alarm() {
    HourLength = width/2-10;
    MinuteLength = width/4;
    offset = new PVector(width/2, height/2-17);
    LilHand = new PVector(sin(radians(360))*MinuteLength, cos(radians(360))*MinuteLength).add(offset);
    BigHand = new PVector(sin(radians(180))*HourLength, cos(radians(180))*HourLength).add(offset);
  }


  void render() {
    image(images[2], 0, 0, width, height);

    Mouse = new PVector(mouseX, mouseY);
    angle = atan(Mouse.copy().sub(offset).normalize().x/Mouse.copy().sub(offset).normalize().y)+PI;
    

    if (mousePressed && mouseButton  == LEFT && offset.dist(Mouse) < width/2 ) {
      if (LilHand.dist(Mouse)<BigHand.dist(Mouse)) {
            LilHand = new PVector(sin(angle)*MinuteLength, cos(angle)*MinuteLength).add(offset);
      } else {
            BigHand = new PVector(sin(angle)*HourLength, cos(angle)*HourLength).add(offset);
      }
      println("yes");
    }
    println(angle);




    stroke(255);
    strokeWeight(5);
    line(offset.x, offset.y, LilHand.x, LilHand.y);
    line(offset.x, offset.y, BigHand.x, BigHand.y);
  }
}
