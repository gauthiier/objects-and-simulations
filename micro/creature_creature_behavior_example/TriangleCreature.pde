class TriangleCreature extends Creature {
  
  PVector A, B, C;
  
  public TriangleCreature(int x, int y, int r) {
    super(x, y, r);
    
    A = new PVector();
    B = new PVector();
    C = new PVector();
    
    float theta = TWO_PI/3;
    
    A.x = cos(0 * theta) * r;
    A.y = sin(0 * theta) * r;
    
    B.x = cos(1 * theta) * r;
    B.y = sin(1 * theta) * r;
    
    C.x = cos(2 * theta) * r;
    C.y = sin(2 * theta) * r;
    
  }  
  
  public void draw_shape(){
    triangle(A.x, A.y, B.x, B.y, C.x, C.y);  
    line(0, 0, A.x, 0);
  }
  
  public boolean inside(int mx, int my) {    
    if(dist(mx, my, position().x, position().y) < radius()) return true;
    return false;
  }

    
};
