// Clase persona, está completa
#include <string>
using namespace std;

class Persona {
public:
    Persona();
    Persona(string n, string d);
    void setNombre(string n);
    string getNombre();
    void setDire(string d);
    string getDire();
private:
    string nombre;
    string dire;
};

Persona::Persona() {
    nombre = "-";
    dire = "-";
}

Persona::Persona(string n, string d) {
    nombre = n;
    dire = d;
}

void Persona::setNombre(string n) {
    nombre = n;
}


string Persona::getNombre() {
    return nombre;
}


void Persona::setDire(string d) {
    dire = d;
}

string Persona::getDire() {
    return dire;
}

