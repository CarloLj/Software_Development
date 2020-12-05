#include <iostream>
#include <string>
using namespace std;

#include "Fraccion.h"

int main () {

    int nume, denom;
    double valor;
    int cantFracciones;
    //cout << "Cuantas fracciones hay " << endl; Este d�jalo como comentario
    // lee el valor para la variable cantFacciones que ser� la cantidad de fracciones que queremos para el arreglo
    cin>>cantFracciones;
    Fraccion *fraccion[cantFracciones];
    // Declara un arreglo de objetos de tipo Fracci�n con el n�mero de posiciones que te acaban de dar 
	for(int i = 0 ; i < cantFracciones; i++){
		//cout << "Teclea el numerador y el denominador de la fracci�n " << cont << endl;
        cin >> nume >> denom;
		fraccion[i] = new Fraccion(nume, denom);
	}
    // Haz una repetici�n para pedir numeradores y denominadores para esa cantidad de datos de tipo Fraccion
     
        //
        // coloca los datos en la casilla correspondiente del arreglo de Fracciones
    //cout << "Se mostrar�n las fracciones cuyo valor decimal sea mayor a un valor, teclea ese valor" << endl; dejalo como comentario
    cin >> valor;
    
    // muestra en la pantalla solamente aquellas fracciones del arreglo cuyo valor en decimal es mayor que el valor dado 
    for(int i = 0 ; i < cantFracciones; i++){
    	if(fraccion[i]->calcValorReal() > valor ){
			cout<<fraccion[i]->getNumerador() << "/" << fraccion[i]->getDenominador();
		}
	}
    return 0;
}

