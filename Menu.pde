class Menu {
  PImage Burger = loadImage("Burger.png"); //loats the image of the hamburger menu icon into burger
  Boolean Open = false; //boolean used to check of the menu is open or not
  int MenuAmount = 6; //amount of menu items
  PVector MenuSize = new PVector(width/2, height/3), BurgerOffset = new PVector(width*0.05, width*0.05), BurgerSize = new PVector(width*0.15, width*0.15); //sets the size of the dropdown menu as a vector width and height, sets the offset of the hamburger icon, sets the size of the hamburger icon  
  ArrayList<MCButton> MenuButtons = new ArrayList<MCButton>(); //instantiets an empty arraylist of the class MCButton to MenuButtons

  //Class constructer functions like a setup as it runs once when instantiated 
  Menu() {
    //instantiates an amount of buttons equal to MenuAmount, width the same button color, buttonaltcolor, text color, and size, and with disabled alternative color on hover. each of the buttons position is shifted down by MenuSize.y/MenuAmount*(i+1)
    for (int i = 0; i < MenuAmount; i++) { 
      MenuButtons.add(new MCButton());
      MenuButtons.get(i).buttonColor = color(150);
      MenuButtons.get(i).buttonAltColor = color(200);
      MenuButtons.get(i).Label.textColor = color(255);
      MenuButtons.get(i).start = new PVector (MenuSize.x/2, MenuSize.y/MenuAmount*(i+1)-(MenuSize.y/MenuAmount/2));
      MenuButtons.get(i).size = new PVector(MenuSize.x/2, MenuSize.y/MenuAmount/2);
      MenuButtons.get(i).ColorOnHover = false;
    }
    //sets the texts for each of the buttons
    MenuButtons.get(0).Label.Text = "Menu";
    MenuButtons.get(1).Label.Text = "Daily input";
    MenuButtons.get(2).Label.Text = "Alarm";
    MenuButtons.get(3).Label.Text = "Sleep timer";
    MenuButtons.get(4).Label.Text = "Logs";
    MenuButtons.get(5).Label.Text = "Customization";
  }

  //Render functon that works like draw, if it gets called in draw it draws the class to the screen
  void render() {
    stroke(200); //sets the color of the outline of the menu

    //check if the main menu is open or closed and renders it either the menu or the hamburger icon dependent on that
    if (Open) {
      for (int i = 0; i < MenuAmount; i++) {
        MenuButtons.get(i).buttonColor = color(150);
      }
      if (Open) {
        MenuButtons.get(appState-1).buttonColor = color(200);
      }

      //renders all the buttons if menu is open
      for (int i = 0; i < MenuButtons.size(); i++) {
        MenuButtons.get(i).render();
      }
    } else {
      image(Burger, BurgerOffset.x, BurgerOffset.y, BurgerSize.x, BurgerSize.y);
    }
  }
}
