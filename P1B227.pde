//Main file subject to change <mikkel was here> //<>// //<>// //<>// //<>// //<>// //<>// //<>//
int appState; // determines which state program is in
int starCount, hatEquipped;
PImage[] images = new PImage[20]; // array for the images used
PImage[] hatImages = new PImage[3];
PImage[] tutorialImgs = new PImage[10];
String[] advices = new String[7];
PShape starShape;
int sizeX, sizeY;
boolean init = false, cheat = true; //cheat allows the cheats to be used (for testing/evaluating)
PFont freestyle;
String input = "";
int tutorialState;
float SleepingForTime;
long startTime, stopTime, currentSleep, AlarmInSec;
double dailySeconds;
int alarmHour, alarmMinute;

MainScreen MainScreen;
DailyInput DailyInput;
Alarm Alarm;
SleepTimer SleepTimer;
Logs Logs;
Customization Customization;
Menu Menu;
Table data;

void setup() {
  size(470, 832);
  MainScreen = new MainScreen();
  DailyInput = new DailyInput();
  Alarm = new Alarm();
  SleepTimer = new SleepTimer();
  Logs = new Logs();
  Customization = new Customization();
  Menu = new Menu();
  data = loadTable("data.csv", "header");
  TableRow row1 = data.getRow(0);

  Menu = new Menu();
  sizeX = width; 
  sizeY = height;
  starShape = loadShape("star.svg");
  freestyle = loadFont("freestyle.vlw");
  images[0] = loadImage("mainscreen.jpg");
  images[1] = loadImage("daily_input3.jpg");
  images[2] = loadImage("alarm.jpg");
  images[3] = loadImage("Sleep_timer.jpg");
  images[4] = loadImage("logs.png");
  images[5] = loadImage("bubble.png");
  images[7] = loadImage("customization.jpg");
  images[8] = loadImage("lizard3.png");
  images[9] = loadImage("lizard1.png");
  images[10] = loadImage("lizard2.png");
  images[11] = loadImage("lizard3flipped.png");
  hatImages[0] = loadImage("TopHat.png");
  hatImages[1] = loadImage("SortingHat.png");
  hatImages[2] = loadImage("WizardHat.png");
  tutorialImgs[0] = loadImage("mainscreen1.png");
  tutorialImgs[1] = loadImage("mainscreen2.png");
  tutorialImgs[2] = loadImage("mainscreen3.png");
  tutorialImgs[3] = loadImage("mainscreen4.png");
  tutorialImgs[4] = loadImage("dailyinput1.png");
  tutorialImgs[5] = loadImage("dailyinput2.png");
  tutorialImgs[6] = loadImage("sleeptimer2.png");
  tutorialImgs[7] = loadImage("sleeptimer3.png");
  tutorialImgs[8] = loadImage("customization.png");
  advices[0] = "Look at all these stars!"+ENTER+"I'm so proud of you!";
  advices[1] = "Oooh, a new hat for me?!"+ENTER+"Thank you hooman!";
  advices[3] = "You should get 7-8 hours"+ENTER+"of sleep every day.";
  advices[2] = "Oooh. Fancy!";
  advices[4] = "Higher sleep quantity"+ENTER+"can lead to better"+ENTER+"academic performance!";
  advices[5] = "Hmm I really want"+ENTER+"a new hat.";
  advices[6] = "Based on your sleep time,"+ENTER+"I predict that you will"+ENTER+"feel productive and energized!";
  appState = row1.getInt("appState");
  frameRate(60);

  Customization.hatsOwned[0] = row1.getInt("hat0Owned");
  Customization.hatsOwned[1] = row1.getInt("hat1Owned");
  Customization.hatsOwned[2] = row1.getInt("hat2Owned");
  starCount = row1.getInt("starCount");
  hatEquipped = row1.getInt("hatEquipped");
  textFont(freestyle);
}

