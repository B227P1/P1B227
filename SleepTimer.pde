class SleepTimer {
  boolean PopUp = false;
  MCButton StartStop, Reset, ExitPopUp;
  MCLabel TimeTilAlarm, SleepingFor, PopUpText;


  SleepTimer() {
    StartStop = new MCButton();
    StartStop.start = new PVector(width/2, height*0.882);
    StartStop.size = new PVector(115, 30);
    StartStop.Label.Text = "Start";
    StartStop.buttonColor = color(0, 0, 0, 1);
    StartStop.Label.textColor = color(255);
    StartStop.buttonOutlineColor = color(255);
    StartStop.buttonOutlineSize = 0;

    Reset = new MCButton();
    Reset.start = new PVector(width/2, height*0.805);
    Reset.size = new PVector(40, 20);
    Reset.Label.Text = "Reset";
    Reset.buttonColor = color(0, 0, 0, 75);
    Reset.Label.textColor = color(255);
    Reset.buttonOutlineColor = color(150);
    Reset.buttonOutlineSize = 2;


    ExitPopUp = new MCButton();
    ExitPopUp.start = new PVector(width*0.75, 260);
    ExitPopUp.size = new PVector(33, 33);
    ExitPopUp.Label.Text = "X";
    ExitPopUp.buttonColor = color(255, 50, 50);
    ExitPopUp.Label.textColor = color(255);
    ExitPopUp.buttonOutlineColor = color(0);
    ExitPopUp.buttonOutlineSize = 2;


    SleepingFor = new MCLabel();
    SleepingFor.textColor = color (255);
    SleepingFor.start = new PVector(width/2, 362);
    SleepingFor.size = new PVector(142, 45);
    SleepingFor.Text = "N/A";


    TimeTilAlarm = new MCLabel();
    TimeTilAlarm.textColor = color (255);
    TimeTilAlarm.start = new PVector(width/2, 508);
    TimeTilAlarm.size = new PVector(102, 23);
    TimeTilAlarm.Text = "god dammit";

    PopUpText = new MCLabel();
    PopUpText.textColor = color (255);
    PopUpText.start = new PVector(width/2, height/2);
    PopUpText.size = new PVector(width*0.75/2, height/2/2);
    PopUpText.Text = "Ehh what"+ENTER+"You shouldnt be able"+ENTER+"to see this";
  }


  void render() {
    image(images[3], 0, 0, width, height);

    if (SleepTimer.StartStop.Label.Text == "Stop") {
      currentSleep = System.currentTimeMillis()-startTime;
      SleepingFor.Text = (int(currentSleep/1000/60/60) < 10 ? "0" : "")+str(int(currentSleep/1000/60/60))+":"+(int(currentSleep/1000/60)%60 < 10 ? "0" : "")+str(int(currentSleep/1000/60)%60)+":"+(int(currentSleep/1000)%60 < 10 ? "0" : "")+str(int(currentSleep/1000)%60);
    }
    //str(AlarmInSec);
    if (Alarm.OnOff.Label.Text == "On") {
      TimeTilAlarm.Text = (int(AlarmInSec/60/60) < 10 ? "0" : "")+str(int(AlarmInSec/60/60))+":"+(int(AlarmInSec/60)%60 < 10 ? "0" : "")+str(int(AlarmInSec/60)%60)+":"+(int(AlarmInSec%60) < 10 ? "0" : "")+str(int(AlarmInSec%60));
    } else {
      TimeTilAlarm.Text = "No alarm set";
    }


    Reset.render();
    StartStop.render();
    TimeTilAlarm.render();
    SleepingFor.render();
    if (PopUp) {
      stroke(0);
      strokeWeight(2);
      fill(50, 50, 150);
      rectMode(CENTER);
      rect(width/2, height/2, width*0.75, height/2);
      PopUpText.render();
      ExitPopUp.render();
    }
  }
}
