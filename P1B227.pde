//Main file subject to change <mikkel was here>
int appState; // determines which state program is in
int starCount, hatEquipped;
PImage[] images = new PImage[20]; // array for the images used
PImage[] hatImages = new PImage[3];
PShape starShape;
int sizeX, sizeY;
boolean init = false;

MainScreen MainScreen = new MainScreen();
DailyInput DailyInput = new DailyInput();
Alarm Alarm = new Alarm();
SleepTimer SleepTimer = new SleepTimer();
Logs Logs = new Logs();
Settings Settings = new Settings();
Customization Customization = new Customization();
Menu Menu;


void setup(){
  size(470,832);
    Menu = new Menu();
  sizeX = width; 
  sizeY = height;
  starShape = loadShape("star.svg");
  images[0] = loadImage("mainscreen.jpg");
  images[1] = loadImage("dailyinput.jpg");
  images[2] = loadImage("alarm.png");
  images[3] = loadImage("sleep_timer.png");
  images[4] = loadImage("logs.png");
  images[5] = loadImage("settings.png");
  images[6] = loadImage("starplaceholder.jpg"); // delet this
  images[7] = loadImage("customization.jpg");
  images[8] = loadImage("lizard3.png");
  images[9] = loadImage("lizard1.png");
  images[10] = loadImage("lizard2.png");
  hatImages[0] = loadImage("TopHat.png");
  hatImages[1] = loadImage("SortingHat.png");
  hatImages[2] = loadImage("WizardHat.png");
  appState = 6;
  frameRate(60);
  
starCount = 3;
hatEquipped = 2;
  
}


void draw(){
  
  switch(appState){
    case 0:
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
      Settings.render();
      break;
    case 7:
      Customization.render();
      break; //<>//
      
    }
  
  Menu.render();

}
  
 

void mouseClicked(){
  if(init == false){
  Customization.setupButtons();
  init = true;
  }
  //println("-----");
  //println(mouseX);
  //println(mouseY);
  
  // --- BUTTONS CLICK FUNCTION FOR CUSTOMIZATION ---
  if(Customization.InventoryButton.mouseHovered() && appState == 7){
    Customization.pageState = 1;
  }
  if(Customization.ShopButton.mouseHovered() && appState == 7){
    Customization.pageState = 2;
  }
  
  // --- BUTTONS FOR EQUIPPING HATS ---
  if(appState == 7 && Customization.slot0Hovered() && Customization.pageState == 1){
    hatEquipped = Customization.inventorySlots[0];
  } //<>//
  if(appState == 7 && Customization.slot1Hovered() && Customization.pageState == 1){
    hatEquipped = Customization.inventorySlots[1];
  }
}

void keyPressed(){
  if(keyCode == LEFT){
    appState--;
  }
  if(keyCode == RIGHT){
    appState++;
  } //<>//
}


//--SAVE FUNCTION--
void saveData(){
  
}

//--LOAD FUNCTION--
void loadData(){
  
}
