import macrodactyl.macrocessing.*;
import java.util.*;

Bezier bez = new Bezier(this, 0, 0, 100, 0, 100, 0, 100, 100);

void setup() {
  fullScreen(P3D);
  
  background(0);
  stroke(255);
  noFill();
}

void draw() {
  delay(1000);
  
  translate(width/2, height/2);
  
  bez.draw();
  
  Point current_end = bez.get_end();
  Point new_end = new Point(current_end.get_x() + random(-100, 100), current_end.get_y() + random(-100, 100));
  Point new_control = new Point(current_end.get_x() + random(-100, 100), current_end.get_y() + random(-100, 100));
  
  bez = new Bezier(this, bez, new_control.get_x(), new_control.get_y(), new_end.get_x(), new_end.get_y());
}