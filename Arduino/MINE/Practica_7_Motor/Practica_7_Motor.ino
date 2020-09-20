//#include <Stepper.h>
#include <Stepper_28BYJ_48.h>
//#include <CheapStepper.h>

#define BIT1 12
#define BIT2 13
#define BIT3 7
#define BITVELOCIDAD 6

int estadobit1;
int estadobit2;
int estadobit3;
int estadobit4;

// Esto es el número de pasos por revolución
#define PASOS 32 //POR DEFECTO EN ESTE MOTOR TIENE 4096 CON UNA PRECISION CASI EXACTA
#define NPASOS -50 //POR DEFECTO EN ESTE MOTOR TIENE 4096 CON UNA PRECISION CASI EXACTA
// Número de pasos que queremos que de

// Constructor, pasamos STEPS y los pines donde tengamos conectado el motor
Stepper_28BYJ_48 avanzar(8, 9, 10, 11);


void derecha(){
  Serial.println("Avanzando a la derecha...");
  avanzar.step(50);   // Movemos el motor un número determinado de pasos a la derecha
}

void izquierda(){
  Serial.println("Avanzando a la izquierda...");
  avanzar.step(NPASOS);   // Movemos el motor un número determinado de pasos a la izquierda
}


void setup() {
  pinMode(BIT1, INPUT);
  pinMode(BIT2, INPUT);
  pinMode(BIT3, INPUT);
  pinMode(BITVELOCIDAD, INPUT);
  Serial.begin(9600);
  Serial.println("Puedes ingresar un dato ya");
}
void loop() {
  //avanzar.setRpm(50000);
  estadobit1 = digitalRead(BIT1);
  estadobit2 = digitalRead(BIT2);
  estadobit3 = digitalRead(BIT3);
  estadobit4 = digitalRead(BITVELOCIDAD);
  
  //digitalWrite(BIT1, estadobit1);
  //digitalWrite(BIT2, estadobit2);
  //digitalWrite(BIT2, estadobit2);
  
  Serial.print(estadobit1);
  Serial.print(estadobit2);
  Serial.print(estadobit3);
  Serial.print(estadobit4);
  if((estadobit1==1) && (estadobit2 == 0) && (estadobit3 == 1)/*Mientras este prendido*/){
    if(estadobit4 == 1){
    Serial.println("TURBO ACTIVADO..");
    }
    else{
      delay(40);
    }
    derecha();
  }

  if((estadobit1==0) && (estadobit2 == 1) && (estadobit3 == 1)/*Mientras este prendido*/){
    if(estadobit4 == 1){
    Serial.println("TURBO ACTIVADO..");
    }
    else{
      delay(40);
    }
    izquierda();
  }
  Serial.println("Apagado");
}
