//Completa lo que haga falta de la clase Personaje, �sta clase representa un personaje dentro de la pantalla
// Tiene un punto que representa la posici�n del personaje y puede avanzar.
#ifndef PERSONAJE_H
#define PERSONAJE_H
#include <string>
#include "Punto.h"

class Personaje {
    public:
        //Constructor por default
        Personaje();
        //Constructor con par�metros, recibe un objeto Punto
        Personaje(std::string n, Punto p);
        //Getters y Setters de los atributos
    	std::string getNombre();
    	Punto getPunto();
    	void setNombre(std::string);
    	void setPunto(Punto);
        // M�todo cambia posici�n, recibe datos en x e y y actualiza los valores de x, as� como de y del atributo posici�n
        void cambiaPosicion(int, int);
        //M�todo que avanza al personaje en horizontal, actualiza la coordenada x del atributo posici�n
        void avanzaHor(int);
        //M�todo que avanza al personaje en vertical, actualiza la coordenada y del atributo posicion
        void avanzaVer(int);
        //Imprime el nombre y posici�n del personaje
        void imprime();
    private:
        std::string nombre;
        Punto posicion;
        
};

//Constructor default inicia el nombre a "Creatura"
Personaje::Personaje(){
	nombre = "creatura";
}

//Constructor con par�metros, inicia los atributos a lo que recibe como par�metro
Personaje::Personaje(std::string _nombre, Punto _punto){
	nombre = _nombre;
	posicion = _punto;
}

// Setter de nombre
void Personaje::setNombre(std::string _nombre){
	nombre = _nombre;
}

// Getter de nombre
std::string Personaje::getNombre(){
	return nombre;
}

//Setter de posicion - recibe un Punto
void Personaje::setPunto(Punto puntoNuevo){
	posicion = puntoNuevo;
}

//Getter de posicion - devuelve un Punto
Punto Personaje::getPunto(){
	return posicion;
}

//Cambia las coordenadas de su atributo posici�n
void Personaje::cambiaPosicion(int x, int y){
    posicion.cambiaCoordenada(x,y);
}

//Actualiza la coordenada X de la posici�n sum�ndole el incremento que recibe
void Personaje::avanzaHor(int inc){
	int xnew = posicion.getX();
	posicion.setX(xnew+inc);
}

//Actualiza la coordenada Y de la posici�n sum�ndole el incremento que recibe
void Personaje::avanzaVer(int inc){
    int ynew = posicion.getY();
	posicion.setY(ynew+inc);
}

//Imprime el personaje, no modifiques este m�todo
void Personaje::imprime(){
    std::cout << nombre << " esta en la coordenada ";
    posicion.imprimePunto();
}

#endif //PERSONAJE_H
