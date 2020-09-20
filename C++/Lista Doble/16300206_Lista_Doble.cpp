// Lista_Doble.cpp: define el punto de entrada de la aplicación de consola.
//

#include "stdafx.h"
#include <iostream>
#include <stdlib.h>
#include <conio.h>
using namespace std;

struct Nodo
{
	int n;
	Nodo *sig;
	Nodo *ant;
};

class Lista {
private:
	Nodo *I, *T, *C;
	int tam;
public:
	Lista();
	~Lista();

	void Alta_Fin();              // <--
	void Alta_Inicio();           // <--
	int Alta_DS();                // <--

	void Baja_Inicio();           // <--
	void Baja_Fin();              // <--
	int Baja_DS();                // <--
	int Baja_DS(int);             // <--
	int Baja_dato();              // <--

	int Buscar();                 // <--
	int Buscar(int);              // <--
	void Modificar();             // <--

	void Ver();  //3              // <--
};

Lista::Lista() {
	I = new Nodo();
	I->n = NULL;
	I->sig = T;
	I->ant = NULL;

	T = new Nodo();
	T->n = NULL;
	T->sig = NULL;
	T->ant = I;

	C = new Nodo();
	C->n = NULL;
	C->sig = I;
	C->ant = NULL;
	tam = 0;
}
Lista::~Lista() {

}
void Lista::Alta_Fin() {
	if (I->n == NULL) {
		cout << tam << ": ";
		cin >> I->n;
		I->sig = T;
	}
	else if (T->n == NULL) {
		cout << tam << ": ";
		cin >> T->n;
		T->sig = NULL;
		I->sig = T;
	}
	else {
		C = I;
		while (C->sig != NULL) {
			C = C->sig;
		}
		T = new Nodo();
		cout << tam << ": ";
		cin >> T->n;
		T->sig = NULL;
		C->sig = T;
		T->ant = C;
		C = I;
	}
	tam++;
}
void Lista::Alta_Inicio() {
	if (I->n == NULL) {
		cout << tam << ": ";
		cin >> I->n;
		I->sig = T;
	}
	else if (T->n == NULL) {
		cout << tam << ": ";
		cin >> T->n;
		T->sig = I;
		I = T;

		T = T->sig;
		T->sig = NULL;
		I->ant = NULL;
		T->ant = I;
		C = I;
	}
	else {
		T = new Nodo();
		cout << tam << ": ";
		cin >> T->n;
		T->sig = I;
		T->ant = NULL;
		I->ant = T;
		I = T;

		C = I;
		while (C->sig != NULL) {
			C = C->sig;
		}
		T = C;
		C = I;
	}
	tam++;
}
int Lista::Alta_DS() {
	int pos;
	cout << "Posicion: ";
	cin >> pos;
	C = I;
	if (pos == 0) {
		Alta_Inicio();
		return 0;
	}
	if (pos == tam - 1) {
		Alta_Fin();
		return 0;
	}
	if (pos >= tam || pos < 0) {
		cout << "No existe esta posicion...\a" << endl;
		cout << " Escoja un valor entre 0 y " << tam - 1 << endl;
		system("pause");
		return -1;
	}

	T = new Nodo();
	cin >> T->n;
	for (int i = 0; i < pos + 1; i++) { //Posicion solicitada
		C = C->sig;
	}
	T->sig = C;
	C->ant = T;

	C = I;
	for (int i = 0; i < pos; i++) {
		C = C->sig;
	}
	C->sig = T;
	T->ant = C;
	C = I;

	while (C->sig != NULL) {
		C = C->sig;
	}
	T = C;
	tam++;
	return 0;
}
void Lista::Baja_Inicio() {
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
			T->ant = I;
		}
		I->ant = NULL;
		delete temp;

		tam--;
	}
	C = I;
}
void Lista::Baja_Fin() {
	Nodo *temp;
	C = I;
	if (I->n == NULL && T->n == NULL) {
		cout << "Lista vacia..." << endl;
		system("pause");
	}
	else {
		if (I->sig == T) {
			if (T->n != NULL) {
				T->n = NULL;
				tam--;
			}
			else if (I->n != NULL) {
				I->n = NULL;
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
int Lista::Baja_DS() {
	Nodo *temp;
	temp = new Nodo();
	int pos;
	if (I->n == NULL && T->n == NULL) {
		cout << "Lista vacia..." << endl;
		system("pause");
		return 0;
	}
	cout << "Posicion: ";
	cin >> pos;
	C = I;
	if (pos == 0) {
		Baja_Inicio();
		return 0;
	}
	if (pos == tam - 1) {
		Baja_Fin();
		return 0;
	}
	if (pos >= tam || pos < 0) {
		cout << "No existe esta posicion...\a" << endl;
		cout << " Escoja un valor entre 0 y " << tam - 1 << endl;
		system("pause");
		return -1;
	}
	for (int i = 0; i < pos; i++) {
		C = C->sig;
	}
	temp = C;
	C = I;
	for (int i = 0; i < pos + 1; i++) {
		C = C->sig;
	}
	C->ant = temp->ant;
	C = I;
	for (int i = 0; i < pos - 1; i++) {
		C = C->sig;
	}
	C->sig = temp->sig;
	delete temp;
	C = I;
	tam--;
	return 0;

}
int Lista::Baja_DS(int _pos) {
	Nodo *temp;
	//temp = new Nodo();
	C = I;
	if (_pos == 0) {
		Baja_Inicio();
		return 0;
	}
	if (_pos == tam - 1) {
		Baja_Fin();
		return 0;
	}
	for (int i = 0; i < _pos; i++) {
		C = C->sig;
	}
	temp = C;
	C = I;
	for (int i = 0; i < _pos + 1; i++) {
		C = C->sig;
	}
	C->ant = temp->ant;
	C = I;
	for (int i = 0; i < _pos - 1; i++) {
		C = C->sig;
	}
	C->sig = temp->sig;
	delete temp;
	C = I;
	tam--;
	return 0;
}
int Lista::Baja_dato() {
	int dato, x;
	if (I->n == NULL && T->n == NULL) {
		cout << "Lista vacia..." << endl;
		system("pause");
		return 0;
	}
	cout << "Valor a elminar: ";
	cin >> dato;
	x = Buscar(dato);
	if (x == -2) {
		cout << "Lista vacia..." << endl;
		system("pause");
	}
	else if (x == -1) {
		cout << "Valor no encontrado..." << endl;
		system("pause");
	}
	else {
		Baja_DS(x);
	}
}
void Lista::Ver() {
	C = I;
	int tecla;
	int i = 0, j = 0;
	if (I->n == NULL && T->n == NULL) {
		cout << "Lista vacia..." << endl;
	}
	else {
		do{
			tecla=_getch();
			if(tecla==77 || tecla==75 || tecla==27){
				i=0;
		if(tecla==77){  //der
			while (C->sig != NULL && i < 3) {
			cout << C->n << ", ";
			C = C->sig;
			i++;
			if (i == 3) {
				system("pause>NULL");
			}
		}
		
		}
		if (C->n != NULL) {
			cout << C->n;
		}
		i=0;
		if(tecla==75){  //izq
			while (C->ant != NULL && i < 3) {
			cout << C->n << ", ";
			C = C->ant;
			i++;
			if (i == 3) {
				system("pause>NULL");
			}
		}
		
		}
			}
			
		}while(tecla!=27);
	}
	system("pause");
	C = I;
}
int Lista::Buscar() {
	int dato, i = 0;
	if (I->n == NULL && T->n == NULL) {
		return -2;
	}
	cout << "Valor: ";
	cin >> dato;
	C = I;
	while (C->sig != NULL) {
		if (C->n == dato) {
			return i;
		}
		C = C->sig;
		i++;
	}
	if (C->n == dato) {
		return i;
	}
	C = I;
	return -1;

}
int Lista::Buscar(int _dato) {
	int i = 0;
	if (I->n == NULL && T->n == NULL) {
		return -2;
	}
	C = I;
	while (C->sig != NULL) {
		if (C->n == _dato) {
			return i;
		}
		C = C->sig;
		i++;
	}
	if (C->n == _dato) {
		return i;
	}
	C = I;
	return -1;

}
void Lista::Modificar() {
	int dato, x;
	cout << "Valor a modificar: ";
	cin >> dato;
	x = Buscar(dato);
	if (x == -2) {
		cout << "Lista vacia..." << endl;
		system("pause");
	}
	else if (x == -1) {
		cout << "Valor no encontrado..." << endl;
		system("pause");
	}
	else {
		C = I;
		for (int i = 0; i < x; i++) {
			C = C->sig;
		}
		cout << "Cambiar " << C->n << " por: ";
		cin >> dato;
		C->n = dato;
		C = I;
	}
}

int main()
{
	int opc;
	Lista A;
		opc = 0;
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
		cout << "[2].-Borrar									" << endl;
		cout << "[3].-Ver				         			" << endl;
		cout << "[4].-Modificar				         	    " << endl;
		cout << "[5].-Buscar				         	    " << endl;
		cout << "[6].-Salir									" << endl; 
		cout << "-------------------------------------------" << endl;
		cout << "\t --> "; cin >> opc;
		switch (opc) {
		case 1:
			do {
				cout << "\tALTA" << endl;
				cout << "[1].-Al inicio							    " << endl; 
				cout << "[2].-Al final									" << endl;
				cout << "[3].-Donde sea			         			" << endl;
				cout << "[4].-Regresar				         	    " << endl;
				cout << "\t --> "; cin >> opc;
				switch (opc) {
				case 1:
					A.Alta_Inicio();
					break;
				case 2:
					A.Alta_Fin();
					break;
				case 3:
					A.Alta_DS();
					break;
				case 4:
					break;
				default:
					cout << "Opcion no valida...\a" << endl;
					system("pause");
				}
			} while (opc != 4);
			break;
		case 2:
			do {
				cout << "\t BAJA" << endl;
				cout << "[1].-Al inicio					    " << endl; 
				cout << "[2].-Al final						" << endl;
				cout << "[3].-Posicion		         	    " << endl;
				cout << "[4].-Dato		         			" << endl;
				cout << "[5].-Regresar				        " << endl;
				cout << "\t --> "; cin >> opc;
				switch (opc) {
				case 1:
					A.Baja_Inicio();
					break;
				case 2:
					A.Baja_Fin();
					break;
				case 3:
					A.Baja_DS();
					break;
				case 4:
					A.Baja_dato();
					break;
				case 5:
					break;
				default:
					cout << "Opcion no valida...\a" << endl;
					system("pause");
				}
			} while (opc != 5);
			break;
		case 3:
			A.Ver();
			break;
		case 4:
			A.Modificar();
			break;
		case 5:
			opc = A.Buscar();
			if (opc == -2) {
				cout << "Lista vacia..." << endl;
			}
			else if (opc == -1) {
				cout << "Valor no encontrado..." << endl;
			}
			else {
				cout << "dato encontrado en la posicion: " << opc << endl;
			}
			system("pause");
			break;
		case 6:
			cout << "Saliendo..." << endl;
			system("pause");
			break;
		default:
			cout << "Opcion no valida...\a" << endl;
			system("pause");
		}
	} while (opc != 6);
	return 0;
}
