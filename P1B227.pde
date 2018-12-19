// Welcome dear examinors! We hope you enjoy our program, and give us a 12 LUL //<>//
boolean init = false, cheat = true; //cheat allows the cheats to be used (for testing/evaluating)
int alarmHour, alarmMinute, sizeX, sizeY, tutorialState, starCount, hatEquipped, appState; /*alarmHour is used to store which Hour in the day the user is currently on, alarmMinute is used to store which Minute in the day the user is currently on,
sizeX is used to store width, sizeY is used to store height, tutorialState determines which screen the program is on during the tutorial, starCount is the amout of star the user has, hatEquipped is the current hat the user has,
appState determines which screen the program is on*/

String input = ""; // this is needed for the input in daily input
long startTime, currentSleep, AlarmInSec; /*startTime is used to save at which point in time the user started the timer since jan 1 1970, currentSleep is used to store how much the user currently has slept in miliseconds, 
AlarmInSec is used to store how long til the alarm in seconds*/

double dailySeconds; //number of seconds transpired so far in a day
PImage[] tutorialImgs = new PImage[10], hatImages = new PImage[3], images = new PImage[20]; /*tutorialImgs array for the images used for tutoral, hatImages array used to store images of the hats the wizard lizard can wear, 
images array used to store miscellaneous images used in the program and the main screens*/

String[] advices = new String[7]; // stores all the possible advices that the Wizard Lizard can give
PShape starShape;
Table data; // the table that holds the savable/loadable data

// declaring the six page objects + the menu
MainScreen MainScreen;
DailyInput DailyInput;
Alarm Alarm;
SleepTimer SleepTimer;
Logs Logs;
Customization Customization;
Menu Menu;

void setup() {
  size(470, 832);
  frameRate(60);
  textFont(loadFont("freestyle.vlw"));

  // instantiation of the six page object + the drop-down menu
  MainScreen = new MainScreen();
  DailyInput = new DailyInput();
  Alarm = new Alarm();
  SleepTimer = new SleepTimer();
  Logs = new Logs();
  Customization = new Customization();
  Menu = new Menu();

  // loading the data table, and instantiates the TableRow object, where the saveable/loadable data is stored (on the first row)
  data = loadTable("data.csv", "header");
  TableRow row1 = data.getRow(0);

  // these variables are used in Customization, to correctly allign the buttons compared to the window size
  sizeX = width; 
  sizeY = height;

  starShape = loadShape("star.svg");

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


  // initializes variables with the values loaded from the table (this is all the loaded data)
  Customization.hatsOwned[0] = row1.getInt("hat0Owned");
  Customization.hatsOwned[1] = row1.getInt("hat1Owned");
  Customization.hatsOwned[2] = row1.getInt("hat2Owned");

  appState = row1.getInt("appState");
  starCount = row1.getInt("starCount");
  hatEquipped = row1.getInt("hatEquipped");
}

void draw() {
  //calculates the seconds transpired in a day
  dailySeconds = hour()*3600d+minute()*60d+second()+(System.currentTimeMillis()%1e3d)/1e3d;
  
  //calculates the seconds til alarm
  AlarmInSec = alarmHour*3600+alarmMinute*60 - (long)dailySeconds > 0 ? alarmHour*3600+alarmMinute*60 - (long)dailySeconds : alarmHour*3600+alarmMinute*60 - (long)dailySeconds + 86400;

  // the switch responsible for rendering the right page and the right elements on the screen.
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
    break; //<>//
  case 4: //<>//
    SleepTimer.render(); //<>//
    break; //<>//
  case 5: //<>//
    Logs.render(); //<>//
    break;
  case 6: 
    Customization.render(); 
    break;
  }

  // renders the drop-down menu (unless the appState is 0, i.e. the tutorial is not active)
  if (appState != 0) {
    Menu.render();
  }
}

