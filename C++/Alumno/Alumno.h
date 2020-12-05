#include <string>
#include <iostream>
using namespace std;
// Escribe la clase Alumno de acuerdo con los comentarios
// Incluye las librerias requeridas
// Utiliza el espacio de trabajo estándar
// implementa los métodos

// Clase Fraccion

// publico
    // constructor omisión que inicialice los atributos tipo string en nulo y los atributos numéricos en cero.
    // constructor con parámetros para matricula, nombre, carrera y edad
    // métodos de acceso para todos los atributos
    // métodos de modificación para todos los atributos
    // método imprimeAlumno que muestre en pantalla los atributos del alumno en el formato [matricula - nombre - carrera - edad]
    // método cumpleanios que incremente en uno la edad

// privado
    // atributos string matricula, nombre y carrera
    // atributo entero edad

class Fraccion{
    public:
        Fraccion();
        Fraccion(string, string, string, int);
        string getMaticula();
        string getNombre();
        string getCarrera();
        int getEdad();
        void setMaticula(string);
        void setNombre(string);
        void setCarrera(string);
        void setEdad(int);
        void imprimeAlumno();
        void cumpleanios();
    private:
        string matricula;
        string nombre;
        string carrera;
        int edad;
};

Fraccion::Fraccion(){
	matricula = "";
    nombre = "";
    carrera = "";
    edad = 0;
}

Fraccion::Fraccion(string _matricula, string _nombre, string _carrera, int _edad){
	matricula = _matricula;
    nombre = _nombre;
    carrera = _carrera;
    edad = _edad;
}
	
string Fraccion::getCarrera(){
	return carrera;
}

string Fraccion::getMaticula(){
	return matricula;
}

string Fraccion::getNombre(){
	return nombre;
}

int Fraccion::getEdad(){
	return edad;
}

void Fraccion::setCarrera(string _carrera){
	carrera = _carrera;
}

void Fraccion::setMaticula(string _matricula){
	matricula = _matricula;
}

void Fraccion::setNombre(string _nombre){
	nombre = _nombre;
}

void Fraccion::setEdad(int _edad){
	edad = _edad;
}

void Fraccion::imprimeAlumno(){
	cout << "[" << matricula << " - " << nombre << " - " << carrera << " - " << edad << "]" <<endl;
}

void Fraccion::cumpleanios(){
	edad++;
}
