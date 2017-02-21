float camera_y = -100;
float radius = 500;

float subject_x = 0;
float subject_y = 0;
float subject_z = 0;

void setup() {
  size(500, 500, P3D);
}

void draw() {

  move_camera();
  
  background(191);
  
  beginShape(QUAD_STRIP);
  vertex(-50,-50,0);
  vertex(-50,-50,-300);
  vertex(50,-50,0);
  vertex(50,-50,-300);
  vertex(50,50,0);
  vertex(50,50,-300);
  vertex(-50,50,0);
  vertex(-50,50,-300);
  vertex(-50,-50,0);
  vertex(-50,-50,-300);
  endShape();
  
  
}

void move_camera() {
  
  float camera_angle = float(mouseX) / width * TWO_PI + HALF_PI;  
  float camera_x = radius * cos(camera_angle);
  float camera_z = radius * sin(camera_angle);
  
  camera(camera_x, camera_y, camera_z, // camera position
          subject_x, subject_y, subject_z, // pointing at
          0, 1, 0); // choose 'up'
}