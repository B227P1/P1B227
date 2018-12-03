class Menu {
  PVector MenuSize = new PVector(width/2, height/3);

  MCButton[] MenuButtons = new MCButton[7];

  void Menu () {
    for (int i = 0; i < MenuButtons.length; i++) {
      MenuButtons[i].buttonColor = color(0);
      MenuButtons[i].Label.textColor = color(255);
      
    }
  }

  void render() {
  }
}
