/**
 * Diese Klasse bildet eine Rakete ab.
 *
 * @author Torsten Pattberg (torsten.pattberg@biglouis.com)
 */
class Rocket extends Particle{
  private float hu;

  /**
   * TODO
   */
  public Rocket(float x, float y, float hu) {
    super(x, y);

    this.velocity = new PVector(random(-1, 6), random(-1, 6), random(6, 16));    
    this.hu = hu;
  }

  /**
   * TODO
   */
  private void update() {
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
  private boolean explode() {
    return ((this.velocity.z < 0) && (random(1) < 0.05));
  }

  /**
   * TODO
   */
  private void display() {
    stroke(this.hu, 255, 100);
    strokeWeight(10);
    point(this.position.x, this.position.y, this.position.z);
  }
  
  /**
   * TODO
   */
  public void run() {
    this.update();
    this.display();
  }  
}