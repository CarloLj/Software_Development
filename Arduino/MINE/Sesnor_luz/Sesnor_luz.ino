void setup() {
  pinMode(13, INPUT);
  pinMode(12, OUTPUT);
  Serial.begin(9600);
  Serial.println("Puedes ingresar un dato ya");
}

void loop() {
  int estado = digitalRead(13);
  if(estado == LOW){
    digitalWrite(12,HIGH);
  }
  else{
    digitalWrite(12,LOW);
  }
  // put your main code here, to run repeatedly:

}
