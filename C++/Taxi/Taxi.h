#ifndef PERSONA_H
#define PERSONA_H
#include <string>
#include "Persona.h"

class Taxi{
	public:
		Taxi();
		Taxi(Persona, int);
		Persona getResponsable() const;
		void setResponsable(Persona);
		int getIden() const;
		void setIden(int);
	private:
		Persona responsable;
		int iden;
};

Taxi::Taxi(){
	Persona responsable();
	responsable.Persona("Holi", "3332223123")
	iden = 0; 
}

Taxi::Taxi(Persona resp, int id){
	responsable = resp;
	iden = id;	
}

#endif
