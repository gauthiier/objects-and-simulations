import teilchen.BehaviorParticle;
import mathematik.Vector3f;

class Creature extends BehaviorParticle {
  
  float   _scale;
  float   _rotation;
  
  public Creature(int x, int y, int r) {
    super();
    position().set(x, y);
    maximumInnerForce(100);
    radius(r);
    _scale = 1.0;
    _rotation = 0;
  }
  
  ///////////////////////////////////
  // display method
  // + applies transformations
  // + draws shape of the subclass   
  
  public void display() {
    pushMatrix();
    translate(position().x, position().y);
    if(_rotation != 0)
      rotate(_rotation);
    else
      rotate(getRotation()); 
    scale(_scale);
    draw_shape();
    popMatrix();    
  }
  
  /////////////////////////////////
  // (absolute) transforms
  
  public void rotate_to(float r) {
    _rotation = r;
  }
  
  public void scale_to(float s) {
    _scale = s;
  }
  
  ///////////////////////////////////
  // (incremental) transforms
  
  public void rotate_increment(float r) {
    _rotation += r;
  }
    
  public void scale_increment(float s) {
    _scale += s;
  }  
  
  private float getRotation() {
    if(velocity().isNaN() || velocity().magnitude() == 0) return 0;
    Vector3f v = new Vector3f(-1, 0, 0);    
    return velocity().angle(v);
  }
  
  ///////////////////////////////////
  // ** METHODS FOR SUBCLASSES **  
  
  // draws a (subclass) shape (in own coordinates)  
  public void draw_shape() {}
  
  // evaluates if mx and my are inside the (subclass) shape 
  public boolean inside(int mx, int my){return false;}
    
};

