/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [id_Tipo_transaccion]
      ,[Tipo]
  FROM [BancoMamalon].[dbo].[Tipo_Transaccion]

  INSERT INTO dbo.Tipo_Transaccion(id_Tipo_transaccion,Tipo) VALUES (1,'Consulta');
  INSERT INTO dbo.Tipo_Transaccion(id_Tipo_transaccion,Tipo) VALUES (2,'Retiro');
  INSERT INTO dbo.Tipo_Transaccion(id_Tipo_transaccion,Tipo) VALUES (3,'Deposito');