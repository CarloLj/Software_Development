// Escribe la clase Fracci�n de acuerdo con los comentarios

// Clase Fraccion
// publico
    // constructor default que inicialice la fracci�n con 1/2
    // constructor con par�metros para numerador y denominador
    // m�todos de acceso para todos los atributos
    // m�todos de modificaci�n para todos los atributos
    // m�todo calcValorReal que regresa el valor en decimal de la fracci�n
    // por ejemplo si la fracci�n es 1/2 regresa 0.5
// privado
    // atributos enteros num y den
  

// implementa los m�todos

class Fraccion{
	public:
		Fraccion();
		Fraccion(int, int);
		int getNumerador();
		int getDenominador();
		void setNumerador(int);
		void setDenominador(int);
		float calcValorReal();
	private:
		int num;
		int den;
};

Fraccion::Fraccion(){
	num = 1;
	den = 2;
}

Fraccion::Fraccion(int _num, int _den){
	num = _num;
	den = _den;
}

int Fraccion::getNumerador(){
	return num;
}

int Fraccion::getDenominador(){
	return den;
}

void Fraccion::setNumerador(int _num){
	num = _num;
}

void Fraccion::setDenominador(int _den){
	den= _den;
}

float Fraccion::calcValorReal(){
	float res = (float)num/den;
	return res;
}
