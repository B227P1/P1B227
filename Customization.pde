
class Customization{
int pageState = 0;
  MCButton InventoryButton = new MCButton();
  MCButton ShopButton = new MCButton();
  
  
 void setupButtons(){
   InventoryButton.start = new PVector(0,sizeY/6*5);
   InventoryButton.size = new PVector(sizeX/2,50);
   InventoryButton.Label.Text = "Inventory";
 }
 
 void render(){
   image(images[7],0,0,width,height);
   textSize(40);
   fill(0);
   text(starCount,width/5,height/6);
   shape(starShape,width/5+35,height/6-38,40,40);
   
   InventoryButton.render();
   ShopButton.render();
 }
  
}
