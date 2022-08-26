class Movement 
{
  PVector pos;
  PVector vel;
  PVector acc;  
  Stopwatch acctimer = new Stopwatch();
  
  ArrayList<PVector> shoves = new ArrayList<PVector>();
  ArrayList<Stopwatch> shovetimers = new ArrayList<Stopwatch>();
  
  
  Movement()
  {
    this.pos = new PVector();
    this.vel = new PVector();
    this.acc = new PVector();
  }
  
  //give some acceleration for t seconds
  //we add the shove to a list of timed shoves to sum a final acc vector
  void shove(PVector av, float t)
  {
    //add shove vector to list
    //can probably simplify this
    PVector svect = new PVector();
    svect = av;
    shoves.add(svect);
    
    //set timer and add to list
    Stopwatch sw = new Stopwatch();
    sw.set(t);
    shovetimers.add(sw);
  }
  
  void update()
  { 
    this.acc.mult(0.0); //reset acc vector (clear prev frame's value to avoid accumu)
    
    //check timers for done, and add up final acc vector
    for (int i = 0; i < shoves.size(); i++) {
      shovetimers.get(i).update();
      if (shovetimers.get(i).done())
        shoves.get(i).mult(0.0);
      this.acc.add(shoves.get(i));
    }
    
    //remove expired shoves & timers from lists
    for (int i = 0; i < shoves.size(); i++) {
      if (shovetimers.get(i).done()) {
        shovetimers.remove(i);
        shoves.remove(i);
      }
    }
     
    this.vel = this.vel.add(this.acc);
    this.pos = this.pos.add(this.vel);
  }
}