void draw() {
  dailySeconds = hour()*3600d+minute()*60d+second()+(System.currentTimeMillis()%1e3d)/1e3d;
  AlarmInSec = alarmHour*3600+alarmMinute*60 - (long)dailySeconds > 0 ? alarmHour*3600+alarmMinute*60 - (long)dailySeconds : alarmHour*3600+alarmMinute*60 - (long)dailySeconds + 86400;

  switch(appState) {
  case 0:
    tutorial();
    break;
  case 1:
    MainScreen.render();
    MainScreen.setStarPositions();
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
    Customization.render(); 
    break; //<>//
  } //<>//
 //<>//
  if (appState != 0) {
    Menu.render();
  }
}

void mouseClicked() {
  loop();
  if (init == false && appState != 0) {
    showAdvice(width*0.496, height*0.583, 320, 200, 6, 40);
    Customization.setupButtons();
    init = true;
  }
  if (appState == 0) {
    tutorialState++;
  }
  println("-----");
  println(mouseX);
  println(mouseY);

  // --- BUTTONS CLICK FUNCTION FOR CUSTOMIZATION ---
  if (Customization.InventoryButton.mouseHovered() && appState == 6) { 
    Customization.pageState = 1;
  }
  if (Customization.ShopButton.mouseHovered() && appState == 6) {
    Customization.pageState = 2;
  }

  // --- BUTTONS FOR EQUIPPING HATS ---
  if (appState == 6 && Customization.slot0Hovered() && Customization.pageState == 1) {
    hatEquipped = Customization.inventorySlots[0];
    showAdvice(width*0.655, height*0.172, 320, 200, 2, 45);
  } 
  if (appState == 6 && Customization.slot1Hovered() && Customization.pageState == 1) {
    hatEquipped = Customization.inventorySlots[1];
    showAdvice(width*0.655, height*0.172, 320, 200, 2, 45);
  }

  // --- BUTTONS FOR BUYING HATS ---
  if (appState == 6 && Customization.slot0Hovered() && Customization.pageState == 2 && starCount-Customization.hatPrices[Customization.inventorySlots[0]] >0) {
    starCount -= Customization.hatPrices[Customization.inventorySlots[0]];
    Customization.hatsOwned[Customization.inventorySlots[0]] = 1;
    showAdvice(width*0.655, height*0.172, 320, 200, 1, 45);
  }
  if (appState == 6 && Customization.slot1Hovered() && Customization.pageState == 2 && starCount-Customization.hatPrices[Customization.inventorySlots[1]] >0) {
    starCount -= Customization.hatPrices[Customization.inventorySlots[1]];
    Customization.hatsOwned[Customization.inventorySlots[1]] = 1;
    showAdvice(width*0.655, height*0.172, 320, 200, 1, 45);
  } 

  // --- BUTTONS IN DAILYINPUT ---

  if (DailyInput.saveHovered()) {
    appState = 1;
  }
  if (DailyInput.productiveHovered()) {
    DailyInput.productive = 1;
  }
  if (DailyInput.unproductiveHovered()) {
    DailyInput.productive = 2;
  }
  if (DailyInput.energizedHovered()) {
    DailyInput.energy = 1;
  }
  if (DailyInput.tiredHovered()) { //<>//
    DailyInput.energy= 2;
  }
  if (DailyInput.wakeTimeHovered()) {
    DailyInput.pageState = 2; //<>//
  }
  if (DailyInput.bedTimeHovered()) {
    DailyInput.pageState = 4;
  }
  if (DailyInput.wakeHourHovered()) {
    DailyInput.pageState = 2;
  }
  if (DailyInput.wakeMinuteHovered()) {
    DailyInput.pageState = 3;
    input = "";
  }
  if (DailyInput.bedHourHovered()) {
    DailyInput.pageState = 4;
  }
  if (DailyInput.bedMinuteHovered()) {
    DailyInput.pageState = 5;
  }
  if (DailyInput.wakeOkHovered()) {
    input = "";
    if (DailyInput.wakeTimeHour<24) {
      if (DailyInput.wakeTimeMinute<60) {
        DailyInput.bedTimeMinute = DailyInput.wakeTimeMinute;
        DailyInput.pageState = 1;
        if (DailyInput.wakeTimeHour>7) {
          DailyInput.bedTimeHour = DailyInput.wakeTimeHour-8;
        } else {
          int i = DailyInput.wakeTimeHour-8;
          DailyInput.bedTimeHour = 24+i;
        }
      }
    }
  }

  if (DailyInput.bedOkHovered()) {
    if (DailyInput.bedTimeHour<24 && DailyInput.bedTimeMinute<60) {
    }
  }
  if (DailyInput.yesHovered()) {
    DailyInput.pageState = 0;
    alarmHour = DailyInput.wakeTimeHour;
    alarmMinute = DailyInput.wakeTimeMinute;
    Alarm.OnOff.Label.Text = "On";
  }
  if (DailyInput.noHovered()) {
    DailyInput.pageState = 0;
  }

  // --- BUTTONS IN ALARM ---
  if (Alarm.AmPm.mouseHovered()) {
    if (Alarm.AmPm.Label.Text == "Pm") {
      Alarm.AmPm.Label.Text = "Am";
    } else {
      Alarm.AmPm.Label.Text = "Pm";
    }
  }

  if (Alarm.OnOff.mouseHovered()) {
    if (Alarm.OnOff.Label.Text == "On") {
      Alarm.OnOff.Label.Text = "Off";
    } else {
      Alarm.OnOff.Label.Text = "On";
    }
  }

  // --- BUTTONS IN SleepTimer ---
  if (SleepTimer.StartStop.mouseHovered()) {
    if (SleepTimer.StartStop.Label.Text == "Start") {
      SleepTimer.StartStop.Label.Text = "Stop";
      if (SleepTimer.SleepingFor.Text == "N/A") {
        startTime = System.currentTimeMillis();
      } else {
        startTime = System.currentTimeMillis()-currentSleep;
      }
    } else {
      SleepTimer.StartStop.Label.Text = "Start";
    }
  }

  if (SleepTimer.Reset.mouseHovered()) {
    SleepTimer.SleepingFor.Text = "N/A";
    SleepTimer.StartStop.Label.Text = "Start";
    if (currentSleep > 25200000) {
      starCount++;
      SleepTimer.PopUp = true;
      SleepTimer.PopUpText.Text = "congratulations!"+ENTER+"you slept for more than"+ENTER+"7 hours you get 1 star!";
      if (currentSleep > 28800000) {
        starCount++;
        SleepTimer.PopUpText.Text = "congratulations!"+ENTER+"you slept for more than"+ENTER+"8 hours you get 2 stars!";
      }
    }
    currentSleep = 0;
  }

  if (SleepTimer.ExitPopUp.mouseHovered() && SleepTimer.PopUp) {
    SleepTimer.PopUp = false;
  }

  // --- BUTTONS IN LOGS ---
  if (appState == 5) {
    if (Logs.inputState == 1 || Logs.inputState == 2) {
      Logs.inputState = 0;
    }
  }
  if (Logs.thHovered()) {
    Logs.inputState = 2;
  }
  if (Logs.ndHovered()) {
    Logs.inputState= 1;
  }
  if (wizardHovered()) {
    switch(appState) {
    case 1:
      showAdvice(width*0.496, height*0.583, 320, 200, round(random(2.5, 5)), 45);
      break; //<>//
    case 2:
      showAdvice(width*0.543, height*0.637, 320, 200, round(random(2.5, 5)), 45);
      break;
    case 5:
      showAdvice(width*0.585, height*0.7, 320, 200, round(random(2.5, 5)), 45);
      break;
    case 6:
      showAdvice(width*0.655, height*0.172, 320, 200, round(random(2.5, 5)), 45);
      break;
    }
  }


  // --- BUTTONS IN MENU ---
  if (appState != 0 && mouseX > Menu.BurgerOffset.x && mouseX < Menu.BurgerOffset.x+Menu.BurgerSize.x && mouseY > Menu.BurgerOffset.y && mouseY < Menu.BurgerOffset.y+Menu.BurgerSize.y && !Menu.Open) {
    Menu.Open = !Menu.Open;
  } else if (Menu.Open) {
    for (int i = 0; i < Menu.MenuAmount; i++) {
      if (Menu.MenuButtons.get(i).mouseHovered()) {
        appState = i+1;
        MainScreen.enter = true;
      }
      Menu.Open = false;
    }
  }
}

