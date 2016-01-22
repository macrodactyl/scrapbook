int moverCount = 100;
Mover[] movers = new Mover[moverCount];

void setup() {
  size(1300, 800);
  background(0);
  stroke(255);
  colorMode(HSB);
  
  for (int i = 0; i < moverCount; i++) {
    movers[i] = new Mover();
  }
}

public class Mover {
  public float x = 0;
  public float y = 0;
  public float x_seed = random(1000);
  public float y_seed = random(1000);
  public color colour = color(floor(random(256)), 255, 128, 10);
  public int stroke_width = 1;
  
  void move() {
    strokeWeight(stroke_width);
    stroke(colour);
    
    float new_x = (noise(x_seed) - 0.49)* 2 + x;
    float new_y = (noise(y_seed) - 0.49)* 2 + y;
    
    line(x, y, new_x, new_y);
    
    x = new_x;
    y = new_y;
    
    x_seed += 0.01;
    y_seed += 0.01;
    
    if (random(1) > 0.999)
    {
      stroke_width += 1;
    }
  }
}

void draw() {
  translate(width/2, height/2);
  
  for (int i = 0; i < moverCount; i++) {
    movers[i].move();
  }
}