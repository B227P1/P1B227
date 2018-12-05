
class Customization{
int pageState = 1;
byte[] hatsOwned = new byte[3];
//PVector 

  MCButton InventoryButton = new MCButton();
  MCButton ShopButton = new MCButton();
  
Customization(){
  hatsOwned[0] = 1;
  hatsOwned[1] = 1;
  hatsOwned[2] = 0;
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
   fill(0);
   text(starCount,width/5,height/7);
   shape(starShape,width/5+30,height/6-40,40,40);
   
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
   
   if(pageState == 1){
     
     for(int i = 0; i < hatImages.length; i++){
       if(hatsOwned[i] == 1){
         pushMatrix();
         scale(0.7);
         image(hatImages[i],i*170+30,height*1.1);
         popMatrix();
   }}}
   
   InventoryButton.render();
   ShopButton.render();
 }
  
}
