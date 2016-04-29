JSONObject json;

String SubscribeTopic(String Topic){
json = new JSONObject();
json.setString("op", "subscribe");
json.setString("topic", Topic);
return json.toString();
}

String UnSubscribeTopic(String Topic){
json = new JSONObject();
json.setString("op", "unsubscribe");
json.setString("topic", Topic);
return json.toString();
}

String AdvertiseString(String Topic, String Type){
json = new JSONObject();
json.setString("op", "advertise");
json.setString("topic", Topic);
json.setString("type", Type);
return json.toString();
}

String unAdvertiseString(String Topic){
json = new JSONObject();
json.setString("op", "unadvertise");
json.setString("topic", Topic);
return json.toString();
}

String CallService(String Topic, String Arg){
json = new JSONObject();
json.setString("op", "call_service");
json.setString("service", Topic);
if(Arg != "")json.setString("args", Arg);
return json.toString();
}

String PublishString(String Topic,String Msg){
json = new JSONObject();
JSONObject data = new JSONObject();
data.setString("data",Msg);
json.setString("op", "publish");
json.setString("topic", Topic);
json.setJSONObject("msg", data);
return json.toString();
}

String PublishTwist(String Topic){
json = new JSONObject();
JSONObject twist = new JSONObject();
JSONObject Ang = new JSONObject();
JSONObject Lin = new JSONObject();
JSONObject data = new JSONObject();
Ang.setFloat("x",angularX.getValueF());
Ang.setFloat("y",angularY.getValueF());
Ang.setFloat("z",angularZ.getValueF());
Lin.setFloat("x",linearX.getValueF());
Lin.setFloat("y",linearY.getValueF());
Lin.setFloat("z",linearZ.getValueF());
twist.setJSONObject("angular",Ang);
twist.setJSONObject("linear",Lin);
json.setString("op", "publish");
json.setString("topic", Topic);
data.setJSONObject("twist", twist);
json.setJSONObject("msg", data);
return json.toString();
}

String PublishTwistStamped(String Topic){
json = new JSONObject();
JSONObject twist = new JSONObject();
JSONObject Ang = new JSONObject();
JSONObject Lin = new JSONObject();
JSONObject data = new JSONObject();
Ang.setFloat("x",angularX.getValueF());
Ang.setFloat("y",angularY.getValueF());
Ang.setFloat("z",angularZ.getValueF());
Lin.setFloat("x",linearX.getValueF());
Lin.setFloat("y",linearY.getValueF());
Lin.setFloat("z",linearZ.getValueF());
twist.setJSONObject("angular",Ang);
twist.setJSONObject("linear",Lin);
json.setString("op", "publish");
json.setString("topic", Topic);
data.setJSONObject("twist", twist);
data.setString("header", "");
json.setJSONObject("msg", data);
return json.toString();
}

void ParseToTopic(String Msg){
  if(Msg == null) return;
  if(receiveTopic == false) return;
  JSONObject obj = JSONObject.parse(Msg);
  Msg = obj.toString();
  if(Msg.contains("/rosapi/topics")){
   JSONObject values = obj.getJSONObject("values");
   JSONArray topics;
   topics = values.getJSONArray("topics");
   String [] tpcs= new String [topics.size()];
   for (int i = 0; i < topics.size(); i++) {
    String topic = topics.getString(i);
    tpcs[i] = topic;
   }
    tpcs = sort(tpcs);
    TopicList.setItems(tpcs,0);
  }
}

void ParseToPose(String Msg){
  if(Msg == null) return;
  JSONObject obj = JSONObject.parse(Msg);
  Msg = obj.toString();
  if(Msg.contains("/itech_ros/marker_pose/pose_corrected") && (Msg.contains("orientation"))){
   JSONObject msg = obj.getJSONObject("msg");
   JSONObject pose = msg.getJSONObject("pose");
   JSONObject position = pose.getJSONObject("position");
   JSONObject orientation = pose.getJSONObject("orientation");
    Positions[0] = position.getFloat("x");
    Positions[1] = position.getFloat("y");
    Positions[2] = position.getFloat("z");
    Orientations[0] = orientation.getFloat("w");
    Orientations[1] = orientation.getFloat("x");
    Orientations[2] = orientation.getFloat("y");
    Orientations[3] = orientation.getFloat("z");
  }
}