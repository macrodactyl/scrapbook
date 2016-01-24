float direction = 0;
float direction_noise_coordinate = 0;
float distance = 5;
float x = 0;
float y = 0;

void setup() {
  fullScreen();
  background(0);
  stroke(255);
}

void draw() {
  
  translate(width/2, height/2);
  
  float new_x = distance * cos(direction) + x;
  float new_y = distance * sin(direction) + y;
  
  line(x, y, new_x, new_y);
  
  x = new_x;
  y = new_y;
  
  direction_noise_coordinate += 0.01;
  float direction_change = noise(direction_noise_coordinate) - 0.5;
  direction += direction_change;
}