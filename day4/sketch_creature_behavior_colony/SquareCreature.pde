class SquareCreature extends Creature {
  
  int _width;
  int _height;
  
  public SquareCreature(int x, int y, int w, int h) {
    super(x, y, (int)sqrt(pow(w / 2, 2) + pow(h / 2, 2)));
    _width = w;
    _height = h;    
    rectMode(CENTER);
  }  
  
  public void draw_shape(){
    rect(0, 0, _width, _height);  
  }
  
  public boolean inside(int mx, int my) {    
    if(dist(mx, my, position().x, position().y) < radius()) return true;
    return false;
  }
  
};
