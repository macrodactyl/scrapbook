int steps = 50;

void setup() {
  fullScreen(P3D);
  
  background(0);
  stroke(255);
  noFill();
}

void draw() {
  translate(width/2, height/2);
  bezier(0, 0, 200, 200, 100, -100, 100, -100);
  
  for (int i = 0; i <= steps; i++) {
    float t = i / float(steps);
    float x = bezierPoint(0, 200, 100, 100, t);
    float y = bezierPoint(0, 200, -100, -100, t);
    ellipse(x, y, 5, 5);
  }  
}