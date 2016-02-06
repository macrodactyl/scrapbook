int steps = 50;
int i = 0;

void setup() {
  
  fullScreen();
  
  background(0);
  stroke(255);
  noFill();
  
}

void draw() {  
  translate(width/2, height/2);
  
  draw_section(i);
  
  i++;  
}

void draw_section(int step) {
  
  if (step > steps) { return; }

  float t = step / float(steps);
  float x = bezierPoint(0, 200, 100, 100, t);
  float y = bezierPoint(0, 200, -100, -100, t);
  
  float t2 = (step+1) / float(steps);
  float x2 = bezierPoint(0, 200, 100, 100, t2);
  float y2 = bezierPoint(0, 200, -100, -100, t2);
  
  line(x, y, x2, y2);
}