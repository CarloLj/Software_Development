// FIFO.cpp: define el punto de entrada de la aplicación de consola.
//

#include "stdafx.h"
#include "iostream"
#include "conio.h"

using namespace std;

class FIFO{

public:
	int arreglo[20];
	int aux;
	void LeerNum();
	void Mostrar();
	void Borrar();
	void Salir();
	FIFO(){aux=0;};
	~FIFO(){};

};

void FIFO::LeerNum(){

	if (aux > 20){
		cout << "Su pila esta llena" << endl;
	}

	if (aux <= 20){
		cout << "Ingresa numero [" << aux+1 << "] en la lista "<< endl;
		cin >> arreglo[aux];
		aux++;
	}
		
}

void FIFO::Mostrar(){

	if(aux <= 0){
	cout << "Ingrese un dato antes!" << endl;
	}

	if(aux > 0){
	int i;
	for(i=0;i<aux;i++){
		cout << arreglo[i]; if(aux > 0){cout << " ";} 
	}
	cout << endl;
	}
}

void FIFO::Borrar(){

	if(aux <= 0){
	cout << "Ingrese un dato antes!" << endl;
	}

	if(aux > 0){
	aux--;
	for(int i=0;i<aux;i++){
		arreglo[i]=arreglo[i+1];
		cout << arreglo[i]; if(aux > 0){cout << " ";} 
	}
	cout << endl;
	}
	}

int main(){
	int Salirprograma;
	FIFO o1;
	int QueHacer;


		system("cls");
		cout << "-----------------------------" << endl;
		cout << "-Bienvenido a FIFO estatico  -" <<endl;
		cout << "-----------------------------" << endl;
		system("pause");
		do{
		system("cls");
		cout << "-------------------------------------------" << endl;
		cout << "-QUE DESEA HACER                          -" <<endl;
		cout << "-------------------------------------------" << endl;
		cout << "[A].-Agregar                     " << endl; 
		cout << "[B].-Ver                   " << endl;
		cout << "[C].-Borrar                    " << endl;
		cout << "[D].-Salir                     " << endl; 
		cout << "-----------------------------------------" << endl;
		cout << "Introduzca la letra de lo que quiere hacer [A, B, C, D]" << endl;
		QueHacer = _getch();
		switch(QueHacer){
///////////////////////////////////////////////////////////////////////////////////
			case 'A': case 'a':
			o1.LeerNum();
			break;
///////////////////////////////////////////////////////////////////////////////////
			case 'B': case 'b':
			o1.Mostrar();
			system("pause");
			break;
///////////////////////////////////////////////////////////////////////////////////
			case 'C': case 'c':
			o1.Borrar();
			system("pause");
			break;
///////////////////////////////////////////////////////////////////////////////////
			case 'D': case 'd':
			return 0;
			default:break;
///////////////////////////////////////////////////////////////////////////////////
		}
	}while((QueHacer != 'd')||(QueHacer != 'D'));

return 0;
}