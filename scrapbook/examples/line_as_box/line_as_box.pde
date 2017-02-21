void setup() {
  size(500,500, P3D);
}

void draw() {
  
  translate(width/2, height/2);
  line(0,0,0,100,0,0);
  
  translate(0, 100);
  noStroke();
  fill(0);
  box(100, 1, 1);
}