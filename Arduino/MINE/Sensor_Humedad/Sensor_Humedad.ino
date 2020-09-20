


//1025 max
//310 min

int maxValue = 1025; // valor sin mojar
int minValue = 310; // valor super mojado
int nLeds = 8;
int range;
void setup() {

  range = (maxValue - minValue) / nLeds;
  range = range - 47;
  for(int i = 2; i<10;i++){
    pinMode(i,OUTPUT);
  }
  Serial.begin(57600);

}

void loop() {

 int value;
 Serial.print("Sensor value:");
 value = analogRead(0);
 Serial.println(value);
 salidaLeds(value);
 delay(100);
}

void salidaLeds(int x){

  int cantLeds = 2;

  for(int i = 1 ; i<9 ; i++){
    
    if(x < maxValue - range * i && x > minValue + range * i){
      cantLeds = i + 1;
    }
    
  }
  
  for(int i = 2; i<10;i++){
    if(i<=cantLeds){
      digitalWrite(i,HIGH);
    }else{
      digitalWrite(i,LOW);
    }
  }

}
