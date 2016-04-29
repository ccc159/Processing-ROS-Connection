/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

public void optStringSelected(GOption source, GEvent event) { //_CODE_:optString:680026:
  txtStringOrTwist.setText("std_msgs/String");
} //_CODE_:optString:680026:

public void optTwistSelected(GOption source, GEvent event) { //_CODE_:optTwist:898540:
  txtStringOrTwist.setText("geometry_msgs/Twist");
} //_CODE_:optTwist:898540:

public void optTwistStampedSeleted(GOption source, GEvent event) { //_CODE_:optTwistStamped:634545:
  txtStringOrTwist.setText("geometry_msgs/TwistStamped");
} //_CODE_:optTwistStamped:634545:

public void btnConnectServerClick(GButton source, GEvent event) { //_CODE_:btnConnectServer:453006:
  String msg = txtWebsocketServer.getText();
  wsc= new WebsocketClient(this, msg);
  labStatus.setText("The server " + msg + " is connected");
  connected = true;
} //_CODE_:btnConnectServer:453006:

public void btnSubscribeClick(GButton source, GEvent event) { //_CODE_:btnSubscribe:630363:
  String msg = txtTopic.getText();
  if(connected){
  wsc.sendMessage(SubscribeTopic(msg));
  labStatus.setText("The topic: '" + msg + "' is subscribed");
  }else{
  labStatus.setText("WARNING: server is not yet connected");
  }
} //_CODE_:btnSubscribe:630363:

public void btnUnSubscribeClick(GButton source, GEvent event) { //_CODE_:btnUnSubscribe:607106:
  String msg = txtTopic.getText();
  if(connected){
  wsc.sendMessage(UnSubscribeTopic(msg));
  labStatus.setText("The topic: '" + msg + "' is unsubscribed");
  }else{
  labStatus.setText("WARNING: server is not yet connected");
  }
} //_CODE_:btnUnSubscribe:607106:

public void btnCallServiceClick(GButton source, GEvent event) { //_CODE_:btnCallService:975244:
  String msg = txtService.getText();
  String arg = txtArgs.getText();
  if(connected){
  wsc.sendMessage(CallService(msg,arg));
  labStatus.setText("The service require: '" + msg + "' is sent to the server");
  }else{
  labStatus.setText("WARNING: server is not yet connected");
  }
} //_CODE_:btnCallService:975244:

public void btnAdvertiseClick(GButton source, GEvent event) { //_CODE_:btnAdvertise:637947:
  String msg = txtAdvertiseTopic.getText();
  String topic = txtStringOrTwist.getText();
  if(connected){
  wsc.sendMessage(AdvertiseString(msg,topic));
  labStatus.setText("The topic : '" + msg + "' is advertised");
  }else{
  labStatus.setText("WARNING: server is not yet connected");
  }
} //_CODE_:btnAdvertise:637947:

public void btnUnAdvertiseClick(GButton source, GEvent event) { //_CODE_:btnUnAdvertise:840832:
  String msg = txtAdvertiseTopic.getText();
  if(connected){
  wsc.sendMessage(unAdvertiseString(msg));
  labStatus.setText("The topic : '" + msg + "' is unadvertised");
  }else{
  labStatus.setText("WARNING: server is not yet connected");
  }
} //_CODE_:btnUnAdvertise:840832:

public void btnTopicListClick(GButton source, GEvent event) { //_CODE_:btnTopicList:549231:
  receiveTopic = true;
  if(connected){
  wsc.sendMessage(CallService("/rosapi/topics",""));
  labStatus.setText("Current Topic List");
  }else{
  labStatus.setText("WARNING: server is not yet connected");
  }
  
} //_CODE_:btnTopicList:549231:

public void btnPublishClicked(GButton source, GEvent event) { //_CODE_:btnPublish:672119:
 keepsending = true;
  
} //_CODE_:btnPublish:672119:

public void btnExitClicked(GButton source, GEvent event) { //_CODE_:btnExit:412470:
  exit();
} //_CODE_:btnExit:412470:

