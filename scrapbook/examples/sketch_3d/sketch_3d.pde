void setup() {
  size(500, 500, P3D);
  
}

float camera_x = -500;
float camera_y = 0;

void draw() {
  background(0);

  camera(camera_x, camera_y, 500, 
         0, 0, 0, 
         0, 1, 0);
  
  // draw cube
  stroke(255);
  noFill();
  box(200);
  
  translate(100, 100, 100);
  box(50);
  translate(-200, -200, -200);
  box(75);
  
  camera_x++;
}