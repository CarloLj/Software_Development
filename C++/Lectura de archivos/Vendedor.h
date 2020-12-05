#ifndef VENDEDOR_H
#define VENDEDOR_H
#include "Depto.h"
#include <string>
#include <iostream>
using namespace std;

class Vendedor {
public:
    Vendedor();
    Vendedor(string, double, Depto);
    string getNombre();
    void setNombre(string);
    Depto getDepartamento() const;
    void setDepartamento(Depto);
    double getVentas();
    void setVentas(double);
    void imprime();
private:
    string nombre;
    double ventas;
    Depto departamento;
};

//Constructor por default
Vendedor::Vendedor(){
    nombre = "_";
    ventas = 0;
}
//Constructor con parámetros
Vendedor::Vendedor(string nom, double ven, Depto dep){
    nombre = nom;
    ventas = ven;
    departamento = dep;
}
//GETTERS y SETTERS de los atributos
double Vendedor::getVentas(){
    return ventas;
}
void Vendedor::setVentas(double ven){
    ventas = ven;
}
string Vendedor::getNombre(){
    return nombre;
}
void Vendedor::setNombre(string nom){
    nombre = nom;
}

Depto Vendedor::getDepartamento() const{
    return departamento;
}

void Vendedor::setDepartamento(Depto dep) {
    departamento = dep;
}

//Imprime datos del vendedor
void Vendedor::imprime(){
    cout << "------------------------------------------------" << endl;
    cout << "Nombre: " << nombre << endl;
    departamento.imprime();
    cout << "Ventas: " << ventas << endl;
    cout << "------------------------------------------------" << endl;
}

#endif //VENDEDOR_H