void keyPressed() {

  if (key == 's') {
    saveData();
  }
  if (key == 'a' && cheat) {
    starCount += 10;
  }

  if (keyCode == UP && cheat) {
    startTime -= 60000;
  }
  if (keyCode == DOWN &&cheat) {
    startTime -= 3600000;
  }

  //if (keyCode == LEFT) {
  //  appState--;
  //  appState = appState < 1 ? 1 : appState;
  //}
  //if (keyCode == RIGHT) {
  //  appState++;
  //  appState = appState > 6 ? 6 : appState;
 // }
  // input for wake-up and bedtime in daily input
  if (appState == 2 && DailyInput.pageState>1 && DailyInput.pageState<6 && input.length()!=2) {
    if (key >= '0' && key <= '9') {
      input += key;
      switch(DailyInput.pageState) {
      case 2:
        DailyInput.wakeTimeHour = int(input);
        break;
      case 3:
        DailyInput.wakeTimeMinute = int(input);
        break;
      case 4:
        DailyInput.bedTimeHour = int(input);
        break;
      case 5:
        DailyInput.bedTimeMinute = int(input);
        break;
      }
      if (input.length() == 2 && DailyInput.pageState%2==0) {
        DailyInput.pageState++;
        input = "";
      }
    }
  }
}
// --- FUNCTIONS USED IN THE PROGRAM -------------------------------------------------------------

