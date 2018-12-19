class Customization {
  int pageState = 1;
  int[] hatsOwned = new int[3]; // determines which hats the user owns
  byte[] inventorySlots = new byte[2]; // holds the ID of the hat that is currently in a given inventory/shop slot (required for purchasing/equiping hats)
  byte[] hatPrices = new byte[3]; // stores the prices of the hats (it is in an array, to make it easier to expand, if we were to add more hats)

  // declaration of the two MCButton objects used on this page
  MCButton InventoryButton = new MCButton();
  MCButton ShopButton = new MCButton();

  // constructor that determines the hats' prices
  Customization() {
    hatPrices[0] = 5;
    hatPrices[1] = 8;
    hatPrices[2] = 10;
  }

  // as mentioned before, this is needed to properly scale the buttons for the size of the window
  void setupButtons() {
    InventoryButton.start = new PVector(sizeX/4, sizeY/6*4);
    InventoryButton.size = new PVector(sizeX/4, 25);
    InventoryButton.Label.Text = "Inventory";
    ShopButton.start = new PVector(sizeX/4*3, sizeY/6*4);
    ShopButton.size = new PVector(sizeX/4, 25);
    ShopButton.Label.Text = "Shop";
  }

  void render() {
    image(images[7], 0, 0, width, height);
    textSize(40);
    fill(255);
    text(starCount, width/5, height/6);
    shape(starShape, width/5+25, height/6-17, 40, 40);

  // changes the two button objects colors. One value is when it is active, one when the cursor is hovered over it, one when it is inactive
    if (pageState == 1) {
      InventoryButton.buttonColor = color(155, 155, 155, 30);
    } else if (InventoryButton.mouseHovered()) {
      InventoryButton.buttonColor = color(200, 200, 200, 30);
    } else {
      InventoryButton.buttonColor = color(255, 255, 255, 30);
    }
    if (pageState == 2) {
      ShopButton.buttonColor = color(155, 155, 155, 30);
    } else if (ShopButton.mouseHovered()) {
      ShopButton.buttonColor = color(200, 200, 200, 30);
    } else {
      ShopButton.buttonColor = color(255, 255, 255, 30);
    }
    
    // draws the Wizard Lizard and the currently equipped hat
    imageMode(CENTER);
    image(images[8], width/2, height/2*0.9, 300, 215);
    equipHat(width/2*1.15, height/2*1.38, 0.6, -20);
    imageMode(CORNER);

    // --- DRAWS THE INVENTORY WINDOW
    if (pageState == 1) {   
      byte j = 0; // it's a byte to save some memory and because why not (also if the hatImages array is a byte array, this has to be too (I think)
      for (byte i = 0; i < hatImages.length; i++) {
        if (hatsOwned[i] == 1) { // checks if the hat with the id of the current "i" value is owned by the user
          pushMatrix();
          scale(0.7);
          image(hatImages[i], j*330+50, height*1.02);
          popMatrix();
          inventorySlots[j] = i; // assigns the hats in the inventory to the inventorySlots (the program needs to know what is in a given slot in order to equip/purchase the right hat, when clicked on)
          j++; // the variable "j" determines the position of the hat on the X coordinate.
          if (hatEquipped == i) {
            ellipse(j*125+50, height/6*4.5, 20, 20); // draws a small ellipse on the currently equipped hat, to give some extra feedback to the user
          }
        }
      }
    }

    // --- DRAWS THE SHOP WINDOW
    if (pageState == 2) {
      byte j = 0;
      for (byte i = 0; i < hatImages.length; i++) { //it's a byte to save some memory and because why not (also if the hatImages array is a byte array, this has to be too (I think)
        if (hatsOwned[i] == 0) { // checks if the hat with the id of the current "i" value is not yet owned by the user
          pushMatrix();
          scale(0.7);
          image(hatImages[i], j*330+50, height*1.02);
          popMatrix();
          inventorySlots[j] = i; // assigns the hats in the shop to the inventorySlots (the program needs to know what is in a given slot in order to equip/purchase the right hat, when clicked on)
          shape(starShape, j*230+125, height*0.92, 40, 40);
          text(hatPrices[i], j*230+100, height*0.942); // draws the hat's price under it
          j++; //the variable "j" determines the position of the hat on the X coordinate.
        }
      }
    }

  // renders the two MCButton objects
    InventoryButton.render();
    ShopButton.render();
  }

// --- METHODS OF THE CLASS --- 

  // FUNCTION TO DRAW THE HAT ON THE LIZARD (DRAWS THE HAT THAT IS CURRENTLY EQUIPPED, HENCE THE SWITCH)
  void equipHat(float xpos, float ypos, float scale, float degree) {
    pushMatrix();
    scale(scale);
    rotate(radians(degree));
    switch(hatEquipped) {
    case 0:
      image(hatImages[0], xpos, ypos);
      break;
    case 1:
      image(hatImages[1], xpos, ypos);
      break;
    case 2:
      image(hatImages[2], xpos, ypos);
      break;
    }
    popMatrix();
  }

// determines if the cursor is hovered over any of the inventory slots
  boolean slot0Hovered() {
    if (mouseX>width*0.07 && mouseX<width*0.4 && mouseY>height*0.71 && mouseY<height*0.9) {
      return true;
    } else {
      return false;
    }
  }

  boolean slot1Hovered() {
    if (mouseX>width*0.61 && mouseX<width*0.87 && mouseY>height*0.71 && mouseY<height*0.9) {
      return true;
    } else {
      return false;
    }
  }
}
