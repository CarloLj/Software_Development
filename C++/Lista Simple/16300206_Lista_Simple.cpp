// Lista_Simple.cpp: define el punto de entrada de la aplicación de consola.
//

#include "stdafx.h"
#include <iostream>
using namespace std;

struct Nodo
{
	int n;
	Nodo *sig;
};

class Lista {
private:
	Nodo *I, *T, *C;
	int tam;
public:
	Lista();
	~Lista();

	void Agregar();
	void Borrar();
	void Mostrar();  //3
	void Modificar();
	void Buscar();
};

Lista::Lista() {
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
Lista::~Lista() {

}

void Lista::Agregar() {
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

void Lista::Borrar() {
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

void Lista::Mostrar() {
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

void Lista::Modificar() {
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

void Lista::Buscar(){
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

int main()
{
	int opc;
	Lista A;
	system("cls");
		cout << "-----------------------------" << endl;
		cout << "-Bienvenido a Lista Simple  -" <<endl;
		cout << "-----------------------------" << endl;
		system("pause");
		do{
		system("cls");
		cout << "-------------------------------------------" << endl;
		cout << "-QUE DESEA HACER                          -" <<endl;
		cout << "-------------------------------------------" << endl;
		cout << "[1].-Agregar							    " << endl; 
		cout << "[2].-Mostrar								" << endl;
		cout << "[3].-Borrar								" << endl;
		cout << "[4].-Modificar								" << endl;
		cout << "[5].-Buscar								" << endl;
		cout << "[6].-Salir									" << endl; 
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
			A.Modificar();
			break;
		case 5:
			A.Buscar();
			break;
		case 6:
			cout << "Saliendo..." << endl;
			system("pause");
			break;
		default:
			cout << "Opcion no valida..." << endl;
			system("pause");
		}
	} while (opc != 6);
	return 0;
}

