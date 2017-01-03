class Particle {
  protected PVector position;
  protected PVector velocity;
  protected PVector acceleration;

  /**
   * Konstruktor, der ein Objekt im Ursprung anlegt.
   */
  Particle() {
    this(0, 0);
  }

  /**
   * TODO
   */
  Particle(float x, float y) {
    this(x, y, 0);
  }

  /**
   * Konstruktor, der ein Objekt an den entsprechenden Koordinaten anlegt
   * @param x  x-Koordinate
   * @param y  y-Koordinate
   * @param z  z-Koordinate
   */
  Particle(float x, float y, float z) {
    this(new PVector(x, y, z));
  }

  /**
   * Konstruktor, der ein Objekt an den entsprechenden Koordinaten anlegt
   * @param p  Koordinaten
   */
  Particle(PVector p) {
    this(p, new PVector(0, 0, 0));
  }

  /**
   * TODO
   */
  Particle(PVector p, PVector v) {
    this.position =  p.copy();
    this.velocity = v.copy();
    this.acceleration = new PVector(0, 0, 0);
  }

  /**
   * TODO
   */
  void applyForce(PVector force) {
    acceleration.add(force);
  }

  /**
   * TODO
   */
  void update() {
    // Die Beschleunigung ändert die Geschwindigkeit
    this.velocity.add(acceleration);

    // Die Geschwindigkeit ändert die Position
    this.position.add(velocity);

    // Die Beschleunigung wieder zurücksetzen
    this.acceleration.mult(0);
  }

  /**
   * TODO
   */
  void display() {
  }
  
  /**
   * TODO
   */
  void run() {
    this.update();
    this.display();
  }
}