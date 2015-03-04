import teilchen.BehaviorParticle;
import mathematik.Vector3f;

class Creature extends BehaviorParticle {
  
  float   _scale;
  
  public Creature(int x, int y, int r) {
    super();
    position().set(x, y);
    maximumInnerForce(100);
    radius(r);
    _scale = 1.0;
  }
  
  public void display() {
    pushMatrix();
    translate(position().x, position().y);
    rotate(getRotation()); 
    scale(_scale);
    draw_shape();
    popMatrix();
    
  }
  
  private float getRotation() {
    if(velocity().isNaN() || velocity().magnitude() == 0) return 0;
    Vector3f v = new Vector3f(-1, 0, 0);    
    return velocity().angle(v);
  }
  
  public void draw_shape() {}
  
  public boolean inside(int mx, int my){return false;}
  
};

