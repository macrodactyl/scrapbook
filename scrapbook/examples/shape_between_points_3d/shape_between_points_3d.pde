float x1 = -200;
float y1 = 0;
float z1 = 0;
float x2 = 200;
float y2 = 200;
float z2 = 0;

float plane_width = 20;

void setup() {
  size(500,500,P3D);
}

void draw() {
  translate(width/2, height/2);
  
  background(255);
  
  draw_plane_along_line(x1,y1,x2,y2, plane_width);
  
  line(x1,y1,x2,y2);
}

float get_angle_of_line(float x1, float y1, float z1, float x2, float y2, float z2) {
  float x_delta = x2 - x1;
  float y_delta = y2 - y1;
  return atan2(y_delta, x_delta);
}

void draw_plane_along_line(float x1, float y1, float z1, float x2, float y2, float z2, float w) {
  
  float angle = get_angle_of_line(x1,y1,x2,y2);
  println(angle);
  float angle_left = angle - HALF_PI;
  println(angle_left);
  float angle_right = angle + HALF_PI;
  println(angle_right);
  
  float left_corner_x = w/2 * cos(angle_left) + x1;
  float left_corner_y = w/2 * sin(angle_left) + y1;
  //line(x1,y1,left_corner_x,left_corner_y);
  
  float right_corner_x = w/2 * cos(angle_right) + x1;
  float right_corner_y = w/2 * sin(angle_right) + y1;
  //line(x1,y1,right_corner_x,right_corner_y);
  
  float end_left_corner_x = w/2 * cos(angle_left) + x2;
  float end_left_corner_y = w/2 * sin(angle_left) + y2;
  //line(x2,y2,end_left_corner_x,end_left_corner_y);
  
  float end_right_corner_x = w/2 * cos(angle_right) + x2;
  float end_right_corner_y = w/2 * sin(angle_right) + y2;
  //line(x2,y2,end_right_corner_x,end_right_corner_y);
  
  beginShape();
  vertex(left_corner_x, left_corner_y);
  vertex(end_left_corner_x, end_left_corner_y);
  vertex(end_right_corner_x, end_right_corner_y);
  vertex(right_corner_x, right_corner_y);
  endShape(CLOSE);
  
}