public void btnPausePublishClick(GButton source, GEvent event) { //_CODE_:btnPausePublish:774827:
  keepsending = false;
} //_CODE_:btnPausePublish:774827:

public void TopicListClick(GDropList source, GEvent event) { //_CODE_:TopicList:604736:
  txtTopic.setText(TopicList.getSelectedText());
  txtPublishTopic.setText(TopicList.getSelectedText());
} //_CODE_:TopicList:604736:

public void DefaultTopicsClick(GDropList source, GEvent event) { //_CODE_:DefaultTopics:278753:
  txtTopic.setText(DefaultTopics.getSelectedText());
  txtPublishTopic.setText(DefaultTopics.getSelectedText());
} //_CODE_:DefaultTopics:278753:

public void PauseTopicListClick(GButton source, GEvent event) { //_CODE_:PauseTopicList:732539:
  receiveTopic = false;
} //_CODE_:PauseTopicList:732539:

public void btnConnectGHClick(GButton source, GEvent event) { //_CODE_:btnConnectGH:302152:
  GHServer = new WebsocketServer(this,int(txtGHServerPort.getText()),"");
} //_CODE_:btnConnectGH:302152:

public void btnSendMsgClick(GButton source, GEvent event) { //_CODE_:btnSendMsg:298317:
  GHconnected = true;
} //_CODE_:btnSendMsg:298317:

