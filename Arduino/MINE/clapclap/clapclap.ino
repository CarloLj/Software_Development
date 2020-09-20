const int pinRELE = 9; 
const int pinMicrophone = 8;
bool state1 = false;
bool state2 = false;
bool state3 = false;
bool stateLED = false;
bool Whattoread = false;
bool apagar=false;
bool soundDetected = false;
bool revisar=true;
unsigned long tem;
#include <LiquidCrystal.h>

LiquidCrystal display(2, 3, 4, 5, 6, 7);
void setup(){
  display.begin(16,2);
  pinMode(pinRELE, OUTPUT);
  pinMode(pinMicrophone, INPUT);
  Serial.begin(9600);
}
 
void loop(){
 if(!apagar){
  if(revisar){
      display.clear();
      display.print("Apagado");
      revisar = false;
  }
  soundDetected = digitalRead(pinMicrophone);
  if ((soundDetected==true) && (state1==false) && (state2==false) && (state3==false)) {
  state1 = true;
  Serial.println("Estado1 true");
  tem = millis();
  delay (200);
  } else if ((soundDetected == true) && (state1==true) && (state2==false) && (state3==false) ) {
  state2 = true; 
  Serial.println("Estado2 true");
  delay (200);
  } else if ((soundDetected == true) && (state1==true) && (state2==true) && (state3==false) ) {
  state3 = true; 
  Serial.println("Estado3 true");
  delay (200);  
  }
 
  if ((state1==true) && (state2==true) && (state3==true)){
  stateLED = !stateLED;
  digitalWrite(pinRELE , stateLED);
  Serial.println("Reset");
  state1 = false; 
  state2 = false;
  state3 = false; 
  apagar=true;
  display.clear();
  display.print("Prendido");  
  delay(1000);  
  }
 
  if (((millis()-tem) >= 800) && (state1==true) && (state2==false || state3==false)){ // Reseteamos estados al pasar 500 ms
  Serial.println("Reset Time");
  Serial.println((millis()-tem));
  state1 = false; 
  state2 = false;
  state3 = false;
  }
 }else{
  soundDetected = digitalRead(pinMicrophone);
  if ((soundDetected==true) && (state1==false) && (state2==false) && (state3==false)) {
  state1 = true;
  Serial.println("Estado1 true");
  tem = millis();
  delay (200);
  } else if ((soundDetected == true) && (state1==true) && (state2==false) && (state3==false) ) {
  state2 = true; 
  Serial.println("Estado2 true");
  delay (200);
  } else if ((soundDetected == true) && (state1==true) && (state2==true) && (state3==false) ) {
  state3 = true; 
  Serial.println("Estado3 true");
  delay (200);  
  }
 
  if ((state1==true) && (state2==true) && (state3==true)){
  stateLED = !stateLED;
  digitalWrite(pinRELE , stateLED);
  Serial.println("Reset");
  state1 = false; 
  state2 = false;
  state3 = false; 
  apagar=false;
  display.clear();
  display.print("Apagado");  
  delay(1000);  
  }
 
  if (((millis()-tem) >= 800) && (state1==true) && (state2==false || state3==false)){ // Reseteamos estados al pasar 500 ms
  Serial.println("Reset Time");
  Serial.println((millis()-tem));
  state1 = false; 
  state2 = false;
  state3 = false;
  }
}
}
