/*
---
cat thing turned into more of a particle emiter thing. boxes
being emited in space. The name of the sketch is a throwback to how it started
---
*/

Camera cam;
Sky sky;
Emitter emitter;
Emitter emitter1;
//TexturedQuad cat;

void setup()
{
  size(1000,666,P3D);
  colorMode(RGB, 1.0);
  
  cam = new Camera();
  sky = new Sky("img/swirl.jpg");
  emitter = new Emitter(0.04);
  emitter.mov.pos.x = width/2;
  emitter.mov.pos.y = height/2;
  emitter1 = new Emitter(0.04);
  emitter1.mov.pos.x = width/2 - 100;
  emitter1.mov.pos.y = height/2;
  emitter1.mov.pos.z = -3000;
}

void draw()
{
  background(0.5); //<>//
  
  //with a flow field in place, this doesn't have much effect
  PVector direction = new PVector();
  direction.set(0.0, 1.0, 0.0); //initial box push
  //direction.add(PVector.random3D().mult(0.0005)); //spray
  //emitter.emit(direction);
  //emitter1.emit(direction.mult(-1));
  
  emitter.emit(new PVector(0.0,0.0,0.0));
  emitter1.emit(new PVector(0.0,0.0,1.0));


   /*
   //axis lines for reference
   pushMatrix();
   translate(width/2,height/2);
   stroke(1.0,0.0,1.0);
   line(-5000,0,0, 5000,0,0);
   line(0,-5000,0,  0,5000,0);
   line(0,0,-5000, 0,0,5000);
   popMatrix();
   */
   
  cam.update().display();
  sky.display();
  
  emitter.update();
  emitter.display();
  emitter1.update();
  emitter1.display();
}

//move the camera randomly on leftclick, stop the camera on right click
void mouseClicked()
{
  if (mouseButton == LEFT) //move cam
    cam.mov.shove(PVector.random3D().mult(0.05), 0.5);
  if (mouseButton == RIGHT) //stop cam
    cam.mov.vel.mult(0.0);
}

//as above, but with key controls
void keyPressed() 
{
  if (key == 'm') //move cam
    cam.mov.shove(PVector.random3D().mult(0.05), 0.5);
  if (key == 's') //stop cam
    cam.mov.vel.mult(0.0);
}
