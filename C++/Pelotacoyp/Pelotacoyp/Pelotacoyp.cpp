// Pelota_16300206.cpp: define el punto de entrada de la aplicación de consola.
//

#include "stdafx.h"
#include "iostream"
#include <windows.h>
#include <thread>         // std::this_thread::sleep_for
#include <chrono>         // std::chrono::seconds


using namespace std; 

void gotoxy(int x, int y)
{
    COORD coord;
    coord.X = x;
    coord.Y = y;
    SetConsoleCursorPosition(GetStdHandle(STD_OUTPUT_HANDLE), coord);
}

class PELOTALOCA{
	public:
		char valorpelota(char);
		char valorpelota1;
		void esperar();
		PELOTALOCA(){};
		~PELOTALOCA(){};
};

class MARCOLOCO{
	public:
		int x1,y1,x2,y2;
		char dibujo(char);
		char dibujo1;
		void dibujarmarco();
		MARCOLOCO(){};
		~MARCOLOCO(){};
};

void PELOTALOCA::esperar(){
	std::this_thread::sleep_for (std::chrono::milliseconds(50));
}

char PELOTALOCA::valorpelota(char _valorpelota=220)
{
	valorpelota1=_valorpelota;
 return valorpelota1;
}

char MARCOLOCO::dibujo(char _valormarco=219)
{
	dibujo1=_valormarco;
 return dibujo1;
}

void MARCOLOCO::dibujarmarco()
{
	MARCOLOCO o;

	for (int i=2;i<=82;i++)
	{
		gotoxy(i,2);
		cout<< o.dibujo();
		gotoxy(i,28);
		cout<< o.dibujo();
	}
	for (int j=2;j<=28;j++)
	{
		gotoxy(2,j);
		cout<< o.dibujo();
		gotoxy(82,j);
		cout<< o.dibujo();
	}

}

int main()
{

	bool parar = 0;
	PELOTALOCA p;
	MARCOLOCO m;

	m.dibujarmarco();
	
	int dx=1;
	int dy=1;
	int _x=3;
	int _y=3;

	int contador = 0 ;
	do{
		contador++;
		gotoxy(_x,_y); cout << p.valorpelota() << endl;
		p.esperar();
		gotoxy(_x,_y); cout<< ' ';
		_x+=dx; _y+=dy;
	
		if(_y == 27 || _y == 3 ) {dy = -dy;}
		if(_x == 80 || _x == 3 ) {dx = -dx;}
		
		/*
		if(_y=3){
			for(_y=3;_y<=27;_y++,_x++){
				gotoxy(_x,_y);
				cout << p.valorpelota() << endl;
				p.esperaryborrar();
				gotoxy(_x,_y);
				cout <<" ";	
			}

			if(_y=26){
				_x--;
				for(_y=27;_y!=3;_y--,_x++){
				gotoxy(_x,_y);
				cout << p.valorpelota() << endl;
				p.esperaryborrar();
				gotoxy(_x,_y);
				cout << " ";
				}
			}

				if(_x=81){
					for(_y=3;_y<=27;_y++,_x++){
					gotoxy(_x,_y);
					cout << p.valorpelota() << endl;
					p.esperaryborrar();
					gotoxy(_x,_y);
					cout <<" ";	
				}

		if(_y=1){
			for(_y=1;_y<=25;_y++,_x++){
			gotoxy(_x,_y);
			cout << p.valorpelota() << endl;
			p.esperaryborrar();
			cout << _x <<endl;
			cout << _y <<endl;
		if(_x=80){
				for(_x=80;((_y!=1));_y--,_x--){
				gotoxy(_x,_y);
				cout << p.valorpelota() << endl;
				p.esperaryborrar();
				system("cls");
				cout << _x <<endl;
				}
			}

			}
			}
			
		if((_y=25)){
			_x--;
			for(_y=25;_y!=1;_y--,_x++){
			gotoxy(_x,_y);
			cout << p.valorpelota() << endl;
			p.esperar();
			system("cls");
			cout << _x <<endl;
			cout << _y <<endl;
			}
		}

	

		if(_x<=80){
			_y--;
			for(_x=80;_x!=1;_y--,_x--){
			gotoxy(_x,_y);
			cout << p.valorpelota() << endl;
			std::this_thread::sleep_for (std::chrono::milliseconds(100));
			system("cls");
			cout << _x <<endl;
			}
				if(_y=1){
				for(_y=1;_y<=25;_y++,_x--){
				gotoxy(_x,_y);
				cout << p.valorpelota() << endl;
				std::this_thread::sleep_for (std::chrono::milliseconds(100));
				system("cls");
				cout << _x <<endl;
				}
			}
				if(_y=25){
				_x--;
				for(_y=25;_y!=1;_y--,_x--){
				gotoxy(_x,_y);
				cout << p.valorpelota() << endl;
				std::this_thread::sleep_for (std::chrono::milliseconds(100));
				system("cls");
				cout << _x <<endl;
				}
			}
		}
		*/
	}while ((parar=1));
	return 0;
}