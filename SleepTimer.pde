class SleepTimer {
  MCButton StartStop;
  MCLabel SleepingFor;
  MCLabel TimeTilAlarm;


  SleepTimer() {
    StartStop = new MCButton();
    StartStop.start = new PVector(width/2, height*0.882);
    StartStop.size = new PVector(115, 30);
    StartStop.Label.Text = "Start" ;
    StartStop.buttonColor = color(0, 0, 0, 1);
    StartStop.Label.textColor = color(255);
    StartStop.buttonOutlineColor = color(255);
    StartStop.buttonOutlineSize = 0;



    SleepingFor = new MCLabel();
    SleepingFor.textColor = color (255);
    SleepingFor.start = new PVector(width/2, height*0.82);
    SleepingFor.size = new PVector(width/10, height);
    SleepingFor.Text = "ass";

    TimeTilAlarm = new MCLabel();
    TimeTilAlarm.textColor = color (255);
    TimeTilAlarm.start = new PVector(232, 362);
    TimeTilAlarm.size = new PVector(142, 45);
    TimeTilAlarm.Text = "ass";
  }


  void render() {
    image(images[3], 0, 0, width, height);


    StartStop.render();
    TimeTilAlarm.render();
    SleepingFor.render();
    println(mouseX,mouseY);
  }
}
