import toxi.geom.*;
Vec3D DronePos = new Vec3D(0,0,0);
Vec3D DroneRot = new Vec3D(0,0,0);
Vec3D DroneVel = new Vec3D(0,0,0);
Matrix4x4 DroneMat = new Matrix4x4();
Quaternion DroneQua;

float [] Positions = new float [3];
float [] Orientations = new float [4];
float [] Matrixs = new float[16];

PShape drone; 
void loadDrone(){
  drone = loadShape("drone.svg");
  PShape C1 = drone.getChild("Circle1");
  PShape C2 = drone.getChild("Circle2");
  PShape C3 = drone.getChild("Circle3");
  PShape C4 = drone.getChild("Circle4");
  C1.setFill(color(79,161,185));
  C2.setFill(color(79,161,185));
  C3.setFill(color(79,161,185));
  C4.setFill(color(79,161,185));
  PShape B1 = drone.getChild("Beam1");
  PShape B2 = drone.getChild("Beam2");
  PShape B3 = drone.getChild("Beam3");
  PShape B4 = drone.getChild("Beam4");
  B1.setFill(color(255));
  B2.setFill(color(255));
  B3.setFill(color(255));
  B4.setFill(color(255));
  PShape Body = drone.getChild("Body");
  PShape Arrow = drone.getChild("Arrow");
  Body.setFill(color(255));
  Arrow.setFill(color(255));
}

void updateDrone(PApplet w){
  transfertoDroneVectors();
  w.pushMatrix();
  w.rotateX(DroneRot.x);
  w.rotateY(DroneRot.y);
  w.rotateZ(DroneRot.z);
  w.translate(DronePos.x,DronePos.y,DronePos.z);
  w.shape(drone,0,0,0.55,0.55);
  w.popMatrix();
}

void transfertoDroneVectors(){
  DronePos = new Vec3D(Positions[0],Positions[1],Positions[2]);
  DroneQua = new Quaternion(Orientations[0],Orientations[1],Orientations[2],Orientations[3]);
  float [] rots = DroneQua.toAxisAngle();
  DroneRot = new Vec3D(rots[1],rots[2],rots[3]);
  DroneMat = DroneQua.toMatrix4x4();
  DroneMat.toFloatArray(Matrixs);
}

void drawMarkers(PApplet w){
  w.rectMode(CORNER);
  w.fill(255,0,0);
  w.rect(2.0, 2.0,0.3,0.3);
  w.rect(2.75, 1.5,0.3,0.3);
  w.rect(2.75, 2.5,0.3,0.3);
  w.rect(3.5, 1.5,0.3,0.3);
  w.rect(3.5, 2.5,0.3,0.3);
  w.rect(4.25, 2.0,0.3,0.3);
  w.stroke(255);
  w.strokeWeight(0.1);
  w.line(0,0,10,0);
  w.line(0,0,0,10);
  w.line(0,0,0,0,0,10);
  
}