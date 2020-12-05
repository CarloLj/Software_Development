#include <iostream>
using namespace  std;;

#include "Rectangulo.h"

int main() {
    int ancho, alto, coorX, coorY, numRec;
    char opcion;
    
    // 1) Crea 2 objetos de tipo Rect�ngulo rect1 y rect2 usando el constructor default.
    Rectangulo rect1, rect2;
    do {
        //cout << " a) Cambiar dimensiones " << endl;
        //cout << " b) Mover de lugar " << endl;
        //cout << " c) Mostrar rect�ngulos " << endl;
        //cout << " d) Terminar " << endl;
        cin >> opcion;
        
        switch (opcion) {
            case 'a': {
                //cout << "Rect�ngulo 1 o 2? ";
                cin >> numRec;
            	//cout << "Teclea las nuevas dimensiones ancho y alto (en ese orden) ";
                cin >> ancho >> alto;
                if(numRec == 1){
                	rect1.setAlto(alto);
                	rect1.setAncho(ancho);
				}else{
					if(numRec == 2){
						rect2.setAlto(alto);
                		rect2.setAncho(ancho);
					}
				}
                break;
            }  // cierra inciso a
            case 'b': {
                //cout << "Rect�ngulo 1 o 2? ";
                cin >> numRec;
                //cout << "Teclea la nueva posici�n (x, y) en ese orden ";
                cin >> coorX >> coorY;
                
                // 3) Modifica el origen del rect�ngulo correspondiente con las nuevas coordenadas
                if (numRec == 1) {
					Punto tempPunto(coorX,coorY);
 					rect1.setOrigen(tempPunto);
                }
                else {
 					Punto tempPunto(coorX,coorY);
 					rect2.setOrigen(tempPunto);
                }
                break;
            } // cierra inciso b
            case 'c': {
                Punto puntoTemp;
                // 4) Muestra los datos del rect�ngulo 1
                cout << " Rect�ngulo 1 " << endl;                
                cout << " Dimensiones : " <<   rect1.getAncho()   << " X " <<  rect1.getAlto()    << endl;
                cout << " Posici�n : " <<  rect1.getOrigen().getX()  << ", " <<  rect1.getOrigen().getY()   << endl;

                
                // 5) Muestra los datos del rect�ngulo 2
                cout << " Rect�ngulo 2 " << endl;
                cout << " Dimensiones : " <<   rect2.getAncho()   << " X " <<  rect2.getAlto()    << endl;
                cout << " Posici�n : " <<  rect2.getOrigen().getX()  << ", " <<  rect2.getOrigen().getY()   << endl;
                break;
            } // cierra inciso c
        } // cierra switch
    } while (opcion != 'd');
       
    return 0;
}

