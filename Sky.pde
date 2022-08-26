/*
basic spherical skybox
*/

class Sky 
{
  PImage tex;
  PShape model;
 
  Sky(String texture)
  {
    this.tex = loadImage(texture);
    this.model = createShape(SPHERE, 16000);
    this.model.setStroke(false); //nostroke for PShapes
    this.model.setTexture(this.tex);
  }
 
  void display()
  {
    pushMatrix();
    translate(width/2, height/2);
    shape(this.model);
    popMatrix();
  }
}
