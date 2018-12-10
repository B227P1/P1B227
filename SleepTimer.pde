class SleepTimer {
  MCButton StartStop;


  SleepTimer() {
    StartStop = new MCButton();
    StartStop.start = new PVector(width-50, 50);
    StartStop.size = new PVector(33, 33);
    StartStop.Label.Text = "Pm" ;
    StartStop.buttonColor = color(155, 155, 155, 30);
    StartStop.Label.textColor = color(255);
  }


  void render() {
    image(images[3], 0, 0, width, height);



    stroke(150);
    StartStop.render();
  }
}
