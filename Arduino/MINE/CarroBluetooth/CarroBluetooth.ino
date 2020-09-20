/*
 !!Cuidado!! Las conexiones de TX y RX al modulo Bluetooth deben estar desconectadas
 en el momento que se realiza la carga del codigo (Sketch) al Arduino.
 */
#include <LiquidCrystal.h>             
LiquidCrystal lcd = LiquidCrystal(A0, A1, A2, A3, A4, A5);
int posicion = 2;
int enemypos = 16;
int estado;

byte enemigo1[8] = {
  B11011,
  B01111,
  B01111,
  B11011,
  B00000,
  B00000,
  B00000,
  B00000
};

byte enemigo2[8] = {
  B00000,
  B00000,
  B00000,
  B00000,
  B11011,
  B01111,
  B01111,
  B11011
};

byte carro1[8] = {
  B11011,
  B01110,
  B01110,
  B11011,
  B00000,
  B00000,
  B00000,
  B00000
};

byte carro2[8] = {
  B00000,
  B00000,
  B00000,
  B00000,
  B11011,
  B01110,
  B01110,
  B11011
};

void setup()  { 
  Serial.begin(9600);    // inicia el puerto serial para comunicacion con el Bluetooth
  lcd.begin(16, 2);
  lcd.createChar(1, carro1);
  lcd.createChar(2, carro2);
  lcd.createChar(3, enemigo1);
  lcd.createChar(4, enemigo2);
} 

void loop()  { 

  //lcd.setCursor(0, 0);// Escribimos el texto
  lcd.write((uint8_t)0);
  //lcd.setCursor(0, 1);// Escribimos el texto
  //lcd.write("--------------------");
  /*
  if(Serial.available()>0){        // lee el bluetooth y almacena en estado
    lcd.clear();
    estado = Serial.read();
  }
  
    if(estado=='1'){    
      lcd.setCursor(0, 0);// Escribimos el texto
      lcd.write((uint8_t)1);
    }

    if(estado=='2'){ 
      lcd.setCursor(0, 0);// Escribimos el texto
      lcd.write((uint8_t)2);
    }

    if(estado=='3'){ 
      lcd.setCursor(0, 1);// Escribimos el texto
      lcd.write((uint8_t)1);
    }

    if(estado=='4'){ 
      lcd.setCursor(0, 1);// Escribimos el texto
      lcd.write((uint8_t)2);
    }
    */
}

