#include <iostream>
#include <string>
using namespace std;

#include "Fraccion.h"

int main () {

    int num, denom, cont;
    double valor, real;
    int cantFracciones;
    cin >> cantFracciones;
    Fraccion *arreglo[cantFracciones];
    
    for (int i=0; i < cantFracciones;i++){
        cin >> num >> denom;
        arreglo[i] = new Fraccion(num,denom);
    }
    
    cin >> valor;
    
    for (int i = 0; i < cantFracciones; i++){
        real= arreglo[i]->calcValorReal();
        cout << real;
        if (real>valor){
            cout << arreglo[i]->getNumerador() << "/" << arreglo[i]->getDenominador() << endl;
        }
    }
    return 0;
}
