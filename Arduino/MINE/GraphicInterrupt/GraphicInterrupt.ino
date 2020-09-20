#include <avr/io.h>
#include <avr/interrupt.h>
#include <LiquidCrystal.h>

volatile byte segundos;
const int intPin = 2;
int nubepos=4;
int contador=1;
int pos;
LiquidCrystal lcd = LiquidCrystal(A0, A1, A2, A3, A4, A5);
byte cabezaamedias[] = {
  B00000,
  B00000,
  B00000,
  B00000,
  B01110,
  B01010,
  B01110,
  B00100
};

byte cuerpoamedias[] = {
  B01110,
  B10101,
  B01010,
  B01010,
  B00000,
  B00000,
  B00000,
  B00000
};

byte Nubeizq[8] = {
  B00011,
  B01100,
  B10000,
  B10000,
  B01111,
  B00001,
  B00101,
  B00100
};

byte Nubeder[8] = {
  B01100,
  B10110,
  B00001,
  B00001,
  B11110,
  B00100,
  B10100,
  B10000
};

byte customChar[8] = {
  B01110,
  B01010,
  B01110,
  B00100,
  B01110,
  B10101,
  B01010,
  B01010
};

byte customChar2[8] = {
  B01110,
  B01010,
  B01110,
  B00101,
  B01110,
  B10100,
  B01010,
  B01010
};

void setup(){
  cli();
  TCCR1A=0;
  TCCR1B=0;
  OCR1A=15624;
  TCCR1B |= (1<<WGM12);
  TCCR1B |= (1<<CS10);
  TCCR1B |= (1<<CS12);
  TIMSK1=(1<<OCIE1A);
  sei();
  attachInterrupt(digitalPinToInterrupt(intPin), saludar, CHANGE);
        lcd.begin(16, 2);
        lcd.createChar(1, customChar);
        lcd.createChar(0, customChar2);
        lcd.createChar(2, Nubeizq);
        lcd.createChar(3, Nubeder);
        lcd.createChar(4, cabezaamedias);
        lcd.createChar(5, cuerpoamedias);
}

void loop()
{ 
  lcd.write((uint8_t)0);
  lcd.clear();
  for (pos = 0; pos < 16; pos++)
      {
        if(contador == 3){
        nubepos++;
        contador=0;
        if(nubepos==15){
          nubepos=0;
        }
        }
        lcd.clear();//Situamos el cursor
        lcd.setCursor(nubepos, 0);// Escribimos el texto
        lcd.write((uint8_t)2);// Esperamos
        lcd.setCursor(nubepos+1, 0);// Escribimos el texto
        lcd.write((uint8_t)3);// Esperamos
        lcd.setCursor(pos, 1);// Escribimos el texto
        lcd.write(1);// Esperamos
        delay(200);
        contador++;
      }
}

ISR(TIMER1_COMPA_vect){
  segundos++;
  if(segundos==15)
  {
    if(nubepos == pos || nubepos+1 == pos){
          nubepos++;
          nubepos++;
    }
    for(int i=0; i<5; i++)
    {
        lcd.clear();//Situamos el cursor
        lcd.setCursor(nubepos, 0);// Escribimos el texto
        lcd.write((uint8_t)2);// Esperamos
        lcd.setCursor(nubepos+1, 0);// Escribimos el texto
        lcd.write((uint8_t)3);// Esperamos
        
        lcd.setCursor(pos, 1);// Escribimos el texto
        lcd.write((uint8_t)0);// Esperamos
        delay(50000);
        lcd.setCursor(pos, 0);// Escribimos el texto
        lcd.write((uint8_t)4);// Esperamos
        lcd.setCursor(pos, 1);// Escribimos el texto
        lcd.write((uint8_t)5);// Esperamos
        delay(30000);

        lcd.clear();//Situamos el cursor
        lcd.setCursor(nubepos, 0);// Escribimos el texto
        lcd.write((uint8_t)2);// Esperamos
        lcd.setCursor(nubepos+1, 0);// Escribimos el texto
        lcd.write((uint8_t)3);// Esperamos
        lcd.setCursor(pos, 0);// Escribimos el texto
        lcd.write((uint8_t)0);// Esperamos
        delay(50000);
        lcd.setCursor(pos, 0);// Escribimos el texto
        lcd.write((uint8_t)4);// Esperamos
        lcd.setCursor(pos, 1);// Escribimos el texto
        lcd.write((uint8_t)5);// Esperamos
        delay(30000);

        lcd.clear();//Situamos el cursor
        lcd.setCursor(nubepos, 0);// Escribimos el texto
        lcd.write((uint8_t)2);// Esperamos
        lcd.setCursor(nubepos+1, 0);// Escribimos el texto
        lcd.write((uint8_t)3);// Esperamos
        lcd.setCursor(pos, 1);// Escribimos el texto
        lcd.write((uint8_t)0);// Esperamos
        delay(30000);
    }
    segundos=0;
  }
}

void saludar()
{
  for(int i=0; i<3; i++)
    {
        lcd.clear();//Situamos el cursor
        lcd.setCursor(nubepos, 0);// Escribimos el texto
        lcd.write((uint8_t)2);// Esperamos
        lcd.setCursor(nubepos+1, 0);// Escribimos el texto
        lcd.write((uint8_t)3);// Esperamos
        lcd.setCursor(pos, 1);// Escribimos el texto
        lcd.write((uint8_t)1);// Esperamos
        delay(50000);
        lcd.clear();//Situamos el cursor
        lcd.setCursor(pos, 1);// Escribimos el texto
        lcd.write((uint8_t)0);// Esperamos
       delay(50000);
    }
}

