#ifndef PUNTO_H
#define PUNTO_H
#include <iostream>

// Define una clase Punto que representa una posición en la pantalla, recuerda que los puntos en la pantalla están en pixeles, 
// por eso x y son int. Además considera que la esquina superior izquierda es la posición 0, 0.
class Punto
{
    public:
        //Constructor default pone el punto en el origen de la ventana (0,0)
        Punto(); 
        // Constructor con parámetros recibe la posición en x y la posición en y 
        Punto(int, int);
        // Método de acceso para X
    	int getX();
       
        // Método de modificación para X
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

// Implementa el constructor con parámetros, llama aquí a los setters de X e Y para que tengan la verificación
Punto::Punto(int _x, int _y) {
    setX(_x);
    setY(_y);
}

// Implementa el método de acceso para x
int Punto::getX(){
	return x;
}

// Implementa el método de acceso para Y
int Punto::getY(){
	return y;
}

// Implementa el método de modificación para Y, verifica que el parámetro recibido es mayor o igual a 0, sino, ponle valor de 0
void Punto::setY(int _y){
	if(_y >= 0){
		y = _y;
	}else{
		y = 0;
	}
}

//Implementa el  setter de Y verifica que el parámetro recibido es mayor o igual a 0, sino, ponle el valor de 0
void Punto::setX(int _x){
	if(_x >= 0){
		x = _x;
	}else{
		x = 0;
	}
}

//Llama los setters de X e Y para tener la verificación
void Punto::cambiaCoordenada(int _x, int _y){
   setX(_x);
   setY(_y);
}

//Imprime los datos de las coordenadas del punto, no modifiques este método
void Punto::imprimePunto(){
    std::cout << "(" << x << ","<< y << ")" <<std::endl;
}

#endif //PUNTO_H


