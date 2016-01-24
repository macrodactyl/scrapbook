void setup() {
  size(500, 500);
  background(0);
  //stroke(255);
}

void draw() {
  translate(width/2, height/2);
  
  stroke(255, 0, 0);
  
  float direction = 1;
  float distance = 200;
  
  float dest_x = distance * cos(direction);
  float dest_y = distance * sin(direction);
  
  line(0,0,dest_x,dest_y);
}