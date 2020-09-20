// LIFO_Dinamico.cpp: define el punto de entrada de la aplicación de consola.
//

#include "stdafx.h"
#include <iostream>
using namespace std;

struct Nodo
{
	int n;
	Nodo *sig;
};

class PILA {
private:
	Nodo *I, *T, *C;
	int tam;
public:
	PILA();
	~PILA();

	void Agregar();
	void Borrar();
	void Mostrar();
};

PILA::PILA() {
	I = new Nodo();
	I->n = NULL;
	I->sig = T;

	T = new Nodo();
	T->sig = NULL;

	C = new Nodo();
	C->n = NULL;
	C->sig = I;

	tam = 0;
}
PILA::~PILA() {

}

void PILA::Agregar() {
	if (I->n == NULL) {
		cout << tam << ": ";
		cin >> I->n;
		I->sig = T;
	}
	else if (T->n == NULL) {
		cout << tam << ": ";
		cin >> T->n;
		T->sig = NULL;
	}
	else {
		while (C->sig != NULL) {
			C = C->sig;
		}
		T = new Nodo();
		cout << tam << ": ";
		cin >> T->n;
		T->sig = NULL;
		C->sig = T;
		C = I;
	}
	tam++;
}

void PILA::Borrar() {
	Nodo *temp;
	C = I;
	if (I->n == NULL && T->n == NULL) {
		cout << "Lista vacia..." << endl;
		system("pause");
	}
	else {
		if(I->sig == T){
			if(T->n!=NULL){
				T->n=NULL;
				tam--;
			}else if(I->n!=NULL){
				I->n=NULL;
				tam--;
			} 
		}
		else {
			temp = T;
			delete temp;
			C = I;
			for (int i = 0; i < tam - 2; i++) {
				C = C->sig;
			}
			T = C;
			T->sig = NULL;

			tam--;
		}
	}
	C = I;
}

void PILA::Mostrar() {
	C = I;
	if (I->n == NULL && T->n == NULL) {
		cout << "Lista vacia..." << endl;
	}
	else {
		while (C->sig != NULL) {

			cout << C->n << ", ";

			C = C->sig;
		}
		if (C->n != NULL) {
			cout << C->n << endl;
		}
		else {
			cout << endl;
		}
	}
	system("pause");
	C = I;
}


int main()
{
	int opc;
	PILA A;
		system("cls");
		cout << "-----------------------------" << endl;
		cout << "-Bienvenido a LIFO Dinamico  -" <<endl;
		cout << "-----------------------------" << endl;
		system("pause");
	do{
		system("cls");
		cout << "-------------------------------------------" << endl;
		cout << "-QUE DESEA HACER                          -" <<endl;
		cout << "-------------------------------------------" << endl;
		cout << "[1].-Agregar							    " << endl; 
		cout << "[2].-Ver									" << endl;
		cout << "[3].-Borrar								" << endl;
		cout << "[4].-Salir									" << endl; 
		cout << "-----------------------------------------" << endl;
		cin >> opc;
		switch (opc) {
		case 1:
			A.Agregar();
			break;
		case 2:
			A.Mostrar();
			break;
		case 3:
			A.Borrar();
			break;
		case 4:
			cout << "Saliendo..." << endl;
			system("pause");
			break;
		default:
			cout << "Opcion no valida..." << endl;
			system("pause");
			break;
		}

	}while (opc != 4);
	return 0;
}