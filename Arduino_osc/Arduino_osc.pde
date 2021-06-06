
 
import oscP5.*;
import netP5.*;
import processing.serial.*;
import cc.arduino.*;  
OscP5 oscP5;
NetAddress myRemoteLocation;
Arduino arduino;


void setup() {
  println(Arduino.list()); //show all arduinos conected
  size(500,500);

oscP5 = new OscP5(this,12000);
arduino = new Arduino(this, Arduino.list()[0], 57600);

  background(0);  
  myRemoteLocation = new NetAddress("127.0.0.1",51000);
}




void draw() {
  OscMessage myMessage = new OscMessage("/test");
 int PotenVal= arduino.analogRead(1);
 float blueMapHydra =  map(PotenVal,0,1023,0,1);
 float BlueMapProcessing=map(PotenVal,0,1023,0,255);
 background(BlueMapProcessing,255,255);
  myMessage.add(blueMapHydra); 
  println(BlueMapProcessing);
  oscP5.send(myMessage, myRemoteLocation); 
}
