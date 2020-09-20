
void setup()
{
        Serial.begin(9600); //Abrimos la comunicación serie con el PC y establecemos velocidad
        pinMode(11, OUTPUT);    // sets the digital pin 13 as output
        pinMode(10, OUTPUT);    // sets the digital pin 13 as output
}

void loop()
{
  if(Serial.available()>0){        // lee el bluetooth y almacena en estado
    char c = Serial.read();  //gets one byte from serial buffer
    if(c == '1'){
      Serial.write("Apagando foco 1");
      digitalWrite(11, LOW); // sets the digital pin 13 on
    }
    if(c == '2'){
      Serial.write("Prendiendo foco 1");
      digitalWrite(11, HIGH); // sets the digital pin 13 on
    }
    if(c == '3'){
      Serial.write("Apagando foco 2");
      digitalWrite(10, LOW); // sets the digital pin 13 on
    }
    if(c == '4'){
      Serial.write("Prendiendo foco 2");
      digitalWrite(10, HIGH); // sets the digital pin 13 on
    }
  }
}

