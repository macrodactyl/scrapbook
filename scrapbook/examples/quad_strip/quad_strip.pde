void setup() {
  size(500, 500, P3D);
}

void draw() {
  
  beginShape(QUAD_STRIP);
  vertex(0,0);
  vertex(0,10);
  vertex(10,0);
  vertex(10,10);
  vertex(20,0);
  vertex(20,10);
  vertex(30,0);
  vertex(30,10);
  endShape();
  
  translate(width/2, height/2);
  
  beginShape(QUAD_STRIP);
  vertex(0,-50,0);
  vertex(0,100,0);
  vertex(100,-50,-50);
  vertex(100,100,-50);
  vertex(200,-50,0);
  vertex(200,100,0);
  endShape();

}