synchronized public void DrawModelSpace(PApplet appc, GWinData data) { //_CODE_:ModelSpace:583256:
  ModelWindowDraw(appc);
} //_CODE_:ModelSpace:583256:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.CYAN_SCHEME);
  G4P.setMouseOverEnabled(false);
  surface.setTitle("ROS Connector");
  labTitle = new GLabel(this, 434, 14, 154, 42);
  labTitle.setText("ROS Connector");
  labTitle.setTextBold();
  labTitle.setOpaque(false);
  txtWebsocketServer = new GTextField(this, 154, 56, 154, 14, G4P.SCROLLBARS_NONE);
  txtWebsocketServer.setText("ws://192.168.xxx.xxx:9090");
  txtWebsocketServer.setOpaque(true);
  label1 = new GLabel(this, 28, 56, 126, 14);
  label1.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  label1.setText("Websocket Server");
  label1.setOpaque(false);
  label2 = new GLabel(this, 28, 84, 126, 14);
  label2.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  label2.setText("Topic");
  label2.setOpaque(false);
  txtTopic = new GTextField(this, 154, 84, 154, 14, G4P.SCROLLBARS_NONE);
  txtTopic.setText("/itech_ros/marker_pose/pose_corrected");
  txtTopic.setOpaque(true);
  label3 = new GLabel(this, 28, 112, 126, 14);
  label3.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  label3.setText("Service");
  label3.setOpaque(false);
  txtService = new GTextField(this, 154, 112, 154, 14, G4P.SCROLLBARS_NONE);
  txtService.setText("/rosapi/topics");
  txtService.setOpaque(true);
  label4 = new GLabel(this, 28, 126, 126, 14);
  label4.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  label4.setText("Args[optional]");
  label4.setOpaque(false);
  txtArgs = new GTextField(this, 154, 126, 154, 14, G4P.SCROLLBARS_NONE);
  txtArgs.setOpaque(true);
  label5 = new GLabel(this, 28, 154, 126, 14);
  label5.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  label5.setText("Advertise Topic");
  label5.setOpaque(false);
  txtAdvertiseTopic = new GTextField(this, 154, 154, 154, 14, G4P.SCROLLBARS_NONE);
  txtAdvertiseTopic.setOpaque(true);
  label6 = new GLabel(this, 28, 182, 126, 14);
  label6.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  label6.setText("Topic Type");
  label6.setOpaque(false);
  txtTopicType = new GToggleGroup();
  optString = new GOption(this, 154, 182, 28, 14);
  optString.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  optString.setText("S");
  optString.setOpaque(false);
  optString.addEventHandler(this, "optStringSelected");
  optTwist = new GOption(this, 182, 182, 28, 14);
  optTwist.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  optTwist.setText("T");
  optTwist.setOpaque(false);
  optTwist.addEventHandler(this, "optTwistSelected");
  optTwistStamped = new GOption(this, 210, 182, 42, 14);
  optTwistStamped.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  optTwistStamped.setText("TS");
  optTwistStamped.setOpaque(false);
  optTwistStamped.addEventHandler(this, "optTwistStampedSeleted");
  txtTopicType.addControl(optString);
  txtTopicType.addControl(optTwist);
  optTwist.setSelected(true);
  txtTopicType.addControl(optTwistStamped);
  btnConnectServer = new GButton(this, 322, 56, 98, 14);
  btnConnectServer.setText("Connect Server");
  btnConnectServer.setLocalColorScheme(GCScheme.RED_SCHEME);
  btnConnectServer.addEventHandler(this, "btnConnectServerClick");
  btnSubscribe = new GButton(this, 322, 84, 98, 14);
  btnSubscribe.setText("Subscribe");
  btnSubscribe.addEventHandler(this, "btnSubscribeClick");
  btnUnSubscribe = new GButton(this, 434, 84, 98, 14);
  btnUnSubscribe.setText("UnSubscribe");
  btnUnSubscribe.addEventHandler(this, "btnUnSubscribeClick");
  btnCallService = new GButton(this, 322, 112, 98, 14);
  btnCallService.setText("Call Service");
  btnCallService.addEventHandler(this, "btnCallServiceClick");
  btnAdvertise = new GButton(this, 322, 154, 98, 14);
  btnAdvertise.setText("Advertise");
  btnAdvertise.addEventHandler(this, "btnAdvertiseClick");
  btnUnAdvertise = new GButton(this, 434, 154, 98, 14);
  btnUnAdvertise.setText("UnAdvertise");
  btnUnAdvertise.addEventHandler(this, "btnUnAdvertiseClick");
  txtLog = new GTextArea(this, 770, 98, 210, 308, G4P.SCROLLBARS_NONE);
  txtLog.setOpaque(true);
  labStatus = new GLabel(this, 546, 56, 434, 14);
  labStatus.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  labStatus.setText("waiting to connect...");
  labStatus.setLocalColorScheme(GCScheme.RED_SCHEME);
  labStatus.setOpaque(false);
  txtStringOrTwist = new GLabel(this, 252, 182, 280, 14);
  txtStringOrTwist.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  txtStringOrTwist.setText("geometry_msgs/Twist");
  txtStringOrTwist.setOpaque(false);
  btnTopicList = new GButton(this, 28, 392, 112, 14);
  btnTopicList.setText("Get Topic List");
  btnTopicList.addEventHandler(this, "btnTopicListClick");
  linearX = new GSlider(this, 28, 224, 140, 56, 10.0);
  linearX.setShowValue(true);
  linearX.setShowLimits(true);
  linearX.setLimits(0.0, -0.3, 0.3);
  linearX.setNbrTicks(10);
  linearX.setShowTicks(true);
  linearX.setEasing(4.0);
  linearX.setNumberFormat(G4P.DECIMAL, 2);
  linearX.setOpaque(false);
  linearY = new GSlider(this, 210, 224, 140, 56, 10.0);
  linearY.setShowValue(true);
  linearY.setShowLimits(true);
  linearY.setLimits(0.0, -0.3, 0.3);
  linearY.setNbrTicks(10);
  linearY.setShowTicks(true);
  linearY.setEasing(4.0);
  linearY.setNumberFormat(G4P.DECIMAL, 2);
  linearY.setOpaque(false);
  linearZ = new GSlider(this, 392, 224, 140, 56, 10.0);
  linearZ.setShowValue(true);
  linearZ.setShowLimits(true);
  linearZ.setLimits(0.0, -0.3, 0.3);
  linearZ.setNbrTicks(10);
  linearZ.setShowTicks(true);
  linearZ.setEasing(4.0);
  linearZ.setNumberFormat(G4P.DECIMAL, 2);
  linearZ.setOpaque(false);
  label7 = new GLabel(this, 28, 210, 84, 14);
  label7.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  label7.setText("linearX");
  label7.setOpaque(false);
  label8 = new GLabel(this, 392, 210, 84, 14);
  label8.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  label8.setText("linearZ");
  label8.setOpaque(false);
  label9 = new GLabel(this, 210, 210, 84, 14);
  label9.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  label9.setText("linearY");
  label9.setOpaque(false);
  angularX = new GSlider(this, 28, 308, 140, 56, 10.0);
  angularX.setShowValue(true);
  angularX.setShowLimits(true);
  angularX.setLimits(0.0, -0.3, 0.3);
  angularX.setNbrTicks(10);
  angularX.setShowTicks(true);
  angularX.setEasing(4.0);
  angularX.setNumberFormat(G4P.DECIMAL, 2);
  angularX.setOpaque(false);
  angularY = new GSlider(this, 210, 308, 140, 56, 10.0);
  angularY.setShowValue(true);
  angularY.setShowLimits(true);
  angularY.setLimits(0.0, -0.3, 0.3);
  angularY.setNbrTicks(10);
  angularY.setShowTicks(true);
  angularY.setEasing(4.0);
  angularY.setNumberFormat(G4P.DECIMAL, 2);
  angularY.setOpaque(false);
  angularZ = new GSlider(this, 392, 308, 140, 56, 10.0);
  angularZ.setShowValue(true);
  angularZ.setShowLimits(true);
  angularZ.setLimits(0.0, -0.3, 0.3);
  angularZ.setNbrTicks(10);
  angularZ.setShowTicks(true);
  angularZ.setEasing(4.0);
  angularZ.setNumberFormat(G4P.DECIMAL, 2);
  angularZ.setOpaque(false);
  label10 = new GLabel(this, 28, 294, 84, 14);
  label10.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  label10.setText("angularX");
  label10.setOpaque(false);
  label11 = new GLabel(this, 210, 294, 84, 14);
  label11.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  label11.setText("angularY");
  label11.setOpaque(false);
  label12 = new GLabel(this, 392, 294, 84, 14);
  label12.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  label12.setText("angularZ");
  label12.setOpaque(false);
  btnPublish = new GButton(this, 546, 462, 98, 14);
  btnPublish.setText("Publish");
  btnPublish.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  btnPublish.addEventHandler(this, "btnPublishClicked");
  MsgToPublish = new GTextArea(this, 546, 98, 210, 308, G4P.SCROLLBARS_NONE);
  MsgToPublish.setPromptText("If you are publishing String, type your message here");
  MsgToPublish.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  MsgToPublish.setOpaque(true);
  label13 = new GLabel(this, 546, 84, 126, 14);
  label13.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  label13.setText("Message to Publish");
  label13.setOpaque(false);
  btnExit = new GButton(this, 434, 56, 98, 14);
  btnExit.setText("Exit");
  btnExit.setLocalColorScheme(GCScheme.RED_SCHEME);
  btnExit.addEventHandler(this, "btnExitClicked");
  btnPausePublish = new GButton(this, 658, 462, 98, 14);
  btnPausePublish.setText("PausePublish");
  btnPausePublish.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  btnPausePublish.addEventHandler(this, "btnPausePublishClick");
  txtPublishTopic = new GTextField(this, 546, 434, 434, 14, G4P.SCROLLBARS_NONE);
  txtPublishTopic.setText("/mavros/setpoint_velocity/cmd_vel");
  txtPublishTopic.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  txtPublishTopic.setOpaque(true);
  label14 = new GLabel(this, 546, 420, 126, 14);
  label14.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  label14.setText("Topic to be published");
  label14.setOpaque(false);
  TopicList = new GDropList(this, 28, 434, 504, 154, 10);
  TopicList.setItems(loadStrings("list_604736"), 0);
  TopicList.addEventHandler(this, "TopicListClick");
  DefaultTopics = new GDropList(this, 546, 546, 434, 42, 2);
  DefaultTopics.setItems(loadStrings("list_278753"), 0);
  DefaultTopics.addEventHandler(this, "DefaultTopicsClick");
  label15 = new GLabel(this, 28, 420, 112, 14);
  label15.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  label15.setText("Current Topic List");
  label15.setOpaque(false);
  label16 = new GLabel(this, 546, 532, 112, 14);
  label16.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  label16.setText("Defalut Topic List");
  label16.setOpaque(false);
  PauseTopicList = new GButton(this, 154, 392, 112, 14);
  PauseTopicList.setText("Pause TopicList");
  PauseTopicList.addEventHandler(this, "PauseTopicListClick");
  label17 = new GLabel(this, 770, 84, 210, 14);
  label17.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  label17.setText("System Log");
  label17.setOpaque(false);
  label18 = new GLabel(this, 770, 462, 98, 14);
  label18.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  label18.setText("GH Server Port");
  label18.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  label18.setOpaque(false);
  txtGHServerPort = new GTextField(this, 868, 462, 56, 14, G4P.SCROLLBARS_NONE);
  txtGHServerPort.setText("1615");
  txtGHServerPort.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  txtGHServerPort.setOpaque(true);
  btnConnectGH = new GButton(this, 770, 518, 98, 14);
  btnConnectGH.setText("Start Server");
  btnConnectGH.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  btnConnectGH.addEventHandler(this, "btnConnectGHClick");
  label19 = new GLabel(this, 770, 490, 98, 14);
  label19.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  label19.setText("Frequence");
  label19.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  label19.setOpaque(false);
  txtTime = new GTextField(this, 868, 490, 56, 14, G4P.SCROLLBARS_NONE);
  txtTime.setText("30");
  txtTime.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  txtTime.setOpaque(true);
  label20 = new GLabel(this, 924, 490, 70, 14);
  label20.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  label20.setText("ms");
  label20.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  label20.setOpaque(false);
  btnSendMsg = new GButton(this, 882, 518, 98, 14);
  btnSendMsg.setText("Send Msg");
  btnSendMsg.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  btnSendMsg.addEventHandler(this, "btnSendMsgClick");
  ModelSpace = GWindow.getWindow(this, "ModelSpace", 0, 0, 600, 600, P3D);
  ModelSpace.noLoop();
  ModelSpace.setActionOnClose(G4P.EXIT_APP);
  ModelSpace.addDrawHandler(this, "DrawModelSpace");
  ModelSpace.loop();
}

