#ifndef SALACON_H
#define SALACON_H
#include <iostream>
//Clase SalaCon define una conferencia que se dar� en una sala, con una determinada capacidad.
//Objetos de esta clase guardan los datos del t�tulo de la conferencia, la capacidad que tiene
//y el n�mero de espacios reservados

//Revisa la clase SalaCon y completa los dos m�todos que hacen falta:
using namespace std;
class SalaCon{
    public:
        SalaCon();
        SalaCon(string, int);
        string getTitulo();
        void setTitulo(string);
        int getCapacidad();
        void setCapacidad(int);
        int getReservados();
        //1. DECLARA el m�todo reservarLugares que recibe la cantidad de personas a registrar, no devuelve nada
        void reservarLugares(int);
        //2. DECLARA el m�todo lugaresDisponibles, regresa la cantidad de lugares disponibles de la conferencia
        int lugaresDisponibles();
        void imprime() ;
    private:
        string titulo;   //Titulo de la conferencia
        int capacidad;   //Capacidad de la sala
        int reservados;  //Lugares reservados actualmente
};

//Constructor por default
SalaCon::SalaCon(){
    titulo="";
    capacidad=0;
    reservados=0;
}
// 3. IMPLEMENTA el Constructor con par�metros, el atributo reservados se inicia en 0,
//    los otros dos se actualizan con los datos recibidos como par�metros
SalaCon::SalaCon(string _n, int _x){
	titulo= _n;
    capacidad=_x;
    reservados=0;
}


// Getter y Setter de titulo
string SalaCon::getTitulo(){
    return titulo;
}

void SalaCon::setTitulo(string tit){
    titulo=tit;
}

//Getter y setter de capacidad
int SalaCon::getCapacidad(){
    return capacidad;
}

void SalaCon::setCapacidad(int cap){
    capacidad=cap;
}

//Getter de reservados
int SalaCon::getReservados(){
    return reservados;
}

// 4. IMPLEMENTA el m�todo reservarLugares que recibe la cantidad de personas a registrar, no devuelve nada.
// Debe revisar que la cantidad de personas a reservar sea mayor a 0 y que a�n haya disponibilidad de acuerdo a la capacidad
void SalaCon::reservarLugares(int _reservados){
	if(_reservados > 0 && reservados+_reservados <= capacidad){
		reservados+=_reservados;	
	}
}

// 5. IMPLEMENTA el m�todo lugaresDisponibles, regresa la cantidad de lugares disponibles de la conferencia
int SalaCon::lugaresDisponibles(){
    return capacidad-reservados;
}

// 6. Este M�todo imprime los datos de la conferencia, NO MODIFIQUES, s�lo COMPLETA lo que falta
void SalaCon::imprime(){
    cout << titulo << endl;
    cout << "Lugares reservados: " << reservados << " Disponibles:" << lugaresDisponibles() << endl;
}

#endif //SALACON_H
