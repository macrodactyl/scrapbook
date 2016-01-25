Arc[] arcs = new Arc[2];
float speed = 2;

void setup() {
  fullScreen();
  background(0);
  stroke(255);
  
  arcs[0] = new Arc(0, PI, 100);
  arcs[1] = new Arc(0, PI, 200);
}

class Arc {  
  //public float start_angle;
  float _end_angle;
  float _radius;
  float _current_angle;
  float x;
  float y;
  
  Arc(float start_angle, float end_angle, float radius) {
    _current_angle = start_angle;
    _end_angle = end_angle;
    _radius = radius;
    
    x = radius * cos(_current_angle);
    y = radius * sin(_current_angle);
  }
  
  public void trace(float distance) {    
    float angle_delta = distance/_radius;
    float new_angle = _current_angle + angle_delta;
    
    if (new_angle <= _end_angle) {
      float new_x = _radius * cos(new_angle);
      float new_y = _radius * sin(new_angle);
      
      line(x, y, new_x, new_y);
      
      x = new_x;
      y = new_y;
      
      _current_angle = new_angle;      
    }  
  }
}

void draw() {
  
  translate(width/2, height/2);
  
  for (int i = 0; i < arcs.length; i++) {
    arcs[i].trace(speed);
  }  
}

/// notes:
/// arc distance = radians * radius
/// therefore:
/// arc_distance/radius = radians