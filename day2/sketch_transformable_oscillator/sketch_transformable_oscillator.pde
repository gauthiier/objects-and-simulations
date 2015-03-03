
final int CANVAS_WIDTH = 500;
final int CANVAS_HEIGHT = 500;
final int NBR_ELEMENTS = 16;

Transformable t; 
Oscillator osc = new Oscillator(0, 5, 0.01);

void setup() {
  
  size(CANVAS_WIDTH, CANVAS_HEIGHT);
  background(23, 68, 250);
  
  t = new Triangle(CANVAS_WIDTH / 2, CANVAS_HEIGHT / 2, 50);
  
}

void draw() {
  background(23, 68, 250);
    
  t.rotate_increment(0.01);
  
  t.scale_to(osc.update());
  
  stroke(255);
  noFill();
  t.display();
}

