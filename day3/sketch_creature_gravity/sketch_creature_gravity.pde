import teilchen.Physics;
import teilchen.force.Gravity;

final int CANVAS_WIDTH = 500;
final int CANVAS_HEIGHT = 500;

Physics physics;

Creature creature;

void setup() {  
  size(CANVAS_WIDTH, CANVAS_HEIGHT);
  background(23, 68, 250);
  frameRate(30);
  
  physics = new Physics();
  
  Gravity mGravity = new Gravity();
  mGravity.force().set(0, 30, 0);  

  physics.add(mGravity);  
  
  creature = new TriangleCreature(width / 2, height / 2, 30);
  
  physics.add(creature);
  
}

void draw() {
  
  physics.step(1.0 / frameRate);
 
  background(23, 68, 250);
  stroke(255);
  noFill();
  
  creature.display();

}

void mousePressed() {
  
  creature.position().set(mouseX, mouseY);
  creature.velocity().set(mouseX - pmouseX, mouseY - pmouseY);
  
}

