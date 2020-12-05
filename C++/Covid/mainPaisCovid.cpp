#include "PaisCovid.h"

void llenaArreglo(PaisCovid arr[], int cuantos){
	string nombre;
	int enfermos;
	for (int i = 0; i< cuantos; i++){
		cout << "Ingresa el nombre del pais: ";
		cin >> nombre;
		cout << "Ingresa la cantidad de enfermos: ";
		cin >> enfermos;
		arr[i].setNombre(nombre);
		arr[i].registraEnfermos(enfermos);		
	}
}

void imprimePaises(PaisCovid arr[], int cuantos){
	for (int i = 0; i< cuantos; i++){
		arr[i].imprime();	
		cout<<"---------------------------------"<<endl;	
	}
}

void registraMuertes(PaisCovid arr[], int cuantos){
	int muertes;
	for (int i = 0; i<cuantos; i++){
		cout << "Registra muertes en " << arr[i].getNombre() << ":";
		cin >> muertes;
		arr[i].registraMuertes(muertes);
	}
}

double promedioTasaMortalidad(PaisCovid arr[], int cuantos){
	double suma = 0, promedio;
	for(int i = 0; i<cuantos ; i++){
		suma+=arr[i].tasaMortalidad();
	}
	promedio = suma/cuantos;
	return promedio;
}

void registraMuertes(PaisCovid arr[],string nombre, int n){
	int muertes;
	for(int i = 0; i<n ; i++){
		if(arr[i].getNombre().compare(nombre) == 0){
			cout << "Registra muertes en" << arr[i].getNombre() << ":";
			cin>>muertes;
			arr[i].registraMuertes(muertes);
			break;
		}
	}
}

int main()
{
	cout << "Ingresa cuantos paises vas a ingresar" << endl;
	int num;
	cin>>num;
    PaisCovid paisesCovid[num];
    llenaArreglo(paisesCovid, num);
    imprimePaises(paisesCovid, num);
    registraMuertes(paisesCovid, "Italia", 400);
    imprimePaises(paisesCovid, num);
    cout << promedioTasaMortalidad(paisesCovid,num) <<endl;
    return 0;
}

