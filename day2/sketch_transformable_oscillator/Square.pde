class Square extends Transformable {
  
  int _width;
  int _height;
  
  public Square(int x, int y, int w, int h) {
    super(x, y);
    _width = w;
    _height = h;    
    rectMode(CENTER);
  }  
  
  public void draw_shape(){
    rect(0, 0, _width, _height);  
  }
  
  public boolean inside(int mx, int my) {    
    if(dist(mx, my, _position.x, _position.y) < _width /2) return true;
    return false;
  }
  
};
