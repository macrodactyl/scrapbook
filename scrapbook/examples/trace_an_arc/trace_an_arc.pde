void setup() {
  fullScreen();
  background(0);
  stroke(255);
}

void draw() {
  translate(width/2, height/2);
  
  //noFill();
  //arc(0, 0, 100, 100, PI, PI*2);
  
  float radius = 100;
  float start_angle = 0;
  float end_angle = HALF_PI;
  
  for (float i = start_angle; i <= end_angle; i += 0.05) {
    point(
      radius * cos(i),
      radius * sin(i)
    );
  }
  
}