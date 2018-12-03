
class Customization{
int pageState = 0;
  
  
  
  
 void render(){
   image(images[7],0,0,width,height);
   textSize(40);
   fill(0);
   text(starCount,width/5,height/6);
   shape(starShape,width/5+35,height/6-38,40,40);
   
 }
  
}
