#ifndef FECHA_H
#define FECHA_H
#include <iostream>
using namespace std;

class Fecha{
    public:
        Fecha();
        Fecha(int, string, int);
        int getDia();
        string getMes();
        int getAnio();
        void setDia(int);
        void setMes(string);
        void setAnio(int);
        void imprime();
    private:
        int dia,anio;
        string mes;    
};

Fecha::Fecha(){
    dia = 0;
    mes= "-";
    anio= 0;
}

Fecha::Fecha(int _dia,string _mes, int _anio){
    dia = _dia;
    mes= _mes;
    anio = _anio;
}

int Fecha::getDia(){
    return dia;
}
void Fecha::setDia(int _dia){
    dia = _dia;
}

string Fecha::getMes(){
    return mes;
}
void Fecha::setMes(string _mes){
    mes = _mes;
}

int Fecha::getAnio(){
    return anio;
}
void Fecha::setAnio(int _anio){
    anio = _anio;
}
void Fecha::imprime(){
    cout << dia << " - " << mes << "-" << anio << endl;
}
#endif //FECHA_H
