int moverCount = 200;
Mover[] movers = new Mover[moverCount];

void setup() {
  fullScreen();
  background(0);
  stroke(255);
  colorMode(HSB);
  
  for (int i = 0; i < moverCount; i++) {
    movers[i] = new Mover();
  }
}

public class Mover {
  float x = 0;
  float y = 0;
  float z = 0;
  float direction = random(PI*2);
  float direction_noise_coordinate = random(1000);
  float distance = random(1) + 1;
  float torque = random(1) + .5;
  color colour = color(floor(random(256)), 64, 255, 255);
  int stroke_width = 1;
  
  void move() {
    
    strokeWeight(stroke_width);
    stroke(colour);
    
    float new_x = distance * cos(direction) + x;
    float new_y = distance * sin(direction) + y;
    
    line(x, y, new_x, new_y);
    
    x = new_x;
    y = new_y;
    
    direction_noise_coordinate += 0.01;
    float direction_change = (noise(direction_noise_coordinate) - 0.5) * torque;
    direction += direction_change;
    
    if (random(1) > 0.999)
    {
      stroke_width += 1;
    }
  }
}

void draw() {
  
  loadPixels();
  for (int i = 0; i < pixels.length; i++) {    
   pixels[i] = color(hue(pixels[i]), saturation(pixels[i]), brightness(pixels[i]) - 1);
  }
  updatePixels();  
  
  translate(width/2, height/2);
  
  for (int i = 0; i < moverCount; i++) {
    movers[i].move();
  }
}