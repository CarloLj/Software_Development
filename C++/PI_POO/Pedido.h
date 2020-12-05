#ifndef PEDIDO_H
#define PEDIDO_H
#include <iostream>
#include "Fecha.h"
#include "Producto.h"
using namespace std;

class Pedido{
	public:
		Pedido(int, Fecha, float,int[], int[]);
		int getId();
		Fecha getFecha();
		float getPrecioTotal();
		int* getIdsProductos();
		int* getCantxProductos();
		void setId(int);
		void imprime(Producto producto[]);
		Producto buscaProducto(Producto[], int);
	private:		
		int id;
		Fecha fecha;
		float precioTotal;
		int* idsProductos[];  
		int* cantxProductos[]; 
};

Pedido::Pedido(int _id, Fecha _fecha, float _precioTotal, int* _idsProductos, int* _cantxProductos){
	id = _id;
	fecha = _fecha;
	precioTotal = _precioTotal;
	*idsProductos = _idsProductos;
	*cantxProductos = _cantxProductos;
}

int Pedido::getId(){
	return id;
}

Fecha Pedido::getFecha(){
	return fecha;
}

float Pedido::getPrecioTotal(){
	return precioTotal;
}

int* Pedido::getIdsProductos(){
	return *idsProductos;
}

int* Pedido::getCantxProductos(){
	return *cantxProductos;
}

void Pedido::setId(int _id){
	id = _id;
}

void Pedido::imprime(Producto productos[]){
	int id;
	cout <<"Id de pedido: " <<id<<endl;
	fecha.imprime();
	cout<<endl;
	cout <<"Precio total: " <<precioTotal<<endl;
	cout <<"----------------------------------"<<endl;
	for(int i= 0; i<sizeof(idsProductos);i++){
		Producto productotemp;
		productotemp = buscaProducto(productos, *idsProductos[i]);
		if(productotemp.getProductoId()!= -9999){
			cout << "Nombre producto: "<<productotemp.getNombre() <<endl; 
			cout << "Costo Unitario: "<<productotemp.getPrecio() <<endl; 
			cout << "Categoria: "<<productotemp.getCategoria().getNombre() <<endl; 
		}
	}
	cout <<"----------------------------------"<<endl;
}

Producto Pedido::buscaProducto(Producto productos[], int _id){
	for(int i= 0; i<sizeof(productos);i++){
		Producto productin = productos[i].retornaProductoPorId(_id);
		if(productin.getProductoId() != -9999){
			return productin;
		}
	}
	Producto productin;
	productin.setProductoId(-9999);
	return productin;
}

#endif
