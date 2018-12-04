class Menu {
  PVector MenuSize = new PVector(width/2, height/3);

  MCButton[] MenuButtons = new MCButton[7];

  Menu() {
    for (int i = 0; i < MenuButtons.length; i++) {
      MenuButtons[i].buttonColor = color(0);
      MenuButtons[i].Label.textColor = color(255);
      MenuButtons[i].start = new PVector (MenuSize.x/2,MenuSize.y/MenuButtons.length*(i+1)-(MenuSize.y/MenuButtons.length)/2);
      MenuButtons[i].size = new PVector(MenuSize.x/2,MenuSize.y/MenuButtons.length*(i+1));
    }
    MenuButtons[0].Label.Text = "ass";
    MenuButtons[1].Label.Text = "ass";
    MenuButtons[2].Label.Text = "ass";
    MenuButtons[3].Label.Text = "ass";
    MenuButtons[4].Label.Text = "ass";
    MenuButtons[5].Label.Text = "ass";
    MenuButtons[6].Label.Text = "ass";
    
  }

  void render() {
  }
}
