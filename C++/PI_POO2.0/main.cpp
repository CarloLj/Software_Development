#include <iostream>
#include <string>
#include <fstream>
#include <Windows.h>
#include <ctime>
using namespace std;
#include "Categoria.h"
#include "Producto.h"
#include "Cliente.h"

///FUNCION CREADA POR CARLO ANGEL LUJAN GARCÍA
Categoria retornaCategoria(Categoria categorias[], int indice)
{
    return categorias[indice];
}

///FUNCION CREADA POR CARLO ANGEL LUJAN GARCÍA
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

///FUNCION CREADA POR RICARDO GONZALEZ LEAL
int buscarProducto(Producto productos[100], int _cantProductos, int id)
{
    for (int i = 0; i < _cantProductos; i++)
    {
        if (productos[i].getProductoId() == id)
            return i;
    }
    return -1;
}

///FUNCION CREADA POR RICARDO GONZALEZ LEAL
void verCategorias(Categoria categorias[], int cantCategorias)
{
    for (int i = 0; i < cantCategorias; i++)
    {
        categorias[i].imprime();
        cout << endl;
        cout << "---------------------------" << endl;
    }
}

///FUNCION CREADA POR CARLO ANGEL LUJAN GARCÍA
void verProductos(Producto productos[], int cantProductos)
{
    for (int i = 0; i < cantProductos; i++)
    {
        productos[i].imprime();
        cout << "---------------------------" << endl;
    }
}

///FUNCION CREADA POR CARLO ANGEL LUJAN GARCÍA
void verClientes(Cliente clientes[], int cantClientes)
{
    for (int i = 0; i < cantClientes; i++)
    {
        clientes[i].imprime();
        cout << endl;
        cout << "---------------------------" << endl;
    }
}

///FUNCION CREADA POR RICARDO GONZALEZ LEAL
void cargarCategorias(Categoria categorias[100], int& cantCategorias)
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

///FUNCION CREADA POR CARLO ANGEL LUJAN GARCÍA
void cargarProductos(Producto productos[100], int& cantProductos, Categoria categorias[], int cantCategorias)
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

///FUNCION CREADA POR RICARDO GONZALEZ LEAL
int buscarCliente(Cliente clientes[100], int cantClientes, int clienteID)
{
    for (int i = 0; i < cantClientes; i++)
    {
        if (clientes[i].getClienteID() == clienteID)
            return i;
    }
    return -1;
}

///FUNCION CREADA POR CARLO ANGEL LUJAN GARCÍA
void cargarClientes(Cliente clientes[100], int& cantClientes)
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

