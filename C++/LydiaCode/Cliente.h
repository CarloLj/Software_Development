#ifndef Cliente_H
#define Cliente_H
#include <iostream>
using namespace std;
#include "Direccion.h"
#include "Pedido.h"

class Cliente{
    public:
        Cliente();
        Cliente(string, Direccion, int);
        string getNombre();
        void setNombre(string); 
        Direccion getDirec();
        void setDirec(Direccion);
        int getIdCliente();
        void setIdCliente(int);
        void setPedidos(Pedido _pedidos);
        Pedido getPedidos(int);
        int getCantPedidos();
        void imprime();

    private:
        string nombre;
        int idCliente, cantPedidos=0;       
        Direccion direc;
        Pedido pedidos[5];
};


Cliente::Cliente(){ //constructor default de la clase cliente 
    nombre= "-";
    idCliente =0;
}

Cliente::Cliente( string _nombre, Direccion _direc,int _idCliente){// constructor que integra nuevos valores a la clase cliente 
    nombre= _nombre ;
    idCliente = _idCliente;
    direc = _direc;
}

string Cliente::getNombre(){// 
    return nombre;
}
void Cliente::setNombre(string _nombre){
     nombre = _nombre;
}

Direccion Cliente::getDirec(){
    return direc;
}
void Cliente::setDirec(Direccion _direc){
     direc = _direc;
}

int Cliente::getIdCliente(){
    return idCliente;
}
void Cliente::setIdCliente(int _idCliente){
     idCliente = _idCliente;
}

void Cliente::setPedidos(Pedido _pedidos){
    pedidos[cantPedidos] = _pedidos ;
    cantPedidos++;
}
int Cliente:: getCantPedidos(){
    return cantPedidos;
}
Pedido Cliente::getPedidos(int _indice){
    return pedidos[_indice];
}
void Cliente::imprime(){

    cout << nombre << "-" << idCliente << "-" << cantPedidos << endl;
}
#endif/* Cliente_h */