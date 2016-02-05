int creatureCount = 10;
float speed = 5;
Creature[] creatures = new Creature[creatureCount];

void setup() {
  fullScreen();
  
  for (int i = 0; i < creatureCount; i++) {
    creatures[i] = new Creature(floor(random(-100, 100)), floor(random(-100, 100)));
  }
}

void draw() {
  delay(125);
  
  translate(width/2, height/2);
  
  background(0);
  
  for (int i = 0; i < creatureCount; i++) {
    creatures[i].move();
  }  
}

class Creature {
  
  float xpos, ypos;
  
  float[][] body = new float[10][2];
  
  Creature (float x, float y) {
    xpos = x;
    ypos = y;
    
    for (int i = 0; i < body.length; i++) {
      body[i][0] = x;
      body[i][1] = y;
    }
  }
  
  void move() {
    int direction = floor(random(4));
    
    switch(direction) {
      case 0:
        xpos += speed;
        break;
      case 1:
        xpos -= speed;
        break;      
      case 2:
        ypos += speed;
        break;      
      case 3:
        ypos -= speed;
        break;      
    }
    
    for (int i = body.length - 1; i > 0; i--) {
      body[i][0] = body[i-1][0];
      body[i][1] = body[i-1][1];
    }
    body[0][0] = xpos;
    body[0][1] = ypos;    
    
    this.draw();
  }
  
  void draw() {
    stroke(255);

    for (int i = body.length - 1; i > 0; i--) {
      line(body[i][0], body[i][1], body[i-1][0], body[i-1][1]);
      
      //body[i][0] = body[i-1][0];
      //body[i][1] = body[i-1][1];
    }

  }
}