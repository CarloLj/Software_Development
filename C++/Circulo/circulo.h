#include <math.h>
const double PI = 3.1416;

class Circulo{
    public:
    	Circulo();
        void setRadio(double radio);
        double getRadio();
        double calcArea();
        double calcPerim();
    private:
        double radio;
};

Circulo::Circulo(){
	radio = 0;
}

double Circulo::getRadio(){
	return radio;
}

void Circulo::setRadio(double _radio){
	radio = _radio;
}

double Circulo::calcArea(){
	return PI*pow(radio,2);
}

double Circulo::calcPerim(){
	return 2*PI*radio;
}
