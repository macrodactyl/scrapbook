PShape boxy;

void setup() {
  size(500,500, P3D);
  boxy = createShape(BOX, 10, 10, 100);
  boxy.setFill(color(255));
  boxy.setStroke(color(0));
  //boxy.rotateX(1);
  boxy.rotateY(0.5);
}

void draw() {
  background(0);
  shape(boxy, 250, 250);
}