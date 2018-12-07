//Main file subject to change <mikkel was here> //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//
int appState; // determines which state program is in
int starCount, hatEquipped;
PImage[] images = new PImage[20]; // array for the images used
PImage[] hatImages = new PImage[3];
PShape starShape;
int sizeX, sizeY;
boolean init = false;
PFont freestyle;

MainScreen MainScreen;
DailyInput DailyInput;
Alarm Alarm;
SleepTimer SleepTimer;
Logs Logs;
Settings Settings;
Customization Customization;
Menu Menu;


void setup() {
  size(470, 832);
  MainScreen = new MainScreen();
  DailyInput = new DailyInput();
  Alarm = new Alarm();
  SleepTimer = new SleepTimer();
  Logs = new Logs();
  Settings = new Settings();
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
  images[3] = loadImage("sleep_timer.png");
  images[4] = loadImage("logs.png");
  images[5] = loadImage("settings.png");
  images[6] = loadImage("starplaceholder.jpg"); // delet this
  images[7] = loadImage("customization.jpg");
  images[8] = loadImage("lizard3.png");
  images[9] = loadImage("lizard1.png");
  images[10] = loadImage("lizard2.png");
  images[11] = loadImage("lizard3flipped.png");
  hatImages[0] = loadImage("TopHat.png");
  hatImages[1] = loadImage("SortingHat.png");
  hatImages[2] = loadImage("WizardHat.png");
  appState = 1;
  frameRate(60);

  starCount = 15;
  hatEquipped = 0;
  textFont(freestyle);
}


void draw() {
  //println(frameRate);

  switch(appState) {
  case 0:
    break;
  case 1:
    MainScreen.render();
    MainScreen.setStarPositions();
    break;
  case 2:
    DailyInput.render();
    break;
  case 3: //<>// //<>//
    Alarm.render(); //<>// //<>//
    break;
  case 4:
    SleepTimer.render();
    break;
  case 5:
    Logs.render();
    break;
  case 6:
    Customization.render(); //<>//
    break; //<>// //<>//
  }

  Menu.render();
}



void mouseClicked() {
  if (init == false) {
    Customization.setupButtons();
    init = true;
  }
  println("-----");
  println(mouseX);
  println(mouseY);

  // --- BUTTONS CLICK FUNCTION FOR CUSTOMIZATION ---
  if (Customization.InventoryButton.mouseHovered() && appState == 6) { //<>// //<>//
    Customization.pageState = 1; //<>// //<>//
  }
  if (Customization.ShopButton.mouseHovered() && appState == 6) {
    Customization.pageState = 2;
  }

  // --- BUTTONS FOR EQUIPPING HATS ---
  if (appState == 6 && Customization.slot0Hovered() && Customization.pageState == 1) {
    hatEquipped = Customization.inventorySlots[0];
  } //<>//
  if (appState == 6 && Customization.slot1Hovered() && Customization.pageState == 1) { //<>//
    hatEquipped = Customization.inventorySlots[1];
  }

  // --- BUTTONS FOR BUYING HATS ---
  if (appState == 6 && Customization.slot0Hovered() && Customization.pageState == 2 && starCount-Customization.hatPrices[Customization.inventorySlots[0]] >0) {
    starCount -= Customization.hatPrices[Customization.inventorySlots[0]];
    Customization.hatsOwned[Customization.inventorySlots[0]] = 1;
  }
  if (appState == 6 && Customization.slot1Hovered() && Customization.pageState == 2 && starCount-Customization.hatPrices[Customization.inventorySlots[1]] >0) {
    starCount -= Customization.hatPrices[Customization.inventorySlots[1]];
    Customization.hatsOwned[Customization.inventorySlots[1]] = 1;
  } //<>// //<>//
  
  // --- BUTTONS IN DAILYINPUT ---
  
  if(DailyInput.productiveHovered()){
    DailyInput.productive = 1;
  }
  if(DailyInput.unproductiveHovered()){
    DailyInput.productive = 2;
  }
  if(DailyInput.energizedHovered()){
    DailyInput.energy = 1;
  }
  if(DailyInput.tiredHovered()){ //<>// //<>//
    DailyInput.energy= 2;
  }
   if(DailyInput.wakeTimeHovered()){
    DailyInput.pageState = 2;
  }
  if(DailyInput.bedTimeHovered()){
    DailyInput.pageState = 3;
  }
  
  // --- BUTTONS IN ALARM ---
  

  // --- BUTTONS IN MENU ---
  if (mouseX > Menu.BurgerOffset.x && mouseX < Menu.BurgerOffset.x+Menu.BurgerSize.x && mouseY > Menu.BurgerOffset.y && mouseY < Menu.BurgerOffset.y+Menu.BurgerSize.y && !Menu.Open) {
    Menu.Open = !Menu.Open;
  } else if (Menu.Open) {
    for (int i = 0; i < Menu.MenuAmount; i++) {
      if (Menu.MenuButtons.get(i).mouseHovered()) {
        Menu.Open = false;
        appState = i+1;
      } //<>//
    }
  }
}

void keyPressed() {
  if (keyCode == LEFT) {
    appState--;
    appState = appState < 1 ? 1 : appState;
  }
  if (keyCode == RIGHT) {
    appState++;
    appState = appState > 6 ? 6 : appState;
  } //<>//
}


//--SAVE FUNCTION--
void saveData() {
}

//--LOAD FUNCTION--
void loadData() {
}
