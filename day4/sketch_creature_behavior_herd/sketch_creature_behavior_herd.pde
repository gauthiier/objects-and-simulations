import teilchen.Physics;
import teilchen.util.CollisionManager;

final int CANVAS_WIDTH = 500;
final int CANVAS_HEIGHT = 500;

Physics physics;

CollisionManager collision;

Herd herd;

ArrayList<Creature> creatures = new ArrayList<Creature>();

void setup() {  
  size(CANVAS_WIDTH, CANVAS_HEIGHT);
  background(23, 68, 250);
  frameRate(30);
  
  physics = new Physics();
  
  collision = new CollisionManager();
  collision.minimumDistance(25);  
  
  herd = new Herd(physics, collision);  
  
}

void draw() {

  collision.createCollisionResolvers();
  collision.loop(1.0 / frameRate);
  
  physics.step(1.0 / frameRate);
  
  herd.update();
 
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
  
  float r = random(0, 3);
  Creature c;
  if(r < 1) {  
    c = new CircleCreature(mouseX, mouseY, 10);
  } else if(r < 2) {
    c = new TriangleCreature(mouseX, mouseY, 15);
  } else {
    c = new SquareCreature(mouseX, mouseY, 20, 20);
  }
  
  creatures.add(c);
  
  herd.add(c);
  
}

