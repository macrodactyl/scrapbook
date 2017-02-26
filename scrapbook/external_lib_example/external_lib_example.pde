import shapes3d.*;
import shapes3d.animation.*;
import shapes3d.utils.*;

Box box;

void setup() {
  size(400, 400, P3D);
  box = new Box(this);
  box.setSize(100, 100, 100);
  box.rotateTo(radians(45), radians(45), radians(45));
}

void draw() {
  translate(width/2, height/2);
  box.draw();
}