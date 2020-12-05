///CLASE CREADA POR CARLO ANGEL LUJAN GARCÍA
#ifndef PEDIDO_H
#define PEDIDO_H
#include <iostream>
#include "Fecha.h"
#include "Producto.h"
using namespace std;

class Pedido{
	public:
        Pedido();
		Pedido(int, Fecha, float,int[], int[], int);
		int getId();
		Fecha getFecha();
		float getPrecioTotal();
		int getIdProducto(int);
		int getCantProducto(int);
		int getCantidadProductos();
		//int[] getIDSProductos();
		void setId(int);
		void imprime();
	private:		
		int id;
		Fecha fecha;
		float precioTotal;
        int cantProductos;
		int cantxProductos[10]; 
		int idsProductos[10];  
};

Pedido::Pedido()
{
    id = 9999;
    for (int i = 0; i < 10; i++)
    {
        cantxProductos[i]=0;
        idsProductos[i]=0;
    }
    
}

Pedido::Pedido(int _id, Fecha _fecha, float _precioTotal, int _idsProductos[10], int _cantxProductos[10], int _cantProductos){
	id = _id;
	fecha = _fecha;
    precioTotal = _precioTotal;
	cantProductos = _cantProductos;
    for (int i = 0; i < 10; i++)
    {
        idsProductos[i] = _idsProductos[i];
        cantxProductos[i] = _cantxProductos[i];
    }
}

int Pedido::getId(){
	return id;
}

Fecha Pedido::getFecha(){
	return fecha;
}

int Pedido::getCantidadProductos()
{
	return cantProductos;
}
float Pedido::getPrecioTotal(){
	return precioTotal;
}

int Pedido::getIdProducto(int index){
	return idsProductos[index];
}

int Pedido::getCantProducto(int index){
	return cantxProductos[index];
}

void Pedido::setId(int _id){
	id = _id;
}

void Pedido::imprime(){
	cout<<"ID del Pedido: "<<id<<endl;
	cout<<"Fecha: ";
	fecha.imprime();
	cout<<endl;
	cout<<"Precio Total: $"<<precioTotal<<endl;
}

#endif
