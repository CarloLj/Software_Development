#include <iostream>
#include <string>
#include <fstream>
#include <Windows.h>
using namespace std;
#include "Categoria.h"
#include "Producto.h"
#include "Cliente.h"
Categoria retornaCategoria(Categoria categorias[], int indice)
{
    return categorias[indice];
}

int buscaCategoriaPorId(int id, Categoria categorias[], int cantCategorias)
{
    for (int i = 0; i < cantCategorias; i++)
    {
        if (categorias[i].getId() == id)
        {
            return i;
        }
    }
    return -1;
}

void verCategorias(Categoria categorias[], int cantCategorias)
{
    for (int i = 0; i < cantCategorias; i++)
    {
        categorias[i].imprime();
        cout << endl;
        cout << "---------------------------" << endl;
    }
}
void verProductos(Producto productos[], int cantProductos)
{
    for (int i = 0; i < cantProductos; i++)
    {
        productos[i].imprime();
        cout << "---------------------------" << endl;
    }
}

void verClientes(Cliente clientes[], int cantClientes)
{
    for (int i = 0; i < cantClientes; i++)
    {
        clientes[i].imprime();
        cout << endl;
        cout << "---------------------------" << endl;
    }
}

void cargarCategorias(Categoria categorias[100], int &cantCategorias)
{
    int numCat;
    string nombreCat;
    ifstream file;
    file.open("Categorias.txt");
    int index = 0;
    while (file >> numCat >> nombreCat)
    {
        categorias[index].setId(numCat);
        categorias[index].setNombre(nombreCat);
        index += 1;
    }
    file.close();
    cantCategorias = index;
}

void cargarProductos(Producto productos[100], int &cantProductos, Categoria categorias[], int cantCategorias)
{
    //Datos esperados a recibir del .text
    int id;
    int idCategoria;
    string nombre;
    int stock;
    float precio;
    //
    ifstream file;
    file.open("Productos.txt");
    int index = 0;
    while (file >> id >> idCategoria >> nombre >> stock >> precio)
    {
        productos[index].setProductoId(id);
        int catEncont = buscaCategoriaPorId(idCategoria, categorias, cantCategorias);
        if (catEncont != -1)
        {
            Categoria nuevaCat = retornaCategoria(categorias, catEncont);
            productos[index].setCategoria(nuevaCat);
        }
        else
        {
            Categoria nuevaCat;
            productos[index].setCategoria(nuevaCat);
        }
        productos[index].setNombre(nombre);
        productos[index].setCantStock(stock);
        productos[index].setPrecio(precio);
        index += 1;
    }
    file.close();
    cantProductos = index;
}

int buscarCliente(Cliente clientes[100], int cantClientes, int clienteID)
{
    for (int i = 0; i < cantClientes; i++)
    {
        if (clientes[i].getClienteID() == clienteID)
            return i;
    }
    return -1;
}

int buscarProducto(Producto productos[100], int _cantProductos, int id) 
{
    for (int i = 0; i < _cantProductos; i++)
    {
        if (productos[i].getProductoId() == id)
            return i;
    }
    return -1;
}

void cargarClientes(Cliente clientes[100], int &cantClientes)
{
    int clienteID;
    string nombre;
    int dia;
    int mes;
    int ano;
    string calle;
    string colonia;
    string cp;
    string pais;
    string ciudad;
    float dineroElectronico;

    ifstream file;
    file.open("Clientes.txt");
    int index = 0;
    while (file >> clienteID >> nombre >> dia >> mes >> ano >> calle >> colonia >> cp >> pais >> ciudad >> dineroElectronico)
    {
        Fecha tempFecha(dia, mes, ano);
        Domicilio tempDomicilio(calle, colonia, cp, pais, ciudad);
        Cliente tempCliente(clienteID, nombre, tempFecha, tempDomicilio, dineroElectronico);
        clientes[index] = tempCliente;
        index += 1;
    }
    file.close();
    cantClientes = index;
}

int main()
{

    ////////////////////
    Categoria categorias[100];
    Cliente clientes[100];
    Producto productos[100];
    ////////////////////
    int cantCategorias = 0;
    int cantProductos = 0;
    int cantClientes = 0;
    ////////////////////
    cargarCategorias(categorias, cantCategorias);
    cargarClientes(clientes, cantClientes);
    cargarProductos(productos, cantProductos, categorias, cantCategorias);
    ////////////////////
    char opt = 'h';
    bool clienteMode = false;
    int clienteID;
    int clienteIndex;
    do
    {
        if (clienteMode == true)
            mainCliente(clientes[clienteIndex], clienteIndex, productos, cantProductos);
        else
        {
            cout << "Bienvenido a @Ecomerce, por favor, seleccione una opcion" << endl;
            cout << "[1]: Ver Categorias" << endl;
            cout << "[2]: Ver Clientes" << endl;
            cout << "[3]: Ver Productos" << endl;
            cout << "---------------------" << endl;
            cout << "[4]: Iniciar Sesión" << endl;

            /*cout << "[4]: Agregar Categoria(s)" << endl;
        cout << "[5]: Registrar Cliente(s)" << endl;
        cout << "[6]: Agregar Producto" << endl;*/
            cin >> opt;
            switch (opt)
            {
            case '1':
                system("cls");
                verCategorias(categorias, cantCategorias);
                break;

            case '2':
                system("cls");
                verClientes(clientes, cantClientes);
                break;

            case '3':
                system("cls");
                verProductos(productos, cantProductos);
                break;

            case '4':
                cout << "Introduce tu ID de cliente" << endl;
                cin >> clienteID;
                clienteIndex = buscarCliente(clientes, cantClientes, clienteID);
                if (clienteIndex != -1)
                    clienteMode = true;
                else
                {
                    cout << "ID no encontrado" << endl;
                    clienteMode = false;
                }
                break;
            default:
                break;
            }
        }
    } while (opt != 5);
}

void mainCliente(Cliente cliente, int clienteID, Producto productos[], int cantProductos)
{
    char opt;
    do
    {
        cout << "Bienvenido " << cliente.getNombre() << " Selecciona una opcion.";
        cout << "[1]: Ver Productos " << endl;
        cout << "[2]: Mis Pedidos" << endl;
        cout << "[3]: Crear Pedido" << endl;
        cin >> opt;
        switch (opt)
        {
        case '1':
            verProductos(productos, cantProductos);
            break;
        case '2':
        	//verPedidos()
            break;
        default:
            break;
        }
    } while (opt != '5');
}
