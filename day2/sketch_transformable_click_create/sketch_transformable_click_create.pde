final int CANVAS_WIDTH = 500;
final int CANVAS_HEIGHT = 500;

ArrayList<Transformable> elements = new ArrayList<Transformable>();

void setup() {  
  size(CANVAS_WIDTH, CANVAS_HEIGHT, OPENGL);
  smooth();
  background(23, 68, 250);
  
}

void draw() {
  
  background(23, 68, 250);
  
  if(frameCount % 2 == 0) {
    
    for(int i = 0; i < elements.size(); i++) {
      Transformable t = elements.get(i);
      t.rotate_increment(0.01);
    }
    
  }
  
  stroke(255);
  noFill();
  
  for(int i = 0; i < elements.size(); i++) {
    Transformable t = elements.get(i);
    t.display();
  }
  
  
  
}

void mousePressed() {
  
  float r = random(0, 3);
  Transformable t;
  
  if(r < 1) {
    t = new Circle(mouseX, mouseY, 25);
  } else if(r < 2) {
    t = new Square(mouseX, mouseY, 35, 35);
  } else {
    t = new Triangle(mouseX, mouseY, 25);
  }
  
  elements.add(t);
  
}


void mouseDragged() {
  
  for(int i = 0; i < elements.size(); i++) {
    Transformable t = elements.get(i);
    if(t.inside(mouseX, mouseY)) {
      t.translate_to(mouseX, mouseY);
    }
  }
  
}










