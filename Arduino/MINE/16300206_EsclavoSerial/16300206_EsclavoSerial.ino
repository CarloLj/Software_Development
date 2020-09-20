#include  <LiquidCrystal.h>
#include <Keypad.h>

LiquidCrystal lcd(51, 53, 43, 45, 47, 49); //RS, E, D4, D5, D6, D7

void setup() {
  lcd.begin(16, 2);
  lcd.home();
  delay(1000);
  Serial.begin(9600);
}

void loop() {
  while(Serial.available())
  {
    char numero = Serial.read();
    lcd.print(numero);
  }
}
