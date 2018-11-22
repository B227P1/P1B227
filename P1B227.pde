//Main file subject to change <mikkel was here>
MCButton homeB;
MCButton gecbutton;
Counter counter = new Counter();

void setup(){
  size(470,832);
  homeB = new MCButton();
  gecbutton = new MCButton();
  homeB.setText("Mi van gecc");
  homeB.setPosSize(new PVector(60,60),new PVector(50,50));
  
  
}

void draw(){
  background(100);
  homeB.setBColor(200,200,10);
  homeB.render();
  if(homeB.mouseHovered() == true){
    homeB.setBColor(0,0,200);
  }
  
  text(counter.getHour()+" "+counter.getMinute()+" "+counter.getSecond(),width/2,height/2);
}

void mouseClicked(){
  
  if(homeB.mouseHovered() == true){
    //rect(width/2,height/2,200,200,20);
    counter.startTimer();
  }
}
void keyPressed(){
  counter.stopTimer(); //<>//
}
