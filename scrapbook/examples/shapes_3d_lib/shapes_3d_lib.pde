import shapes3d.*;
import shapes3d.animation.*;
import shapes3d.utils.*;

Tube tube;
 
void setup(){
  size(600,600,P3D);
  tube = new Tube(this, 1, 3);
  tube.setSize(1,1,1,1);
  tube.fill(color(200,40,40));
  //tube.fill(color(200,200,40), Tube.BOTH_CAP);
  tube.drawMode(Shape3D.SOLID);
  //tube.drawMode(Shape3D.SOLID, Tube.BOTH_CAP);
  tube.setWorldPos(0,0,0, 100,100,100);
}
 
void draw(){
  translate(width/2, height/2);
  background(0);
  tube.draw();
}