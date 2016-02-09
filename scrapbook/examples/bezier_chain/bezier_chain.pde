void setup() {
  fullScreen(P3D);
  
  background(0);
  stroke(255);
  noFill();
}

class Point {
  float xpos, ypos;
  
  Point(float x, float y) {
    xpos = x;
    ypos = y;
  }
  
  public float get_x() {
    return xpos;
  }
  
  public float get_y() {
    return ypos;
  }
}

class Bezier {
  Point start, start_control, end_control, end;
  
  Bezier(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4) {
    start = new Point(x1, y1);
    start_control = new Point(x2, y2);
    end_control = new Point(x3, y3);
    end = new Point(x4, y4);
  }
  
  Bezier(Bezier previous, float x3, float y3, float x4, float y4) {
    // the start point should meet the previous end point,
    // and the start control should mirror the previous end control
    
    start = previous.get_end();
    
    float control_x_delta = previous.get_end_control().get_x() - start.get_x();
    float control_y_delta = previous.get_end_control().get_y() - start.get_y();
    
    float control_x = start.get_x() + (-control_x_delta);
    float control_y = start.get_y() + (-control_y_delta);
    
    start_control = new Point(control_x, control_y);
    
    end_control = new Point(x3, y3);
    end = new Point(x4, y4);
  }
  
  Point get_end() {
    return end;
  }
  
  Point get_end_control() {
    return end_control;
  }
  
  void draw() {
    bezier(
      start.get_x(), start.get_y(),
      start_control.get_x(), start_control.get_y(),
      end_control.get_x(), end_control.get_y(),
      end.get_x(), end.get_y()
    );
  }
}

void draw() {
  translate(width/2, height/2);
  
  stroke(color(255, 0, 0));
  Bezier bezier1 = new Bezier(-200, -200, -50, -200, 0, -50, 0, 0);
  bezier1.draw();
  
  stroke(color(255, 255, 0));
  Bezier bezier2 = new Bezier(bezier1, -25, 100, 100, 100);
  bezier2.draw();
  
  stroke(color(0, 255, 0));
  Bezier bezier3 = new Bezier(bezier2, 50, -200, -200, 100);
  bezier3.draw();
}