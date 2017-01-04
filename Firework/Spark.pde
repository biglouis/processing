/**
 * Diese Klasse bildet einen Funken ab.
 *
 * @author Torsten Pattberg (torsten.pattberg@biglouis.com)
 */
class Spark extends Particle{
  private float lifespan;
  private float hu;

  /**
   * Konstruktor.
   *
   * @param p Position
   * @param v Geschwindigkeit
   * @param hu Farbe
   */
  public Spark(PVector p, PVector v, float h) {
    super(p, v);
    this.hu = h;
    
    // Zufällige Lebensdauer
    this.lifespan = random(255);
    
    // Zufällig in irgendeine Richtung starten
    PVector f = PVector.random3D();
    
    // Zufällig mit irgendeiner Geschwindigkeit starten
    f.mult(random(8, 10));

    this.applyForce(f);    
  }

  /**
   * Physik auf den Funken anwenden.
   */
  private void update() {
    
    // Ein bisschen Wind simulieren, je später desto mehr.
    PVector f = PVector.random3D();
    f.mult(map(this.lifespan, 255, 0, 0, random(0.8)));
    this.applyForce(f);    

    this.lifespan -= random(2, 3);
    this.velocity.mult(0.96);
    super.update();
    
    // Behandlung an der Grundfläche
    if ((this.position.z < 0) 
     && (this.position.x > -r)
     && (this.position.y > -r)
     && (this.position.x < r)
     && (this.position.y < r)
     )
    {
      this.position.z = 0;
      this.velocity.z *=-1;
    }
  }

  /**
   * Den Funken anzeigen.
   */
  private void display() {
    
    // Damit es schön funkelt
    float bright = map(sqrt(random(1)), 0, 1, 0, 255);
    float hue = (this.hu+random(-10, 10)) % 256;
    float alpha = this.lifespan;
    stroke(hue, bright, 255, alpha);

    float size = random(1, map(this.lifespan, 0, 255, 1, 10)); 
    strokeWeight(size);
    
    point(this.position.x, this.position.y, this.position.z);
  }

  /**
   * TODO Warum kann "Fireworks" hierauf zurückgreifen, obwohl die Methode "private" ist?
   */
  private void run() {
    this.update();
    this.display();
  }

  /**
   * Lebt der Funken noch?
   */
  private boolean isDead() {
    return (this.lifespan < 0.0);
  }
}