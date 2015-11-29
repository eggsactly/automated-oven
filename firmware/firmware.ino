//ARDUINO 1.0+ ONLY
//ARDUINO 1.0+ ONLY
#include <Ethernet.h>
#include <SPI.h>
#include <Servo.h> 

////////////////////////////////////////////////////////////////////////
//CONFIGURE
////////////////////////////////////////////////////////////////////////
byte server[] = { 98,172,84,203 }; //ip Address of the server you will connect to

//The location to go to on the server
//make sure to keep HTTP/1.0 at the end, this is telling it what type of file it is
String location = "/oven-get.php HTTP/1.0";


// if need to change the MAC address (Very Rare)
byte mac[] = { 0x90, 0xA2, 0xDA, 0x10, 0x2A, 0xEF };
////////////////////////////////////////////////////////////////////////

EthernetClient client;

Servo bakeServo;
Servo tempServo; 

char inString[32]; // string for incoming serial data
int stringPos = 0; // string index counter
boolean startRead = false; // is reading?

void setup(){
  Ethernet.begin(mac);
  Serial.begin(9600);
  
  bakeServo.attach(5);
  tempServo.attach(6); 
}

unsigned servoAngle; 

void loop() {
  String pageValue = connectAndRead(); //connect to the server and read the output
  
  // Decode the values

  Serial.print("Bake Value: ");
  Serial.println(pageValue.charAt(0));
  
  Serial.print("Temp Value: ");
  Serial.println(pageValue.substring(2).toInt());

  if(pageValue.length() > 2) {
    if(pageValue.charAt(0) == '1') {
      bakeServo.write(90);
    }
    else if(pageValue.charAt(0) == '2') {
      bakeServo.write(170);
    }
    else if(pageValue.charAt(180) == '3') {
      bakeServo.write(10);
    }
    
    tempServo.write(pageValue.substring(2).toInt());
  }

  delay(5000); //wait 5 seconds before connecting again
}



String connectAndRead(){
  //connect to the server

  Serial.println("connecting...");

  //port 80 is typical of a www page
  if (client.connect(server, 80)) {
    Serial.println("connected");
    client.print("GET ");
    client.println(location);
    client.println();

    //Connected - Read the page
    return readPage(); //go and read the output

  }else{
    return "connection failed";
  }

}

String readPage(){
  //read the page, and capture & return everything between '<' and '>'

  stringPos = 0;
  memset( &inString, 0, 32 ); //clear inString memory

  while(true){

    if (client.available()) {
      char c = client.read();

      if (c == '<' ) { //'<' is our begining character
        startRead = true; //Ready to start reading the part 
      }else if(startRead){

        if(c != '>'){ //'>' is our ending character
          inString[stringPos] = c;
          stringPos ++;
        }else{
          //got what we need here! We can disconnect now
          startRead = false;
          client.stop();
          client.flush();
          Serial.println("disconnecting.");
          return inString;

        }

      }
    }

  }

}
