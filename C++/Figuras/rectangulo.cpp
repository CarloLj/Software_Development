#include <iostream>
#include "Rectangulo.h"

using namespace std;

int main(){
    Rectangulo r1(4,8); 
    cout <<"Area = " << r1.area() <<"Perimetro = "<< r1.perimetro() <<endl;
    return 0;
}