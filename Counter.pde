// Counter class, to time the amount of sleep the user gets.

class Counter{
  int startTime = 0,timeSum = 0;
  boolean running = false;
  
  
// Starts the timer  
void startTimer(){
  startTime = millis();
  running = true;
}
// Stops the timer
void stopTimer(){
  running = false;
  timeSum = startTime+(millis()-startTime);
}

// Calculates the time elapsed since starting the timer
void currentTime(){
  if(running == true){
  
  }
}
// returns the seconds passed
int getSecond(){
  return timeSum/1000%60;
} 
// returns the minutes passed
int getMinute(){
return timeSum/1000/60%60;
}
// returns the hours passed
int getHour(){
  return timeSum/1000/60/60%24;
}
}
