#ifndef CLIENTE_H
#define CLIENTE_H
#include <iostream>
#include "Domicilio.h"
#include "Fecha.h"
#include "Pedido.h"

using namespace std;
class Cliente
{
public:
    Cliente();
    Cliente(int, string, Fecha, Domicilio, float);
    void setCliente(int, string, Fecha, Domicilio, float);
    void setDineroElectronico(float);
    int getClienteID() const;
    string getNombre() const;
    Fecha getFecha() const;
    Domicilio getDomicilio() const;
    float getDineroElectronico() const;
    void imprime();
private:
    int clienteID;
    string nombre;
    Fecha fechaNac;
    Domicilio domicilio;
    float dineroElectronico;
    Pedido pedido[];
};

Cliente::Cliente()
{
    clienteID = 9999;
    nombre = "";
    Fecha fecha;
    fechaNac = fecha;
    Domicilio dom;
    domicilio = dom;
    dineroElectronico = 0; 
}

Cliente::Cliente(int _clienteID, string _nombre, Fecha _fechaNac, Domicilio _domicilio, float _dineroElectronico)
{
    clienteID = _clienteID;
    nombre = _nombre;
    fechaNac = _fechaNac;
    domicilio = _domicilio;
    dineroElectronico = _dineroElectronico;
}

void Cliente::setCliente(int _clienteID, string _nombre, Fecha _fechaNac, Domicilio _domicilio, float _dineroElectronico)
{
    clienteID = _clienteID;
    nombre = _nombre;
    fechaNac = _fechaNac;
    domicilio = _domicilio;
    dineroElectronico = _dineroElectronico;
}

void Cliente::setDineroElectronico(float _dinero)
{
    dineroElectronico = _dinero;
}

int Cliente::getClienteID() const
{
    return clienteID;
}
string Cliente::getNombre() const
{
    return nombre;
}
Fecha Cliente::getFecha() const
{
    return fechaNac;
}
Domicilio Cliente::getDomicilio() const
{
    return domicilio;
}
float Cliente::getDineroElectronico() const
{
    return dineroElectronico;
}
void Cliente::imprime()
{
    cout<<"Cliente ID: "<<clienteID<<endl;
    cout<<"Nombre: "<<nombre<<endl;
    cout<<"Fecha de Nacimiento: ";
    fechaNac.imprime();
    cout<<endl;
    cout<<"Domicilio: ";
    domicilio.imprime();
    cout<<"Dinero Electronico: $"<<dineroElectronico<<endl;
}
#endif
