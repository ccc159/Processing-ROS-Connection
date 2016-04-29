void ModelWindowDraw(PApplet w){
  w.background(0);
  w.translate(100,100);
  w.scale(10);
  updateDrone(w);
  drawMarkers(w);
}