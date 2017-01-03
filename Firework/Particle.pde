/**
 * Diese Klasse bildet ein "Teil" ab, hauptsächlich ist
 * hier die "Physik" ausgelagert, die andere Objkte dann
 * erben können.
 *
 * @author Torsten Pattberg (torsten.pattberg@biglouis.com)
 */
class Particle {
  protected PVector position;
  protected PVector velocity;
  private PVector acceleration;

  /**
   * Konstruktor, der ein Objekt im Ursprung anlegt.
   */
  public Particle() {
    this(0, 0);
  }

  /**
   * Konstruktor, der ein Objekt an den entsprechenden Koordinaten anlegt.
   *
   * @param x  x-Koordinate
   * @param y  y-Koordinate
   */
  public Particle(float x, float y) {
    this(x, y, 0);
  }

  /**
   * Konstruktor, der ein Objekt an den entsprechenden Koordinaten anlegt.
   *
   * @param x  x-Koordinate
   * @param y  y-Koordinate
   * @param z  z-Koordinate
   */
  public Particle(float x, float y, float z) {
    this(new PVector(x, y, z));
  }

  /**
   * Konstruktor, der ein Objekt an den entsprechenden Koordinaten anlegt.
   *
   * @param p  Position
   */
  public Particle(PVector p) {
    this(p, new PVector(0, 0, 0));
  }

  /**
   * Konstruktor, der ein Objekt an den entsprechenden Koordinaten 
   * mit einer Startgeschwindigkeit anlegt.
   *
   * @param p  Position
   * @param v  Geschwindigkeit
   */
  public Particle(PVector p, PVector v) {
    this.position =  p.copy();
    this.velocity = v.copy();
    this.acceleration = new PVector(0, 0, 0);
  }

  /**
   * Wendet eine "Kraft" auf das Teil an.
   *
   * @param f  Kraft
   */
  protected void applyForce(PVector force) {
    acceleration.add(force);
  }

  /**
   * Physik auf das Teil anwenden.
   */
  private void update() {
    // Die Beschleunigung ändert die Geschwindigkeit
    this.velocity.add(acceleration);

    // Die Geschwindigkeit ändert die Position
    this.position.add(velocity);

    // Die Beschleunigung wieder zurücksetzen
    this.acceleration.mult(0);
  }
}