void mouseClicked() {

  // this gets the program running again (when the Wizard Lizard gives advice, a noLoop() is called, to keep the advice on the screen, until the user clicks again)
  loop();

  // this is only ran once after the program has been started. It's purpose is show the prediction of the Wizard Lizard about the user's mood, and to set the buttons up in Customization (this was required for proper width and height scaling)
  if (init == false && appState != 0) {
    showAdvice(width*0.496, height*0.583, 320, 200, 6, 40);
    Customization.setupButtons();
    init = true;
  }
  // if the tutorial is active, this makes it switch to the next picture on click
  if (appState == 0) {
    tutorialState++;
  }

  // --- BUTTONS CLICK FUNCTION FOR CUSTOMIZATION ----------------------------------------
  // -- buttons for switching between the shop and the inventory
  if (Customization.InventoryButton.mouseHovered() && appState == 6) { 
    Customization.pageState = 1;
  }
  if (Customization.ShopButton.mouseHovered() && appState == 6) {
    Customization.pageState = 2;
  }

  // --- BUTTONS FOR EQUIPPING HATS ---
  if (appState == 6 && Customization.slot0Hovered() && Customization.pageState == 1) {
    hatEquipped = Customization.inventorySlots[0];
    showAdvice(width*0.655, height*0.172, 320, 200, 2, 45); // makes the Wizard Lizard react to equipping of the hat
  } 
  if (appState == 6 && Customization.slot1Hovered() && Customization.pageState == 1) {
    hatEquipped = Customization.inventorySlots[1];
    showAdvice(width*0.655, height*0.172, 320, 200, 2, 45); // makes the Wizard Lizard react to equipping of the hat
  }

  // --- BUTTONS FOR BUYING HATS ---
  if (appState == 6 && Customization.slot0Hovered() && Customization.pageState == 2 && starCount-Customization.hatPrices[Customization.inventorySlots[0]] >0) {
    starCount -= Customization.hatPrices[Customization.inventorySlots[0]];
    Customization.hatsOwned[Customization.inventorySlots[0]] = 1;
    showAdvice(width*0.655, height*0.172, 320, 200, 1, 45); // makes the Wizard Lizard react to purchasing the hat
  }
  if (appState == 6 && Customization.slot1Hovered() && Customization.pageState == 2 && starCount-Customization.hatPrices[Customization.inventorySlots[1]] >0) {
    starCount -= Customization.hatPrices[Customization.inventorySlots[1]];
    Customization.hatsOwned[Customization.inventorySlots[1]] = 1;
    showAdvice(width*0.655, height*0.172, 320, 200, 1, 45); // makes the Wizard Lizard react to purchasing the hat
  } 

  // --- BUTTONS IN DAILYINPUT ---
 //<>//
  if (DailyInput.saveHovered()) {
    appState = 1; //<>//
  }
  if (DailyInput.productiveHovered()) { //<>//
    DailyInput.productive = 1;
  }
  if (DailyInput.unproductiveHovered()) {
    DailyInput.productive = 2;
  }
  if (DailyInput.energizedHovered()) {
    DailyInput.energy = 1;
  }
  if (DailyInput.tiredHovered()) {
    DailyInput.energy= 2;
  }
  if (DailyInput.wakeTimeHovered()) {
    DailyInput.pageState = 2;
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

  // this checks if the input is valid (since the user is supposed to enter a time, max hour value is 23, max minute value is 59)
  if (DailyInput.wakeOkHovered()) {
    input = "";
    if (DailyInput.wakeTimeHour<24) {
      if (DailyInput.wakeTimeMinute<60) {
        DailyInput.bedTimeMinute = DailyInput.wakeTimeMinute;
        DailyInput.pageState = 1;
        if (DailyInput.wakeTimeHour>7) {
          DailyInput.bedTimeHour = DailyInput.wakeTimeHour-8;
        } else {
          int i = DailyInput.wakeTimeHour-8; // calculates the recommended bedtime, than sets the bedTimeHour to that value (one line down)
          DailyInput.bedTimeHour = 24+i;
        }
      }
    }
  }

  if (DailyInput.bedOkHovered()) {
    if (DailyInput.bedTimeHour<24 && DailyInput.bedTimeMinute<60) {
    }
  }
  // ---buttons for the popup screen ("do you want to set an alarm for the desired wake-up time?") ---------
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
  //if the page is being renderd it checks if the alarm Pm/Am button is hoverd and if so changes it from Pm to Am or opposite
  if (appState == 3) {
    if (Alarm.AmPm.mouseHovered()) {
      if (Alarm.AmPm.Label.Text == "Pm") {
        Alarm.AmPm.Label.Text = "Am";
      } else {
        Alarm.AmPm.Label.Text = "Pm";
      }
    }

    //it checks if the alarm on/off button is hoverd and if so changes it from On to Off or opposite
    if (Alarm.OnOff.mouseHovered()) {
      if (Alarm.OnOff.Label.Text == "On") {
        Alarm.OnOff.Label.Text = "Off";
      } else {
        Alarm.OnOff.Label.Text = "On";
      }
    }
  }

  // --- BUTTONS IN SleepTimer ---
  if (appState == 4) {
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
 //<>//
    if (SleepTimer.ExitPopUp.mouseHovered() && SleepTimer.PopUp) {
      SleepTimer.PopUp = false;
    }
  }
 //<>//
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

  // --- MAKES THE WIZARD LIZARD GIVE A RANDOM SLEEP-ADVICE WHEN IT IS CLICKED (THE POSITION OF THE TEXTBOX IS BASED ON WHICH PAGE IS ACTIVE) ---
  if (wizardHovered()) {
    switch(appState) {
    case 1:
      showAdvice(width*0.496, height*0.583, 320, 200, round(random(2.5, 5)), 45);
      break;
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
  //sets the if it should render boolean to true if the drop down menu closed and the hamburger icon is clicked otherwise if its alredy open it will check which if the buttons have been click if any and set app state to corresponding button index and then close the menu
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
  // --- THE CHEAT FUNCTIONS USED IN THE EVALUATION, TO SET UP CERTAIN SCENARIOS (also used for testing) ---
  if (key == 'a' && cheat) {
    starCount += 10;
  }

  if (keyCode == UP && cheat) {
    startTime -= 60000;
  }
  if (keyCode == DOWN &&cheat) {
    startTime -= 3600000;
  }

  // input for wake-up and bedtime in daily input
  if (appState == 2 && DailyInput.pageState>1 && DailyInput.pageState<6 && input.length()!=2) { // the last condition here stops the user from writing a value more than 2 numbers long (since the max hour value is 23 and the max minute value is 59) 
    if (key >= '0' && key <= '9') {
      input += key;
      switch(DailyInput.pageState) {  // determines which value is being entered, based on the pageState of the Daily Input object
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
      // makes the hour input automatically jump to the minute input, when 2 characters have been entered (to make the user's life more convinient). The modulo is there to limit this to the hour-minute input change
      if (input.length() == 2 && DailyInput.pageState%2==0) {
        DailyInput.pageState++;
        input = ""; // changes the input value back to nothing, so that the user can enter something new
      }
    }
  }
}
// --- SELF-DEFINED FUNCTIONS USED IN THE PROGRAM -------------------------------------------------------------

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
    appState++; // this makes the app exit the tutorial into the main screen, once it is over
  }
}

// returns true when the cursor is over the Lizard, returns false when it is not (different positions are required because the Wizard Lizard's location changes from page-to-page)
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
  noLoop(); // this makes the text stay on the screen, until loop() is called (when the user clicks the mouse again)
}
