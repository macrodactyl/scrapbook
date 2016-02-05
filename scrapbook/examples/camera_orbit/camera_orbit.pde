void setup() {
  background(0);
  fullScreen(P3D);
}

float camera_angle = HALF_PI;
float camera_x = 0;
float camera_y = -300;
float camera_z = 0;
float radius = 500;
float speed = 1;

float subject_x = 0;
float subject_y = 0;
float subject_z = 0;

void draw() {
  background(0);
  
  move_camera();
  
  draw_cubes();
}

void move_camera() {
  camera_x = radius * cos(camera_angle);
  camera_z = radius * sin(camera_angle);
  
  camera(camera_x, camera_y, camera_z, // camera position
          subject_x, subject_y, subject_z, // pointing at
          0, 1, 0); // choose 'up'
          
  camera_angle += 0.003;
}

void draw_cubes() {
  stroke(255);
  noFill();
  box(200);
  
  translate(100, 100, 100);
  box(50);
  translate(-200, -200, -200);
  box(75);
}

/// notes:
/// arc distance = radians * radius
/// therefore:
/// arc_distance/radius = radians