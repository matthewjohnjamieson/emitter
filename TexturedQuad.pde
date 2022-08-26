/*
a square shape that you can texture
TODO: add billboarding (make optional?)
*/

class TexturedQuad
{
  PImage tex;
  PShape model;
  Movement mov;
  float scale = 300;
  
  TexturedQuad(String texture)
  {
    this.mov = new Movement(); 
    this.tex = loadImage(texture);
    rectMode(CENTER);
    this.model = createShape(RECT,0,0,1,1);
    this.model.setStroke(false);
    this.model.scale(this.scale);
    this.model.setTexture(this.tex);
  }
  
  void update(){}
  
  void display()
  {
    pushMatrix();
    translate(this.mov.pos.x,this.mov.pos.y,this.mov.pos.z);
    shape(this.model);
    popMatrix();
  }
}
