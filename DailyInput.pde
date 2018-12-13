class DailyInput {
  int pageState = 0; // 0 is default, 1 is when the popup window appears, 2 is wakeup minute input is active, 3 when hour active, 4 is bedtime minute input is active, 5 bedtime hour active
  int productive = 0, energy = 0; // 0 is when nothing is selected, 1 is productive/energetic, 2 is unproductive/tired
  boolean save = false; // turns true when everything is filled out, and the data can be saved
  int wakeTimeHour = 0, wakeTimeMinute = 0, bedTimeHour = 0, bedTimeMinute = 0;
  int wakeHourSize = 25, wakeMinuteSize = 25, bedHourSize = 25, bedMinuteSize = 25;

  void render() {
    image(images[1], 0, 0, width, height);
    image(images[11], width/2, height*0.76, 282, 190);

    Customization.equipHat(width*1.65, height*0.82, 0.6, 20);

    // outlines for the selected input
    rectMode(CENTER);
    strokeWeight(10);
    noFill();
    stroke(255);
    if (productive == 1) {
      rect(width*0.25, height*0.345, 167, 43, 15);
    }
    if (productive == 2) {
      rect(width*0.75, height*0.345, 167, 43, 15);
    }
    if (energy == 1) {
      rect(width*0.25, height*0.47, 167, 43, 15);
    }
    if (energy == 2) {
      rect(width*0.75, height*0.47, 167, 43, 15);
    }
    strokeWeight(5);
    // wakeup/bed- time
    if (pageState == 2 || pageState == 3) {
      rect(width*0.255, height*0.715, 163, 31, 20);
    }
    if (pageState == 4 ||pageState == 5) {
      rect(width*0.255, height*0.82, 163, 31, 20);
    }
    strokeWeight(1);


    if (pageState == 1) {
      int yescol = 0, nocol = 0;
      if (yesHovered()) {
        yescol = 255;
      } else {
        yescol = 0;
      }
      if (noHovered()) {
        nocol = 255;
      } else {
        nocol = 0;
      }
      rectMode(CENTER);
      strokeWeight(1);
      fill(210, 210, 210, 210);
      rect(width/2, height/2, width-20, 300, 20);
      fill(0);
      textSize(60);
      textAlign(CENTER);
      text("Do you want me to set an alarm"+ENTER+"for your wake-up time?", width/2, height*0.4);
      strokeWeight(13);
      line(width/2, height*0.55, width/2, height*0.66);
      fill(yescol);
      text("YES", width*0.25, height*0.63);
      fill(nocol);
      text("NO", width*0.75, height*0.63);
    }
    textSize(20);
    fill(255);
    textAlign(CENTER);
    text("OK", width*0.38, height*0.725);
    text("OK", width*0.38, height*0.83);

    // for the wake-up / bedtime input
    switch(pageState) {
    case 2:
      wakeHourSize = 35;
      wakeMinuteSize = 25;
      bedHourSize = 25;
      bedMinuteSize = 25;
      break;
    case 3:
      wakeMinuteSize = 35;
      wakeHourSize = 25;
      bedHourSize = 25;
      bedMinuteSize = 25;
      break;
    case 4:
      bedHourSize = 35;
      wakeHourSize = 25;
      wakeMinuteSize = 25;
      bedMinuteSize = 25;
      break;
    case 5:
      bedMinuteSize = 35;
      wakeHourSize = 25;
      wakeMinuteSize = 25;
      bedHourSize = 25;
      break;
    default:
      bedHourSize = 25;
      wakeHourSize = 25;
      wakeMinuteSize = 25;
      bedMinuteSize = 25;
      break;
    }
    textSize(wakeHourSize);
    text(wakeTimeHour+"  :", width*0.25, height*0.725);
    textSize(wakeMinuteSize);
    text(wakeTimeMinute, width*0.3, height*0.725);
    textSize(bedHourSize);
    text(bedTimeHour+"  :", width*0.25, height*0.83);
    textSize(bedMinuteSize);
    text(bedTimeMinute, width*0.3, height*0.83);
    fill(255);
    textSize(33);
    text("Max hour value: 23, max minute value: 59",width*0.45,height*0.65);
  }

  boolean productiveHovered() {
    if (mouseX>width*0.07 && mouseX<width*0.43 && mouseY>height*0.32 && mouseY<height*0.37 && appState == 2) {
      return true;
    } else {
      return false;
    }
  }

  boolean unproductiveHovered() {
    if (mouseX>width*0.57 && mouseX<width*0.93 && mouseY>height*0.32 && mouseY<height*0.37 && appState == 2) {
      return true;
    } else {
      return false;
    }
  }

  boolean energizedHovered() {
    if (mouseX>width*0.07 && mouseX<width*0.43 && mouseY>height*0.44 && mouseY<height*0.5 && appState == 2) {
      return true;
    } else {
      return false;
    }
  }

  boolean tiredHovered() {
    if (mouseX>width*0.57 && mouseX<width*0.93 && mouseY>height*0.44 && mouseY<height*0.5 && appState == 2) {
      return true;
    } else {
      return false;
    }
  }

  boolean wakeTimeHovered() {
    if (mouseX>width*0.08 && mouseX<width*0.43 && mouseY>height*0.7 && mouseY<height*0.73 && appState == 2 && pageState != 3) {
      return true;
    } else {
      return false;
    }
  }

  boolean bedTimeHovered() {
    if (mouseX>width*0.08 && mouseX<width*0.43 && mouseY>height*0.8 && mouseY<height*0.84 && appState == 2 && pageState != 5) {
      return true;
    } else {
      return false;
    }
  }

  boolean saveHovered() {
    if (mouseX>width*0.096 && mouseX<width*0.177 && mouseY>height*0.89 && mouseY<height*0.945 && appState == 2) {
      return true;
    } else {
      return false;
    }
  }

  boolean yesHovered() {
    if (mouseX>width*0.072 && mouseX<width*0.477 && mouseY>height*0.544 && mouseY<height*0.67 && pageState == 1 && appState == 2) {
      return true;
    } else {
      return false;
    }
  }

  boolean noHovered() {
    if (mouseX>width*0.519 && mouseX<width*0.964 && mouseY>height*0.544 && mouseY<height*0.67 && pageState == 1 && appState == 2) {
      return true;
    } else {
      return false;
    }
  }

  boolean wakeOkHovered() {
    if (mouseX>width*0.362 && mouseX<width*0.426 && mouseY>height*0.7 && mouseY<height*0.74 && appState == 2 && pageState>1 && pageState<4) {
      return true;
    } else {
      return false;
    }
  }


  boolean bedOkHovered() {
    if (mouseX>width*0.362 && mouseX<width*0.426 && mouseY>height*0.804 && mouseY<height*0.834 && pageState == 4 || pageState == 5 && appState == 2) {
      return true;
    } else {
      return false;
    }
  }

  boolean wakeHourHovered() {
    if (mouseX>width*0.191 && mouseX<width*0.253 && mouseY>height*0.804 && mouseY<height*0.834 && pageState == 2 || pageState == 3 && appState == 2) {
      return true;
    } else {
      return false;
    }
  } 

  boolean wakeMinuteHovered() {
    if (mouseX>width*0.253 && mouseX<width*0.33 && mouseY>height*0.7 && mouseY<height*0.74 && pageState == 2 || pageState == 3 && appState == 2) {
      return true;
    } else {
      return false;
    }
  } 

  boolean bedHourHovered() {
    if (mouseX>width*0.191 && mouseX<width*0.253 && mouseY>height*0.804 && mouseY<height*0.834 && appState == 2) {
      return true;
    } else {
      return false;
    }
  } 

  boolean bedMinuteHovered() {
    if (mouseX>width*0.253 && mouseX<width*0.33 && mouseY>height*0.804 && mouseY<height*0.834 && appState == 2) {
      return true;
    } else {
      return false;
    }
  }
}
