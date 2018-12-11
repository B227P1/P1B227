//Main file subject to change <mikkel was here> //<>//
int appState; // determines which state program is in
int starCount, hatEquipped;
PImage[] images = new PImage[20]; // array for the images used
PImage[] hatImages = new PImage[3];
PImage[] tutorialImgs = new PImage[10];
String[] advices = new String[6];
PShape starShape;
int sizeX, sizeY;
boolean init = false;
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


void setup() {
  size(470, 832);
  MainScreen = new MainScreen();
  DailyInput = new DailyInput();
  Alarm = new Alarm();
  SleepTimer = new SleepTimer();
  Logs = new Logs();
  Customization = new Customization();
  Menu = new Menu();

  size(470, 832);
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
  advices[0] = "Look at all these stars!"+ENTER+"I'm so proud of you!";
  advices[1] = "Oooh, a new hat for me?!"+ENTER+"Thank you hooman!";
  advices[3] = "You should get 7-8 hours"+ENTER+"of sleep every day.";
  advices[2] = "Oooh. Fancy!";
  advices[4] = "Higher sleep quantity"+ENTER+"can lead to better"+ENTER+"academic performance!";
  advices[5] = "Hmm I really want"+ENTER+"a new hat.";
  appState = 1;
  frameRate(60);

  starCount = 13;
  hatEquipped = 0;
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
  case 6: //<>//
    Customization.render(); //<>// //<>//
    break; //<>// //<>//
  }

  Menu.render();
}



void mouseClicked() {
  loop();
  if (init == false) {
    Customization.setupButtons();
    init = true;
  }
  if(appState == 0){
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
    showAdvice(width*0.655,height*0.172,320,200,2);
  } 
  if (appState == 6 && Customization.slot1Hovered() && Customization.pageState == 1) {
    hatEquipped = Customization.inventorySlots[1];
    showAdvice(width*0.655,height*0.172,320,200,2);
  }

  // --- BUTTONS FOR BUYING HATS ---
  if (appState == 6 && Customization.slot0Hovered() && Customization.pageState == 2 && starCount-Customization.hatPrices[Customization.inventorySlots[0]] >0) {
    starCount -= Customization.hatPrices[Customization.inventorySlots[0]];
    Customization.hatsOwned[Customization.inventorySlots[0]] = 1;
    showAdvice(width*0.655,height*0.172,320,200,1);
  }
  if (appState == 6 && Customization.slot1Hovered() && Customization.pageState == 2 && starCount-Customization.hatPrices[Customization.inventorySlots[1]] >0) {
    starCount -= Customization.hatPrices[Customization.inventorySlots[1]];
    Customization.hatsOwned[Customization.inventorySlots[1]] = 1;
    showAdvice(width*0.655,height*0.172,320,200,1);
  } 

  // --- BUTTONS IN DAILYINPUT ---

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
    DailyInput.pageState = 2;
  }
  if (DailyInput.bedTimeHovered()) {
    DailyInput.pageState = 4;
  }
  if(DailyInput.wakeHourHovered()){
    DailyInput.pageState = 2;
  }
  if(DailyInput.wakeMinuteHovered()){
    DailyInput.pageState = 3;
    input = "";
  }
  if(DailyInput.bedHourHovered()){
    DailyInput.pageState = 4;
  }
  if(DailyInput.bedMinuteHovered()){
    DailyInput.pageState = 5;
  }
  if(DailyInput.wakeOkHovered()){
    input = "";
    if(DailyInput.wakeTimeHour<24){
      if(DailyInput.wakeTimeMinute<60){
        DailyInput.bedTimeMinute = DailyInput.wakeTimeMinute;
        DailyInput.pageState = 1;
        if(DailyInput.wakeTimeHour>7){
          DailyInput.bedTimeHour = DailyInput.wakeTimeHour-8;
        } else{
          int i = DailyInput.wakeTimeHour-8;
          DailyInput.bedTimeHour = 24+i;
        }
      }
    }
  }
  
  if(DailyInput.bedOkHovered()){
    if(DailyInput.bedTimeHour<24 && DailyInput.bedTimeMinute<60){
    }}
  if(DailyInput.yesHovered()){
    //set alarm
  }
  if(DailyInput.noHovered()){
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
  }
  
  // --- BUTTONS IN LOGS ---
  if(appState == 5){
    if(Logs.inputState == 1 || Logs.inputState == 2){
      Logs.inputState = 0;
    }
  }
  if (Logs.thHovered()){
    Logs.inputState = 1;
  }
  if(Logs.ndHovered()){
    Logs.inputState= 2;
  }
  if(wizardHovered()){
    switch(appState){
      case 1:
       showAdvice(width*0.496,height*0.583,320,200,round(random(2.5,5)));
       break;
      case 2:
        showAdvice(width*0.543,height*0.637,320,200,round(random(2.5,5)));
        break;
      case 5:
        showAdvice(width*0.585,height*0.7,320,200,round(random(2.5,5)));
        break;
      case 6:
        showAdvice(width*0.655,height*0.172,320,200,round(random(2.5,5)));
        break;
    }
  }
  
   //<>//
  

  // --- BUTTONS IN MENU ---
  if (mouseX > Menu.BurgerOffset.x && mouseX < Menu.BurgerOffset.x+Menu.BurgerSize.x && mouseY > Menu.BurgerOffset.y && mouseY < Menu.BurgerOffset.y+Menu.BurgerSize.y && !Menu.Open) {
    Menu.Open = !Menu.Open;
  } else if (Menu.Open) {
    for (int i = 0; i < Menu.MenuAmount; i++) {
      if (Menu.MenuButtons.get(i).mouseHovered()) {
        Menu.Open = false;
        appState = i+1;
      }
    }
  }
}

void keyPressed() {
  
    if (keyCode == UP) {
    startTime -= 60000;
  }
    if (keyCode == DOWN) {
    startTime -= 3600000;
  }
  
  if (keyCode == LEFT) {
    appState--;
    appState = appState < 1 ? 1 : appState;
  }
  if (keyCode == RIGHT) {
    appState++;
    appState = appState > 6 ? 6 : appState;
  }
  // input for wake-up and bedtime in daily input
  if(appState == 2 && DailyInput.pageState>1 && DailyInput.pageState<6 && input.length()!=2){
    if(key >= '0' && key <= '9'){
      input += key;
      switch(DailyInput.pageState){
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
      if(input.length() == 2 && DailyInput.pageState%2==0){
        DailyInput.pageState++;
        input = "";
      }
    }
  }
  
}


//--SAVE FUNCTION--
void saveData() {
}

//--LOAD FUNCTION--
void loadData() {
}

void tutorial(){
  switch(tutorialState){
    case 0:
    image(tutorialImgs[0],0,0,width,height);
    break;
    case 1:
    image(tutorialImgs[1],0,0,width,height);
    break;
    case 2:
    image(tutorialImgs[2],0,0,width,height);
    break;
    case 3:
    image(tutorialImgs[3],0,0,width,height);
    break;
    default:
    appState++;
    
  }
}

boolean wizardHovered(){
  switch(appState){
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
  

void showAdvice(float xpos, float ypos, float wide, float high, int advNum){
  //int startT = millis(), stopT = millis()+10000;
  //while(startT<stopT){
  imageMode(CENTER);
  image(images[5],xpos,ypos,wide,high);
  fill(0);
  textAlign(CENTER);
  textSize(45);
  text(advices[advNum],xpos,ypos-50);
  imageMode(CORNER);
  noLoop();
  //}
}
