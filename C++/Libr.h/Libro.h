#ifndef Libro_H
#define Libro_H
#include <string>
#include <iostream>
using namespace std;
//Clase libro define un libro electr�nico y guarda los datos del t�tulo, la cantidad de p�ginas que tiene el libro
//y la p�gina actual donde vamos en la lectura del mismo.

//Revisa la clase Libro y completa los dos m�todos que hacen falta:

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
        //1. DECLARA el m�todo registraAvance que recibe la cantidad de p�ginas que representan el avance en la lectura, no regresa nada
        void registraAvance(int);
        //2. DECLARA el m�todo pagPorLeer, regresa la cantidad de p�ginas que faltan por leer en el libro
        int pagPorLeer();
        
    private:
        string titulo;     //titulo del libro
        int paginas;       //paginas que tiene el libro
        int paginaActual;  //p�gina en la que vamos (hasta d�nde hemos leido)
};

//Constructor por default
Libro::Libro(){
    titulo="";
    paginas=0;
    paginaActual=0;
}

// 3. IMPLEMENTA el Constructor con par�metros, el atributo paginaActual se inicia en 0.
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
// 4. IMPLEMENTA el m�todo registraAvance de lectura, recibe cuantas p�ginas avanzamos
//    Se debe verificar que el avance sea mayor que 0 y que al aumentar el avance no pase el n�mero de p�ginas
//    Si se cumple lo anterior, debe actualizar el atributo correspondiente aumentando las p�ginas leidas.
  
int Libro::pagPorLeer(){
	return paginas-paginaActual;
}
// 5. IMPLEMENTA el m�todo pagPorLeer que devuelve cu�ntas p�ginas nos quedan por leer.

//6. Esta funci�n imprime los datos del libro, NO MODIFIQUES este m�todo, solo COMPLETA lo que hace falta, ve el comentario
void Libro::imprime() {
    cout << titulo << endl;
    cout << "Paginas: " << paginas << " te faltan por leer:" << pagPorLeer() << endl;
}

#endif //Libro_H
