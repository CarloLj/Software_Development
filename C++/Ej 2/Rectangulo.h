#include "Punto.h"

class Rectangulo {
public:
    Rectangulo();
    Rectangulo(int an, int alt, Punto orig);
    void setAncho(int an);
    int getAncho();
    void setAlto(int al);
    int getAlto();
    void setOrigen(Punto);
    Punto getOrigen();
    // 1) Agrega los métodos set y get para el atributo origen
private:
    int ancho, alto;
    Punto origen;     // origen se refiere a la esquina superior izquierda del rectángulo
};

// 2) Completa el constructor default poniendo como valor inicial:
//    las coordenadas (1, 1) y las dimensiones ancho = 1 y alto = 1
Rectangulo::Rectangulo() {
    ancho = 1;
    alto = 1;
	origen.setX(1);
	origen.setY(1);
}
// 3) Completa el constructor con parámetros
Rectangulo::Rectangulo(int an, int alt, Punto orig) {
    ancho = an;
    alto = alt;
    origen = orig;   
}

void Rectangulo::setAncho(int an) {
    ancho = an;
}

void Rectangulo::setAlto(int al) {
    alto = al;
}

int Rectangulo::getAncho() {
    return ancho;
}

int Rectangulo::getAlto() {
    return alto;
}

Punto Rectangulo::getOrigen() {
    return origen;
}

void Rectangulo::setOrigen(Punto puntito) {
    origen = puntito;
}

// 4) Implementa los métodos set y get del atributo origen





