#include <iostream>
#include <fstream>
#include <cstring>
#include <sstream>
#include <cmath>
using namespace std;
#include "Fecha.h"
#include "Cliente.h"
#include "Direccion.h"
#include "Producto.h"


void crearCliente(int cantclientes, Cliente listaClientes[]){ // funcion que recibe la cantidad de clientes que se van a registrar y la una lista donde se van a almacenar los clientes
    string nombre, ciudad, estado, pais, calle; // se declaran las variables
    int codPost, numCalle;
    int idCliente;
    for (int i=0; i<cantclientes; i++){ // loop for que se repite respecto a la cantidad de clientes
        cout <<"Ingresa nombre de cliente y su ID" << endl;
        cin >> nombre >> idCliente; //se pide el nombre y el id del cliente al usuario
        cout << "Ingrese su direccion de la siguiente forma: ciudad, estado, pais, calle, codigo postal y numero de calle" << endl;
        cin >> ciudad >> estado >> pais >> calle >> codPost >> numCalle; // se pide al usuario los datos de la direccion
        listaClientes[i].setNombre(nombre); //se agrega un nombre al cliente en la lista 
        listaClientes[i].setIdCliente(idCliente);// se le agrega un Id al cliente
        listaClientes[i].setDirec(Direccion (ciudad, estado, pais, codPost, calle, numCalle)); // se crea un objeto de tipo direccion y se le es agregado al cliente 
    }
     
}

int realizarPedidos(Cliente listaClientes[],int idClient, int cantidadC, Producto listaProductos[]){ //funcion que crea un pedido
    string nombre, idPed, mes; // se declaran las variables
    stringstream temp; // convierte un objeto tipo int a string 
    int cantProd=sizeof(listaProductos), idProd, dia, anio;
    for (int i = 0; i <cantidadC ; i++){// for loop en base a la cantidad de clientes
        if (listaClientes[i].getIdCliente()==idClient){ //condicional que verifica si el id del cliente ingresado existe en la lista de 
            cout << "Ingrese id de producto: ";
            cin >> idProd; // se pide al usuario el id del producto
            for (int j = 0; j < cantProd; j++){
                cout << listaProductos[j].getIdProducto() << idProd;
                if (listaProductos[j].getIdProducto()== idProd){ //verifica si el id del producto ya existe en la lista de productos 
                    cout << "ingrese la fecha de hoy de la siguiente manera: dia, mes, anio" << endl;
                    cin >> dia>> mes >> anio;
                    Fecha date(dia, mes, anio); 
                    listaProductos[j].setVenta();
                    temp <<  listaProductos[j].getIdProducto() << "_" << listaProductos[j].getTotalVendidos(); 
                    temp >> idPed; // se guardan los datos de tem en el Id del pedido
                    Pedido compra(date, listaProductos[j], idPed); // se crea un objeto de tipo pedido y se guarda en el la fecha, la lista de producto, y el id
                    int pedidoActual = listaClientes[i].getCantPedidos();
                    listaClientes[i].setPedidos(compra); // se guarda el pedido en el cliente 
                    cout << "Se ha registrado un pedido " << endl;
                    cout << "el Id del pedido es: " << listaClientes[i].getPedidos(pedidoActual).getIdPedido() << endl;//muestar el id del pedido
                    return 0;
                }
            }
            cout << "Id de producto no existe: ";
            return 0; 
        }
    }
    return 0;
}
void consultarClientes(Cliente listaClient[], int cClientes){ //despliega todos los clientes creados en el arreglo listaClientes
    cout << "Clientes registrados: " << cClientes << endl;
    for (int i = 0; i < cClientes; i++){
        listaClient[i].imprime();
    }
}
void consultarPedidos(Cliente listaClient[], int cClientes){ // despliega todos los pedidos creados por los clientes
    cout << "Clientes con pedidos registrados:  "<< cClientes << endl; 
    for (int i = 0; i < cClientes; i++){
        cout << "El cliente " << listaClient[i].getNombre() << " con el ID " <<listaClient[i].getIdCliente()<<" realizo los siguientes pedidos:"<<endl;
        for (int j = 0; j < listaClient[i].getCantPedidos(); j++){
            listaClient[i].getPedidos(j).imprime();
        }
    } 
}

void cargaDatosProductos(Producto listaProductos[], int &cantProds){ //recibe los datos de los productos del archivo Productos.txt
    int numProd;
    double precio;
    string nombreProd;
    cantProds=0;
    ifstream archivo;
    archivo.open("Productos.txt");
    while(archivo >> numProd >> nombreProd >> precio){
        listaProductos[cantProds].setIdProducto(numProd);
        cout << listaProductos[cantProds].getIdProducto();
        listaProductos[cantProds].setNombre(nombreProd);
        cout << listaProductos[cantProds].getNombre();
        listaProductos[cantProds].setPrecio(precio);
        cout << listaProductos[cantProds].getPrecio();
        cantProds++;
    }
    archivo.close();
}

void verProductos(Producto productos[], int cantProductos)
{
    for (int i = 0; i < cantProductos; i++)
    {
        productos[i].imprime();
        cout << "---------------------------" << endl;
    }
}



int main(){
    char opcion;
    int cantClientes=0, cantPedidos=0, idCliente, cantProductos;
    Cliente listaClientes[10];
    Producto listaProducto[10];
    cargaDatosProductos(listaProducto, cantProductos);//llama a la funcion para recibir los datos de los productos
    do {
        cout << endl;
        cout << "--------MENU--------"<< endl; 
        cout << "Opciones disponibles " << endl;
        cout << " 1) Registrar clientes " << endl;
        cout << " 2) Realizar pedidos " << endl;
        cout << " 3) Consultar clientes " << endl;
        cout << " 4) ver pedidos "<< endl;
        cout << " 5) Terminar " << endl;
        cin >> opcion;
        switch (opcion) {
            case '1':
                cout << "Ingresa la cantidad de personas que deseas registrar: " << endl; 
                cin >> cantClientes; //recibe la cantidad de clientes que se van a registrar
                crearCliente(cantClientes,listaClientes);
                
                break;
            case '2':
                
                if (cantClientes != 0){ // si no se han creado ningun cliente no se pueden realizar pedidos
                    cout << "Ingresa el Id del cliente para realizar el pedido: " << endl;
                    cin >> idCliente;
                    realizarPedidos(listaClientes,idCliente,cantClientes, listaProducto);
                }
                else{ 
                    cout << "Aun no ha creado un cliente " << endl;
                }
                
                break;
            case '3':
                if (cantPedidos != 0){ // condicional que impide el desplegar clientes si no se han creado
                    consultarClientes(listaClientes, cantClientes); //despliega todos los clientes creados 
                }
                else{ 
                    cout << "No hay clientes a consultar " << endl;
                }
                break;
            case '4':
                if (cantClientes != 0){ //condicional que impide el el despligue de pedididos si no hay clientes que han creado uno  
                    consultarPedidos(listaClientes, cantClientes);
                }
                else{
                    cout << "No hay pedidos creados" << endl;
                }   
                break;
            case '5':
                break;
            default:
                cout << "Opcion invalida"<<endl;
        }
    } while (opcion != '5');
    return 0;
}
