import teilchen.Physics;
import teilchen.force.Spring;
import teilchen.force.ViscousDrag;

final int CANVAS_WIDTH = 500;
final int CANVAS_HEIGHT = 500;

final int NBR_CREATURES = 75;

Physics physics;
Spring spring;

Creature t;
Creature c;

ArrayList<Creature> creatures = new ArrayList<Creature>();

void setup() {  
  size(CANVAS_WIDTH, CANVAS_HEIGHT);
  background(23, 68, 250);
  frameRate(30);
  
  physics = new Physics();
  
  // create a global drag
  ViscousDrag drag = new ViscousDrag();
  drag.coefficient = 0.25f;
  physics.add(drag);  
  
  t = new TriangleCreature((int)random(width), (int)random(height), 20);
  c = new CircleCreature((int)random(width), (int)random(height), 20);
  
  physics.add(t); physics.add(c);
  
  spring = physics.makeSpring(t, c);
  spring.restlength(20);
  
}

void draw() {
  
  physics.step(1.0 / frameRate);
 
  background(23, 68, 250);
  stroke(255);
  noFill();
  
  c.display();
  t.display();
  
  stroke(255, 0, 0);
  line(c.position().x, c.position().y, t.position().x, t.position().y);

}

void mouseDragged() {
  spring.b().position().set(mouseX, mouseY);
}

