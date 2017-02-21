import macrodactyl.macrocessing.*;
import java.util.*;

Bezier bez = new Bezier(this, 0, 0, 100, 0, 100, 0, 100, 100);
Point start_point = new Point(0, 0);
Chain chain;

PApplet that = this;

void setup() {
  //fullScreen(P3D);
  size(500, 500);
  
  background(0);
  stroke(255);
  noFill();
  
  chain = new Chain();
}

class Chain {
  
  LinkedList segments = new LinkedList();
  LinkedList points = new LinkedList();
  
  Chain() {
    
    Bezier segment_1 = new Bezier(
      that,
      start_point,
      get_random_nearby_point(start_point),
      get_random_nearby_point(start_point),
      get_random_nearby_point(start_point)
    );
    
    this.add_segment(segment_1);    
  }
  
  private void add_segment(Bezier new_segment) {
    // add the segment to the list
    this.segments.add(new_segment);
    
    int steps = 50;
    
    // add the points of this segment to the point list
    for (int i = 0; i < steps; i++) {
      float t = i / float(steps);
      
      float x = bezierPoint(
        new_segment.get_start().get_x(),
        new_segment.get_start_control().get_x(),
        new_segment.get_end_control().get_x(),
        new_segment.get_end().get_x(),
        t
      );

      float y = bezierPoint(
        new_segment.get_start().get_y(),
        new_segment.get_start_control().get_y(),
        new_segment.get_end_control().get_y(),
        new_segment.get_end().get_y(),
        t
      );
      
      Point step_point = new Point(x, y);
      
      this.add_point(step_point);
    }
  }
  
  private void add_point(Point new_point) {
    this.points.add(new_point);
  }
  
}

Point get_random_nearby_point(Point source_point) {
  Point nearby_point = new Point(
    source_point.get_x() + random(-50, 50),
    source_point.get_y() + random(-50, 50)
  );
  return nearby_point;
}

void draw() {
  translate(width/2, height/2);
  
  Bezier bez = (Bezier)chain.segments.getFirst();
  bez.draw();
}