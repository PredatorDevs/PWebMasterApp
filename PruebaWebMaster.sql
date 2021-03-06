USE [master]
GO
/****** Object:  Database [pruebawebmaster]    Script Date: 5/5/2020 10:53:02 ******/
CREATE DATABASE [pruebawebmaster]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'pruebawebmaster', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\pruebawebmaster.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'pruebawebmaster_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\pruebawebmaster_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [pruebawebmaster] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [pruebawebmaster].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [pruebawebmaster] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [pruebawebmaster] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [pruebawebmaster] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [pruebawebmaster] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [pruebawebmaster] SET ARITHABORT OFF 
GO
ALTER DATABASE [pruebawebmaster] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [pruebawebmaster] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [pruebawebmaster] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [pruebawebmaster] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [pruebawebmaster] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [pruebawebmaster] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [pruebawebmaster] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [pruebawebmaster] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [pruebawebmaster] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [pruebawebmaster] SET  ENABLE_BROKER 
GO
ALTER DATABASE [pruebawebmaster] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [pruebawebmaster] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [pruebawebmaster] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [pruebawebmaster] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [pruebawebmaster] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [pruebawebmaster] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [pruebawebmaster] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [pruebawebmaster] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [pruebawebmaster] SET  MULTI_USER 
GO
ALTER DATABASE [pruebawebmaster] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [pruebawebmaster] SET DB_CHAINING OFF 
GO
ALTER DATABASE [pruebawebmaster] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [pruebawebmaster] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [pruebawebmaster] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [pruebawebmaster] SET QUERY_STORE = OFF
GO
USE [pruebawebmaster]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 5/5/2020 10:53:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](150) NOT NULL,
	[FechaCreacion] [datetime2](7) NOT NULL,
	[UltimaActualizacion] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 5/5/2020 10:53:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [varchar](255) NOT NULL,
	[Apellidos] [varchar](255) NOT NULL,
	[Email] [varchar](150) NOT NULL,
	[Direccion] [varchar](255) NOT NULL,
	[Dui] [varchar](15) NULL,
	[Nit] [varchar](20) NULL,
	[Telefono] [varchar](30) NULL,
	[FechaCreacion] [datetime2](7) NOT NULL,
	[UltimaActualizacion] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetVentas]    Script Date: 5/5/2020 10:53:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetVentas](
	[Fecha] [datetime2](7) NOT NULL,
	[Venta] [int] NOT NULL,
	[Producto] [int] NOT NULL,
	[PrecioVenta] [decimal](10, 4) NOT NULL,
	[Cantidad] [decimal](10, 2) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 5/5/2020 10:53:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Categoria] [int] NOT NULL,
	[Nombre] [varchar](150) NOT NULL,
	[Descripcion] [varchar](255) NOT NULL,
	[Costo] [decimal](10, 4) NOT NULL,
	[Precio] [decimal](10, 4) NOT NULL,
	[Descuento] [decimal](10, 4) NOT NULL,
	[DescuentoActivo] [bit] NOT NULL,
	[Existencias] [decimal](10, 2) NOT NULL,
	[FechaCreacion] [datetime2](7) NOT NULL,
	[UltimaActualizacion] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 5/5/2020 10:53:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](150) NOT NULL,
	[NivelAcceso] [int] NOT NULL,
	[FechaCreacion] [datetime2](7) NOT NULL,
	[UltimaActualizacion] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tiendas]    Script Date: 5/5/2020 10:53:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tiendas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](255) NOT NULL,
	[Direccion] [varchar](255) NOT NULL,
	[Telefono] [varchar](30) NULL,
	[FechaCreacion] [datetime2](7) NOT NULL,
	[UltimaActualizacion] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoVentas]    Script Date: 5/5/2020 10:53:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoVentas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](150) NOT NULL,
	[FechaCreacion] [datetime2](7) NOT NULL,
	[UltimaActualizacion] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 5/5/2020 10:53:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Rol] [int] NOT NULL,
	[NombreUsuario] [varchar](255) NOT NULL,
	[Contrasenha] [varchar](2048) NOT NULL,
	[Bloqueado] [bit] NOT NULL,
	[FechaCreacion] [datetime2](7) NOT NULL,
	[UltimaActualizacion] [datetime2](7) NOT NULL,
	[Token] [varchar](2048) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[NombreUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ventas]    Script Date: 5/5/2020 10:53:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ventas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Cliente] [int] NOT NULL,
	[TipoVenta] [int] NOT NULL,
	[Fecha] [datetime2](7) NOT NULL,
	[Total] [decimal](10, 4) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Productos] ADD  DEFAULT ((0)) FOR [DescuentoActivo]
GO
ALTER TABLE [dbo].[Usuarios] ADD  DEFAULT ((0)) FOR [Bloqueado]
GO
ALTER TABLE [dbo].[DetVentas]  WITH CHECK ADD FOREIGN KEY([Producto])
REFERENCES [dbo].[Productos] ([Id])
GO
ALTER TABLE [dbo].[DetVentas]  WITH CHECK ADD FOREIGN KEY([Venta])
REFERENCES [dbo].[Ventas] ([Id])
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD FOREIGN KEY([Categoria])
REFERENCES [dbo].[Categorias] ([Id])
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD FOREIGN KEY([Cliente])
REFERENCES [dbo].[Clientes] ([Id])
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD FOREIGN KEY([TipoVenta])
REFERENCES [dbo].[TipoVentas] ([Id])
GO
USE [master]
GO
ALTER DATABASE [pruebawebmaster] SET  READ_WRITE 
GO
