Mover[] movers = new Mover[1];
float speed = 2;

class Mover {
  float _current_angle;
  float current_radius = 0;
  Float end_angle; // captialised Float allows nulls
  Float end_radius = null; // captialised Float allows nulls
  float x = 0;
  float y = 0;
  int _move_mode;
  
  Mover(float start_angle, int start_move_mode) { // float start_radius, 
    _current_angle = start_angle;
    _move_mode = start_move_mode;
  }
  
  public void move(float frame_distance) {
    
    float new_x = 0; // initialising these two temporarily while filling out switch statement
    float new_y = 0;    
    
    switch (_move_mode) {
      case 0:
        // move outwards
        end_angle = null; //<>//
        
        if (end_radius == null) {
          end_radius = random(25) + current_radius;
        }
        
        float new_radius = current_radius + frame_distance;
        if (new_radius > end_radius) {
          new_radius = end_radius;
          //_move_mode = floor(random(2)) + 1; // get either a 1 or a 2
          _move_mode = 1; // just move clockwise for now...
        }
        
        new_x = new_radius * cos(_current_angle);
        new_y = new_radius * sin(_current_angle);
        
        current_radius = new_radius;
        
        break;
        
      case 1:
        // move clockwise
        
        end_radius = null;
        
        if (end_angle == null) {          
          // calculate the new sidewards destination angle
          
          // instead of picking a random angle, pick a random distance.
          // this compensates for the fact that arc lengths get larger
          // the further you go from the centre.
          float new_distance = random(200);
          
          // then calculate the destination angle from that distance.
          /// radians = arc_distance/radius
          float additional_angle = new_distance/current_radius;
          end_angle = _current_angle + additional_angle;
        }
        
        // by this point, we know the end angle.
        // now we need to draw the next frame.
        // we know the distance we need to move per frame.
        // so we calculate the new angle based on that distance.
        /// radians = arc_distance/radius
        float angle_delta = frame_distance/current_radius;
        float new_angle = _current_angle + angle_delta;
        
        if (new_angle > end_angle) {
          new_angle = end_angle;
          _move_mode = 0; // back to outwards
        }
        
        new_x = current_radius * cos(new_angle);
        new_y = current_radius * sin(new_angle);
        
        _current_angle = new_angle;
        
        break;
      case 2:
        // move anti-clockwise
        break;
    }
    
    line(x, y, new_x, new_y);
  
    x = new_x;
    y = new_y;
    
  }
}

void setup() {
  fullScreen();
  background(0);
  stroke(255);
  
  movers[0] = new Mover(0, 0);
}

void draw() {
  
  translate(width/2, height/2);
  
  for (int i = 0; i < movers.length; i++) {
    movers[i].move(speed);
  }  
  
}