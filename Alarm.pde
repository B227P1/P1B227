
class Alarm {
  float angle;
  int Hour=12, Minute=60, HourLength, MinuteLength;
  PVector offset, LilHand, BigHand, Mouse;
  MCLabel Digital;
  MCButton AmPm;


  Alarm() {
    HourLength = width/2-10;
    MinuteLength = width/4;
    offset = new PVector(width/2, height/2-17);
    LilHand = new PVector(sin(radians(minute()/60*360))*MinuteLength, cos(radians(minute()/60*360))*MinuteLength).add(offset);
    BigHand = new PVector(sin(radians(hour()/12*360))*HourLength, cos(radians(hour()/12*360))*HourLength).add(offset);

    AmPm = new MCButton();
    AmPm.start = new PVector(width-50, 50);
    AmPm.size = new PVector(33, 33);
    AmPm.Label.Text = "Pm" ;


    Digital = new MCLabel();
    Digital.textColor = color (255);
    Digital.start = new PVector(width/2, height*0.82);
    Digital.size = new PVector(width/10, height);
  }


  void render() {
    image(images[2], 0, 0, width, height);

    Mouse = new PVector(mouseX, mouseY);
    angle = Mouse.copy().sub(offset).normalize().y < 0 ? atan(Mouse.copy().sub(offset).normalize().x/Mouse.copy().sub(offset).normalize().y)+PI : atan(Mouse.copy().sub(offset).normalize().x/Mouse.copy().sub(offset).normalize().y);


    if (mousePressed && mouseButton  == LEFT && offset.dist(Mouse) < width/2 ) {
      if (LilHand.dist(Mouse)<BigHand.dist(Mouse)) {
        LilHand = new PVector(sin(angle)*MinuteLength, cos(angle)*MinuteLength).add(offset);
        Hour = (round(degrees(-angle+PI/2+PI)/360*12)+9)%12;
        Hour = Hour != 0 ? Hour : 12;
        if (AmPm.Label.Text == "Pm") {
          Hour+=12;
        }
      } else {
        BigHand = new PVector(sin(angle)*HourLength, cos(angle)*HourLength).add(offset);
        Minute = (round(degrees(-angle+PI/2+PI)/360*60)+45)%60;
      }
    }




    Digital.Text = (Hour<=9?"0":"")+str(Hour)+":"+(Minute<=9?"0":"")+str(Minute);



    stroke(255);
    strokeWeight(5);
    line(offset.x, offset.y, LilHand.x, LilHand.y);
    line(offset.x, offset.y, BigHand.x, BigHand.y);
    Digital.render();
    AmPm.render();
  }
}
