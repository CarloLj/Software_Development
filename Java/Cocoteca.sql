USE [master]
GO
/****** Object:  Database [Cocoteca]    Script Date: 30/06/2020 09:33:26 p. m. ******/
CREATE DATABASE [Cocoteca]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Cocoteca', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Cocoteca.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Cocoteca_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Cocoteca_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Cocoteca] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Cocoteca].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Cocoteca] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Cocoteca] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Cocoteca] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Cocoteca] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Cocoteca] SET ARITHABORT OFF 
GO
ALTER DATABASE [Cocoteca] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Cocoteca] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Cocoteca] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Cocoteca] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Cocoteca] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Cocoteca] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Cocoteca] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Cocoteca] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Cocoteca] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Cocoteca] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Cocoteca] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Cocoteca] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Cocoteca] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Cocoteca] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Cocoteca] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Cocoteca] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Cocoteca] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Cocoteca] SET RECOVERY FULL 
GO
ALTER DATABASE [Cocoteca] SET  MULTI_USER 
GO
ALTER DATABASE [Cocoteca] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Cocoteca] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Cocoteca] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Cocoteca] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Cocoteca] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Cocoteca', N'ON'
GO
ALTER DATABASE [Cocoteca] SET QUERY_STORE = OFF
GO
USE [Cocoteca]
GO
/****** Object:  Table [dbo].[Cat_Categorias]    Script Date: 30/06/2020 09:33:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cat_Categorias](
	[IDCategoria] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
 CONSTRAINT [PK_Cat_Categorias] PRIMARY KEY CLUSTERED 
(
	[IDCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cat_Direcciones]    Script Date: 30/06/2020 09:33:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cat_Direcciones](
	[IDDireccion] [int] IDENTITY(1,1) NOT NULL,
	[IDUsuario] [int] NOT NULL,
	[IDMunicipio] [int] NOT NULL,
	[NoInterior] [varchar](30) NULL,
	[NoExterior] [int] NOT NULL,
	[CodigoPostal] [int] NOT NULL,
	[Calle] [varchar](128) NOT NULL,
 CONSTRAINT [PK_Cat_Direcciones] PRIMARY KEY CLUSTERED 
(
	[IDDireccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cat_Editorial]    Script Date: 30/06/2020 09:33:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cat_Editorial](
	[IDEditorial] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
 CONSTRAINT [PK_Cat_Editorial] PRIMARY KEY CLUSTERED 
(
	[IDEditorial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cat_Estados]    Script Date: 30/06/2020 09:33:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cat_Estados](
	[IDEstado] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](128) NOT NULL,
 CONSTRAINT [PK_Cat_Estados] PRIMARY KEY CLUSTERED 
(
	[IDEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cat_EstadosMunicipios]    Script Date: 30/06/2020 09:33:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cat_EstadosMunicipios](
	[IDEstadoMunicipio] [int] IDENTITY(1,1) NOT NULL,
	[IDEstado] [int] NOT NULL,
	[IDMunicipio] [int] NOT NULL,
 CONSTRAINT [PK_Cat_EstadosMunicipios] PRIMARY KEY CLUSTERED 
(
	[IDEstadoMunicipio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cat_Municipios]    Script Date: 30/06/2020 09:33:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cat_Municipios](
	[IDMunicipio] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](128) NOT NULL,
 CONSTRAINT [PK_Cat_Municipios] PRIMARY KEY CLUSTERED 
(
	[IDMunicipio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cat_Paises]    Script Date: 30/06/2020 09:33:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cat_Paises](
	[IDPais] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](128) NULL,
	[ISO3] [char](3) NULL,
 CONSTRAINT [PK_Cat_Paises] PRIMARY KEY CLUSTERED 
(
	[IDPais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MtoCat_Libros]    Script Date: 30/06/2020 09:33:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MtoCat_Libros](
	[IDLibro] [int] IDENTITY(1,1) NOT NULL,
	[ISBN] [varchar](15) NOT NULL,
	[Titulo] [varchar](200) NOT NULL,
	[Autor] [varchar](200) NOT NULL,
	[Sinopsis] [varchar](200) NOT NULL,
	[Descontinuado] [bit] NOT NULL,
	[Paginas] [int] NOT NULL,
	[Revision] [int] NOT NULL,
	[Ano] [int] NOT NULL,
	[Precio] [money] NOT NULL,
	[Stock] [int] NOT NULL,
	[IDEditorial] [int] NOT NULL,
	[IDPais] [int] NOT NULL,
	[IDCategoria] [int] NOT NULL,
	[Imagen] [varchar](max) NULL,
 CONSTRAINT [PK_Table_MtoCat_Libros] PRIMARY KEY CLUSTERED 
(
	[IDLibro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UK_Table_MtoCat_Libros] UNIQUE NONCLUSTERED 
(
	[ISBN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MtoCat_Usuarios]    Script Date: 30/06/2020 09:33:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MtoCat_Usuarios](
	[IDUsuario] [int] IDENTITY(1,1) NOT NULL,
	[IDIdentity] [nvarchar](450) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
 CONSTRAINT [PK_MtoCat_Usuario] PRIMARY KEY CLUSTERED 
(
	[IDUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UK_Table_MtoCat_Usuarios] UNIQUE NONCLUSTERED 
(
	[IDIdentity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tra_Compras]    Script Date: 30/06/2020 09:33:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tra_Compras](
	[IDCompra] [int] IDENTITY(1,1) NOT NULL,
	[PrecioTotal] [money] NULL,
	[FechaCompra] [datetime] NULL,
	[Pagado] [bit] NOT NULL,
	[IDUsuario] [int] NOT NULL,
 CONSTRAINT [PK_Tra_Compras] PRIMARY KEY CLUSTERED 
(
	[IDCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tra_ConceptoCompra]    Script Date: 30/06/2020 09:33:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tra_ConceptoCompra](
	[Tra_Compras] [int] IDENTITY(1,1) NOT NULL,
	[IDCompra] [int] NOT NULL,
	[IDLibro] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
 CONSTRAINT [PK_Tra_ConceptoCompra] PRIMARY KEY CLUSTERED 
(
	[Tra_Compras] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cat_Direcciones]  WITH CHECK ADD  CONSTRAINT [FK_Cat_Direcciones_Cat_Municipios] FOREIGN KEY([IDMunicipio])
REFERENCES [dbo].[Cat_Municipios] ([IDMunicipio])
GO
ALTER TABLE [dbo].[Cat_Direcciones] CHECK CONSTRAINT [FK_Cat_Direcciones_Cat_Municipios]
GO
ALTER TABLE [dbo].[Cat_Direcciones]  WITH CHECK ADD  CONSTRAINT [FK_Cat_Direcciones_MtoCat_Usuarios] FOREIGN KEY([IDUsuario])
REFERENCES [dbo].[MtoCat_Usuarios] ([IDUsuario])
GO
ALTER TABLE [dbo].[Cat_Direcciones] CHECK CONSTRAINT [FK_Cat_Direcciones_MtoCat_Usuarios]
GO
ALTER TABLE [dbo].[Cat_EstadosMunicipios]  WITH CHECK ADD  CONSTRAINT [FK_Cat_EstadosMunicipios_Cat_Estados] FOREIGN KEY([IDEstado])
REFERENCES [dbo].[Cat_Estados] ([IDEstado])
GO
ALTER TABLE [dbo].[Cat_EstadosMunicipios] CHECK CONSTRAINT [FK_Cat_EstadosMunicipios_Cat_Estados]
GO
ALTER TABLE [dbo].[Cat_EstadosMunicipios]  WITH CHECK ADD  CONSTRAINT [FK_Cat_EstadosMunicipios_Cat_Municipios] FOREIGN KEY([IDMunicipio])
REFERENCES [dbo].[Cat_Municipios] ([IDMunicipio])
GO
ALTER TABLE [dbo].[Cat_EstadosMunicipios] CHECK CONSTRAINT [FK_Cat_EstadosMunicipios_Cat_Municipios]
GO
ALTER TABLE [dbo].[MtoCat_Libros]  WITH CHECK ADD  CONSTRAINT [FK_MtoCat_Libros_Cat_Categorias] FOREIGN KEY([IDCategoria])
REFERENCES [dbo].[Cat_Categorias] ([IDCategoria])
GO
ALTER TABLE [dbo].[MtoCat_Libros] CHECK CONSTRAINT [FK_MtoCat_Libros_Cat_Categorias]
GO
ALTER TABLE [dbo].[MtoCat_Libros]  WITH CHECK ADD  CONSTRAINT [FK_MtoCat_Libros_Cat_Editorial] FOREIGN KEY([IDEditorial])
REFERENCES [dbo].[Cat_Editorial] ([IDEditorial])
GO
ALTER TABLE [dbo].[MtoCat_Libros] CHECK CONSTRAINT [FK_MtoCat_Libros_Cat_Editorial]
GO
ALTER TABLE [dbo].[MtoCat_Libros]  WITH CHECK ADD  CONSTRAINT [FK_MtoCat_Libros_Cat_Paises] FOREIGN KEY([IDPais])
REFERENCES [dbo].[Cat_Paises] ([IDPais])
GO
ALTER TABLE [dbo].[MtoCat_Libros] CHECK CONSTRAINT [FK_MtoCat_Libros_Cat_Paises]
GO
ALTER TABLE [dbo].[Tra_Compras]  WITH CHECK ADD  CONSTRAINT [FK_Tra_Compras_MtoCat_Usuario] FOREIGN KEY([IDUsuario])
REFERENCES [dbo].[MtoCat_Usuarios] ([IDUsuario])
GO
ALTER TABLE [dbo].[Tra_Compras] CHECK CONSTRAINT [FK_Tra_Compras_MtoCat_Usuario]
GO
ALTER TABLE [dbo].[Tra_ConceptoCompra]  WITH CHECK ADD  CONSTRAINT [FK_Tra_ConceptoCompra_MtoCat_Libros] FOREIGN KEY([IDLibro])
REFERENCES [dbo].[MtoCat_Libros] ([IDLibro])
GO
ALTER TABLE [dbo].[Tra_ConceptoCompra] CHECK CONSTRAINT [FK_Tra_ConceptoCompra_MtoCat_Libros]
GO
ALTER TABLE [dbo].[Tra_ConceptoCompra]  WITH CHECK ADD  CONSTRAINT [FK_Tra_ConceptoCompra_Tra_Compras] FOREIGN KEY([IDCompra])
REFERENCES [dbo].[Tra_Compras] ([IDCompra])
GO
ALTER TABLE [dbo].[Tra_ConceptoCompra] CHECK CONSTRAINT [FK_Tra_ConceptoCompra_Tra_Compras]
GO
USE [master]
GO
ALTER DATABASE [Cocoteca] SET  READ_WRITE 
GO
