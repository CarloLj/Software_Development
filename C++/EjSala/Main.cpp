//
#include <iostream>
using namespace std;
#include "SalaCon.h"

//COMPLETA este programa principal, escribe las funciones que hagan falta...

// 1. ESCRIBE la funci�n que carga informaci�n de una determinada cantidad de conferencias al arreglo,
//    con datos que proporciona el usuario.
//    Se pide al usuario t�tulo y luego capacidad por cada SalaCon del arreglo (pidelos en ese orden).
//    El t�tulo de la conferencia man�jalo por simplicidad de una sola palabra por ejemplo: Vivencias
//    No pongas ning�n mensaje al usuario para recibir los datos
void cargaConferencias(SalaCon conf[], int cant){
	for (int i = 0; i < cant;i++){
		string titl;
		int cap;
		cin>>titl;
		cin>>cap;
		conf[i].setCapacidad(cap);
		conf[i].setTitulo(titl);
	}
}

// 2. ESCRIBE la funci�n que recorre el arreglo de objetos SalaCon, busca un determinado titulo y si lo encuentra,
//    intenta la reservaci�n del n�mero de personas que recibe como uno de sus par�metros.
bool buscaConferencia(SalaCon salas[], int cant, string busqueda, int reservacion){
	for(int i = 0; i<cant; i++){
		string titulo = salas[i].getTitulo();
		if(titulo == busqueda){
			salas[i].reservarLugares(reservacion);
		}
	}
	return false;
}


// 3. COMPLETA esta funci�n que mostrar� todas las conferencias que han sido cargadas.
void muestraConferencias(SalaCon lista[], int cant){
    cout << "------------------------------"<<endl; //No la quites
    for(int i = 0; i<cant;i++){
    	lista[i].imprime();
    	cout << "------------------------------"<<endl; //No la quites
    }
}

int main(){
    // 4. CREA un arreglo de objetos SalaCon llamado conferencias con 10 localidades
    SalaCon conferencias[10];
    //Variables que te van a servir para tus opciones del programa principal
    int cantSalas, personas;
    char opcion;
    string titulo;
    //cout << "�Cu�ntas conferencias vas a ingresar? "; d�ja esta instrucci�n como comentario
    cin>>cantSalas;
    // 5. ESCRIBE la instrucci�n para recibir la cantidad de conferencias
    // 6. LLAMA/INVOCA a la funci�n para cargar los datos de las conferencias
    cargaConferencias(conferencias,cantSalas);
    do {
       //cout << "a) Registrar reservaciones de una conferencia b) Mostrar conferencias c) Terminar" << endl; ***Deja como comentario
        cin >> opcion;
        switch (opcion) {
            case 'a':
                //En esta opci�n se registran reservaciones de una conferencia en particular
                //cout << "Titulo de la conferencia a actualizar: ";***D�ja esta linea como comentario
                // 7. ESCRIBE la instrucci�n para recibir el titulo de la conferencia
                cin>> titulo;
               //cout << "Personas a reservar: "; ***D�ja esta linea como comentario
            	// 8. ESCRIBE la instrucci�n para recibir la cantidad de personas para reservar lugar en la conferencia
            	cin>> personas;
                // 9. LLAMA/INVOCA a la funci�n correspondiente que creaste en este archivo para realizar la reserva
                buscaConferencia(conferencias, cantSalas, titulo, personas);
                break;
            case 'b':
                // En esta opci�n se deben mostrar todas las conferencias que han sido registradas
                // 10. ESCRIBE lo necesario para realizar la acci�n mencionada en el rengl�n anterior
                muestraConferencias(conferencias, cantSalas);
                break;
            case 'c':
                cout << "Escogiste salir del menu." << endl; //No modifiques esto
                break;
            default:
                cout << "Error, opcion incorrecta" << endl;// No modifiques esto
        }
    } while (opcion != 'c');
    return 0;
}