///FUNCION CREADA POR RICARDO GONZALEZ LEAL Y RETOCADA POR CARLO ANGEL LUJAN GARCIA
void mainCliente(Cliente &cliente, int clienteID, Producto productos[], int cantProductos, int& pedidoId, bool &clienteMode)
{
    char opt;
    int productoID;
    int cant;
    int clientePedidoIndex = 0;
    do
    {
        int productosIDs[10];
        int cantidadesproductos[10];
        int index = 0;
        int precioTotal = 0;
        int cantProduct = 0;

        system("cls");
        cout << "Bienvenido " << cliente.getNombre() << endl << "Selecciona una opcion." << endl;
        cout << "[1]: Ver Productos " << endl;
        cout << "[2]: Mis Pedidos" << endl;
        cout << "[3]: Crear Pedido" << endl;
        cout << "[4]: Ver Saldo" << endl;
        cout << "[5]: Salir" << endl;
        cin >> opt;
        switch (opt)
        {
        case '1':
            system("cls");
            verProductos(productos, cantProductos);
            system("pause");
            break;
        case '2':
            system("cls");
            for (int i = 0; i < 10; i++)
            {
                if (cliente.getPedido(i).getId() != 9999)
                {
                    cout << "---------------------------" << endl;
                    cliente.getPedido(i).imprime();
                    cout << endl;
                    for (int j = 0; j < cliente.getPedido(i).getCantidadProductos(); j++)
                    {
                        cout << "   Articulo: " << productos[cliente.getPedido(i).getIdProducto(j)].getNombre() << endl;
                        cout << "   Cantidad: " << cliente.getPedido(i).getCantProducto(j) << endl;
                        cout << "   Precio c/u: $" << productos[cliente.getPedido(i).getIdProducto(j)].getPrecio() << endl;
                        cout << endl;
                    }
                    cout << "---------------------------" << endl;
                }
            }
            system("pause");
            break;
        case '3':
            do
            {
                system("cls");
                cout << "Escribe el ID del producto" << endl;
                cin >> productoID;
                int indexProducto = buscarProducto(productos, cantProductos, productoID);
                if (indexProducto == -1 || productoID >= cantProductos)
                {
                    cout << "ID invalido" << endl;
                    system("pause");
                    break;
                }
                else
                {
                    cout << "Introduce la cantidad a comprar de " << productos[indexProducto].getNombre()<< endl;
                    cout << "Precio C/u: $" <<productos[indexProducto].getPrecio()<< " , en este pedido aun puedes gastar: $" <<cliente.getDineroElectronico()-precioTotal<< endl;
                    cin >> cant;
                    cantProduct++;
                    precioTotal += productos[indexProducto].getPrecio() * cant;
                    cout << "Deseas mas productos? \n 1: Si\n 2: No" << endl;
                    cin >> opt;
                    productosIDs[index] = indexProducto;
                    cantidadesproductos[index] = cant;
                    index++;
                    if (opt == '2')
                    {
                        if (precioTotal <= cliente.getDineroElectronico())
                        {
                        	time_t t = time(NULL);
							tm* timePtr = localtime(&t);
                            Fecha fecha(timePtr->tm_mday, timePtr->tm_mon+1, 1900+timePtr->tm_year);
                            Pedido pedido(pedidoId, fecha, precioTotal, productosIDs, cantidadesproductos, cantProduct);

                            for (int i = 0; i < 10; i++)
                            {
                                if (cliente.getPedido(i).getId() == 9999)
                                {
                                    cliente.setPedido(i, pedido);
                                    break;
                                }
                            }
                            cliente.setDineroElectronico(cliente.getDineroElectronico() - precioTotal);
                            system("cls");
                            cout << "Pedido creado correctamente!" << endl;
                            system("Pause");
                            //cliente.getPedido(clientePedidoIndex).imprime();
                            pedidoId++;
                            //Añadimos

                        }
                        else
                        {
                            cout << "Fondos insuficientes, te hacen falta: $" << precioTotal - cliente.getDineroElectronico() << endl;
                            system("pause");
                        }
                    }
                }
            } while (opt == '1');
            break;
        case '4':
            cout << "Tu saldo es de: $" << cliente.getDineroElectronico()<< endl;
            system("pause");
            break;
        case '5':
            cout << "Saliendo"<< endl;
            opt = '5';
        break;
        default:
        	cout << "Ingresa una opcion valida"<< endl;
        	system("pause");
        	system("cls");
            break;
        }
    } while (opt != '5');
    system("cls");
}


///FUNCION CREADA POR RICARDO GONZALEZ LEAL Y CARLO ANGEL LUJAN GARCIA
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
    int pedidoId = 0;
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
        {
            mainCliente(clientes[clienteIndex], clienteIndex, productos, cantProductos, pedidoId, clienteMode);
            clienteMode = false;
        }
        else
        {
            cout << "Bienvenido a @Ecomerce, por favor, seleccione una opcion" << endl;
            cout << "[1]: Ver Categorias" << endl;
            cout << "[2]: Ver Clientes" << endl;
            cout << "[3]: Ver Productos" << endl;
            cout << "---------------------" << endl;
            cout << "[4]: Iniciar Sesion" << endl;
            cout << "[5]: Salir" << endl;
            cin >> opt;
            switch (opt)
            {
            case '1':
                system("cls");
                verCategorias(categorias, cantCategorias);
                system("pause");
                system("cls");
                break;

            case '2':
                system("cls");
                verClientes(clientes, cantClientes);
            	system("pause");
                system("cls");
                break;

            case '3':
                system("cls");
                verProductos(productos, cantProductos);
                system("pause");
                system("cls");
                break;

            case '4':
                system("cls");
                cout << "Introduce tu ID de cliente" << endl;
                cin >> clienteID;
                clienteIndex = buscarCliente(clientes, cantClientes, clienteID);
                if (clienteIndex != -1)
                    clienteMode = true;
                else
                {
                    cout << "ID no encontrado" << endl;
                    clienteMode = false;
                    system("pause");
                    system("cls");
                }
                break;
                
			case '5':
	            cout << "Saliendo"<< endl;
	            opt = '5';
	            break;
	            
            default:
                break;
            }
        }
    } while (opt != '5');
}

