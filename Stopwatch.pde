/*
General timer object. Movement depends on this for timed acc
*/
class Stopwatch
{
  float t = 0.0; //current time
  float st = 0.0; //stop time
  float fri = 1.0/60.0; //framerate inverse will need to be calculated at runtime
  //set to 60 for now as a default 
   
  void set(float stoptime)
  {
    this.st = stoptime;
  }
   
  void reset()
  {
    this.t = 0.0;
  } 
   
  boolean done()
  {
    return this.t >= this.st;
  }
   
  void update()
  {
    if (t <= st)
      t += fri;
  }
}
