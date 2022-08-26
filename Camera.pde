/*
Camera class
---
note: doing transforms in func args because mat operations
    kinda don't work right. need to mess with beginCamera and endCamera
    more (otherwise translate() etc don't apply to the camera correctly)
    but I don't know how to adjust the lookAt of the camera that way.
---
*/
class Camera
{
  Movement mov;
  Movement lookat;
  float fov = PI/2.0;
  float aspect = float(width)/float(height);
  float nearplane = 10.0; //closest the cam can see
  float farplane = 32000.0; //farthest distance cam can see (needs to be twice the skybox radius) 
  
  Camera()
  {
    mov = new Movement();
    mov.pos.z = 500.0;
    lookat = new Movement();
    lookat.pos.x = width/2.0;
    lookat.pos.y = height/2.0;
  }
  
  Camera update()
  {
    this.mov.update();
    return this;
  }
  
  Camera display()
  {
    perspective(this.fov, this.aspect,
      this.nearplane,
      this.farplane);
    camera(
      mov.pos.x + width/2.0,
      mov.pos.y + height/2.0,
      mov.pos.z,
      lookat.pos.x, lookat.pos.y, 0,
      0, 1, 0);  
    return this;
  }
}
