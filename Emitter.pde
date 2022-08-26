class Emitter
{
  Movement mov = new Movement();
  Stopwatch sw = new Stopwatch(); //set a delay between emits
  ArrayList<Box> boxes = new ArrayList<Box>();

  Emitter()
  {
    sw.set(0.1); //default delay
  }
 
  Emitter(float delay)
  {
    sw.set(delay); //delay
  }
 
  //default emit. random direction and rotation 
  void emit()
  {
    if (sw.done()) {
      boxes.add(new Box());
      boxes.get(boxes.size() - 1).mov.pos.set(this.mov.pos);
      boxes.get(boxes.size() - 1).mov.shove(PVector.random3D().mult(0.09), 1.0);
      boxes.get(boxes.size() - 1).rot.shove(PVector.random3D().mult(0.0005), 1.0);
      sw.reset();
    }
  }
    
  void emit(PVector direction)
  {
    if (sw.done()) {
      boxes.add(new Box());
      boxes.get(boxes.size() - 1).mov.pos.set(this.mov.pos);
      boxes.get(boxes.size() - 1).mov.shove(direction, 0.5);
      boxes.get(boxes.size() - 1).rot.shove(PVector.random3D().mult(0.0005), 1.0);
      sw.reset();
    }
  }
  
  void update()
  {
    sw.update();
    for (Box b : boxes) {
      //apply transformations to the emited particles
      
      //flow field from brine tank cascade diffeq
      //https://www.math.utah.edu/~gustafso/2250systems-de.pdf
      b.mov.shove(new PVector(
        -0.5*b.mov.pos.x,
        0.5*b.mov.pos.x - 0.25*b.mov.pos.y,
        0.25*b.mov.pos.y - 0.16*b.mov.pos.z
        ).mult(0.0001),
        0.017); //smallest t val that still has an effect 
      
      b.update(); //don't delete! :)
    }
  }
  
  void display()
  {
    for (Box b : boxes)
      b.display();
  }
}
