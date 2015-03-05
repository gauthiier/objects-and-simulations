import teilchen.Physics;
import teilchen.behavior.Alignment;
import teilchen.behavior.Cohesion;
import teilchen.behavior.Motor;
import teilchen.behavior.Separation;
import teilchen.behavior.Wander;
import java.util.Vector;
import teilchen.IBehaviorParticle;

class Herd {
  
  ArrayList<Herderer> _herderers = new ArrayList<Herderer>(); 
  Vector<Creature> _creatures = new Vector<Creature>();
  CollisionManager _collision;
  
  Physics _physics;
  
  public Herd(Physics p, CollisionManager c) {
    _herderers = new ArrayList<Herderer>();
    _physics = p;
    _collision = c;
  }
  
  public void add(Creature c) {
    
    _physics.add(c);
    _collision.collision().add(c);
    _creatures.add(c);
    
    Herderer h = new Herderer(c);
    _herderers.add(h);
  }
    
  public void remove(Creature c) {
    // todo
  }
  
  public void update() {
    for(int i = 0; i < _herderers.size(); i++) {
      _herderers.get(i).update();
    }
  }  
  
  class Herderer {    
    Creature creature;
    Separation separation;
    Alignment alignment;
    Cohesion cohesion;
    Wander wander;
    Motor motor;
    
    public Herderer(Creature c) {
             
      creature = c;      
      
      separation = new Separation();
      separation.proximity(10);
      separation.weight(10.0f);
      creature.behaviors().add(separation);
      
      cohesion = new Cohesion();
      cohesion.proximity(500);
      cohesion.weight(5.0f);
      creature.behaviors().add(cohesion);
      
      wander = new Wander();
      creature.behaviors().add(wander);
      
      /*
      motor = new Motor();
      motor.auto_update_direction(true);
      motor.strength(0.01f);
      creature.behaviors().add(motor);
      */      
      
    }       
   
   public void update() {
    separation.neighbors(_creatures);
    cohesion.neighbors(_creatures);     
   }
   
  }
  
}
