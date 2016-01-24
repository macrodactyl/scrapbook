float x = 0;
float y = 0;

void setup() {
  fullScreen();
  background(0);
  stroke(255);
  colorMode(HSB);
}

void draw() {
  
  loadPixels();
  for (int i = 0; i < pixels.length; i++) {    
    pixels[i] = color(hue(pixels[i]), saturation(pixels[i]), brightness(pixels[i]) - 2);
  }
  updatePixels();
  
  translate(width/2, height/2);
  
  float new_x = x + 1;
  float new_y = y + 1;
  
  line(x, y, new_x, new_y);
  
  x = new_x;
  y = new_y;
}