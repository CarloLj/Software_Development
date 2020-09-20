/*
MODELO  SDA SCK
Uno     A4  A5
Nano    A4  A5
Mini ProA4  A5
Mega    20  21
*/
#include <Wire.h>
#include <LiquidCrystal.h>

LiquidCrystal lcd(51, 53, 43, 45, 47, 49); //RS, E, D4, D5, D6, D7
void setup() {
  lcd.begin(16, 2);
  lcd.home();
  delay(1000);
  Wire.begin(1);
  Wire.onReceive(recibi);
  Serial.begin(9600);
}

void loop() {
 delay(100);
}

void recibi(int n){
  String dato = "";
  while(1 < Wire.available()){
    char c = Wire.read();
    dato += c;
  }
  lcd.clear();
  lcd.print(dato);
  delay(500);
}
