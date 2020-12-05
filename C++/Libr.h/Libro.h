#ifndef Libro_H
#define Libro_H
#include <string>
#include <iostream>
using namespace std;
//Clase libro define un libro electrónico y guarda los datos del título, la cantidad de páginas que tiene el libro
//y la página actual donde vamos en la lectura del mismo.

//Revisa la clase Libro y completa los dos métodos que hacen falta:

class Libro{
    public:
        Libro(); 
        Libro(string, int);
        string getTitulo() const;
        void setTitulo(string);
        int getPaginas() const;
        void setPaginas(int);
        int getPaginaActual()const;
        void imprime() ;
        //1. DECLARA el método registraAvance que recibe la cantidad de páginas que representan el avance en la lectura, no regresa nada
        void registraAvance(int);
        //2. DECLARA el método pagPorLeer, regresa la cantidad de páginas que faltan por leer en el libro
        int pagPorLeer();
        
    private:
        string titulo;     //titulo del libro
        int paginas;       //paginas que tiene el libro
        int paginaActual;  //página en la que vamos (hasta dónde hemos leido)
};

//Constructor por default
Libro::Libro(){
    titulo="";
    paginas=0;
    paginaActual=0;
}

// 3. IMPLEMENTA el Constructor con parámetros, el atributo paginaActual se inicia en 0.
Libro::Libro(string _titulo, int _paginas){
	titulo = _titulo;
	paginas = _paginas;
}


// Getter y Setter de titulo
string Libro::getTitulo() const{
    return titulo;
}

void Libro::setTitulo(string tit){
    titulo=tit;
}

//Getter y setter de paginas
int Libro::getPaginas() const{
    return paginas;
}

void Libro::setPaginas(int numP){
    paginas=numP;
}

//Getter de paginaAcual
int Libro::getPaginaActual() const{
    return paginaActual;
}

void Libro::registraAvance(int _paginas){
	int pagact = getPaginaActual();
	if(_paginas > 0 && paginaActual+_paginas <= paginas){
		paginaActual+=_paginas;	
	}
}
// 4. IMPLEMENTA el método registraAvance de lectura, recibe cuantas páginas avanzamos
//    Se debe verificar que el avance sea mayor que 0 y que al aumentar el avance no pase el número de páginas
//    Si se cumple lo anterior, debe actualizar el atributo correspondiente aumentando las páginas leidas.
  
int Libro::pagPorLeer(){
	return paginas-paginaActual;
}
// 5. IMPLEMENTA el método pagPorLeer que devuelve cuántas páginas nos quedan por leer.

//6. Esta función imprime los datos del libro, NO MODIFIQUES este método, solo COMPLETA lo que hace falta, ve el comentario
void Libro::imprime() {
    cout << titulo << endl;
    cout << "Paginas: " << paginas << " te faltan por leer:" << pagPorLeer() << endl;
}

#endif //Libro_H
