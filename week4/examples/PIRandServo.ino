/* This code sweeps a servo from 0 degrees to 180 when the PIR sensor detects motion.
   Special thanks goes to the author of the PIR sensor code, whose code helped tremendously
   in the making of this code and Instructable.
   author of PIR sensor code: Kristian Gohlke / krigoo (_) gmail (_) com / http://krx.at
**/

#include <Servo.h>

Servo myservo;  //creates a servo object
                         //a maximum of eight servo objects can be created

int pos = 0;        //variable to store servo position

//amount of time we give the sensor to calibrate(10-60 secs according to the datasheet)

int calibrationTime = 30;

//the time when the sensor outputs a low impulse
long unsigned int lowIn;        

//the amount of milliseconds the sensor has to be low
//before we assume all motion has stopped
long unsigned int pause = 5000; 

boolean lockLow = true;
boolean takeLowTime; 

int pirPin = 12;            //digital pin connected to the PIR's output
int pirPos = 13;           //connects to the PIR's 5V pin

void setup(){
  myservo.attach(4);    //attaches servo to pin 4
  Serial.begin(9600);    //begins serial communication
  pinMode(pirPin, INPUT);
  pinMode(pirPos, OUTPUT);
  digitalWrite(pirPos, HIGH);

  //give the sensor time to calibrate
  Serial.println("calibrating sensor ");
  for(int i = 0; i < calibrationTime; i++){
    Serial.print(calibrationTime - i);
    Serial.print("-");
    delay(1000);
  }
  Serial.println();
  Serial.println("done");
 
  //while making this Instructable, I had some issues with the PIR's output
  //going HIGH immediately after calibrating
  //this waits until the PIR's output is low before ending setup
  while (digitalRead(pirPin) == HIGH) {
    delay(500);
    Serial.print(".");     
  }
  Serial.print("SENSOR ACTIVE");
}

void loop(){

  if(digitalRead(pirPin) == HIGH){  //if the PIR output is HIGH, turn servo

    /*turns servo from 0 to 180 degrees and back
    it does this by increasing the variable "pos" by 1 every 5 milliseconds until it hits 180
    and setting the servo's position in degrees to "pos" every 5 milliseconds
    it then does it in reverse to have it go back
    to learn more about this, google "for loops"
    to change the amount of degrees the servo turns, change the number 180 to the number of degrees you want it to turn
    **/
    for(pos = 0; pos < 180; pos += 1)  //goes from 0 to 180 degrees
    {                                                 //in steps of one degree
      myservo.write(pos);                   //tells servo to go to position in variable "pos"
      delay(10);                                   //waits for the servo to reach the position
    }
    for(pos = 180; pos>=1; pos-=1)    //goes from 180 to 0 degrees
    {                               
      myservo.write(pos);                  //to make the servo go faster, decrease the time in delays for
      delay(10);                                  //to make it go slower, increase the number.
    }
   
    if(lockLow){ 
      //makes sure we wait for a transition to LOW before further output is made
      lockLow = false;           
      Serial.println("---");
      Serial.print("motion detected at ");
      Serial.print(millis()/1000);
      Serial.println(" sec");
      delay(10);
    }        
    takeLowTime = true;
  }

  if(digitalRead(pirPin) == LOW){      

    if(takeLowTime){
      lowIn = millis();             //save the time of the transition from HIGH to LOW
      takeLowTime = false;    //make sure this is only done at the start of a LOW phase
    }
   
    //if the sensor is low for more than the given pause,
    //we can assume the motion has stopped
    if(!lockLow && millis() - lowIn > pause){
      //makes sure this block of code is only executed again after
      //a new motion sequence has been detected
      lockLow = true;                       
      Serial.print("motion ended at "); //output
      Serial.print((millis() - pause)/1000);
      Serial.println(" sec");
      delay(10);
    }
  }
}
