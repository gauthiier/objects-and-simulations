import teilchen.Physics;
import teilchen.util.CollisionManager;

final int CANVAS_WIDTH = 500;
final int CANVAS_HEIGHT = 500;

Physics physics;

CollisionManager collision;

Colony colony;

ArrayList<Creature> creatures = new ArrayList<Creature>();

void setup() {  
  size(CANVAS_WIDTH, CANVAS_HEIGHT);
  background(23, 68, 250);
  frameRate(30);
  
  physics = new Physics();
  
  collision = new CollisionManager();
  collision.minimumDistance(25);
  
  colony = new Colony(physics, collision);  
  
}

void draw() {
  
  colony.migrate_to(mouseX, mouseY);
  
  collision.createCollisionResolvers();
  collision.loop(1.0 / frameRate);

  physics.step(1.0 / frameRate);
 
  background(23, 68, 250);
  stroke(255);
  noFill();
  
  for(int i = 0; i < creatures.size(); i++) {
    Creature c = creatures.get(i);
    c.display();
  }
  
  collision.removeCollisionResolver();

}

void mousePressed() {
  
  Creature c = new CircleCreature(mouseX, mouseY, 10);
  
  creatures.add(c);
  
  colony.add(c);
  
}

