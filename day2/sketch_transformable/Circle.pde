class Circle extends Transformable {
  
  int _radius;
  
  public Circle(int x, int y, int r) {
    super(x, y);
    _radius = r;
    ellipseMode(RADIUS);
  }  
  
  public void draw_shape(){
    ellipse(0, 0, _radius, _radius);  
    line(0, 0, _radius, 0);
  }
  
  public boolean inside(int mx, int my) {    
    if(dist(mx, my, _position.x, _position.y) < _radius) return true;
    return false;
  }
  
};
