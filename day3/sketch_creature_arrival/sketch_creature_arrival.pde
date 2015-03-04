import teilchen.Physics;
import teilchen.behavior.Arrival;

final int CANVAS_WIDTH = 500;
final int CANVAS_HEIGHT = 500;

Physics physics;

Creature creature;

Arrival arrival;

void setup() {  
  size(CANVAS_WIDTH, CANVAS_HEIGHT);
  background(23, 68, 250);
  frameRate(30);
  
  physics = new Physics();
    
  creature = new TriangleCreature(width / 2, height / 2, 30);  
  physics.add(creature);
  
  arrival = new Arrival();
  arrival.breakforce(creature.maximumInnerForce() * 0.25f);
  arrival.breakradius(creature.maximumInnerForce() * 0.25f);
  
  creature.behaviors().add(arrival);  
  
}

void draw() {
  
  arrival.position().set(mouseX, mouseY);
  
  physics.step(1.0 / frameRate);
 
  background(23, 68, 250);
  stroke(255);
  noFill();
  
  creature.display();
  
  if(arrival.arrived()) {
    stroke(0, 255, 0);
    fill(0, 255, 0, 30);
  } else {
    stroke(255, 0, 189);
    fill(255, 0, 189, 30);
  }

  ellipse(arrival.position().x, arrival.position().y,
  arrival.breakradius() * 2, arrival.breakradius() * 2);


}

