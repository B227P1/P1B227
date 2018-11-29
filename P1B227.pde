//Main file subject to change <mikkel was here>
int appState; // determines which state program is in
PImage[] images = new PImage[10]; // array for the images used

MainScreen MainScreen = new MainScreen();
DailyInput DailyInput = new DailyInput();
Alarm Alarm = new Alarm();
SleepTimer SleepTimer = new SleepTimer();
Logs Logs = new Logs();
Settings Settings = new Settings();

void setup(){
  size(470,832);
  images[0] = loadImage("test.jpg");
  images[1] = loadImage("dailyinput.jpg");
  images[2] = loadImage("alarm.png");
  images[3] = loadImage("sleep_timer.png");
  images[4] = loadImage("logs.png");
  images[5] = loadImage("settings.png");
  appState = 1;
  
  
  
}

void draw(){
  switch(appState){
    case 0:
    
    case 1:
      MainScreen.render();
      break;
    case 2:
      DailyInput.render();
      break;
    case 3:
      Alarm.render();
      break;
    case 4:
      SleepTimer.render();
      break;
    case 5:
      Logs.render();
      break;
    case 6:
      Settings.render();
      break;
    }
  

}
  
 

void mouseClicked(){
  appState++;
  
}

void keyPressed(){
  //<>//
}
