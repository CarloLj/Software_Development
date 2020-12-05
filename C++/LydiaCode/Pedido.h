#ifndef PEDIDO_H
#define PEDIDO_H
#include <iostream>
#include "Fecha.h"
#include "Producto.h"
using namespace std; 

class Pedido{
    public:
        Pedido();
        Pedido( Fecha, Producto, string);
        Fecha getFechaPed();
        void  setFechaPed(Fecha);
        Producto getProducto();
        void setProducto(Producto);  
        string getIdPedido();
        void setIdPedido(string);
        void imprime();
    private:
        Fecha fechaPed;
        Producto producto; 
        string idPedido; 
};

Pedido::Pedido(){
    idPedido ="-";
}

Pedido::Pedido( Fecha _fechaPed, Producto _producto, string _idPedido){
    fechaPed=_fechaPed;
    producto=_producto;
    idPedido=_idPedido;
}
Fecha Pedido::getFechaPed(){
    return fechaPed;
}

void Pedido::setFechaPed(Fecha _fechaPed){
    fechaPed=_fechaPed;
}

Producto Pedido::getProducto(){
    return producto;
}

void Pedido::setProducto(Producto _producto){
    producto=_producto;
}

string Pedido::getIdPedido(){
    return idPedido;
}

void Pedido::setIdPedido(string _idPedido){
    idPedido=_idPedido;
}
void Pedido::imprime(){
    cout << "ID de pedido: " << idPedido << " Producto: ";
    producto.imprime();
    cout <<" $"<< producto.getPrecio() << endl;
}
#endif