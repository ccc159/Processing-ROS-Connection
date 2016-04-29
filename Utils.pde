WebsocketServer GHServer;
boolean GHconnected = false;
int now;

void Publish(){
if(keepsending){
 if(txtStringOrTwist.getText() == "std_msgs/String"){
    String string = PublishString(txtPublishTopic.getText(),MsgToPublish.getText());
    if(connected){
    wsc.sendMessage(string);
    labStatus.setText("The String Type MSG is published");
    }else{
    labStatus.setText("WARNING: server is not yet connected");
  }
  }
  if(txtStringOrTwist.getText() == "geometry_msgs/Twist"){
    String twist = PublishTwist(txtPublishTopic.getText());
    MsgToPublish.setText(twist);
    if(connected){
    wsc.sendMessage(twist); 
    labStatus.setText("The String TWIST MSG is published");
    }else{
  labStatus.setText("WARNING: server is not yet connected");
  }
  }
  if(txtStringOrTwist.getText() == "geometry_msgs/TwistStamped"){
    String twiststamped = PublishTwistStamped(txtPublishTopic.getText());
    MsgToPublish.setText(twiststamped);
     if(connected){
    wsc.sendMessage(twiststamped);
    
    labStatus.setText("The String TWISSTAMPED MSG is published");
    }else{
  labStatus.setText("WARNING: server is not yet connected");
  }
  }
}
}

void webSocketEvent(String msg){
   JSONObject obj = JSONObject.parse(msg);
   msg = obj.toString();
   sysLog = msg;
}

void webSocketServerEvent(String msg) {
  String[] parts = msg.split(",");
  DroneVel.x = float(parts[0]);
  DroneVel.y = float(parts[1]);
  DroneVel.z = float(parts[2]);
  linearX.setValue(DroneVel.x);
  linearY.setValue(DroneVel.y);
  linearZ.setValue(DroneVel.z);
}

void SendingMsgtoGH(){
  if(!GHconnected) return;
  //if(millis()>now+int(txtTime.getText())){
  String msg = "";
  for(int i=0;i<15;i++)msg+=(Matrixs[i])+",";
  msg+=(Matrixs[15]);
  GHServer.sendMessage(msg);
  //now=millis();
  //}
}