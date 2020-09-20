#include <LiquidCrystal.h>             
LiquidCrystal lcd = LiquidCrystal(A0, A1, A2, A3, A4, A5);
int estado;
int posactual=2;
int posenemigo;
int ywait;
int randomcharwait;
int lineaenemigo;
int x=5;
bool esperarenemigo = false;
int yrandom;
int enemigochar_random;
int record;

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

void moveraestado(int var){
  int var_ = var;
  
  if(var_=='1'){    
      lcd.setCursor(0, 0);// Escribimos el texto
      lcd.write((uint8_t)1);
      posactual=1;
    }

    if(var_=='2'){ 
      lcd.setCursor(0, 0);// Escribimos el texto
      lcd.write((uint8_t)2);
      posactual=2;
    }

    if(var_=='3'){ 
      lcd.setCursor(0, 1);// Escribimos el texto
      lcd.write((uint8_t)1);
      posactual=3;
    }

    if(var_=='4'){ 
      lcd.setCursor(0, 1);// Escribimos el texto
      lcd.write((uint8_t)2);
      posactual=4;
    }
}

void setup() {
  Serial.begin(9600);  
  lcd.begin(16, 2);
  lcd.createChar(1, carro1);
  lcd.createChar(2, carro2);
  lcd.createChar(3, enemigo1);
  lcd.createChar(4, enemigo2);
  lcd.setCursor(0, 0);// Escribimos el texto
  lcd.write("@ephemeral_games :");
  lcd.setCursor(0, 1);// Escribimos el texto
  lcd.write("-CRAZY ROADSTER-");
  delay(5000);
}

void loop() {
  if(Serial.available()>0){        // lee el bluetooth y almacena en estado
    lcd.clear();
    estado = Serial.read();
    moveraestado(estado);
    
    if(esperarenemigo == false){
      enemigochar_random = random(3,5);
      yrandom = random(0,2);
      randomcharwait = enemigochar_random;
      ywait = yrandom;
      
      if(randomcharwait== 3 && yrandom ==0){
        lineaenemigo = 1;
      }
      if(randomcharwait== 4 && yrandom ==0){
        lineaenemigo = 2;
      }
      if(randomcharwait== 3 && yrandom ==1){
        lineaenemigo = 3;
      }
      if(randomcharwait== 4 && yrandom ==1){
        lineaenemigo = 4;
      }

      lcd.setCursor(x, ywait);// Escribimos el texto
      lcd.write((uint8_t)randomcharwait);
      esperarenemigo = true;
    }else{
      lcd.setCursor(x, ywait);// Escribimos el texto
      lcd.write((uint8_t)randomcharwait);
    }
    record++;
    x--;
    if(x<=0 && posactual==lineaenemigo){lcd.setCursor(0, 0);lcd.write("GAME OVER");lcd.setCursor(0, 1);lcd.print(record);delay(1000);lcd.clear();record=0;}
    if(x<0){x=5; esperarenemigo = false;}
  }
  /*
  if(esperarenemigo == false){
    enemigochar_random = random(3,5);
    yrandom = random(0,2);
    randomcharwait = enemigochar_random;
    ywait = yrandom;
    lcd.setCursor(x, ywait);// Escribimos el texto
    lcd.write((uint8_t)randomcharwait);
    esperarenemigo = true;
  }else{
    lcd.setCursor(x, ywait);// Escribimos el texto
    lcd.write((uint8_t)randomcharwait);
  }
  x--;
  if(x<0){x=16; esperarenemigo = false;}
  delay(200);
  */
}
