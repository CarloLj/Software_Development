///CLASE CREADA POR RICARDO GONZALEZ LEAL
#ifndef DOMICILIO_H
#define DOMICILIO_H
#include <string>
#include <iostream>

using namespace std;
class Domicilio
{
public:
    Domicilio();
    Domicilio(string, string, string, string, string);
    string getCalle() const;
    string getColonia() const;
    string getCP() const;
    string getPais() const;
    string getCiudad() const;
    void setDomicilio(string, string, string, string, string);
    void imprime();
private:
    string calle;
    string colonia;
    string cp;
    string pais;
    string ciudad;
};
Domicilio::Domicilio()
{
    calle = "";
    colonia = "";
    cp = "";
    pais = "";
    ciudad = "";
}
Domicilio::Domicilio(string _calle, string _colonia, string _cp, string _pais, string _ciudad)
{
    calle = _calle;
    colonia = _colonia;
    cp = _cp;
    pais = _pais;
    ciudad = _ciudad;
}

string Domicilio::getCalle() const
{
    return calle; 
}

string Domicilio::getCiudad() const
{
    return ciudad; 
}
string Domicilio::getColonia() const
{
    return colonia; 
}
string Domicilio::getCP() const
{
    return cp; 
}
string Domicilio::getPais() const
{
    return pais; 
}
void Domicilio::setDomicilio(string _calle, string _colonia, string _cp, string _pais, string _ciudad)
{
    calle = _calle;
    colonia = _colonia;
    cp = _cp;
    pais = _pais;
    ciudad = _ciudad;
}

void Domicilio::imprime()
{
    cout<<"Calle: "<<calle<<endl;
    cout<<"Colonia: "<<colonia<<endl;
    cout<<"CP: "<<cp<<endl;
    cout<<"Ciudad: "<<ciudad<<endl;
    cout<<"Pais: "<<pais<<endl;
}

#endif
