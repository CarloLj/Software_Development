// Matriz_16300206.cpp: define el punto de entrada de la aplicación de consola.
#include "stdafx.h"
#include "iostream"
#include "iomanip"
#include <windows.h>
#include <conio.h>
using namespace std; 
void gotoxy(int x, int y)
{
    COORD coord;
    coord.X = x;
    coord.Y = y;
    SetConsoleCursorPosition(GetStdHandle(STD_OUTPUT_HANDLE), coord);
}
class MATRIZ
{
public:
 int x,y;
 float Matriz[10][10];
 void Mostrar();
 void Matrizacion();
 MATRIZ();
 ~MATRIZ();
};
MATRIZ::MATRIZ(){
}
MATRIZ::~MATRIZ(){
}
void MATRIZ::Matrizacion()
{
 cout << "Ingrese el tamaño de su matriz" << endl;
 do{
  cout << "Ingrese sus Columnas" <<endl;
  cin >> x;
   if((x>10)){
   cout << "Vuelva a ingresar su dato (mayor a diez no es valido)" <<endl;
   }
   if((x<=0)){
   cout << "Vuelva a ingresar su dato (menor o igual a cero no es valido)" <<endl;
   }
 }while ((x>10)||(x<=0));
 do{
  cout << "Ingrese sus Filas" <<endl;
  cin >> y;
   if((y>10)){
   cout << "Vuelva a ingresar su dato (mayor a diez no es valido)" <<endl;
   }
   if((y<=0)){
   cout << "Vuelva a ingresar su dato (menor o igual a cero no es valido)" <<endl;
   }
 }while ((y>10)||(y<=0));
  system("cls");
  for (int i=0; i < x ; i++){
   for(int j=0; j < y ; j++){
    cout << "Ingresar dato de: Fila ["<< i+1 << "] Columna [" << j+1 << "]" <<endl;
    cin >> Matriz[i][j];
   }
  system("cls");
  }
}
void MATRIZ::Mostrar(){
 for (int i=0; i < x ; i++){
  for(int j=0; j < y ; j++){
   cout << Matriz[i][j] <<" ";
  }
 cout <<endl;
 }
}
void SumaOResta(MATRIZ mA, MATRIZ mB , bool operacion);
void Multiplicacion(MATRIZ muA, MATRIZ muB);
int main()
{
 int SIONO;
 int Salirprograma;
 int QueHacer;
 MATRIZ o1;
 MATRIZ o2;
 do{
  cout << "-----------------------------" << endl;
  cout << "-Bienvenido MATRIZAPP_v1.0  -" <<endl;
  cout << "-----------------------------" << endl;
  system("pause");
  system("cls");
  cout << "Ingrese la 1er matriz" << endl;
  o1.Matrizacion();
  cout << "Ingrese la 2da matriz" << endl;
  o2.Matrizacion();
  cout << "-----------------------------------------" << endl;
  cout << "-Que quiere hacer con las matrices-------" <<endl;
  cout << "-----------------------------------------" << endl;
  cout << "[A].-Suma de Matrices*                     " << endl; 
  cout << "[B]-Resta de Matrices*                    " << endl;
  cout << "[C].-Multiplicacion de Matrices            " << endl;
  cout << "(*Operacion con matrices iguales*)       " << endl;
  cout << "-----------------------------------------" << endl;
  cout << "________"  << endl;
  cout << "Matriz 1" << endl;
  o1.Mostrar();
  cout << "________"  << endl;
  cout << "Matriz 2" << endl;
  o2.Mostrar();
  cout << "________"  << endl;
  cout << "Introduzca la letra de lo que quiere hacer [A, B, C]" << endl;
  QueHacer = _getch();
  switch(QueHacer){
  case 'A': case 'a':
   cout << "Matriz sumada" << endl; 
   cout << "______________"  << endl;
   SumaOResta( o1, o2 , true); // mandamos el true porque es suma en la funcion
   cout << "______________"  << endl;
   break;
  case 'B': case 'b':
   cout << "Matriz restada" << endl; 
   SumaOResta( o1, o2 , false); // mandamos el false porque es resta en la funcion
   system("pause");
   break;
  case 'C': case 'c':
   Multiplicacion( o1, o2 );
   default:break;

  }
  system("pause");
  cout << "Quiere volver a usar el programa?  1=SI , 2=NO" << endl;
  cin >> Salirprograma;
  do{
   if ((Salirprograma >= 3 )||(Salirprograma <=0)){
    cout << "1 o 2 Porfavor" << endl;
   }
  }while ((Salirprograma >= 3 )&&(Salirprograma < 0 ));
 }while((Salirprograma !=2));
 return 0;
}
void SumaOResta( MATRIZ mA, MATRIZ mB , bool operacion){
 int z=0;
 int w=0;
 int _z=0;
 int _w=0;
 z = mA.x;
 _z = mB.x;
 w = mA.y;
 _w = mB.y;
 if ((z==_z)&&(w==_w)){
  for (int i=0; i < mA.x ; i++){
   for(int j=0; j < mA.y ; j++){
    if ( operacion )     // Si operacion es true es suma, sino resta
     cout << mA.Matriz[i][j] + mB.Matriz[i][j] << " ";
    else
     cout << mA.Matriz[i][j] - mB.Matriz[i][j] << " ";
   }
   cout <<endl;
  }
 }
 else {
  cout << "No se puede hacer" << endl;
 }
}
void Multiplicacion(MATRIZ muA, MATRIZ muB){

 int z=0;
 int w=0;
 int _z=0;
 int _w=0;
 z = muA.x;
 _z = muB.x;
 w = muA.y;
 _w = muB.y;
 if ((z==_z)&&(w==_w)){
  for (int i=0; i < muA.x ; i++){
   for(int j=0; j < muA.y ; j++){
     cout << muA.Matriz[i][j] * muB.Matriz[j][i] << " ";
   }
   cout <<endl;
  }
 }
 if (w==_z){
  cout << "No se puede hacer" << endl;
 }

cout << "eres gay" << endl;

}