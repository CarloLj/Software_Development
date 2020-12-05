#include "Libro.h"
using namespace std;
//COMPLETA este programa principal, escribe las funciones que hagan falta...

// 1. ESCRIBE la funci�n que carga informaci�n de una determinada cantidad de libros al arreglo con datos que proporciona el usuario.
//    Se pide al usuario t�tulo y numero de p�ginas por cada libro del arreglo (pidelos en ese orden).
//    El t�tulo del libro man�jalo por simplicidad de una sola palabra por ejemplo: Dracula
//    No pongas ning�n mensaje al usuario para recibir los datos
void cargaLibros(Libro libritos[], int cant){
	for (int i = 0; i < cant;i++){
		string tempTitulo;
		int numeroPag;
		cin>>tempTitulo;
		cin>>numeroPag;
		libritos[i].setTitulo(tempTitulo);
		libritos[i].setPaginas(numeroPag);
	}
}



// 2. ESCRIBE la funci�n que recorre el arreglo, busca un determinado titulo y si lo encuentra, 
//    actualiza las paginas leidas de ese libro
bool buscaTitulo(Libro libritos[], int cant, string tituloBuscar, int paginas){
	for(int i = 0; i<cant; i++){
		string titulin = libritos[i].getTitulo();	
		if(titulin == tituloBuscar){
			libritos[i].registraAvance(paginas);
		}
	}
	return false;
}

// 3. COMPLETA la funci�n que muestra los libros de la biblioteca que han sigo cargados.
void muestraBiblioteca(Libro lista[], int cant){
    cout << "------------------------------"<<endl; //No la quites
    for(int i = 0; i<cant; i++){
    	lista[i].imprime();
       //Escribe la instrucci�n para imprimir la informaci�n del libro, usando el m�todo correspondiente de Libro.
        cout << "------------------------------"<<endl; //No la quites
    }
}

int main(){
    // 4. CREA un arreglo de objetos tipo Libro, llamado biblioteca con 10 localidades
    Libro biblioteca[10];
    //Variables que te van a servir para tus opciones del programa principal
    int cantLibros, paginas;
    char opcion;
    string titulo;
    //cout << "�Cu�ntos libros vas a ingresar? "; d�ja esta instrucci�n como comentario
    // 5. ESCRIBE la instrucci�n para recibir la cantidad de libros
   	cin>>cantLibros;
    // 6. LLAMA/INVOCA a la funci�n para cargar los libros
    cargaLibros(biblioteca, cantLibros);
    do {
        //cout << "a) Incrementar paginas leidas b) Mostrar biblioteca c) Terminar" << endl; ***D�ja esta linea como comentario
        cin >> opcion;
        switch (opcion) {
            case 'a':
                //En esta opci�n se registran las p�ginas leidas de un libro en particular
                //cout << "Titulo del libro a actualizar: ";***D�ja esta linea como comentario
                // 7. ESCRIBE la instrucci�n para recibir el titulo del libro
                cin >>titulo;
               //cout << "Paginas leidas: "; ***Deja esta linea como comentario
                // 8. ESCRIBE la instrucci�n para recibir la cantidad de p�ginas leidas
                cin >>paginas;
                // 9. LLAMA/INVOCA a la funci�n correspondiente que creaste en este archivo
                buscaTitulo(biblioteca, cantLibros, titulo, paginas);
                break;
            case 'b':
                // En esta opci�n se deben mostrar los libros de la biblioteca que han sido cargados.
                muestraBiblioteca(biblioteca, cantLibros);
                // 10. ESCRIBE lo necesario para realizar la acci�n mencionada en el rengl�n anterior
                break;
            case 'c':
                cout << "Escogiste salir del menu." << endl; //No modifiques esto
                break;
            default:
                cout << "Error, opcion incorrecta" << endl;// No modifiques esto
        }
    } while (opcion != 'c');
    
    return 0;

}
