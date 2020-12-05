#ifndef DEPTO_H
#define DEPTO_H
#include <string>
#include <iostream>
using namespace std;
class Depto {
public:
    Depto();
    Depto(int i, string n);
    int getIdDep();
    void setIdDep(int i);
    string getNombre();
    void setNombre(string n);
    void imprime();
private:
    int idDep;
    string nombre;
};

//Constructor por Default
Depto::Depto(){
    idDep = 0;
    nombre = '-';
}
//Constructor con parámetros
Depto::Depto(int i, string n){
    idDep = i;
    nombre = n;
}

//GETTERS Y SETTERS de los atributos
int Depto::getIdDep(){
    return idDep;
}
void Depto::setIdDep(int i){
    idDep = i;
}
string Depto::getNombre(){
    return nombre;
}
void Depto::setNombre(string n){
    nombre = n;
}

void Depto::imprime(){
    cout << idDep << " - " << nombre << endl;
}

#endif //DEPTO_H
