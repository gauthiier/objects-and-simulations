import teilchen.Physics;

final int CANVAS_WIDTH = 500;
final int CANVAS_HEIGHT = 500;

Physics physics;

Creature creature;

void setup() {  
  size(CANVAS_WIDTH, CANVAS_HEIGHT);
  background(23, 68, 250);
  frameRate(30);
  
  physics = new Physics();
  
  creature = new CircleCreature(width / 2, height / 2, 30);
  
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
  
}

