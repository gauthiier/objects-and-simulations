class CircleCreature extends Creature {
  
  public CircleCreature(int x, int y, int r) {
    super(x, y, r);
    ellipseMode(RADIUS);
  }  
  
  public void draw_shape(){
    ellipse(0, 0, radius(), radius());  
    line(0, 0, radius(), 0);
  }
  
  public boolean inside(int mx, int my) {    
    if(dist(mx, my, position().x, position().y) < radius()) return true;
    return false;
  }
  
};
