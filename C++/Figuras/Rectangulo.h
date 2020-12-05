#ifndef RECTANGULO_H
#define RECTANGULO_H
#include <string>

class Rectangulo{
    private:
        double ancho;
        double largo;
        //string color;
    public:
        Rectangulo(); //Constructor por Default
        Rectangulo(double, double/*, string*/); //Recbimos los datos para iniciar los atributos
        ~Rectangulo();
        double area();
        double perimetro();
        double getAncho() const;
        double getLargo() const;
        //string getColor() const;
        void setAncho(double);
        void setLargo(double);
        //void setColor(string);
};

Rectangulo::Rectangulo(){
    ancho = 1;
    largo = 2;
}

Rectangulo::Rectangulo(double _ancho, double _largo){
    ancho = a;
    largo = l;
}


Rectangulo::getAncho() const{
    return ancho;
}

Rectangulo::getLargo() const{
    return largo;
}

Rectangulo::setAncho(double _ancho){
    ancho = _ancho;
}

Rectangulo::setLargo(double largo){
    largo = _largo;
}

double Rectangulo::area(){
    return ancho*largo;
}

double Rectangulo::perimetro(){
    return 2*(ancho+largo);
}

#endif //RECTANGULO
