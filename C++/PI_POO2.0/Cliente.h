///CLASE CREADA POR RICARDO GONZALEZ LEAL
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
    void setPedido(int, Pedido);
    int getClienteID() const;
    string getNombre() const;
    Fecha getFecha() const;
    Domicilio getDomicilio() const;
    float getDineroElectronico() const;
    Pedido getPedido(int) const;
    void quitaDineroElectronico(int);
    void imprime();
private:
    int clienteID;
    string nombre;
    Fecha fechaNac;
    Domicilio domicilio;
    float dineroElectronico;
    Pedido pedidos[10];
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
    Pedido pedido;
    for (int i = 0; i < 10; i++)
        pedidos[i] = pedido;
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

void Cliente::setPedido(int index, Pedido _pedido)
{
    pedidos[index] = _pedido;
}

Pedido Cliente::getPedido(int index) const
{
    return pedidos[index];
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

void Cliente::quitaDineroElectronico(int _dinero){
	if(_dinero <= dineroElectronico){
		dineroElectronico -= _dinero;
	}
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