// Variable declarations 
// autogenerated do not edit
GLabel labTitle; 
GTextField txtWebsocketServer; 
GLabel label1; 
GLabel label2; 
GTextField txtTopic; 
GLabel label3; 
GTextField txtService; 
GLabel label4; 
GTextField txtArgs; 
GLabel label5; 
GTextField txtAdvertiseTopic; 
GLabel label6; 
GToggleGroup txtTopicType; 
GOption optString; 
GOption optTwist; 
GOption optTwistStamped; 
GButton btnConnectServer; 
GButton btnSubscribe; 
GButton btnUnSubscribe; 
GButton btnCallService; 
GButton btnAdvertise; 
GButton btnUnAdvertise; 
GTextArea txtLog; 
GLabel labStatus; 
GLabel txtStringOrTwist; 
GButton btnTopicList; 
GSlider linearX; 
GSlider linearY; 
GSlider linearZ; 
GLabel label7; 
GLabel label8; 
GLabel label9; 
GSlider angularX; 
GSlider angularY; 
GSlider angularZ; 
GLabel label10; 
GLabel label11; 
GLabel label12; 
GButton btnPublish; 
GTextArea MsgToPublish; 
GLabel label13; 
GButton btnExit; 
GButton btnPausePublish; 
GTextField txtPublishTopic; 
GLabel label14; 
GDropList TopicList; 
GDropList DefaultTopics; 
GLabel label15; 
GLabel label16; 
GButton PauseTopicList; 
GLabel label17; 
GLabel label18; 
GTextField txtGHServerPort; 
GButton btnConnectGH; 
GLabel label19; 
GTextField txtTime; 
GLabel label20; 
GButton btnSendMsg; 
GWindow ModelSpace;