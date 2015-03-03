class Cup extends Thing {
  
  int _temperature;
  boolean _empty;
  
  public Cup(int x, int y, int w, int h) {
    super(x, y, w, h);
  }
  
  public void filled() {
    _empty = false;
  }
  
  public void drink() {
    _empty = true;
  }
  
  public void display() {
    
    super.display();
    
    if(_empty) {
      fill(255);
    } else {
      fill(0,0,255);
    }
    
    ellipse(_position.x, _position.y, _width, _height);  
    
  }
  
  public void mousePressed(int mx, int my) {

    float d = dist( _position.x, _position.y, mx, my);
    
    println("mouse");
    
    if(d < _width) {
      
      println("touched!");
      
      if(_empty) {
        filled();        
      } else {
        drink();
      }
            
      
    }  
    
  }
  
};

