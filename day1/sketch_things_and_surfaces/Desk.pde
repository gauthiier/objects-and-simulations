class Desk extends Surface {
  
  int nbr_legs;
  
  public void display() {

    fill(0,255,0);
    
    rect(20, 20, 20 + _width, 20 + _height);
    
    super.display();
  }
  
};

