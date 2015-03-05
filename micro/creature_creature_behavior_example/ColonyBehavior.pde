import teilchen.Physics;
import teilchen.util.CollisionManager;
import teilchen.behavior.Arrival;

class ColonyBehavior implements CreatureBehavior {
  
  ArrayList<Colon> _colons = new ArrayList<Colon>(); 
  Arrival _leader;
  CollisionManager _collision;
  
  Physics _physics;
  
  public ColonyBehavior(Physics p, CollisionManager c) {
    _colons = new ArrayList<Colon>();
    _leader = new Arrival();
    _leader.position().set(random(width), random(height));
    _physics = p;
    _collision = c;
  }
  
  public void add(Creature c) {
    
    _physics.add(c);
    _collision.collision().add(c);
    
    Colon colon = new Colon(c);
    if(_colons.size() >= 1) {
      colon.a.setPositionRef(_colons.get(_colons.size()-1).creature.position());
    } else if(_colons.isEmpty()) {
      colon.a.setPositionRef(_leader.position());
    }
    _colons.add(colon);
  }
  
  public void event(int x, int y) {
    _leader.position().set(x, y);    
  }
 
  public void event(int c) {
    if(c == 'q') {
      _leader.position().set(random(width), random(height));
    }
  }
  
  public void update(float dt) {;}  
     
  class Colon {    
    Creature creature;
    Arrival a;    
    public Colon(Creature colon) {
      creature = colon;
      a = new Arrival();
      a.breakforce(creature.radius() * 5);
      a.breakradius(creature.radius() * 5);      
      creature.behaviors().add(a);      
    }        
  }
  
}
