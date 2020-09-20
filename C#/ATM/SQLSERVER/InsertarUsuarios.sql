INSERT INTO dbo.Usuario(N_Cuenta,NIP,P_Nombre,P_Apellido,S_Apellido) VALUES(11111,11111,'Angel','Padilla','Esqueda');
INSERT INTO dbo.Usuario(N_Cuenta,NIP,P_Nombre,P_Apellido,S_Apellido) VALUES(11112,22222,'Martha','Lopez','Lopez');
INSERT INTO dbo.Usuario(N_Cuenta,NIP,P_Nombre,P_Apellido,S_Apellido) VALUES(12121,12345,'Juan','Perez','Stark');
INSERT INTO dbo.Usuario(N_Cuenta,NIP,P_Nombre,P_Apellido,S_Apellido) VALUES(34534,31113,'Tony','Stark','Stark');
INSERT INTO dbo.Usuario(N_Cuenta,NIP,P_Nombre,P_Apellido,S_Apellido) VALUES(75332,45672,'Jesica','Hide','Jhonson');
INSERT INTO dbo.Usuario(N_Cuenta,NIP,P_Nombre,P_Apellido,S_Apellido) VALUES(86654,13675,'Valeria','Brown','Lannister');

INSERT INTO dbo.Cliente(id_Cliente,Saldo,N_Cuenta) VALUES(11112,5000,11112);
INSERT INTO dbo.Cliente(id_Cliente,Saldo,N_Cuenta) VALUES(12121,2500,12121);
INSERT INTO dbo.Cliente(id_Cliente,Saldo,N_Cuenta) VALUES(34534,700000,34534);
INSERT INTO dbo.Cliente(id_Cliente,Saldo,N_Cuenta) VALUES(75332,200,75332);
INSERT INTO dbo.Cliente(id_Cliente,Saldo,N_Cuenta) VALUES(86654,1350,86654);

INSERT INTO dbo.Gerente(N_Empleado,N_Cuenta) VALUES(11111,11111);

delete from dbo.Cliente;
delete from dbo.Gerente;
delete from dbo.Usuario;