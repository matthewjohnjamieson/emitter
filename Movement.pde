/*
Movement class. Use this class to compose objects that can move. 
This class is vectored, and can be thought of as a mini-physics 
movement class. Use for translation or rotation and specify that 
in object's display method. Shove() is a great way to push stuff 
around in space.

Note: this class depends on the Stopwatch class

Note: when a movement instance is used in an object, they are best 
refered to as mov, or translator or something like that rather than 
pos, even though position is what they control in that case. This is 
to avoid the perverse "box.pos.pos.x" situation.
*/
class Movement 
{
  PVector pos;
  PVector vel;
  PVector acc;  
  Stopwatch acctimer = new Stopwatch(); //dependency :3
  ArrayList<PVector> shoves = new ArrayList<PVector>();
  ArrayList<Stopwatch> shovetimers = new ArrayList<Stopwatch>();
    
  Movement()
  {
    this.pos = new PVector();
    this.vel = new PVector();
    this.acc = new PVector();
  }
  
  /*
  give some acceleration for t seconds
  we add the shove to a list of timed shoves to sum a final acc vector
  when a shove's timer finishes, that shove is removed from the list. 
  */
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
     
    //compute vel and pos 
    this.vel = this.vel.add(this.acc);
    this.pos = this.pos.add(this.vel);
  }
}
