#ifndef Fraccion_h
#define Fraccion_h
#include <iostream>
#include <string>

// Clase Fraccion
class Fraccion{
// publico
    public:
        Fraccion();
        Fraccion(int,int);
    
        //getters
        int getNumerador()const;
        int getDenominador()const;
        
        //setters
        void setNumerador(int);
        void setDenominador(int);
    
        double calcValorReal();
    
    
    private:
        int numerador;
        int denominador;
};
    // constructor default que inicialice la fracción con 1/2
    
Fraccion::Fraccion(){
    numerador = 1;
    denominador = 2;
}

Fraccion::Fraccion(int _numerador, int _denominador){
    numerador= _numerador;
    denominador= _denominador;
}
        
int Fraccion::getNumerador() const{
    return numerador;
}

int Fraccion::getDenominador() const{
    return denominador;
}
        
void Fraccion::setNumerador(int _numerador){
    numerador = _numerador;
}

void Fraccion::setDenominador(int _denominador){
    denominador = _denominador;
}
        
double Fraccion::calcValorReal(){
    double resultado= (double)numerador/denominador;
    return resultado;
}
#endif
