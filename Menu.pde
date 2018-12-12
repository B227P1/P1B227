class Menu {
  PImage Burger = loadImage("Burger.png");
  Boolean Open = false;
  int MenuAmount = 6;
  PVector MenuSize = new PVector(width/2, height/3), BurgerOffset = new PVector(width*0.05, width*0.05), BurgerSize = new PVector(width*0.15, width*0.15);
  ArrayList<MCButton> MenuButtons = new ArrayList<MCButton>();

  Menu() {
    for (int i = 0; i < MenuAmount; i++) {
      MenuButtons.add(new MCButton());
      MenuButtons.get(i).buttonColor = color(150);
      MenuButtons.get(i).buttonAltColor = color(200);
      MenuButtons.get(i).Label.textColor = color(255);
      MenuButtons.get(i).start = new PVector (MenuSize.x/2, MenuSize.y/MenuAmount*(i+1)-(MenuSize.y/MenuAmount/2));
      MenuButtons.get(i).size = new PVector(MenuSize.x/2, MenuSize.y/MenuAmount/2);
      MenuButtons.get(i).ColorOnHover = false;
    }
    MenuButtons.get(0).Label.Text = "Menu";
    MenuButtons.get(1).Label.Text = "Daily input";
    MenuButtons.get(2).Label.Text = "Alarm";
    MenuButtons.get(3).Label.Text = "Sleep timer";
    MenuButtons.get(4).Label.Text = "Logs";
    MenuButtons.get(5).Label.Text = "Customization";
  }

  void render() {
    stroke(200);

    if (Open) {
      for (int i = 0; i < MenuAmount; i++) {
        MenuButtons.get(i).buttonColor = color(150);
      }
      if (Open) {
        MenuButtons.get(appState-1).buttonColor = color(200);
      }

      for (int i = 0; i < MenuButtons.size(); i++) {
        MenuButtons.get(i).render();
      }
    } else {
      image(Burger, BurgerOffset.x, BurgerOffset.y, BurgerSize.x, BurgerSize.y);
    }
  }
}
