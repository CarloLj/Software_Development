CREATE TABLE Usuario(
	N_Cuenta INT PRIMARY KEY,
	NIP VARCHAR(10),
	P_Nombre VARCHAR(30),
	S_Nombre VARCHAR(30),
	P_Apellido VARCHAR(30),
	S_Apellido VARCHAR(30)
);

CREATE TABLE Cliente(
	id_Cliente INT PRIMARY KEY,
	Saldo MONEY,
	N_Cuenta INT FOREIGN KEY REFERENCES Usuario(N_Cuenta)
);

CREATE TABLE Gerente(
	N_Empleado INT PRIMARY KEY,
	N_Cuenta INT FOREIGN KEY REFERENCES Usuario(N_Cuenta)
);

CREATE TABLE Tipo_Transaccion(
	id_Tipo_transaccion INT PRIMARY KEY,
	Tipo VARCHAR(15)
);

CREATE TABLE Transaccion(
	N_Folio INT PRIMARY KEY,
	Fecha DATE,
	Hora TIME,
	Tipo INT FOREIGN KEY REFERENCES Tipo_Transaccion(id_Tipo_transaccion),
	N_Cuenta INT FOREIGN KEY REFERENCES Usuario(N_Cuenta)
);

CREATE TABLE Retiro(
	id_Retiro INT PRIMARY KEY,
	monto MONEY,
	N_Folio INT FOREIGN KEY REFERENCES Transaccion(N_Folio)
);

CREATE TABLE Deposito(
	id_Deposito INT PRIMARY KEY,
	monto MONEY,
	N_Folio INT FOREIGN KEY REFERENCES Transaccion(N_Folio),
	N_Cuenta INT FOREIGN KEY REFERENCES Usuario(N_Cuenta)
);

CREATE TABLE Consulta(
	id_Consulta INT PRIMARY KEY,
	N_Folio INT FOREIGN KEY REFERENCES Transaccion(N_Folio)
);

