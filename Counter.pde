// Counter class, to time the amount of sleep the user gets. //<>//

class Counter {
  long startTime, timeSum;
  boolean running = false;
  long[] sleepTimes = new long[0];

  // Starts the timer  
  void startTimer() {
    startTime = System.currentTimeMillis();
    running = true;
  }
  // Stops the timer
  void stopTimer() {
    running = false;
    timeSum = startTime+(millis()-startTime);
  }

  // Calculates the time elapsed since starting the timer
  void currentTime() {
    if (running == true) {
    }
  }
  // returns the seconds passed
  long getSecond() {
    return timeSum/1000%60;
  } 
  // returns the minutes passed
  long getMinute() {
    return timeSum/1000/60%60;
  }
  // returns the hours passed
  long getHour() {
    return timeSum/1000/60/60%24;
  }

  // saves the time | UNFINISHED
  void saveTime() {
    //sleepTimes = append(sleepTimes,timeSum); // fix this
  } //<>// //<>// //<>// //<>//
}
