#ifndef DIRECCION_H
#define DIRECCION_H
#include <iostream>
using namespace std;

class Direccion{
    public:
        Direccion();
        Direccion( string, string, string, int, string, int);
        string getCiudad();
        void setCiudad(string);
        string getEstado();
        void setEstado(string);
        string getPais(); 
        void setPais(string);
        int getCodPost(); 
        void setCodPost(int);
        string getCalle();
        void setCalle(string);
        int getNumCalle(); 
        void setNumCalle(int);       
 private:
        string ciudad;
        string estado;
        string pais;
        int codPost;
        string calle;
        int numCalle;
};

Direccion::Direccion (){
    ciudad="-";
    estado="-";
    pais="-";
    codPost= 0;
    calle= "-";
    numCalle=0;
}
Direccion::Direccion(string _ciudad, string _estado, string _pais, int _codPost, string _calle, int _numCalle){
    ciudad=_ciudad;
    estado=_estado;
    pais=_pais;
    codPost=_codPost;
    calle=_calle;
    numCalle=_numCalle;
}
string Direccion::getCiudad(){
    return ciudad;
}
void Direccion::setCiudad(string _ciudad){
    ciudad = _ciudad;
}
string Direccion::getEstado(){
    return estado;
}
void Direccion::setEstado(string _estado){
    estado = _estado;

}
string Direccion::getPais(){
    return pais;
}
void Direccion::setPais(string _pais){
    pais = _pais;

}
string Direccion::getCalle(){
    return calle;
}
void Direccion::setCalle(string _calle){
    calle = _calle;

}
int Direccion::getCodPost(){
    return codPost;
}
void Direccion::setCodPost(int _codPost){
    codPost = _codPost;

}
int Direccion::getNumCalle(){
    return numCalle;
}
void Direccion::setNumCalle(int _numCalle){
    numCalle = _numCalle;
}
#endif