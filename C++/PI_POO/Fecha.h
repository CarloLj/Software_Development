#ifndef FECHA_H
#define FECHA_H

#include <iostream>

using namespace std;

class Fecha{
	public:
        Fecha();
        Fecha(int,int,int);
        void setDia(int);
        void setMes(int);
        void setAno(int);
        int getDia() const;
        int getMes() const;
        int getAno() const;
        void actualizarFecha(int,int,int);
        void imprime();
    private:
        int dia;
        int mes;
        int ano;
};

Fecha::Fecha(){
    dia = 1;
    mes = 1;
    ano = 2020;
}

Fecha::Fecha(int _dia, int _mes , int _ano){
    dia = _dia;
    mes = _mes;
    ano = _ano;
}

void Fecha::setDia(int _dia){
    if(_dia < 31 && _dia > 0){
        dia = _dia;
    }else{
        dia = 1;
    }
}

void Fecha::setMes(int _mes){
    if(_mes < 13 && _mes > 0){
        mes = _mes;
    }else{
        _mes = 1;
    }
}

int Fecha::getDia() const{
    return dia;
}

int Fecha::getMes() const{
    return dia;
}

int Fecha::getAno() const{
    return ano;
}

void Fecha::actualizarFecha(int _dia, int _mes, int _ano){
    dia = _dia;
    mes = _mes;
    ano = _ano;
}

void Fecha::imprime(){
    cout<<dia<<"/"<<mes<<"/"<<ano;
}

#endif