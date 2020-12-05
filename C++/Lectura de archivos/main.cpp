#include <iostream>
#include <fstream>
using namespace std; //Recuerda antes de los include de tus clases
#include "Depto.h"
#include "Vendedor.h"

// función que busca un id de un departamento en el arreglo de departamentos
// si lo encuentra que regrese verdadero, si no falso
int buscaDepartamento(Depto listaDept[], int cantDept, int idDeptoABuscar) {
    //Completaremos esta función
    // si sale del for, quiere decir que no existe porque si exisiera se hubiera regresado adentro del for
    for(int i =0; i<cantDept;i++){
    	if(listaDept[i].getIdDep() == idDeptoABuscar){
    		return i;
		}
	}
	//Si se sale del for significa que no lo encontro
    return -1;
}

// función que busca un id de un departamento en el arreglo de departamentos
// si lo encuentra que regres el nombre del departamento, si no lo encuentra regresa ""
string nombreDepartamento(Depto listaDept[], int cantDept, int idDeptoABuscar) {
    //Completemos esta función
    // si sale del for, quiere decir que no existe porque si exisiera se hubiera regresado adentro del for
    return "";
}

// carga datos del archivo Deptos.txt en listaDeptos y cantDeptos
void cargaDatosDepartamentos(Depto listaDeptos[], int &cantDeptos) {
    //Completaremos esta función
    int numDep;
    string nombreDep;
    cantDeptos = 0;
    ifstream archivo;
    archivo.open("Deptos.txt");
    while(archivo >> numDep >> nombreDep){
    	listaDeptos[cantDeptos].setIdDep(numDep);
    	listaDeptos[cantDeptos].setNombre(nombreDep);
    	cantDeptos++;
	}
	archivo.close();
}

// muestra la lista de departamentos
void muestraDepartamentos(Depto listaDept[], int cantDep) {
    cout << "Departamentos de la tienda" << endl;
    for(int i = 0; i < cantDep; i++){
    	listaDept[i].imprime();
	}
}

// función que regresa la listaVend y la cantVend con datos
// recibe el arreglo vacío y la variable cantVend sin inicializar y les pone valor en esta función
void cargaDatosVendedores(Vendedor listaVend[], int &cantVend, Depto listaDep[], int cantDep) {
    int idDep;
    string nom;
    double vent;
    int num;
    
    cout << "Cuantos vendedores? ";
    cin >> cantVend;
    for(int i = 0; i<cantVend;i++){
    	cout << "Teclea el nombre: ";
    	cin >> nom;
    	cout << "Teclea las ventas: ";
    	cin >> vent;
    	//Se recibe y verifica el idDepartamento
    	do{
    		cout << "Teclee el id del departamento: ";
    		cin >> idDep;
    		num = buscaDepartamento(listaDep, cantDep, idDep);
		}while(num == -1);
		listaVend[i].setNombre(nom);
		listaVend[i].setVentas(vent);
		listaVend[i].setDepartamento(listaDep[num]);
	}
}

// muestra la lista de vendedores
void muestraVendedores(Vendedor listaVen[], int cantVen) {
    //Competaremos esta función
    for(int i = 0; i < cantVen; i++){
    	listaVen[i].imprime();
	}
}

// muestra los nombres de los vendedores de un departamento
void vendedoresPorDepartamento(Vendedor listaVen[], int cantVend, Depto listaDep[], int cantDept, int idDeptoAConsultar) {
    int num = buscaDepartamento(listaDep, cantDept, idDeptoAConsultar);
    cout << "Vendedores del departamento: " << listaDep[num].getNombre() << endl;
    //Completaremos esta función
    for(int i = 0; i < cantDept; i++){
    	if(listaVen[i].getDepartamento().getIdDep() == idDeptoAConsultar){
    		cout << listaVen[i].getNombre() << " esta en el departamento " << idDeptoAConsultar <<endl;
		}
	}
}

// registra las ventas de un vendedor de la lista de vendedores existentes
// suma las ventas nuevas a las que ya estaban registradas
bool registrarVentas(Vendedor listaVend[], int cantVend) {
    //Completaremos esta función
    string nombreVendedor;
    double ventasNuevas, ventasAnteriores;
    cout << "Teclea el nombre del vendedor que quieres agregar ventas" << endl;
    cin >> nombreVendedor;
    for(int i = 0; i < cantVend ;i++){
    	if(listaVend[i].getNombre() == nombreVendedor){
    		cout << "Ingresa las ventas a registrar: ";
    		cin >> ventasNuevas;
    		ventasAnteriores = listaVend[i].getVentas();
    		listaVend[i].setVentas(ventasNuevas+ventasAnteriores);
    		return true;
		}
	}
	cout << "Vendedor no existe";
	return false;
}

int main() {
    char opcion;
    int numDepto;
    
    Vendedor listaVendedores[10];
    int cantVendedores;  // cantidad de empleados en la lista de empleados
    Depto listaDeptos[10];
    int cantDeptos;  // cantidad de departamentos en la lista de deptos
    
    //Cargamos datos de los departamentos del archivo
    cargaDatosDepartamentos(listaDeptos, cantDeptos);
    //CArgamos datos de los vendedores, los ingresa el usuario por teclado
    cargaDatosVendedores(listaVendedores, cantVendedores, listaDeptos, cantDeptos);
    
    do {
        cout << endl;
        cout << "Opciones disponibles " << endl;
        cout << " 1) Ver la lista de Departamentos " << endl;
        cout << " 2) Ver la lista de Vendedores " << endl;
        cout << " 3) Consultar vendedores de un departamento " << endl;
        cout << " 4) Registrar ventas "<< endl;
        cout << " 5) Terminar " << endl;
        cin >> opcion;
        switch (opcion) {
            case '1':
                muestraDepartamentos(listaDeptos, cantDeptos);
                break;
            case '2':
                muestraVendedores(listaVendedores, cantVendedores);
                break;
            case '3': 
                cout << "Teclea el id departamento que quieres consultar " << endl;
                cin >> numDepto;
                vendedoresPorDepartamento(listaVendedores, cantVendedores, listaDeptos, cantDeptos, numDepto);
                break;
            case '4':
                if(registrarVentas(listaVendedores, cantVendedores)){
                	cout << "Se actualizo con exito";
				}else{
					cout << " - error" <<endl;
				}
                break;
            case '5':
                cout << "Elegiste salir del programa..."<< endl;
            default:
                cout << "Opcion invalida"<<endl;
        }
    } while (opcion != '5');
    return 0;
}
