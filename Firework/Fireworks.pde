class Fireworks {

  // Das Feuerwerk bekommt eine zufällige Farbe
  private float hu = random(255);

  // Die Rakete startet in der Ecke unserer Fläche
  private Rocket rocket = new Rocket(-r, -r, this.hu);

  // Zu Beginn existieren noch keine Funken
  private ArrayList<Spark> sparks = new ArrayList<Spark>();    
  
  /**
   * Fügt dem Feuerwerk "Funken" hinzu.
   *
   * @param s Anzahl
   * @param p Position
   * @param v Geschwindigkeit
   * @param h Farbe
   */
  private void addSparks(float s, PVector p, PVector v, float h){
    for (int i = 0; i < s; i++) {
      this.sparks.add(new Spark(p, v, h));    
    }
  }
  
  /**
   * TODO
   */
  private void runRocket(){
    if (this.rocket != null) {
      this.rocket.applyForce(gravity);
      this.rocket.run();

      if (this.rocket.explode()) {
        this.addSparks(random(1000, 3000), this.rocket.position, this.rocket.velocity, this.hu);
        this.rocket = null;
      }
    }
  }

  /**
   * TODO
   */
  private void runSparks(){
    for (int i = this.sparks.size()-1; i >= 0; i--) {
      Spark s = this.sparks.get(i);
      s.applyForce(gravity);
      s.run();
      
      // Ein paar Fehlzündungen simulieren
     if (random(1) < 0.00001) {
       this.addSparks(random(2, 5), s.position, s.velocity, s.hu);
      }

      if (s.isDead()) {
        this.sparks.remove(i);
      }
    }
  }

  /**
   * TODO
   */
  private void run() {
    this.runRocket();
    this.runSparks();
  }
  
  /**
   * TODO
   */
  private boolean isDead() {
    return ((this.rocket == null) && (this.sparks.isEmpty()));
  }
}