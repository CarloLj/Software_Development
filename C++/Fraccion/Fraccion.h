// Escribe la clase Fracción de acuerdo con los comentarios

// Clase Fraccion
// publico
    // constructor default que inicialice la fracción con 1/2
    // constructor con parámetros para numerador y denominador
    // métodos de acceso para todos los atributos
    // métodos de modificación para todos los atributos
    // método calcValorReal que regresa el valor en decimal de la fracción
    // por ejemplo si la fracción es 1/2 regresa 0.5
// privado
    // atributos enteros num y den
  

// implementa los métodos

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
