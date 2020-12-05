#include <string>
#include <iostream>
using namespace std;
// INSTRUCCIONES: 
// Escribe la clase PaisCovid de acuerdo con 
// los comentarios que se encuentran enseguida

class PaisCovid{
	public:	
		PaisCovid();
		PaisCovid(string, int);
		string getNombre();
		int getEnfermos();
		int getCurados();
		int getMuertes();
		void setNombre(string);
		void setEnfermos(int);
		void setCurados(int);
		void setMuertes(int);
		void registraEnfermos(int);
		void registraCurados(int);
		void registraMuertes(int);
		int infectadosTotales();
		double tasaMortalidad();
		void imprime();
	private:
		string nombre;
   	    int enfermos;
    	int curados;
    	int muertes;
};

PaisCovid::PaisCovid(){
	nombre = "Desconocido";
	enfermos = 0;
	curados = 0;
	muertes = 0;
}

PaisCovid::PaisCovid(string _nombre, int _enfermos){
	nombre = _nombre;
	enfermos = _enfermos;
	curados = 0;
	muertes = 0;
}

string PaisCovid::getNombre(){
	return nombre;
}

int PaisCovid::getEnfermos(){
	return enfermos;
}

int PaisCovid::getCurados(){
	return curados;
}

int PaisCovid::getMuertes(){
	return muertes;
}

void PaisCovid::setNombre(string _nombre){
	nombre = _nombre;
}

void PaisCovid::setEnfermos(int _enfermos){
	enfermos = _enfermos;
}

void PaisCovid::setCurados(int _curados){
	curados = _curados;
}

void PaisCovid::setMuertes(int _muertes){
	muertes = _muertes;
}

void PaisCovid::registraEnfermos(int _enfermos){
	if(_enfermos > 0){
		enfermos += _enfermos;
		cout << enfermos <<endl;
	}
}

void PaisCovid::registraCurados(int _curados){
	if(_curados > 0 && _curados <= enfermos){
		enfermos -= _curados;
		curados += _curados;
	}
}

void PaisCovid::registraMuertes(int _muertes){
	if(_muertes > 0 && _muertes < enfermos){
		muertes += _muertes;
		enfermos -= _muertes;
	}
}

int PaisCovid::infectadosTotales(){
	return enfermos+curados+muertes;
}

double PaisCovid::tasaMortalidad(){
	double nuevodato = muertes*100;
	nuevodato = nuevodato/infectadosTotales();
	return nuevodato;
}

void PaisCovid::imprime(){
	cout << "Pais: " << nombre <<endl;
    cout << "Infectados totales: " << infectadosTotales() <<endl;
    cout << "Tasa de mortalidad: <" << tasaMortalidad() <<endl;
}


