#include <LiquidCrystal.h>
const int rs = 12, en = 11, d4 = 5, d5 = 4, d6 = 3, d7 = 2;
LiquidCrystal lcd(rs, en, d4, d5, d6, d7);
const int PinAnalogo=A0;
int ValorADC;
float value;
void setup() {
lcd.begin(16, 2);
}

void loop() {
  
  ValorADC=analogRead(PinAnalogo);
  lcd.setCursor(0,0);
  value = fmap(ValorADC, 0, 1021, 0.0, 5.0); 
  lcd.print("Voltaje = " + String(value));
  delay(100);

}
float fmap(float x, float in_min, float in_max, float out_min, float out_max)
{
   return (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;
}
