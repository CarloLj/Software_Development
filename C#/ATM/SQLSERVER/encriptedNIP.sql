/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [N_Cuenta]
      ,[NIP]
      ,[P_Nombre]
      ,[S_Nombre]
      ,[P_Apellido]
      ,[S_Apellido]
      ,[NIP_ENCRYPTED]
  FROM [BancoMamalon].[dbo].[Usuario]

  UPDATE dbo.Usuario
  SET NIP_ENCRYPTED = HASHBYTES('MD5','11111')
  WHERE NIP = 11111;

  UPDATE dbo.Usuario
  SET NIP_ENCRYPTED = HASHBYTES('MD5','22222')
  WHERE NIP = 22222;

   UPDATE dbo.Usuario
  SET NIP_ENCRYPTED = HASHBYTES('MD5','12345')
  WHERE NIP = 12345;

   UPDATE dbo.Usuario
  SET NIP_ENCRYPTED = HASHBYTES('MD5','31113')
  WHERE NIP = 31113;

   UPDATE dbo.Usuario
  SET NIP_ENCRYPTED = HASHBYTES('MD5','45672')
  WHERE NIP = 45672;

  UPDATE dbo.Usuario
  SET NIP_ENCRYPTED = HASHBYTES('MD5','13675')
  WHERE NIP = 13675;