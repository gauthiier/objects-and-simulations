class Thing {
  
  PVector _position;
  int _weight;
  color _color;
  int _width;
  int _height;
  
  public Thing(int x, int y, int w, int h) {
    _position = new PVector();
    _position.x = x;
    _position.y = y;    
    _width = w;
    _height = h;
  }
  
  public void move(int x, int y) {
    _position.x = x;
    _position.y = y;
  }
  
  public void display() {}
  
  public void mousePressed(int mx, int my) {}
  
};

