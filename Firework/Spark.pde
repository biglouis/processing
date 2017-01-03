class Spark extends Particle{
  private float lifespan;
  private float hu;

  /**
   * TODO
   */
  Spark(PVector l, PVector v, float hu) {
    super(l, v);
    this.hu = hu;
    this.lifespan = random(255);
    
    // Zufällig in irgendeine Richtung starten
    PVector f = PVector.random3D();
    
    // Zufällig mit irgendeiner Geschwindigkeit starten
    f.mult(random(8,10));

    this.applyForce(f);    
  }

  /**
   * TODO
   */
  void update() {
    // Ein bisschen Wind simulieren
    PVector f = PVector.random3D();
    f.mult(map(this.lifespan, 255, 0, 0, random(0.8)));
    this.applyForce(f);    

    this.lifespan -= random(2, 3);
    this.velocity.mult(0.96);
    super.update();
    
    if ((this.position.z < 0) 
     && (this.position.x > -r)
     && (this.position.y > -r)
     && (this.position.x < r)
     && (this.position.y < r)
     ){
      this.position.z = 0;
      this.velocity.z *=-1;
    }
  }

  /**
   * TODO
   */
  void display() {
    // Damit es schön funkelt
    float size = random(1, map(this.lifespan, 0, 255, 1, 10)); 
    float bright = map(sqrt(random(1)), 0, 1, 0, 255);
    float hue = (this.hu+random(-10,10))%256;
    float alpha = this.lifespan;
    stroke(hue, bright, 255, alpha);
    strokeWeight(size);
    point(this.position.x, this.position.y, this.position.z);
  }

  /**
   * Is the spark still useful?
   */
  private boolean isDead() {
    return (this.lifespan < 0.0);
  }
}