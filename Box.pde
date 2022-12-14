/*
just a basic box that can be emitted as a particle
*/
class Box
{
  Movement mov;
  Movement rot;
  float scale;
  color col = color(random(0.2, 0.9), random(0.2, 0.9), random(0.2, 0.9));
  
  Box()
  {
    scale = random(200.0, 400.0); //should make this an arg at some point
    this.mov = new Movement(); 
    this.rot = new Movement();
  }
  
  Box update()
  {
    this.mov.update();
    this.rot.update();
    return this;
  }
  
  Box display()
  {
    noStroke();
    pushMatrix();
    translate(this.mov.pos.x, this.mov.pos.y, this.mov.pos.z); //where to draw. keep these in display 
    rotateX(this.rot.pos.x);                                   //why? because no variables being changed
    rotateY(this.rot.pos.y);
    rotateZ(this.rot.pos.z);
    fill(this.col);
    box(scale);
    popMatrix();
    return this;
  }
}
