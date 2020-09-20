// FIFO_Dinamico.cpp: define el punto de entrada de la aplicación de consola.
//

#include "stdafx.h"
#include <iostream>
using namespace std;

struct Nodo
{
	int n;
	Nodo *sig;
};

class COLA {
private:
	Nodo *I, *T, *C;
	int tam;
public:
	COLA();
	~COLA();

	void Alta();
	void Baja();
	void Ver();
};

COLA::COLA() {
	I = new Nodo();
	I->n = NULL;
	I->sig = T;

	T = new Nodo();
	T->n = NULL;
	T->sig = NULL;

	C = new Nodo();
	C->n = NULL;
	C->sig = I;
	tam = 0;
}
COLA::~COLA() {

}

void COLA::Alta() {
	if (I->n == NULL) {
		cout << tam << ": ";
		cin >> I->n;
		I->sig = T;
	}
	else if (T->n == NULL) {
		cout << tam << ": ";
		cin >> T->n;
		T->sig = NULL;
	} else {
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

void COLA::Baja() {
	Nodo *temp;
	temp = I;

	if (I->n == NULL && T->n == NULL) {
		cout << "Lista vacia..." << endl;
		system("pause");
		
	}
	else {
		I = I->sig;
		if (I->sig == NULL) {
			T = new Nodo();
			T->n = NULL;
			T->sig = NULL;
			I->sig = T;
		}

		delete temp;

		tam--;
	}

	
	C = I;
}

void COLA::Ver() {
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
	COLA A;

		system("cls");
		cout << "-----------------------------" << endl;
		cout << "-Bienvenido a FIFO Dinamico  -" <<endl;
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
			A.Alta();
			break;
		case 2:
			A.Ver();
			break;
		case 3:
			A.Baja();
			break;
		case 4:
			cout << "Saliendo..." << endl;
			system("pause");
			break;
		default:
			cout << "Opcion no valida..." << endl;
			system("pause");
		}

	} while (opc != 4);
	return 0;
}

