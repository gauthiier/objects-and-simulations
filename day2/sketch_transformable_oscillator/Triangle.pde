class Triangle extends Transformable {
  
  int _radius;
  PVector A, B, C;
  
  public Triangle(int x, int y, int r) {
    super(x, y);
    _radius = r;
    
    A = new PVector();
    B = new PVector();
    C = new PVector();
    
    float theta = TWO_PI/3;
    
    A.x = cos(0 * theta) * _radius;
    A.y = sin(0 * theta) * _radius;
    
    B.x = cos(1 * theta) * _radius;
    B.y = sin(1 * theta) * _radius;
    
    C.x = cos(2 * theta) * _radius;
    C.y = sin(2 * theta) * _radius;
    
  }  
  
  public void draw_shape(){
    triangle(A.x, A.y, B.x, B.y, C.x, C.y);  
    line(0, 0, A.x, 0);
  }
  
  public boolean inside(int mx, int my) {    
    if(dist(mx, my, _position.x, _position.y) < _radius) return true;
    return false;
  }
  
};
