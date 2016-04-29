// Need G4P library
import g4p_controls.*;
import websockets.*;
import java.awt.Font; 
import peasy.*;

WebsocketClient wsc;
boolean keepsending = false;
boolean receiveTopic = true;
boolean connected = false;
String StrWebsocketServer = "ws://192.168.2.1:9090";
String sysLog;

PeasyCam cam;


public void setup(){
  size(1010, 600, P3D);
  createGUI();
  customGUI();
  // Place your setup code here
  loadDrone();
  cam = new PeasyCam(ModelSpace, 100); 
  cam.lookAt(100,100,0);
  
  JSONObject a = loadJSONObject("pose.json");
  ParseToPose(a.toString());
  transfertoDroneVectors();
  
}

public void draw(){
  background(250);
  Publish();
  txtLog.setText(sysLog);
  ParseToTopic(sysLog);
  ParseToPose(sysLog);
  now=millis();
  SendingMsgtoGH();
}

// Use this method to add additional statements
// to customise the GUI controls
public void customGUI(){
MsgToPublish.setFont(new Font("Consolas", Font.PLAIN, 10));
txtLog.setFont(new Font("Consolas", Font.PLAIN, 10));
txtWebsocketServer.setText(StrWebsocketServer);
labTitle.setFont(new Font("Consolas", Font.PLAIN, 18));
labStatus.setFont(new Font("Consolas", Font.BOLD, 12));
}