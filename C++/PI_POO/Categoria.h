#ifndef CATEGORIA_H
#define CATEGORIA_H

#include <string>
#include <iostream>
using namespace std;

class Categoria{
	public:
        Categoria();
        Categoria(int,string);
        void setId(int);
        void setNombre(string);
        int getId() const;
        string getNombre() const;
		void imprime();
    private:
        int id;
        string nombre;
};

Categoria::Categoria(){
	id = 99;
	nombre = "Otros";
}

Categoria::Categoria(int _id, string _nombre){
	id = _id;
	nombre = _nombre;
}

void Categoria::setId(int _id){
    if(_id < 100 && _id > 0){
        id = _id;
    }else{
        id = 1;
    }
}

void Categoria::setNombre(string _nombre){
    nombre = _nombre;
}

int Categoria::getId() const{
    return id;
}

string Categoria::getNombre() const{
    return nombre;
}

void Categoria::imprime(){
    cout<<"Categoria = " << nombre <<"| ID = "<<id;
}

#endif
