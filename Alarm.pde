class Alarm {
  float angle;
  int  HourLength, MinuteLength;
  PVector offset, LilHand, BigHand, Mouse;
  MCLabel Digital;
  MCButton AmPm;
  MCButton OnOff;


  Alarm() {
    HourLength = width/2-10;
    MinuteLength = width/4;
    offset = new PVector(width/2, height/2-17);
    LilHand = new PVector(sin(radians(180))*MinuteLength, cos(radians(180))*MinuteLength).add(offset);
    BigHand = new PVector(sin(radians(180))*HourLength, cos(radians(180))*HourLength).add(offset);

    AmPm = new MCButton();
    AmPm.start = new PVector(width-50, 50);
    AmPm.size = new PVector(33, 33);
    AmPm.Label.Text = "Pm" ;
    AmPm.buttonColor = color(155, 155, 155, 30);
    AmPm.Label.textColor = color(255);
    AmPm.buttonOutlineColor = color(150);
    AmPm.buttonOutlineSize = 2;

    OnOff = new MCButton();
    OnOff.start = new PVector(width-50, height*0.80);
    OnOff.size = new PVector(33, 33);
    OnOff.Label.Text = "On" ;
    OnOff.buttonColor = color(155, 155, 155, 30);
    OnOff.Label.textColor = color(255);
    OnOff.buttonOutlineColor = color(150);
    OnOff.buttonOutlineSize = 2;


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
        alarmHour = (round(degrees(-angle+PI/2+PI)/360*12)+9)%12;
        alarmHour = alarmHour != 0 ? alarmHour : 12;
        if (AmPm.Label.Text == "Pm") {
          alarmHour+=12;
          alarmHour = alarmHour == 24 ? 0 : alarmHour;
        }
      } else {
        BigHand = new PVector(sin(angle)*HourLength, cos(angle)*HourLength).add(offset);
        alarmMinute = (round(degrees(-angle+PI/2+PI)/360*60)+45)%60;
      }
    }


    Digital.Text = (alarmHour<=9?"0":"")+str(alarmHour)+":"+(alarmMinute<=9?"0":"")+str(alarmMinute);


    stroke(255);
    strokeWeight(5);
    line(offset.x, offset.y, LilHand.x, LilHand.y);
    line(offset.x, offset.y, BigHand.x, BigHand.y);
    Digital.render();
    AmPm.render();
    OnOff.render();
  }
}
