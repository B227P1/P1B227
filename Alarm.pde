class Alarm {
  float angle; //used to hold the angle the big and small hand should render at
  int  HourLength, MinuteLength; //used to determin the length of the clock hands
  PVector offset, LilHand, BigHand, Mouse; //is used to store the center of the screen, is used to store the small hands end point, is used to store the big hands end point, is used to store the mouse position
  //declares 1 label and 2 buttons
  MCLabel Digital;
  MCButton AmPm;
  MCButton OnOff;


  Alarm() {
    //initializes HourLength and Minute Length which is used for the clock hand lengths, offset is to get the center of the clock, big and lil hand is to get the end point posistion of the two hands
    HourLength = width/2-10;
    MinuteLength = width/4;
    offset = new PVector(width/2, height/2-17);
    LilHand = new PVector(sin(radians(180))*MinuteLength, cos(radians(180))*MinuteLength).add(offset);
    BigHand = new PVector(sin(radians(180))*HourLength, cos(radians(180))*HourLength).add(offset);

    //instantiates the AmPm as a new MCButton(); and sets the location and size of the object along with the text, button color, label sub class color, button Outline Color, and Button Outline size
    AmPm = new MCButton();
    AmPm.start = new PVector(width-50, 50);
    AmPm.size = new PVector(33, 33);
    AmPm.Label.Text = "Pm" ;
    AmPm.buttonColor = color(155, 155, 155, 30);
    AmPm.Label.textColor = color(255);
    AmPm.buttonOutlineColor = color(150);
    AmPm.buttonOutlineSize = 2;

    //instantiates the OnOff as a new MCButton(); and sets the location and size of the object along with the text, button color, label sub class color, button Outline Color, and Button Outline size
    OnOff = new MCButton();
    OnOff.start = new PVector(width-50, height*0.80);
    OnOff.size = new PVector(33, 33);
    OnOff.Label.Text = "On" ;
    OnOff.buttonColor = color(155, 155, 155, 30);
    OnOff.Label.textColor = color(255);
    OnOff.buttonOutlineColor = color(150);
    OnOff.buttonOutlineSize = 2;

    //instantiates the Digital as a new MCLabel(); and sets the location and size of the object along with the text and text color
    Digital = new MCLabel();
    Digital.textColor = color (255);
    Digital.start = new PVector(width/2, height*0.82);
    Digital.size = new PVector(width/10, height);
  }

  //Render functon that works like draw, if it gets called in draw it draws the class to the screen
  void render() {
    //static background is rendered
    image(images[2], 0, 0, width, height);

    //update the mouse vector position
    Mouse = new PVector(mouseX, mouseY);
    
    //get the angle of the mouse relative to offset using tangent
    angle = Mouse.copy().sub(offset).normalize().y < 0 ? atan(Mouse.copy().sub(offset).normalize().x/Mouse.copy().sub(offset).normalize().y)+PI : atan(Mouse.copy().sub(offset).normalize().x/Mouse.copy().sub(offset).normalize().y);

    //checks if the mouse is inside the clock and beeing pressed
    if (mousePressed && mouseButton  == LEFT && offset.dist(Mouse) < width/2 ) {
      if (LilHand.dist(Mouse)<BigHand.dist(Mouse)) { //checks which of the hand end points the mouse is closest to
        LilHand = new PVector(sin(angle)*MinuteLength, cos(angle)*MinuteLength).add(offset); //updates the end point position of the little hand
        alarmHour = (round(degrees(-angle+PI/2+PI)/360*12)+9)%12; //converts it from an angle to 12h 
        alarmHour = alarmHour != 0 ? alarmHour : 12; //makes it 12 insted of 0
        if (AmPm.Label.Text == "Pm") { //checks either pm is enabled
          alarmHour+=12; 
          alarmHour = alarmHour == 24 ? 0 : alarmHour; //makes it 00:00 insted of 24:00
        }
      } else {
        BigHand = new PVector(sin(angle)*HourLength, cos(angle)*HourLength).add(offset); //updates the end point position of the big hand
        alarmMinute = (round(degrees(-angle+PI/2+PI)/360*60)+45)%60; //converts it from an angle to 60m
      }
    }


    Digital.Text = (alarmHour<=9?"0":"")+str(alarmHour)+":"+(alarmMinute<=9?"0":"")+str(alarmMinute); //makes a string set up as HH:MM:SS to be drawn below the analog clock


    stroke(255);
    strokeWeight(5);
    line(offset.x, offset.y, LilHand.x, LilHand.y); //draws the lil hand
    line(offset.x, offset.y, BigHand.x, BigHand.y); //draws the big hand
    
    Digital.render(); //renders the digital clock below the analog clock
    AmPm.render(); //renders the Am Pm toggle button
    OnOff.render(); //renders the on of button for the alarm
  }
}
