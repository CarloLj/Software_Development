#ifndef Producto_h
#define Producto_h
#include <string>
using namespace std;
class Producto{
    public:
        Producto();
        Producto(int idProducto, double precio, int totalVendidos, string nombre);
        int getIdProducto() const;
        double getPrecio() const;
        int getTotalVendidos() const;
        string getNombre() const;
        void setIdProducto(int);
        void setPrecio(double);
        void setVenta();
        void setNombre(string);
        void imprime();
    private:
        int idProducto, totalVendidos;
        double precio;
        string nombre;
};

Producto::Producto(){
    idProducto =0;
    totalVendidos =0;
    nombre = "-";
}
Producto::Producto(int _idProducto, double _precio, int _totalVendidos, string _nombre){
    idProducto=_idProducto;
    precio=_precio;
    totalVendidos=_totalVendidos;
    nombre=_nombre;
}
int Producto::getIdProducto() const{
    return idProducto;
}
double Producto::getPrecio() const{
    return precio;
}
int Producto::getTotalVendidos() const{
    return totalVendidos;
}
string Producto::getNombre() const{
    return nombre;
}
void Producto::setIdProducto(int _idProducto){
    idProducto=_idProducto;
}
void Producto::setPrecio(double _precio){
    precio=_precio;
}
void Producto::setVenta(){
    totalVendidos++;
}
void Producto::setNombre(string _nombre){
    nombre=_nombre;
}
void Producto::imprime(){

    cout << idProducto << " - " << nombre;
}




#endif /* Producto_h */