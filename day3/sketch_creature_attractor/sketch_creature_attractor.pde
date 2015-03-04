import teilchen.Physics;
import teilchen.force.Attractor;
import teilchen.force.ViscousDrag;

final int CANVAS_WIDTH = 500;
final int CANVAS_HEIGHT = 500;

final int NBR_CREATURES = 75;

Physics physics;
Attractor attractor;

ArrayList<Creature> creatures = new ArrayList<Creature>();

void setup() {  
  size(CANVAS_WIDTH, CANVAS_HEIGHT);
  background(23, 68, 250);
  frameRate(30);
  
  physics = new Physics();
  
  // create a global drag
  ViscousDrag drag = new ViscousDrag();
  drag.coefficient = 0.75f;
  physics.add(drag);  
  
  // create attaractor
  attractor = new Attractor();
  attractor.radius(50);
  attractor.strength(200);
  physics.add(attractor);
  
  // create all creatures
  Creature c;
  for(int i = 0; i < NBR_CREATURES; i++) {
    if(i % 3 == 0) {
      c = new CircleCreature((int)random(width), (int)random(height), 20);
    } else if(i % 3 == 1) {
      c = new TriangleCreature((int)random(width), (int)random(height), 20);
    } else {
      c = new SquareCreature((int)random(width), (int)random(height), 30, 30);
    }
    creatures.add(c);
    physics.add(c);  
  }
  
}

void draw() {
  
  attractor.position().set(mouseX, mouseY);
  
  physics.step(1.0 / frameRate);
 
  background(23, 68, 250);
  stroke(255);
  noFill();
  
  for(int i = 0; i < creatures.size(); i++) {
    Creature c = creatures.get(i);
    c.display();
  }    
  
  if(attractor.strength() < 0) {
    stroke(255, 0, 0);
    fill(255, 0, 0, 35);
  } else {
    stroke(0, 255, 0);
    fill(0, 255, 0, 35);    
  }
  
  ellipse(attractor.position().x, attractor.position().y,
  attractor.radius(), attractor.radius());

}

void mousePressed() {
  float inv = -1 * attractor.strength();
  attractor.strength(inv);    
}

