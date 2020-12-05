#include "Keypad.h"
#include <LiquidCrystal_I2C.h>
#include<Wire.h>
LiquidCrystal_I2C lcd(0x27,20,4);

//Variables para llevar el conteo de las cajas que ingresan o salen del sistema
int Au=0;
int Ad=0;
int Bu=0;
int Bd=0;
int x;
int interrupcion=0;
int interrupcion2=0;

//CONFIGURACION DE LOS PINES QUE SE USARÁN EN LOS MOTORES
//EJE X
const int dirX = 8;
const int stepX = 9;
//EJE Y
const int dirY = 6;
const int stepY = 7;
//EJE Z
const int dirZ = 5;
const int stepZ = 4;

const int steps = 700;
int stepDelay;

// CONFIGURACION DE LOS PINES QUE SE USARÁN EN LOS FINALES DE CARRERA
 int fcX=23;
 int fcY=22;
 int fcZ=24;
 
//CONFIGURACION PARA EL TECLADO
const byte FILAS = 4;
const byte COLUMNAS = 4;
int CARGA=0;

char keys[FILAS][COLUMNAS] = {
  {'1','2','3','A'},
  {'4','5','6','B'},
  {'7','8','9','C'},
  {'*','0','#','D'}
};
byte fp[FILAS] = {2, 3, 4, 5};
byte cp[COLUMNAS] ={6, 7, 8, 9};
Keypad keypad = Keypad(makeKeymap(keys), fp, cp, FILAS, COLUMNAS);

void setup() {
  //MARCAMOS LOS PINES DE LOS EJES
  //EJE X
 pinMode(dirX, OUTPUT);
 pinMode(stepX, OUTPUT);
 //EJE Y
  pinMode(dirY, OUTPUT);
  pinMode(stepY, OUTPUT);
 //EJE Z
  pinMode(dirZ, OUTPUT);
  pinMode(stepZ, OUTPUT);
 //MARCAMOS LOS PINES DE LOS FINALES DE CARRERA
 pinMode(fcX, INPUT);
 pinMode(fcY, INPUT);
 pinMode(fcZ, INPUT);
 //INICIALIZAMOS LA PANTALLA
 lcd.backlight(); 
lcd.init();
//se muestra el mensaje de inicio
menu();

}

void loop() {}
//posicion inicial
PH();
//INICIA LA PARTE DEL MENU
{
x=0;
char key = keypad.getKey();
if(key)
{
switch(key)
{
case'A':
//Se muestra en el display el estado de los vagones
A();
break;


case'B':
//se despliega el menu para que vagón se cargará
B();
// Se da el comando hacia donde se desea cargar 
carga();
break;



//Se despliega el menu  para seleccionar el vagón del que se descargará
case'C':
C();
descarga();
break;
}
void menu ()
{
lcd.clear();
lcd.setCursor(0,0);
lcd.print ("Accion deseada");
lcd.setCursor(0,2);
lcd.print ("A=Estado de vagones ");    
lcd.setCursor(0,3);
lcd.print ("C=Descarga B=Carga");
}

