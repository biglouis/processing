import peasy.*;

ArrayList<Fireworks> fireworks;
PVector gravity = new PVector(0, 0.001, -0.1);
int r = 400;

PeasyCam cam;

void setup() {
  fullScreen(P3D);
  colorMode(HSB);

  fireworks = new ArrayList<Fireworks>();
}

void draw() {
  if (random(1) < 0.025) {
    fireworks.add(new Fireworks());
  }

  background(0);
  translate(width/2, height/1.1, height-r-r-r);
  rotateX(1.1*PI/2);
  rotateZ(frameCount * -0.001);

  stroke(34);
  strokeWeight(4);
  fill(17, 200);
  beginShape();
  vertex(-r, r, 0);
  vertex(r, r, 0);
  vertex(r, -r, 0);
  vertex(-r, -r, 0);
  endShape(CLOSE);

  for (int i = fireworks.size()-1; i >= 0; i--) {
    Fireworks f = fireworks.get(i);
    f.run();
    if (f.isDead()) {
      fireworks.remove(i);
    }
  }
}