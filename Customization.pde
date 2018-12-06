
class Customization{
int pageState = 1;
byte[] hatsOwned = new byte[3];
byte[] inventorySlots = new byte[2];


  MCButton InventoryButton = new MCButton();
  MCButton ShopButton = new MCButton();
  
Customization(){
  hatsOwned[0] = 1;
  hatsOwned[1] = 0;
  hatsOwned[2] = 1;
}
  
 void setupButtons(){
   InventoryButton.start = new PVector(sizeX/4,sizeY/6*4);
   InventoryButton.size = new PVector(sizeX/4,25);
   InventoryButton.Label.Text = "Inventory";
   ShopButton.start = new PVector(sizeX/4*3,sizeY/6*4);
   ShopButton.size = new PVector(sizeX/4,25);
   ShopButton.Label.Text = "Shop";
 }
 
 void render(){
   image(images[7],0,0,width,height);
   textSize(40);
   fill(255);
   text(starCount,width/5,height/6);
   shape(starShape,width/5+25,height/6-17,40,40);
   
   if(pageState == 1){
     InventoryButton.buttonColor = color(155);
   }else if(InventoryButton.mouseHovered()){
     InventoryButton.buttonColor = color(200);
   }else{
     InventoryButton.buttonColor = color(255);
   }
   if(pageState == 2){
     ShopButton.buttonColor = color(155);
   }else if(ShopButton.mouseHovered()){
     ShopButton.buttonColor = color(200);
   }else{
     ShopButton.buttonColor = color(255);
   }
   imageMode(CENTER);
   image(images[8],width/2,height/2*0.9,300,215);
   equipHat();
   imageMode(CORNER);
   
   if(pageState == 1){   
     byte j = 0;
     for(byte i = 0; i < hatImages.length; i++){
       if(hatsOwned[i] == 1){
         pushMatrix();
         scale(0.7);
         image(hatImages[i],j*330+50,height*1.02);
         popMatrix();
         inventorySlots[j] = i;
         j++;
         if(hatEquipped == i){
           ellipse(j*125+50,height/6*4.5,20,20);
         }
   }}}
   
   if(pageState == 2){
     int j = 0;
     for(int i = 0; i < hatImages.length; i++){
       if(hatsOwned[i] == 0){
         pushMatrix();
         scale(0.7);
         image(hatImages[i],j*330+50,height*1.02);
         popMatrix();
         j++;
       }}}

   
   InventoryButton.render();
   ShopButton.render();
 }

  void equipHat(){
   pushMatrix();
   scale(0.6);
   rotate(radians(-20));
   switch(hatEquipped){
     case 0:
       image(hatImages[0],width/2*1.15,height/2*1.38);
       break;
     case 1:
       image(hatImages[1],width/2*1.15,height/2*1.38);
       break;
     case 2:
       image(hatImages[2],width/2*1.15,height/2*1.38);
       break;
   }
   popMatrix();
  }
  
  boolean slot0Hovered(){
    if(mouseX>width*0.07 && mouseX<width*0.4 && mouseY>height*0.71 && mouseY<height*0.9){
      return true;
    }else{
      return false;
    }}
    
  boolean slot1Hovered(){
    if(mouseX>width*0.61 && mouseX<width*0.87 && mouseY>height*0.71 && mouseY<height*0.9){
      return true;
    }else{
      return false;
    }}
}
