#include <iostream>
#include <string>
using namespace std;

#include "CtaBanc.h"

int main() {

    string nom, dire;
    CtaBanc cliente1;
    // 1) Crea un objeto cliente1 de tipo CtaBanc usando
    // el constructor default
    
    //cout<<"Como se llama el cliente "<<endl;
    cin>>nom;
    //cout<<"Direccion del cliente "<<endl;
    cin>>dire;
	Persona persona(nom,dire);
	CtaBanc cliente2(persona, 0);
    // 2) Crea un objeto cliente2 de tipo CtaBanc usando
    // el constructor con parámetros que tenga
    // los datos del cliente nom, dire y saldo = 0
    // declara lo que necesites
    nom = "";       // NO borres esta línea
    dire = "";      // NO borres esta línea  
    // 3) Muestra los datos del objeto cliente1 usando los cout que están a continuación
    // agrega lo que necesites, no modifiques los mensajes
    cout << "Cliente 1:" << endl;
    cout<<"Nombre: "<<cliente1.getCliente()->getNombre()<< endl;
    cout<<"Dirección: "<<cliente1.getCliente()->getDire()<< endl;
    cout<<"Saldo: "<<cliente1.getSaldo()<< endl;

    
    // 4) Muestra los datos del objeto cliente2 usando los cout que están a continuación
    // agrega lo que necesites, no modifiques los mensajes
    
    
    cout << "Cliente 2:" << endl;
    cout<<"Nombre: "<<cliente2.getCliente()->getNombre()<< endl;
    cout<<"Dirección: "<<cliente2.getCliente()->getDire()<< endl;
    cout<<"Saldo: "<<cliente2.getSaldo()<< endl;
    
    int numeroCliente;
    //cout << "Modificar dirección de cliente 1 o 2 ";
    cin >> numeroCliente;
    //cout << "Nueva dirección ";
    cin >> dire;
    
    // 5) Haz lo necesario para modificar la dirección de uno de 
    // los objetos cliente que ya creaste. 1 para cliente1 y 2 para cliente2
    if(numeroCliente == 1){
    	cliente1.getCliente()->setDire(dire);
	}else{
		if(numeroCliente == 2){
			cliente2.getCliente()->setDire(dire);
		}
	}
    // 6) Vuelve a mostrar los datos de los dos clientes

    // Muestra los datos del objeto cliente 1
    // agrega lo que necesites
    cout << "Cliente 1:" << endl;
    cout<<"Nombre: "<<cliente1.getCliente()->getNombre()<< endl;
    cout<<"Dirección: "<<cliente1.getCliente()->getDire()<< endl;
    cout<<"Saldo: "<<cliente1.getSaldo()<< endl;
    
    // Muestra los datos del objeto cliente 2
    // agrega lo que necesites

    cout << "Cliente 2:" << endl;
    cout<<"Nombre: "<<cliente2.getCliente()->getNombre()<< endl;
    cout<<"Dirección: "<<cliente2.getCliente()->getDire()<< endl;
    cout<<"Saldo: "<<cliente2.getSaldo()<< endl;

    return 0;
}
