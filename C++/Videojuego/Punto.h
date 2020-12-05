#ifndef PUNTO_H
#define PUNTO_H
#include <iostream>

// Define una clase Punto que representa una posici�n en la pantalla, recuerda que los puntos en la pantalla est�n en pixeles, 
// por eso x y son int. Adem�s considera que la esquina superior izquierda es la posici�n 0, 0.
class Punto
{
    public:
        //Constructor default pone el punto en el origen de la ventana (0,0)
        Punto(); 
        // Constructor con par�metros recibe la posici�n en x y la posici�n en y 
        Punto(int, int);
        // M�todo de acceso para X
    	int getX();
       
        // M�todo de modificaci�n para X
        void setX(int);
        
        // Getter de Y
        int getY();
        
        // Setter de Y
        void setY(int);
        
        //Cambiar los dos atributos x e y
        void cambiaCoordenada(int, int);
        //Imprimir la posicion
        void imprimePunto();
    private:
        int x;
        int y;
};

// Implementa el constructor default, inicia los atributos x e y a 0
Punto::Punto(){
	x = 0;
	y = 0;
}

// Implementa el constructor con par�metros, llama aqu� a los setters de X e Y para que tengan la verificaci�n
Punto::Punto(int _x, int _y) {
    setX(_x);
    setY(_y);
}

// Implementa el m�todo de acceso para x
int Punto::getX(){
	return x;
}

// Implementa el m�todo de acceso para Y
int Punto::getY(){
	return y;
}

// Implementa el m�todo de modificaci�n para Y, verifica que el par�metro recibido es mayor o igual a 0, sino, ponle valor de 0
void Punto::setY(int _y){
	if(_y >= 0){
		y = _y;
	}else{
		y = 0;
	}
}

//Implementa el  setter de Y verifica que el par�metro recibido es mayor o igual a 0, sino, ponle el valor de 0
void Punto::setX(int _x){
	if(_x >= 0){
		x = _x;
	}else{
		x = 0;
	}
}

//Llama los setters de X e Y para tener la verificaci�n
void Punto::cambiaCoordenada(int _x, int _y){
   setX(_x);
   setY(_y);
}

//Imprime los datos de las coordenadas del punto, no modifiques este m�todo
void Punto::imprimePunto(){
    std::cout << "(" << x << ","<< y << ")" <<std::endl;
}

#endif //PUNTO_H