//--SAVE FUNCTION--
void saveData() {
  TableRow row1 = data.getRow(0);
  row1.setInt("appState", 1);
  row1.setInt("starCount", starCount);
  row1.setInt("hatEquipped", hatEquipped);
  row1.setInt("hat0Owned", Customization.hatsOwned[0]);
  row1.setInt("hat1Owned", Customization.hatsOwned[1]);
  row1.setInt("hat2Owned", Customization.hatsOwned[2]);
  saveTable(data, "data.csv");
}

// function for the startup tutorial
void tutorial() {
  switch(tutorialState) {
  case 0:
    image(tutorialImgs[0], 0, 0, width, height);
    break;
  case 1:
    image(tutorialImgs[1], 0, 0, width, height);
    break;
  case 2:
    image(tutorialImgs[2], 0, 0, width, height);
    break;
  case 3:
    image(tutorialImgs[3], 0, 0, width, height);
    break;
  case 4:
    image(tutorialImgs[4], 0, 0, width, height);
    break;
  case 5:
    image(tutorialImgs[5], 0, 0, width, height);
    break;
  case 6:
    image(tutorialImgs[6], 0, 0, width, height);
    break;
  case 7:
    image(tutorialImgs[7], 0, 0, width, height);
    break;
  case 8:
    image(tutorialImgs[8], 0, 0, width, height);
    break;
  default:
    appState++;
  }
}

// returns true when the cursor is over the Lizard, returns false when it is not
boolean wizardHovered() {
  switch(appState) {
  case 1:
    if (dist(mouseX, mouseY, width*0.389, height*0.817)<80) { 
      return true;
    } else {
      return false;
    }
  case 2:
    if (dist(mouseX, mouseY, width*0.64, height*0.855)<80) { 
      return true;
    } else {
      return false;
    }
  case 5:
    if (dist(mouseX, mouseY, width*0.308, height*0.89)<80) { 
      return true;
    } else {
      return false;
    }
  case 6:
    if (dist(mouseX, mouseY, width*0.674, height*0.423)<80) { 
      return true;
    } else {
      return false;
    }
  default:
    return false;
  }
}

// function that makes the Lizard give advice
void showAdvice(float xpos, float ypos, float wide, float high, int advNum, int textSize) {
  imageMode(CENTER);
  image(images[5], xpos, ypos, wide, high);
  fill(0);
  textAlign(CENTER);
  textSize(textSize);
  text(advices[advNum], xpos, ypos-50);
  imageMode(CORNER);
  noLoop();
}
