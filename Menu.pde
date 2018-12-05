class Menu {
  PVector MenuSize = new PVector(width/2, height/3);

  MCButton[] MenuButtons = new MCButton[7];

  Menu() {
    for (int i = 0; i < MenuButtons.length; i++) {
    //  MenuButtons[i].buttonColor = color(0);
    //  MenuButtons[i].Label.textColor = color(255);
    //  MenuButtons[i].start = new PVector (MenuSize.x/2, MenuSize.y/MenuButtons.length*(i+1)-(MenuSize.y/MenuButtons.length)/2);
    //  MenuButtons[i].size = new PVector(MenuSize.x/2, MenuSize.y/MenuButtons.length*(i+1));
    }
    //MenuButtons[0].Label.Text = "Menu";
    //MenuButtons[1].Label.Text = "Shop";
    //MenuButtons[2].Label.Text = "Daily input";
    //MenuButtons[3].Label.Text = "Alarm";
    //MenuButtons[4].Label.Text = "Sleep timer";
    //MenuButtons[5].Label.Text = "Logs";
    //MenuButtons[6].Label.Text = "Settings";
  }

  void render() {
    for (int i = 0; i < MenuButtons.length; i++) {
      MenuButtons[6].render();
    }
  }
}
