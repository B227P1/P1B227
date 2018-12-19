class SleepTimer {
  boolean PopUp = false; //Controls whether or not theres to display the popup
  MCButton StartStop, Reset, ExitPopUp; //declares the buttons for starting and stoping the timer, Reseting the timer, and Exiting the popup
  MCLabel TimeTilAlarm, SleepingFor, PopUpText; //Declares the text labels for the time until the alarm, time spendt sleeping, and pup up text

  //Class constructer functions like a setup as it runs once when instantiated 
  SleepTimer() {
    //instantiates the StartStop as a new MCButton(); and sets the location and size of the object along with the text, button color, label sub class color, button Outline Color, and Button Outline size
    StartStop = new MCButton();
    StartStop.start = new PVector(width/2, height*0.882);
    StartStop.size = new PVector(115, 30);
    StartStop.Label.Text = "Start";
    StartStop.buttonColor = color(0, 0, 0, 1);
    StartStop.Label.textColor = color(255);
    StartStop.buttonOutlineColor = color(255);
    StartStop.buttonOutlineSize = 0;

    //instantiates the Reset as a new MCButton(); and sets the location and size of the object along with the text, button color, label sub class color, button Outline Color, and Button Outline size
    Reset = new MCButton();
    Reset.start = new PVector(width/2, height*0.805);
    Reset.size = new PVector(40, 20);
    Reset.Label.Text = "Reset";
    Reset.buttonColor = color(0, 0, 0, 75);
    Reset.Label.textColor = color(255);
    Reset.buttonOutlineColor = color(150);
    Reset.buttonOutlineSize = 2;

    //instantiates the ExitPopUp as a new MCButton(); and sets the location and size of the object along with the text, button color, label sub class color, button Outline Color, and Button Outline size
    ExitPopUp = new MCButton();
    ExitPopUp.start = new PVector(width*0.75, 260);
    ExitPopUp.size = new PVector(33, 33);
    ExitPopUp.Label.Text = "X";
    ExitPopUp.buttonColor = color(255, 50, 50);
    ExitPopUp.Label.textColor = color(255);
    ExitPopUp.buttonOutlineColor = color(0);
    ExitPopUp.buttonOutlineSize = 2;

    //instantiates the SleepingFor as a new MCLabel(); and sets the location and size of the object along with the text and text color
    SleepingFor = new MCLabel();
    SleepingFor.textColor = color (255);
    SleepingFor.start = new PVector(width/2, 362);
    SleepingFor.size = new PVector(142, 45);
    SleepingFor.Text = "N/A";

    //instantiates the TimeTilAlarm as a new MCLabel(); and sets the location and size of the object along with the text and text color
    TimeTilAlarm = new MCLabel();
    TimeTilAlarm.textColor = color (255);
    TimeTilAlarm.start = new PVector(width/2, 508);
    TimeTilAlarm.size = new PVector(102, 23);
    TimeTilAlarm.Text = "god dammit";

    //instantiates the PopUpText as a new MCLabel(); and sets the location and size of the object along with the text and text color
    PopUpText = new MCLabel();
    PopUpText.textColor = color (255);
    PopUpText.start = new PVector(width/2, height/2);
    PopUpText.size = new PVector(width*0.75/2, height/2/2);
    PopUpText.Text = "Ehh what"+ENTER+"You shouldnt be able"+ENTER+"to see this";
  }

  //Render functon that works like draw, if it gets called in draw it draws the class to the screen
  void render() {
    //static background is rendered
    image(images[3], 0, 0, width, height);

    //checks if the sleep timer is on or off and renderes it dependent on that
    if (SleepTimer.StartStop.Label.Text == "Stop") {
      currentSleep = System.currentTimeMillis()-startTime; //gets the transpired time; milliseconds since jan 1 1970 subtracted from the time started since jan 1 1970
      SleepingFor.Text = (int(currentSleep/1000/60/60) < 10 ? "0" : "")+str(int(currentSleep/1000/60/60))+":"+(int(currentSleep/1000/60)%60 < 10 ? "0" : "")+str(int(currentSleep/1000/60)%60)+":"+(int(currentSleep/1000)%60 < 10 ? "0" : "")+str(int(currentSleep/1000)%60); //converts it from milliseconds to HH:MM:SS format and sets the text to that
    }
    //checks if the OnOff button for the alarm is on or off and renders it dependet on that
    if (Alarm.OnOff.Label.Text == "On") {
      TimeTilAlarm.Text = (int(AlarmInSec/60/60) < 10 ? "0" : "")+str(int(AlarmInSec/60/60))+":"+(int(AlarmInSec/60)%60 < 10 ? "0" : "")+str(int(AlarmInSec/60)%60)+":"+(int(AlarmInSec%60) < 10 ? "0" : "")+str(int(AlarmInSec%60)); //converts it from milliseconds to HH:MM:SS format and sets the text to that
    } else {
      TimeTilAlarm.Text = "No alarm set"; //sets the text
    }

    
    Reset.render();  //renders the Reset button
    StartStop.render();  //renders the Reset button
    TimeTilAlarm.render();  //renders the Reset button
    SleepingFor.render();  //renders the Reset button
    if (PopUp) {   //checks if it should render the pop up
    //renders the box part of the pop up
      stroke(0);
      strokeWeight(2);
      fill(50, 50, 150);
      rectMode(CENTER);
      rect(width/2, height/2, width*0.75, height/2);
      
      PopUpText.render(); //Renders the pop up text
      ExitPopUp.render(); //Renders the pop up exit button
    }
  }
}
