
class Customization{
int pageState = 1;
int[] hatsOwned = new int[3];
byte[] inventorySlots = new byte[2];
byte[] hatPrices = new byte[3];


  MCButton InventoryButton = new MCButton();
  MCButton ShopButton = new MCButton();
  
Customization(){
  hatPrices[0] = 5;
  hatPrices[1] = 8;
  hatPrices[2] = 10;
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
     InventoryButton.buttonColor = color(155,155,155,30);
   }else if(InventoryButton.mouseHovered()){
     InventoryButton.buttonColor = color(200,200,200,30);
   }else{
     InventoryButton.buttonColor = color(255,255,255,30);
   }
   if(pageState == 2){
     ShopButton.buttonColor = color(155,155,155,30);
   }else if(ShopButton.mouseHovered()){
     ShopButton.buttonColor = color(200,200,200,30);
   }else{
     ShopButton.buttonColor = color(255,255,255,30);
   }
   imageMode(CENTER);
   image(images[8],width/2,height/2*0.9,300,215);
   equipHat(width/2*1.15,height/2*1.38,0.6,-20);
   imageMode(CORNER);
   
   // INVENTORY WINDOW
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
   
   // SHOP WINDOW
   if(pageState == 2){
     byte j = 0;
     for(byte i = 0; i < hatImages.length; i++){
       if(hatsOwned[i] == 0){
         pushMatrix();
         scale(0.7);
         image(hatImages[i],j*330+50,height*1.02);
         popMatrix();
         inventorySlots[j] = i;
         shape(starShape,j*230+125,height*0.92,40,40);
         text(hatPrices[i],j*230+100,height*0.942);
         j++;
       }}}

   
   InventoryButton.render();
   ShopButton.render();
 }

  // FUNCTION TO PUT THE HAT ON THE LIZARD
  void equipHat(float xpos, float ypos, float scale, float degree){
   pushMatrix();
   scale(scale);
   rotate(radians(degree));
   switch(hatEquipped){
     case 0:
       image(hatImages[0],xpos,ypos);
       break;
     case 1:
       image(hatImages[1],xpos,ypos);
       break;
     case 2:
       image(hatImages[2],xpos,ypos);
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
