#include "Persona.h"

class CtaBanc {
public:
    CtaBanc();
    CtaBanc(Persona, double);
    void setCliente(Persona);
    Persona* getCliente();
    double getSaldo();
    void setSaldo(double s);
private:
    Persona cliente;
    double saldo;
};

// 4) Implementa el constructor default
CtaBanc::CtaBanc(){
	Persona _cliente;
	cliente = _cliente;
	saldo = 0;
}

// 5) Implementa el constructor con parámetros
CtaBanc::CtaBanc(Persona _persona, double _saldo){
	cliente = _persona;
	saldo = _saldo;
}

// 6) Implementa el método de acceso para cliente
Persona* CtaBanc::getCliente(){
	return &cliente;
}

// 7) Implementa el método de modificación para cliente
void CtaBanc::setCliente(Persona _cliente){
	cliente = _cliente;
}

void CtaBanc::setSaldo(double s) {
    saldo = s;
}

double CtaBanc::getSaldo(){
    return saldo;
}

