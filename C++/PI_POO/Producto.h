#ifndef PRODUCTO_H
#define PRODUCTO_H

#include "Categoria.h"
#include "Pedido.h"
class Producto{
	public:
		Producto();
		Producto(int, Categoria, string, int, float);
		int getProductoId();
		Categoria getCategoria();
		string getNombre();
		int getCantStock();
		float getPrecio();
		void setProductoId(int);
		void setCategoria(Categoria);
		void setNombre(string);
		void setCantStock(int);
		void setPrecio(float);
		void imprime();
		Producto retornaProductoPorId(int);
	private:
		int productoId;
		Categoria categoria;
		string nombre;
		int cantStock;
		float precio;
};

Producto::Producto(){
	productoId = 1;
	Categoria cat;
	categoria = cat;
	nombre = "Producto de prueba";
	cantStock = 0;
	precio = 1000000;
}

Producto::Producto(int _id, Categoria _cat, string _nombre, int _stock, float _precio){
	productoId = _id;
	categoria = _cat;
	nombre = _nombre;
	int cantStock = _stock;
	precio = _precio;
}

int Producto::getProductoId(){
	return productoId;
}

Categoria Producto::getCategoria(){
	return categoria;
}

string Producto::getNombre(){
	return nombre;
}

int Producto::getCantStock(){
	return cantStock;
}

float Producto::getPrecio(){
	return precio;
}

void Producto::setProductoId(int _id){
	if(_id > 0){
		productoId = _id;
	}
}

void Producto::setCategoria(Categoria _cat){
	categoria = _cat;
}
void Producto::setNombre(string _nombre){
	nombre = _nombre;
}

void Producto::setCantStock(int _stock){
	cantStock = _stock;
}

void Producto::setPrecio(float _precio){
	precio = _precio;
}

void Producto::imprime(){
	cout <<"Id = "<<productoId <<endl;
	categoria.imprime();
	cout<<""<<endl;
	cout <<"Nombre = "<<nombre <<endl;
	cout <<"Stock = "<<cantStock <<endl;
	cout <<"Precio = "<<precio <<endl;
}

Producto Producto::retornaProductoPorId(int _id){
	if(_id == productoId){
		return *this;
	}
	Producto productoNulo;
	productoNulo.setProductoId(-9999);
	return productoNulo;
}

#endif
