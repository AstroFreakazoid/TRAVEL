USE [master]
GO
/****** Object:  Database [TRV_DB]    Script Date: 20/09/2016 13:35:55 ******/
CREATE DATABASE [TRV_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TRV_DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSFREAKAZOID\MSSQL\DATA\TRV_DB.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TRV_DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSFREAKAZOID\MSSQL\DATA\TRV_DB_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TRV_DB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TRV_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TRV_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TRV_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TRV_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TRV_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TRV_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [TRV_DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TRV_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TRV_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TRV_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TRV_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TRV_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TRV_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TRV_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TRV_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TRV_DB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TRV_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TRV_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TRV_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TRV_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TRV_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TRV_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TRV_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TRV_DB] SET RECOVERY FULL 
GO
ALTER DATABASE [TRV_DB] SET  MULTI_USER 
GO
ALTER DATABASE [TRV_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TRV_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TRV_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TRV_DB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [TRV_DB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [TRV_DB]
GO
/****** Object:  User [IIS APPPOOL\DefaultAppPool]    Script Date: 20/09/2016 13:35:56 ******/
CREATE USER [IIS APPPOOL\DefaultAppPool] FOR LOGIN [IIS APPPOOL\DefaultAppPool] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [##MS_PolicyEventProcessingLogin##]    Script Date: 20/09/2016 13:35:56 ******/
CREATE USER [##MS_PolicyEventProcessingLogin##] FOR LOGIN [##MS_PolicyEventProcessingLogin##] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [IIS APPPOOL\DefaultAppPool]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [IIS APPPOOL\DefaultAppPool]
GO
/****** Object:  Table [dbo].[Canton]    Script Date: 20/09/2016 13:35:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Canton](
	[numeroCanton] [int] NOT NULL,
	[numeroProvincia] [int] NOT NULL,
	[nombre] [varchar](30) NOT NULL,
 CONSTRAINT [PKCanton] PRIMARY KEY CLUSTERED 
(
	[numeroProvincia] ASC,
	[numeroCanton] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Distrito]    Script Date: 20/09/2016 13:35:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Distrito](
	[numeroDistrito] [int] NOT NULL,
	[numeroCanton] [int] NOT NULL,
	[numeroProvincia] [int] NOT NULL,
	[nombre] [varchar](30) NOT NULL,
 CONSTRAINT [PKDistrito] PRIMARY KEY CLUSTERED 
(
	[numeroDistrito] ASC,
	[numeroCanton] ASC,
	[numeroProvincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Provincia]    Script Date: 20/09/2016 13:35:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Provincia](
	[numeroProvincia] [int] NOT NULL,
	[nombre] [varchar](30) NOT NULL,
 CONSTRAINT [PKProvincia] PRIMARY KEY CLUSTERED 
(
	[numeroProvincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBL_ACCION]    Script Date: 20/09/2016 13:35:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBL_ACCION](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_USUARIO] [varchar](50) NULL,
	[TIPO_ACCION] [varchar](50) NULL,
	[FECHA] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBL_ASIENTO]    Script Date: 20/09/2016 13:35:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_ASIENTO](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_VAGON] [int] NOT NULL,
	[TIPO] [nvarchar](50) NULL,
	[ESTADO] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBL_CLIENTE]    Script Date: 20/09/2016 13:35:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_CLIENTE](
	[CEDULA] [nvarchar](50) NOT NULL,
	[NOMBRE] [nvarchar](50) NOT NULL,
	[APELLIDO] [nvarchar](50) NOT NULL,
	[TELEFONO] [nvarchar](50) NOT NULL,
	[RESIDENCIA] [nvarchar](100) NOT NULL,
	[CORREO] [nvarchar](50) NOT NULL,
	[CONTRASENA] [nvarchar](max) NOT NULL,
	[EDAD] [int] NULL,
 CONSTRAINT [PK__TBL_CLIE__06BB8449675D9E2D] PRIMARY KEY CLUSTERED 
(
	[CEDULA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBL_CLIENTES_NO_FRECUENTES]    Script Date: 20/09/2016 13:35:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_CLIENTES_NO_FRECUENTES](
	[CEDULA] [nvarchar](50) NOT NULL,
	[NOMBRE] [nvarchar](50) NOT NULL,
	[CORREO] [nvarchar](50) NOT NULL,
	[TELEFONO] [nvarchar](50) NOT NULL,
	[ESTADO] [nvarchar](50) NULL,
	[APELLIDO] [nvarchar](50) NULL,
	[PROVINCIA] [nvarchar](50) NULL,
	[DISTRITO] [nvarchar](50) NULL,
	[CANTON] [nvarchar](50) NULL,
 CONSTRAINT [PK__TBL_CLIE__06BB844952E3A436] PRIMARY KEY CLUSTERED 
(
	[CEDULA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBL_CONVENIO]    Script Date: 20/09/2016 13:35:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_CONVENIO](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NOMBRE] [nvarchar](50) NOT NULL,
	[DESCUENTO] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBL_EMPRESA]    Script Date: 20/09/2016 13:35:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_EMPRESA](
	[CED_JURIDICA] [nvarchar](50) NOT NULL,
	[NOMBRE] [nvarchar](50) NOT NULL,
	[DIRECCION] [nvarchar](50) NOT NULL,
	[TELEFONO] [nvarchar](50) NOT NULL,
	[CORREO] [nvarchar](50) NOT NULL,
	[IMPUESTO] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CED_JURIDICA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBL_ESTACION]    Script Date: 20/09/2016 13:35:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_ESTACION](
	[COD_ESTACION] [int] IDENTITY(1,1) NOT NULL,
	[NOMBRE] [nvarchar](250) NULL,
	[ESTADO] [nvarchar](50) NULL,
	[LONGITUD] [decimal](10, 4) NULL,
	[LATITUD] [decimal](10, 4) NULL,
	[CENTRAL] [int] NULL,
	[UBICACION] [geography] NULL,
	[KILOMETRO] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[COD_ESTACION] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBL_ESTACIONES_POR_LINEA]    Script Date: 20/09/2016 13:35:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_ESTACIONES_POR_LINEA](
	[ID_LINEA] [int] NOT NULL,
	[ID_ESTACION] [int] NOT NULL,
 CONSTRAINT [TBL_ESTACIONES_POR_LINEA_PK] PRIMARY KEY CLUSTERED 
(
	[ID_LINEA] ASC,
	[ID_ESTACION] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBL_EXCEPCION]    Script Date: 20/09/2016 13:35:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_EXCEPCION](
	[CODIGO] [nvarchar](100) NOT NULL,
	[MENSAJE] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CODIGO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBL_HISTORIAL]    Script Date: 20/09/2016 13:35:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_HISTORIAL](
	[CODIGO] [int] IDENTITY(1,1) NOT NULL,
	[FECHA] [datetime] NOT NULL,
	[CED_CLIENTE] [nvarchar](50) NOT NULL,
	[ID_TIQUETE] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CODIGO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBL_HISTORIALVIAJES]    Script Date: 20/09/2016 13:35:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_HISTORIALVIAJES](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LINEA] [nvarchar](50) NOT NULL,
	[TREN] [nvarchar](50) NOT NULL,
	[ESTACION_ANTERIOR] [nvarchar](50) NULL,
	[ESTACION_SIGUIENTE] [nvarchar](50) NULL,
	[TIEMPO_ESTIMADO] [nvarchar](50) NULL,
	[ACCION] [nvarchar](50) NULL,
	[FECHA] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBL_HORARIOS]    Script Date: 20/09/2016 13:35:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_HORARIOS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HORA_SALIDA] [nvarchar](50) NOT NULL,
	[HORA_ARRIBO] [nvarchar](50) NOT NULL,
	[FECHA_SALIDA] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__tmp_ms_x__C1FF6E912E4D08B9] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBL_INCIDENCIA]    Script Date: 20/09/2016 13:35:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_INCIDENCIA](
	[CODIGO] [nvarchar](50) NOT NULL,
	[DESCRIPCION] [nvarchar](50) NOT NULL,
	[DETALLE] [nvarchar](100) NULL,
	[TIPO] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[CODIGO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBL_LINEA]    Script Date: 20/09/2016 13:35:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_LINEA](
	[COD_LINEA] [int] IDENTITY(1,1) NOT NULL,
	[NOMBRE] [nvarchar](250) NULL,
	[COLOR] [nvarchar](50) NULL,
	[DISTANCIA] [int] NULL,
	[ESTADO] [nvarchar](50) NULL,
	[ESTACION_INICIAL] [int] NULL,
	[ESTACION_FINAL] [int] NULL,
	[HORA_TRABAJO] [int] NULL,
	[HORA_INICIO] [time](0) NULL,
	[CANT_ESTACIONES] [int] NULL,
	[COSTO_CIRCULACION] [decimal](18, 2) NULL,
	[COD_CENTRAL] [int] NULL,
	[DURACION_RECORRIDO] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[COD_LINEA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBL_PERMISO]    Script Date: 20/09/2016 13:35:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_PERMISO](
	[CODIGO] [int] IDENTITY(1,1) NOT NULL,
	[DESCRIPCION] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CODIGO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBL_PERMISO_PUESTO]    Script Date: 20/09/2016 13:35:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_PERMISO_PUESTO](
	[COD_PERMISO] [int] NOT NULL,
	[COD_PUESTO] [int] NOT NULL,
 CONSTRAINT [PK_PERMISO_PUESTO] PRIMARY KEY CLUSTERED 
(
	[COD_PERMISO] ASC,
	[COD_PUESTO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBL_PUESTO]    Script Date: 20/09/2016 13:35:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_PUESTO](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NOMBRE] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBL_RUTA]    Script Date: 20/09/2016 13:35:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_RUTA](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LUGAR_SALIDA] [nvarchar](50) NOT NULL,
	[LUGAR_LLEGADA] [nvarchar](50) NOT NULL,
	[COD_LINEA] [int] NOT NULL,
	[NOMBRE] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBL_TARJETA]    Script Date: 20/09/2016 13:35:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_TARJETA](
	[NUMERO] [nvarchar](50) NOT NULL,
	[TIPO] [nvarchar](50) NOT NULL,
	[FECHA_EXP] [date] NOT NULL,
	[CODIGO_SEG] [nvarchar](50) NOT NULL,
	[CED_CLIENTE] [nvarchar](50) NULL,
	[TITULAR] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__TBL_TARJ__7500EDCAD0B1FC1B] PRIMARY KEY CLUSTERED 
(
	[NUMERO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBL_TIPO_TIQUETE]    Script Date: 20/09/2016 13:35:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_TIPO_TIQUETE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TIPO] [nvarchar](50) NULL,
	[PRECIO] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBL_TIQUETE]    Script Date: 20/09/2016 13:35:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_TIQUETE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_VIAJE] [int] NOT NULL,
	[ID_TIPO_TIQUETE] [int] NOT NULL,
	[ID_ASIENTO] [int] NOT NULL,
	[ID_CONVENIO] [int] NOT NULL,
	[ID_COMPRA] [int] NOT NULL,
 CONSTRAINT [PK__TBL_TIQU__3214EC27CEE6202A] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBL_TREN]    Script Date: 20/09/2016 13:35:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_TREN](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MODELO] [nvarchar](50) NOT NULL,
	[MATRICULA] [nvarchar](50) NOT NULL,
	[NOMBRE] [nvarchar](50) NOT NULL,
	[FECHA_COMPRA] [nvarchar](50) NULL,
	[CANT_VAGONES] [int] NULL,
	[COSTO] [decimal](18, 2) NOT NULL,
	[DESCRIPCION] [nvarchar](100) NULL,
	[ESTADO] [nvarchar](50) NOT NULL,
	[KILOMETRO] [int] NULL,
	[COD_LINEA] [int] NULL,
 CONSTRAINT [PK__TBL_TREN__3214EC27EE4B0AA5] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[MATRICULA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBL_USUARIO]    Script Date: 20/09/2016 13:35:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBL_USUARIO](
	[CEDULA] [nvarchar](10) NOT NULL,
	[NOMBRE] [varchar](50) NOT NULL,
	[TELEFONO] [nvarchar](8) NOT NULL,
	[ID_PUESTO] [int] NULL,
	[CONTRASENA] [nvarchar](max) NULL,
	[CORREO] [nvarchar](max) NULL,
 CONSTRAINT [PK__tmp_ms_x__06BB8449CF0E7C47] PRIMARY KEY CLUSTERED 
(
	[CEDULA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBL_VAGON]    Script Date: 20/09/2016 13:35:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_VAGON](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CANT_ASIENTOS] [int] NOT NULL,
	[ID_TREN] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBL_VIAJE]    Script Date: 20/09/2016 13:35:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_VIAJE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_RUTA] [int] NOT NULL,
	[ID_TREN] [int] NOT NULL,
	[ID_HORARIO] [int] NOT NULL,
 CONSTRAINT [PK__TBL_VIAJ__3214EC2754E901FA] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 1, N'San Jose')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 1, N'Escazu')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 1, N'Desamparados')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (4, 1, N'Puriscal')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (5, 1, N'Aserri')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (6, 1, N'Mora')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (7, 1, N'Goicoechea')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (8, 1, N'Santa Ana')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (9, 1, N'Alajuelita')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (10, 1, N'Vasquez de Coronado')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (11, 1, N'Acosta')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (12, 1, N'Tibas')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (13, 1, N'Moravia')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (14, 1, N'Montes de Oca')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (15, 1, N'Turrubares')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (16, 1, N'Dota')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (17, 1, N'Curridabat')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (18, 1, N'Perez Zeledon')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (19, 1, N'Leon Cortez')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 2, N'Alajuela')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 2, N'San Ramon')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 2, N'Grecia')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (4, 2, N'San Mateo')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (5, 2, N'Atenas')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (6, 2, N'Naranjo')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (7, 2, N'Palmares')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (8, 2, N'Poas')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (9, 2, N'Orotina')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (10, 2, N'San Carlos')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (11, 2, N'Alfaro Ruiz')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (12, 2, N'Valverde Vega')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (13, 2, N'Upala')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (14, 2, N'Los Chiles')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (15, 2, N'Guatuso')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 3, N'Cartago')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 3, N'Paraiso')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 3, N'La Union')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (4, 3, N'Jimenez')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (5, 3, N'Turrialba')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (6, 3, N'Alvarado')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (7, 3, N'Oreamuno')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (8, 3, N'El Guarco')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 4, N'Heredia')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 4, N'Barva')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 4, N'Santo Domingo')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (4, 4, N'Santa Barbara')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (5, 4, N'San Rafael')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (6, 4, N'San Isidro')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (7, 4, N'Belen')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (8, 4, N'Flores')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (9, 4, N'San Pablo')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (10, 4, N'Sarapiqui')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 5, N'Liberia')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 5, N'Nicoya')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 5, N'Santa Cruz')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (4, 5, N'Bagaces')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (5, 5, N'Carrillo')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (6, 5, N'Cañas')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (7, 5, N'Abangares')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (8, 5, N'Tilaran')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (9, 5, N'Nandayure')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (10, 5, N'La Cruz')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (11, 5, N'Hojancha')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 6, N'Puntarenas')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 6, N'Esparza')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 6, N'Buenos Aires')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (4, 6, N'Montes de Oro')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (5, 6, N'Osa')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (6, 6, N'Aguirre')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (7, 6, N'Golfito')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (8, 6, N'Coto Brus')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (9, 6, N'Parrita')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (10, 6, N'Corredores')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (11, 6, N'Garabito')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 7, N'Limon')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 7, N'Pococi')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 7, N'Siquirres')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (4, 7, N'Talamanca')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (5, 7, N'Matina')
INSERT [dbo].[Canton] ([numeroCanton], [numeroProvincia], [nombre]) VALUES (6, 7, N'Guacimo')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 1, 1, N'Carmen')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 1, 2, N'Alajuela')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 1, 3, N'Oriental')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 1, 4, N'Heredia')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 1, 5, N'Liberia')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 1, 6, N'Puntarenas')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 1, 7, N'Limon')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 2, 1, N'Escazu')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 2, 2, N'San Ramon')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 2, 3, N'Paraiso')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 2, 4, N'Barva')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 2, 5, N'Nicoya')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 2, 6, N'Espiritu Santo')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 2, 7, N'Guapiles')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 3, 1, N'Desamparados')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 3, 2, N'Grecia')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 3, 3, N'Tres Rios')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 3, 4, N'Santo Domingo')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 3, 5, N'Santa Cruz')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 3, 6, N'Buenos Aires')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 3, 7, N'Siquirres')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 4, 1, N'Santiago')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 4, 2, N'San Mateo')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 4, 3, N'Juan Viñas')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 4, 4, N'Santa Barbara')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 4, 5, N'Bagaces')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 4, 6, N'Miramar')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 5, 1, N'Aserri')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 5, 2, N'Atenas')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 5, 3, N'Turrialba')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 5, 4, N'San Rafael')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 5, 5, N'Filadelfia')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 5, 6, N'Cortes')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 5, 7, N'Matina')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 6, 1, N'Colon')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 6, 2, N'Naranjo')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 6, 3, N'Pacayas')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 6, 4, N'San Isidro')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 6, 5, N'Cañas')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 6, 6, N'Quepos')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 6, 7, N'Guacimo')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 7, 1, N'Guadalupe')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 7, 2, N'Palmares')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 7, 3, N'San Rafael')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 7, 4, N'San Antonio')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 7, 5, N'Juntas')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 7, 6, N'Golfito')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 8, 1, N'Santa Ana')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 8, 2, N'San Pedro')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 8, 3, N'Tejar')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 8, 4, N'San Joaquin de Flores')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 8, 5, N'Tilaran')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 8, 6, N'San Vito')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 9, 1, N'Alajuelita')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 9, 2, N'Orotina')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 9, 4, N'San Pablo')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 9, 5, N'Carmona')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 9, 6, N'Parrita')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 10, 1, N'San Isidro')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 10, 2, N'Quesada')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 10, 4, N'Puerto Viejo')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 10, 5, N'La Cruz')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 10, 6, N'Corredores')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 11, 1, N'San Ignacio')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 11, 2, N'Zarcero')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 11, 5, N'Hojancha')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 11, 6, N'Jaco')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 12, 1, N'San Juan')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 12, 2, N'Sarchi Norte')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 13, 1, N'San Vicente')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 13, 2, N'Upala')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 14, 1, N'San Pedro')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 14, 2, N'Los Chiles')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 15, 1, N'San Pablo')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 15, 2, N'San Rafael')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 16, 1, N'Santa Maria')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 17, 1, N'Granadilla')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 18, 1, N'San Isidro del General')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (1, 19, 1, N'San Pablo')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 1, 1, N'Merced')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 1, 2, N'Carrizal')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 1, 3, N'Occidental')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 1, 4, N'Mercedes')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 1, 5, N'Cañas Dulces')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 1, 6, N'Pitahaya')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 1, 7, N'Valle la Estrella')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 2, 1, N'San Antonio')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 2, 2, N'Santiago')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 2, 3, N'Santiago')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 2, 4, N'San Pedro')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 2, 5, N'Mansion')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 2, 6, N'San Juan Grande')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 2, 7, N'Jimenez')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 3, 1, N'San Miguel')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 3, 2, N'San Isidro')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 3, 3, N'San Diego')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 3, 4, N'San Vicente')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 3, 5, N'Bolson')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 3, 6, N'Volcan')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 3, 7, N'Pacuarito')
GO
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 4, 1, N'Mercedes Sur')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 4, 2, N'Desmonte')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 4, 3, N'Tucurrique')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 4, 4, N'San Pedro')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 4, 5, N'Fortuna')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 4, 6, N'Union')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 5, 1, N'Tarbaca')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 5, 2, N'Jesus')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 5, 3, N'La Suiza')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 5, 4, N'San Josecito')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 5, 5, N'Palmira')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 5, 6, N'Palmar')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 5, 7, N'Batan')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 6, 1, N'Guayabo')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 6, 2, N'San Miguel')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 6, 3, N'Cervantes')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 6, 4, N'San Jose')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 6, 5, N'Palmira')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 6, 6, N'Savegre')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 6, 7, N'Mercedes')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 7, 1, N'San Francisco')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 7, 2, N'Zaragoza')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 7, 3, N'Cot')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 7, 4, N'Ribera')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 7, 5, N'Sierra')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 7, 6, N'Jimenez')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 8, 1, N'Salitral')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 8, 2, N'San Juan')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 8, 3, N'San Isidro')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 8, 4, N'Barrantes')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 8, 5, N'Quebrada Grande')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 8, 6, N'Sabalito')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 9, 1, N'San Josecito')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 9, 2, N'Mastate')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 9, 4, N'Rincon de Sabanilla')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 9, 5, N'Santa Rita')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 10, 1, N'San Rafael')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 10, 2, N'Florencia')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 10, 4, N'La Virgen')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 10, 5, N'Santa Cecilia')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 10, 6, N'La Cuesta')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 11, 1, N'Guaitil')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 11, 2, N'Laguna')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 11, 5, N'Monte Romo')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 11, 6, N'Tarcoles')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 12, 1, N'Cinco Esquinas')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 12, 2, N'Sarchi Sur')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 13, 1, N'San Jeronimo')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 13, 2, N'Aguas Claras')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 14, 1, N'Sabanilla')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 14, 2, N'Caño Negro')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 15, 1, N'San Pedro')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 15, 2, N'Buena Vista')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 16, 1, N'Jardin')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 17, 1, N'Sanchez')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 18, 1, N'General')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (2, 19, 1, N'San Andres')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 1, 1, N'Hospital')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 1, 2, N'San Antonio')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 1, 3, N'Carmen')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 1, 4, N'San Francisco')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 1, 5, N'Mayorga')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 1, 6, N'Chomes')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 1, 7, N'Rio Blanco')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 2, 1, N'San Rafael')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 2, 2, N'San Juan')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 2, 3, N'Orosi')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 2, 4, N'San Pablo')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 2, 5, N'San Antonio')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 2, 6, N'Macacona')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 2, 7, N'Rita')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 3, 1, N'San Juan de Dios')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 3, 2, N'San Jose')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 3, 3, N'San Juan')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 3, 4, N'San Miguel')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 3, 5, N'Veintisiete de Abril')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 3, 6, N'Potrero Grande')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 3, 7, N'Florida')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 4, 1, N'Barbacoas')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 4, 2, N'Jesus Maria')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 4, 3, N'Pejibaye')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 4, 4, N'San Juan')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 4, 5, N'Mogote')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 4, 6, N'San Isidro')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 5, 1, N'Vuelta de Jorco')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 5, 2, N'Mercedes')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 5, 3, N'Peralta')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 5, 4, N'Santiago')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 5, 5, N'Sardinal')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 5, 6, N'Sierpe')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 5, 7, N'Carrandi')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 6, 1, N'Tabarcia')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 6, 2, N'San Jose')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 6, 3, N'Capellades')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 6, 4, N'Concepcion')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 6, 5, N'San Miguel')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 6, 6, N'Naranjito')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 6, 7, N'Pocora')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 7, 1, N'Calle Blancos')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 7, 2, N'Buenos Aires')
GO
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 7, 3, N'Potrero Cerrado')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 7, 4, N'Asuncion')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 7, 5, N'San Juan')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 7, 6, N'Guaycar')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 8, 1, N'Pozos')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 8, 2, N'San Rafael')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 8, 3, N'Tobosi')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 8, 4, N'Llorente')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 8, 5, N'Tronadora')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 8, 6, N'Aguabuena')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 9, 1, N'San Antonio')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 9, 2, N'Hacienda Vieja')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 9, 5, N'Zapotal')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 10, 1, N'Jesus (Dulce Nombre)')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 10, 2, N'Buenavista')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 10, 4, N'Horquetas')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 10, 5, N'Garita')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 10, 6, N'Canoas')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 11, 1, N'Palmichal')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 11, 2, N'Tapezco')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 11, 5, N'Puerto Carrillo')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 12, 1, N'Anselmo Llorente')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 12, 2, N'Toro Amarillo')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 13, 1, N'Trinidad')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 13, 2, N'San Jose (Pizote)')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 14, 1, N'Mercedes(Betania)')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 14, 2, N'El Amparo')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 15, 1, N'San Juan de Mata')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 15, 2, N'Cote')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 16, 1, N'Copey')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 17, 1, N'Tirrases')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 18, 1, N'Daniel Flores')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (3, 19, 1, N'Llano Bonito')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (4, 1, 1, N'Catedral')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (4, 1, 2, N'Guacima')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (4, 1, 3, N'San Nicolas')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (4, 1, 4, N'Ulloa')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (4, 1, 5, N'Nacascolo')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (4, 1, 6, N'Lepanto')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (4, 1, 7, N'Matama')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (4, 2, 2, N'Piedades Norte')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (4, 2, 3, N'Cachi')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (4, 2, 4, N'San Roque')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (4, 2, 5, N'Quebrada Honda')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (4, 2, 6, N'San Rafael')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (4, 2, 7, N'Roxana')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (4, 3, 1, N'San Rafael')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (4, 3, 2, N'San Roque')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (4, 3, 3, N'San Rafael')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (4, 3, 4, N'Paracito')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (4, 3, 5, N'Tempate')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (4, 3, 6, N'Boruca')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (4, 3, 7, N'Germania')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (4, 4, 1, N'Grito Alto')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (4, 4, 4, N'Jesus')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (4, 5, 1, N'San Gabriel')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (4, 5, 2, N'San Isidro')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (4, 5, 3, N'Santa cruz')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (4, 5, 4, N'Angeles')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (4, 5, 5, N'Belen')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (4, 5, 6, N'Bahia Ballena')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (4, 6, 1, N'Piedras Negras')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (4, 6, 2, N'Cirri Sur')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (4, 6, 4, N'San Francisco')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (4, 6, 5, N'Bebedero')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (4, 6, 7, N'Rio Jimenez')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (4, 7, 1, N'Mata de Platano')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (4, 7, 2, N'Santiago')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (4, 7, 3, N'Cipreses')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (4, 7, 5, N'Colorado')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (4, 7, 6, N'Corredor')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (4, 8, 1, N'Uruca')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (4, 8, 2, N'Carrillos')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (4, 8, 3, N'Patio de Agua')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (4, 8, 5, N'Santa Rosa')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (4, 8, 6, N'Limoncito')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (4, 9, 1, N'Concepcion')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (4, 9, 2, N'Coyolar')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (4, 9, 5, N'San Pablo')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (4, 10, 1, N'Patalillo')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (4, 10, 2, N'Aguas Zarcas')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (4, 10, 4, N'Llanuras del Gaspar')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (4, 10, 5, N'Santa Elena')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (4, 10, 6, N'Laurel')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (4, 11, 1, N'Cangrejal')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (4, 11, 2, N'Guadalupe')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (4, 11, 5, N'Huacas')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (4, 12, 1, N'Leon XIII')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (4, 12, 2, N'San Pedro')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (4, 13, 2, N'Bijagua')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (4, 14, 1, N'San Rafael')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (4, 14, 2, N'San Jorge')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (4, 15, 1, N'San Luis')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (4, 16, 1, N'Curridabat')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (4, 17, 1, N'Curridabat')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (4, 18, 1, N'Rivas')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (4, 19, 1, N'San Isidro')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (5, 1, 1, N'Zapote')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (5, 1, 2, N'San Isidro')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (5, 1, 3, N'Aguacaliente (San Francisco)')
GO
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (5, 1, 4, N'Varablanca')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (5, 1, 5, N'Curubande')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (5, 1, 6, N'Paquera')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (5, 2, 2, N'Piedades Sur')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (5, 2, 3, N'Llanos de Santa Lucia')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (5, 2, 4, N'Santa Lucia')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (5, 2, 5, N'Samara')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (5, 2, 6, N'San Jeronimo')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (5, 2, 7, N'Cariari')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (5, 3, 1, N'San Antonio')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (5, 3, 2, N'Tacares')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (5, 3, 3, N'Concepcion')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (5, 3, 4, N'Santo Tomas')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (5, 3, 5, N'Cartagena')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (5, 3, 6, N'Pilas')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (5, 3, 7, N'Cairo')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (5, 4, 1, N'San Rafael')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (5, 4, 4, N'Santo Domingo')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (5, 5, 1, N'Legua')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (5, 5, 2, N'Concepcion')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (5, 5, 3, N'Santa Teresita')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (5, 5, 4, N'Concepcion')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (5, 5, 6, N'Piedras Blancas')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (5, 6, 1, N'Picagres')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (5, 6, 2, N'San Jeronimo')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (5, 6, 5, N'Porozal')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (5, 6, 7, N'Duacari')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (5, 7, 1, N'Ipis')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (5, 7, 2, N'Candelaria')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (5, 7, 3, N'Santa Rosa')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (5, 8, 1, N'Piedades')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (5, 8, 2, N'Sabana Redonda')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (5, 8, 5, N'Libano')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (5, 8, 6, N'Pittier')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (5, 9, 1, N'San Felipe')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (5, 9, 2, N'Ceiba')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (5, 9, 5, N'Porvenir')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (5, 10, 1, N'Cascajal')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (5, 10, 2, N'Venecia')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (5, 10, 4, N'Cureña')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (5, 11, 1, N'Sabanillas')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (5, 11, 2, N'Palmira')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (5, 12, 1, N'Colima')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (5, 12, 2, N'Rodriguez')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (5, 13, 2, N'Delicias')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (5, 18, 1, N'San Pedro')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (5, 19, 1, N'Santa Cruz')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (6, 1, 1, N'San Francisco de Dos Rios')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (6, 1, 2, N'Sabanilla')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (6, 1, 3, N'Guadalupe (Arenilla)')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (6, 1, 6, N'Manzanillo')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (6, 2, 2, N'San Rafael')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (6, 2, 4, N'San Jose de la Montaña')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (6, 2, 5, N'Nosara')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (6, 2, 7, N'Colorado')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (6, 3, 1, N'Frailes')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (6, 3, 2, N'Rio Cuarto')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (6, 3, 3, N'Dulce Nombre')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (6, 3, 4, N'Santa Rosa')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (6, 3, 5, N'Coajiniquil')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (6, 3, 6, N'Colinas')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (6, 3, 7, N'Alegria')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (6, 4, 1, N'Candelarita')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (6, 4, 4, N'Puraba')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (6, 4, 5, N'Rio Naranjo')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (6, 5, 1, N'Monterrey')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (6, 5, 2, N'San Jose')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (6, 5, 3, N'Pavones')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (6, 6, 2, N'San Juan')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (6, 7, 1, N'Rancho Redondo')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (6, 7, 2, N'Esquipulas')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (6, 8, 1, N'Brasil')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (6, 8, 5, N'Tierras Morenas')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (6, 9, 5, N'Bejuco')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (6, 10, 2, N'Pital')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (6, 11, 2, N'Zapote')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (6, 13, 2, N'Dos Rios (Colonia Mayorga)')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (6, 18, 1, N'Platanares')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (6, 19, 1, N'San Antonio')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (7, 1, 1, N'Uruca')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (7, 1, 2, N'San Rafael')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (7, 1, 3, N'Corralillo')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (7, 1, 6, N'Guacimal')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (7, 2, 2, N'San Isidro')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (7, 2, 5, N'Belen de Nosarita')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (7, 3, 1, N'Patarra')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (7, 3, 2, N'Puente de Piedra')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (7, 3, 3, N'San Ramon')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (7, 3, 4, N'Tures')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (7, 3, 5, N'Diria')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (7, 3, 6, N'Changuenas')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (7, 4, 1, N'Desamparaditos')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (7, 4, 7, N'Bratsi')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (7, 5, 1, N'Salitrillos')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (7, 5, 2, N'Santa Eulalia')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (7, 5, 3, N'Tuis')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (7, 6, 2, N'Rosario')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (7, 7, 1, N'Purral')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (7, 7, 2, N'Granja')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (7, 8, 5, N'Arenal')
GO
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (7, 10, 2, N'Fortuna')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (7, 11, 2, N'Brisas')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (7, 13, 2, N'Yolillal')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (7, 18, 1, N'Pejibaye')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (8, 1, 1, N'Mata Redonda')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (8, 1, 2, N'Rio Segundo')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (8, 1, 3, N'Tierra Blanca')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (8, 1, 6, N'Barranca')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (8, 2, 2, N'Angeles')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (8, 3, 1, N'San Cristobal')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (8, 3, 2, N'Bolivar')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (8, 3, 3, N'Rio Azul')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (8, 3, 4, N'Para')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (8, 3, 5, N'Cabo Velas')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (8, 3, 6, N'Biolley')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (8, 4, 1, N'San Antonio')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (8, 4, 7, N'Sixaola')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (8, 5, 3, N'Tayutic')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (8, 10, 2, N'Tigra')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (8, 18, 1, N'Cajon')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (9, 1, 1, N'Pavas')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (9, 1, 2, N'Desamparados')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (9, 1, 3, N'Dulce Nombre')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (9, 1, 6, N'Monte Verde')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (9, 2, 2, N'Alfaro')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (9, 3, 1, N'Rosario')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (9, 3, 5, N'Tamarindo')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (9, 4, 1, N'Chires')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (9, 4, 7, N'Cahuita')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (9, 5, 3, N'Santa Rosa')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (9, 10, 2, N'Palmera')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (9, 18, 1, N'Baru')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (10, 1, 1, N'Hatillo')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (10, 1, 2, N'Turrucares')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (10, 1, 3, N'Llano Grande')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (10, 1, 6, N'Isla del Coco')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (10, 2, 2, N'Volio')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (10, 3, 1, N'Damas')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (10, 4, 1, N'Tarrazu')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (10, 5, 3, N'Tres Equis')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (10, 10, 2, N'Venado')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (10, 18, 1, N'Rio Nuevo')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (11, 1, 1, N'San Sebastian')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (11, 1, 2, N'Tambor')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (11, 1, 3, N'Quebradilla')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (11, 1, 6, N'Cobano')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (11, 2, 2, N'Concepcion')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (11, 3, 1, N'San Rafael Abajo')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (11, 4, 1, N'San Marcos')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (11, 5, 3, N'La Isabel')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (11, 10, 2, N'Cutris')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (11, 18, 1, N'El Páramo')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (12, 1, 2, N'Garita')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (12, 1, 6, N'Chacarita')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (12, 2, 2, N'Zapotal')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (12, 3, 1, N'Gravillas')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (12, 4, 1, N'San Lorenzo')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (12, 5, 3, N'Chirripo')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (12, 10, 2, N'Monterrey')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (13, 1, 2, N'Sarapiqui')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (13, 1, 6, N'Chira')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (13, 2, 2, N'Peñas Blancas')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (13, 4, 1, N'San Carlos')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (13, 10, 2, N'Pocosol')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (14, 1, 6, N'Acapulco')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (15, 1, 6, N'El Roble')
INSERT [dbo].[Distrito] ([numeroDistrito], [numeroCanton], [numeroProvincia], [nombre]) VALUES (16, 1, 6, N'Arancibia')
INSERT [dbo].[Provincia] ([numeroProvincia], [nombre]) VALUES (1, N'San Jose')
INSERT [dbo].[Provincia] ([numeroProvincia], [nombre]) VALUES (2, N'Alajuela')
INSERT [dbo].[Provincia] ([numeroProvincia], [nombre]) VALUES (3, N'Cartago')
INSERT [dbo].[Provincia] ([numeroProvincia], [nombre]) VALUES (4, N'Heredia')
INSERT [dbo].[Provincia] ([numeroProvincia], [nombre]) VALUES (5, N'Guanacaste')
INSERT [dbo].[Provincia] ([numeroProvincia], [nombre]) VALUES (6, N'Puntarenas')
INSERT [dbo].[Provincia] ([numeroProvincia], [nombre]) VALUES (7, N'Limon')
SET IDENTITY_INSERT [dbo].[TBL_ACCION] ON 

INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (1, N'Jose Gómez', N'Eliminación de puesto', CAST(N'2016-07-16 01:39:25.653' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (2, N'Jose Gómez', N'Eliminación de puesto', CAST(N'2016-07-16 01:43:43.887' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (3, N'Jose Gómez', N'Creación de puesto', CAST(N'2016-07-16 01:44:41.113' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (4, N'Jose Gómez', N'Eliminación de puesto', CAST(N'2016-07-16 01:44:45.620' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (5, N'Jose Gómez', N'Creación de puesto', CAST(N'2016-07-16 01:44:51.880' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (6, N'Jose Gómez', N'Modificación de puesto', CAST(N'2016-07-16 01:47:27.817' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (7, N'Jose Gómez', N'Modificación de permiso', CAST(N'2016-07-16 01:47:39.047' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (8, N'Jose Gómez', N'Modificación de permiso', CAST(N'2016-07-16 01:47:43.727' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (9, N'Jose Gómez', N'Modificación de permiso', CAST(N'2016-07-16 02:13:21.440' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (10, N'Jose Gómez', N'Modificación de permiso', CAST(N'2016-07-16 02:13:27.387' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (11, N'Jose Gómez', N'Creación de usuario', CAST(N'2016-07-16 02:22:56.537' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (12, N'Jose Gómez', N'Creación de usuario', CAST(N'2016-07-16 02:31:36.440' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (13, N'Jose Gómez', N'Eliminación de usuario', CAST(N'2016-07-16 02:31:43.447' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (14, N'Jose Gómez', N'Creación de usuario', CAST(N'2016-07-16 02:34:02.867' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (15, N'Jose Gómez', N'Eliminación de usuario', CAST(N'2016-07-16 02:34:08.717' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (16, N'Jose Gómez', N'Modificación de usuario', CAST(N'2016-07-16 02:35:17.710' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (17, N'Jose Gómez', N'Eliminación de usuario', CAST(N'2016-07-16 02:35:30.213' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (18, N'Jose Gómez', N'Creación de usuario', CAST(N'2016-07-16 02:36:07.303' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (19, N'Jose Gómez', N'Eliminación de usuario', CAST(N'2016-07-16 02:36:13.683' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (20, N'Jose Gómez', N'Modificación de usuario', CAST(N'2016-07-16 04:27:42.277' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (21, N'Eduardo Guerrero', N'Creación de línea', CAST(N'2016-07-24 01:01:48.023' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (22, N'Paula', N'Modificación de línea', CAST(N'2016-07-24 10:29:20.950' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (23, N'Paula', N'Modificación de tipo de tiquete', CAST(N'2016-07-24 10:32:56.173' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (24, N'Paula', N'Modificación de tipo de tiquete', CAST(N'2016-07-24 10:33:19.347' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (25, N'Paula', N'Modificación de tipo de tiquete', CAST(N'2016-07-24 10:33:56.243' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (26, N'Paula', N'Modificación de tipo de tiquete', CAST(N'2016-07-24 10:59:37.443' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (27, N'Paula', N'Eliminación de tipo de tiquete', CAST(N'2016-07-24 12:54:21.257' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (28, N'Paula', N'Creación de tipo de tiquete', CAST(N'2016-07-24 13:23:00.703' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (29, N'Paula', N'Eliminación de tipo de tiquete', CAST(N'2016-07-24 13:23:50.443' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (30, N'Paula', N'Creación de tipo de tiquete', CAST(N'2016-07-24 13:24:15.723' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (31, N'Paula', N'Eliminación de tipo de tiquete', CAST(N'2016-07-24 13:25:40.653' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (32, N'Paula', N'Creación de tipo de tiquete', CAST(N'2016-07-24 13:40:39.350' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (33, N'Paula', N'Eliminación de tipo de tiquete', CAST(N'2016-07-24 13:40:48.847' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (34, N'Paula', N'Modificación de estación', CAST(N'2016-07-25 08:36:27.800' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (35, N'Paula', N'Modificación de estación', CAST(N'2016-07-25 08:36:48.297' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (36, N'Paula', N'Modificación de línea', CAST(N'2016-07-25 08:36:48.760' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (37, N'Paula', N'Modificación de línea', CAST(N'2016-07-25 08:36:49.063' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (38, N'Paula', N'Modificación de línea', CAST(N'2016-07-25 08:36:49.360' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (39, N'Paula', N'Modificación de línea', CAST(N'2016-07-25 08:36:49.657' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (40, N'Paula', N'Modificación de estación', CAST(N'2016-07-25 08:37:04.590' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (41, N'Paula', N'Modificación de estación', CAST(N'2016-07-25 08:37:10.600' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (42, N'Paula', N'Modificación de línea', CAST(N'2016-07-25 08:37:11.057' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (43, N'Paula', N'Modificación de línea', CAST(N'2016-07-25 08:37:11.363' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (44, N'Paula', N'Modificación de línea', CAST(N'2016-07-25 08:37:11.670' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (45, N'Paula', N'Modificación de línea', CAST(N'2016-07-25 08:37:11.967' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (46, N'Paula', N'Modificación de estación', CAST(N'2016-07-25 08:38:14.647' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (47, N'Paula', N'Modificación de estación', CAST(N'2016-07-25 08:38:20.133' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (48, N'Paula', N'Modificación de línea', CAST(N'2016-07-25 08:38:20.593' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (49, N'Paula', N'Modificación de línea', CAST(N'2016-07-25 08:38:20.880' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (50, N'Paula', N'Modificación de línea', CAST(N'2016-07-25 08:38:21.167' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (51, N'Paula', N'Modificación de línea', CAST(N'2016-07-25 08:38:21.453' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (52, N'Paula', N'Modificación de estación', CAST(N'2016-07-25 08:40:09.733' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (53, N'Paula', N'Modificación de estación', CAST(N'2016-07-25 08:48:37.187' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (54, N'Paula', N'Modificación de línea', CAST(N'2016-07-25 08:48:37.663' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (55, N'Paula', N'Modificación de línea', CAST(N'2016-07-25 08:48:37.963' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (56, N'Paula', N'Modificación de línea', CAST(N'2016-07-25 08:48:38.300' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (57, N'Paula', N'Modificación de línea', CAST(N'2016-07-25 08:48:38.597' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (58, N'Paula', N'Modificación de estación', CAST(N'2016-07-25 08:50:06.467' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (59, N'Paula', N'Modificación de estación', CAST(N'2016-07-25 08:54:16.230' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (60, N'Paula', N'Modificación de línea', CAST(N'2016-07-25 08:54:16.677' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (61, N'Paula', N'Modificación de línea', CAST(N'2016-07-25 08:54:16.960' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (62, N'Paula', N'Modificación de línea', CAST(N'2016-07-25 08:54:17.243' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (63, N'Paula', N'Modificación de línea', CAST(N'2016-07-25 08:54:17.527' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (64, N'Paula', N'Modificación de estación', CAST(N'2016-07-25 08:55:30.933' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (65, N'Paula', N'Modificación de estación', CAST(N'2016-07-25 08:57:07.433' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (66, N'Paula', N'Modificación de línea', CAST(N'2016-07-25 08:57:08.057' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (67, N'Paula', N'Modificación de línea', CAST(N'2016-07-25 08:57:08.357' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (68, N'Paula', N'Modificación de línea', CAST(N'2016-07-25 08:57:08.660' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (69, N'Paula', N'Modificación de línea', CAST(N'2016-07-25 08:57:08.960' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (70, N'Paula', N'Modificación de estación', CAST(N'2016-07-25 08:57:45.467' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (71, N'Paula', N'Modificación de línea', CAST(N'2016-07-25 08:57:45.920' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (72, N'Paula', N'Modificación de línea', CAST(N'2016-07-25 08:57:46.207' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (73, N'Paula', N'Modificación de línea', CAST(N'2016-07-25 08:57:46.500' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (74, N'Paula', N'Modificación de línea', CAST(N'2016-07-25 08:57:46.790' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (75, N'Paula', N'Creación de usuario', CAST(N'2016-07-25 11:49:36.757' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (76, N'Paula', N'Eliminación de usuario', CAST(N'2016-07-25 11:49:44.113' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (77, N'Eduardo Guerrero', N'Modificación de línea', CAST(N'2016-07-26 11:03:23.977' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (78, N'Eduardo Guerrero', N'Modificación de línea', CAST(N'2016-07-26 11:03:35.407' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (79, N'Eduardo Guerrero', N'Creación de tipo de tiquete', CAST(N'2016-07-26 11:19:29.247' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (80, N'Eduardo Guerrero', N'Eliminación de tipo de tiquete', CAST(N'2016-07-26 11:19:38.857' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (81, N'Eduardo Guerrero', N'Eliminación de tipo de tiquete', CAST(N'2016-07-26 11:19:52.407' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (82, N'Eduardo Guerrero', N'Creación de tipo de tiquete', CAST(N'2016-07-26 11:20:11.757' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (83, N'Eduardo Guerrero', N'Creación de tipo de tiquete', CAST(N'2016-07-26 11:20:24.697' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (84, N'Eduardo Guerrero', N'Eliminación de tipo de tiquete', CAST(N'2016-07-26 11:20:52.197' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (85, N'Paula', N'Creación de tipo de tiquete', CAST(N'2016-07-26 11:42:00.957' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (86, N'Paula', N'Eliminación de tipo de tiquete', CAST(N'2016-07-26 11:42:09.967' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (87, N'Paula', N'Creación de tipo de tiquete', CAST(N'2016-07-26 11:44:03.747' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (88, N'Paula', N'Eliminación de tipo de tiquete', CAST(N'2016-07-26 11:44:12.067' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (89, N'Paula', N'Modificación de tipo de tiquete', CAST(N'2016-07-26 11:53:21.070' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (90, N'Paula', N'Modificación de tipo de tiquete', CAST(N'2016-07-26 11:53:40.753' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (91, N'Paula', N'Creación de tipo de tiquete', CAST(N'2016-07-26 11:53:48.153' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (92, N'Paula', N'Eliminación de tipo de tiquete', CAST(N'2016-07-26 11:53:54.873' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (93, N'Paula', N'Modificación de tren', CAST(N'2016-07-27 14:30:54.437' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (94, N'Paula', N'Modificación de tren', CAST(N'2016-07-27 14:34:04.883' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (95, N'Paula', N'Modificación de tren', CAST(N'2016-07-27 14:40:39.123' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (96, N'Paula', N'Modificación de tren', CAST(N'2016-07-27 14:40:48.970' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (97, N'Paula', N'Modificación de tren', CAST(N'2016-07-27 14:50:50.563' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (98, N'Paula', N'Modificación de tren', CAST(N'2016-07-27 14:51:57.947' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (99, N'Paula', N'Modificación de tren', CAST(N'2016-07-27 14:52:07.537' AS DateTime))
GO
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (100, N'Paula', N'Modificación de tren', CAST(N'2016-07-27 14:52:38.493' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (101, N'Paula', N'Modificación de tren', CAST(N'2016-07-27 15:05:48.633' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (102, N'Paula', N'Modificación de tren', CAST(N'2016-07-27 15:05:57.357' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (103, N'Paula', N'Modificación de tren', CAST(N'2016-07-27 15:06:00.257' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (104, N'Paula', N'Modificación de tren', CAST(N'2016-07-27 18:15:22.663' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (105, N'Paula', N'Modificación de tren', CAST(N'2016-07-27 18:15:33.580' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (106, N'Paula', N'Modificación de tren', CAST(N'2016-07-27 07:36:05.223' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (107, N'Paula', N'Modificación de tren', CAST(N'2016-07-27 07:36:08.657' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (108, N'Paula', N'Modificación de tren', CAST(N'2016-07-27 16:33:02.540' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (109, N'Eduardo Guerrero', N'Modificación de tipo de tiquete', CAST(N'2016-07-28 15:24:38.830' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (110, N'Eduardo Guerrero', N'Modificación de tipo de tiquete', CAST(N'2016-07-28 15:24:46.087' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (111, N'Paula', N'Modificación de tren', CAST(N'2016-08-01 00:31:45.340' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (112, N'Paula', N'Modificación de tren', CAST(N'2016-08-01 00:31:51.767' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (113, N'Paula', N'Modificación de tren', CAST(N'2016-08-01 00:31:59.310' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (114, N'Paula', N'Creación de Convenio', CAST(N'2016-08-06 00:19:49.737' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (115, N'Paula', N'Modificación de Convenio', CAST(N'2016-08-06 00:19:59.180' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (116, N'Paula', N'Eliminación de Convenio', CAST(N'2016-08-06 00:20:03.800' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (117, N'Paula', N'Modificación de tren', CAST(N'2016-08-08 08:57:55.283' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (118, N'Paula', N'Modificación de tren', CAST(N'2016-08-08 08:57:58.230' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (119, N'Paula', N'Modificación de tren', CAST(N'2016-08-08 10:38:33.957' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (120, N'Paula', N'Modificación de tren', CAST(N'2016-08-08 10:39:15.007' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (121, N'Paula', N'Modificación de tren', CAST(N'2016-08-08 10:39:28.413' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (122, N'Paula', N'Modificación de tren', CAST(N'2016-08-08 10:42:00.010' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (123, N'Paula', N'Modificación de tren', CAST(N'2016-08-08 10:44:32.967' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (124, N'Paula', N'Modificación de tren', CAST(N'2016-08-08 10:44:54.867' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (125, N'Paula', N'Modificación de tren', CAST(N'2016-08-08 10:47:06.467' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (126, N'Paula', N'Modificación de tren', CAST(N'2016-08-08 10:47:51.567' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (127, N'Paula', N'Modificación de tren', CAST(N'2016-08-08 10:48:24.177' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (128, N'Paula', N'Modificación de tren', CAST(N'2016-08-08 10:48:27.853' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (129, N'Paula', N'Modificación de tren', CAST(N'2016-08-08 10:48:32.303' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (130, N'Paula', N'Modificación de tren', CAST(N'2016-08-08 11:00:28.163' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (131, N'Paula', N'Modificación de tren', CAST(N'2016-08-08 15:23:39.330' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (132, N'Paula', N'Modificación de tren', CAST(N'2016-08-08 15:42:32.543' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (133, N'Paula', N'Modificación de tren', CAST(N'2016-08-08 15:45:42.573' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (134, N'Paula', N'Modificación de tren', CAST(N'2016-08-08 15:46:51.323' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (135, N'Paula', N'Modificación de tren', CAST(N'2016-08-08 16:03:14.977' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (136, N'Paula', N'Modificación de tren', CAST(N'2016-08-08 16:05:37.577' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (137, N'Paula', N'Modificación de tren', CAST(N'2016-08-08 16:05:46.597' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (138, N'Paula', N'Modificación de tren', CAST(N'2016-08-08 16:17:27.350' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (139, N'Paula', N'Modificación de tren', CAST(N'2016-08-08 23:32:41.723' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (140, N'Paula', N'Modificación de tipo de tiquete', CAST(N'2016-08-08 23:33:14.157' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (141, N'Paula', N'Modificación de tren', CAST(N'2016-08-08 23:36:10.490' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (142, N'Paula', N'Modificación de tren', CAST(N'2016-08-08 23:36:14.053' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (143, N'Eduardo Guerrero', N'Eliminación de puesto', CAST(N'2016-08-09 01:45:12.783' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (144, N'Eduardo Guerrero', N'Creación de puesto', CAST(N'2016-08-09 01:49:04.463' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (145, N'Eduardo Guerrero', N'Modificación de puesto', CAST(N'2016-08-09 01:49:42.633' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (146, N'Eduardo Guerrero', N'Modificación de puesto', CAST(N'2016-08-09 01:49:51.753' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (147, N'Eduardo Guerrero', N'Eliminación de puesto', CAST(N'2016-08-09 01:49:58.393' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (148, N'Eduardo Guerrero', N'Creación de puesto', CAST(N'2016-08-09 01:50:49.640' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (149, N'Eduardo Guerrero', N'Eliminación de puesto', CAST(N'2016-08-09 01:54:42.943' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (150, N'Eduardo Guerrero', N'Creación de puesto', CAST(N'2016-08-09 01:55:41.447' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (151, N'Eduardo Guerrero', N'Eliminación de puesto', CAST(N'2016-08-09 01:56:37.050' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (152, N'Eduardo Guerrero', N'Creación de puesto', CAST(N'2016-08-09 01:57:31.927' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (153, N'Eduardo Guerrero', N'Eliminación de puesto', CAST(N'2016-08-09 01:59:06.420' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (154, N'Eduardo Guerrero', N'Creación de puesto', CAST(N'2016-08-09 01:59:14.573' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (155, N'Eduardo Guerrero', N'Eliminación de puesto', CAST(N'2016-08-09 01:59:49.450' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (156, N'Eduardo Guerrero', N'Creación de puesto', CAST(N'2016-08-09 02:00:00.057' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (157, N'Eduardo Guerrero', N'Eliminación de puesto', CAST(N'2016-08-09 02:00:38.880' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (158, N'Eduardo Guerrero', N'Creación de puesto', CAST(N'2016-08-09 02:00:47.343' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (159, N'Eduardo Guerrero', N'Creación de usuario', CAST(N'2016-08-09 02:02:44.273' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (160, N'Eduardo Guerrero', N'Eliminación de usuario', CAST(N'2016-08-09 02:02:51.457' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (161, N'Eduardo Guerrero', N'Creación de usuario', CAST(N'2016-08-09 02:06:27.730' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (162, N'Eduardo Guerrero', N'Eliminación de usuario', CAST(N'2016-08-09 02:06:34.870' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (163, N'Eduardo Guerrero', N'Eliminación de puesto', CAST(N'2016-08-09 02:14:38.587' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (164, N'Eduardo Guerrero', N'Creación de puesto', CAST(N'2016-08-09 02:14:48.137' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (165, N'Paula', N'Modificación de tren', CAST(N'2016-08-09 08:57:45.773' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (166, N'Paula', N'Modificación de tren', CAST(N'2016-08-09 06:58:14.647' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (167, N'Paula', N'Modificación de tren', CAST(N'2016-08-09 06:59:45.843' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (168, N'Paula', N'Modificación de tren', CAST(N'2016-08-09 06:01:41.863' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (169, N'Paula', N'Modificación de tren', CAST(N'2016-08-09 06:02:16.427' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (170, N'Paula', N'Modificación de tren', CAST(N'2016-08-09 06:03:17.387' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (171, N'Paula', N'Modificación de tren', CAST(N'2016-08-09 06:04:10.550' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (172, N'Eduardo Guerrero', N'Modificación de tren', CAST(N'2016-08-09 09:09:55.010' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (173, N'Paula', N'Modificación de tren', CAST(N'2016-08-09 11:17:21.100' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (174, N'Paula', N'Modificación de tren', CAST(N'2016-08-09 12:45:40.890' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (175, N'Paula', N'Modificación de tren', CAST(N'2016-08-09 12:52:55.087' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (176, N'Eduardo Guerrero', N'Modificación de tren', CAST(N'2016-08-11 05:53:14.823' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (177, N'Jose Gómez', N'Creación de usuario', CAST(N'2016-08-11 07:49:54.247' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (178, N'Eduardo Guerrero', N'Modificación de tren', CAST(N'2016-08-11 09:56:22.970' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (179, N'Paula', N'Modificación de estación', CAST(N'2016-08-19 09:10:31.017' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (180, N'Paula', N'Modificación de estación', CAST(N'2016-08-19 09:18:41.957' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (181, N'Paula', N'Modificación de estación', CAST(N'2016-08-19 09:18:49.233' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (182, N'Paula', N'Creación de estación', CAST(N'2016-08-19 09:21:29.143' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (183, N'Paula', N'Eliminación de estación', CAST(N'2016-08-19 09:21:33.960' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (184, N'Paula', N'Modificación de línea', CAST(N'2016-08-19 09:34:48.843' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (185, N'Paula', N'Modificación de línea', CAST(N'2016-08-19 09:34:58.483' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (186, N'Paula', N'Creación de línea', CAST(N'2016-08-19 09:35:48.250' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (187, N'Paula', N'Eliminación de línea', CAST(N'2016-08-19 09:42:04.710' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (188, N'Jose Gómez', N'Creación de línea', CAST(N'2016-08-19 15:53:43.313' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (189, N'Jose Gómez', N'Eliminación de línea', CAST(N'2016-08-19 15:54:05.120' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (190, N'Jose Gómez', N'Creación de línea', CAST(N'2016-08-19 15:56:20.343' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (191, N'Jose Gómez', N'Eliminación de línea', CAST(N'2016-08-19 15:58:22.437' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (192, N'Jose Gómez', N'Eliminación de línea', CAST(N'2016-08-19 15:58:28.960' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (193, N'Jose Gómez', N'Modificación de tren', CAST(N'2016-08-19 15:58:50.127' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (194, N'Jose Gómez', N'Modificación de tren', CAST(N'2016-08-19 19:46:09.890' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (195, N'Jose Gómez', N'Modificación de tren', CAST(N'2016-08-19 07:53:36.043' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (196, N'Jose Gómez', N'Modificación de tren', CAST(N'2016-08-19 08:01:48.797' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (197, N'Jose Gómez', N'Modificación de tren', CAST(N'2016-08-19 08:01:55.003' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (198, N'Jose Gómez', N'Creación de línea', CAST(N'2016-08-19 08:06:12.360' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (199, N'Jose Gómez', N'Modificación de tren', CAST(N'2016-08-19 08:10:15.117' AS DateTime))
GO
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (200, N'Jose Gómez', N'Modificación de tren', CAST(N'2016-08-19 09:18:01.037' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (201, N'Jose Gómez', N'Modificación de línea', CAST(N'2016-08-19 09:22:04.703' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (202, N'Jose Gómez', N'Eliminación de línea', CAST(N'2016-08-19 09:30:58.600' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (203, N'Jose Gómez', N'Creación de línea', CAST(N'2016-08-19 09:32:46.887' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (204, N'Jose Gómez', N'Modificación de línea', CAST(N'2016-08-19 09:39:02.830' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (205, N'Jose Gómez', N'Modificación de línea', CAST(N'2016-08-19 09:39:51.690' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (206, N'Jose Gómez', N'Modificación de estación', CAST(N'2016-08-19 11:21:21.083' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (207, N'Jose Gómez', N'Eliminación de línea', CAST(N'2016-08-19 11:22:16.567' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (208, N'Jose Gómez', N'Modificación de línea', CAST(N'2016-08-19 11:31:56.887' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (209, N'Jose Gómez', N'Modificación de línea', CAST(N'2016-08-19 11:32:10.983' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (210, N'Jose Gómez', N'Modificación de tren', CAST(N'2016-08-19 11:33:40.450' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (211, N'Jose Gómez', N'Modificación de tren', CAST(N'2016-08-19 11:34:18.790' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (212, N'Jose Gómez', N'Creación de línea', CAST(N'2016-08-19 11:38:14.170' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (213, N'Jose Gómez', N'Modificación de tren', CAST(N'2016-08-21 13:03:27.790' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (214, N'Jose Gómez', N'Modificación de tren', CAST(N'2016-08-21 13:03:41.510' AS DateTime))
INSERT [dbo].[TBL_ACCION] ([ID], [ID_USUARIO], [TIPO_ACCION], [FECHA]) VALUES (215, N'Jose Gómez', N'Modificación de tren', CAST(N'2016-08-31 10:35:44.720' AS DateTime))
SET IDENTITY_INSERT [dbo].[TBL_ACCION] OFF
SET IDENTITY_INSERT [dbo].[TBL_ASIENTO] ON 

INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (1, 9, N'Preferencial', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (2, 9, N'Preferencial', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (3, 9, N'Preferencial', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (4, 9, N'Preferencial', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (5, 9, N'Preferencial', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (6, 9, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (7, 9, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (8, 9, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (9, 9, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (10, 9, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (11, 9, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (12, 9, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (13, 9, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (14, 9, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (15, 9, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (16, 9, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (17, 9, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (18, 9, N'VIP', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (19, 9, N'VIP', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (20, 9, N'VIP', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (21, 9, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (22, 9, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (23, 9, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (24, 9, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (25, 9, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (26, 9, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (27, 9, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (28, 9, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (29, 9, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (30, 9, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (31, 11, N'Preferencial', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (32, 11, N'Preferencial', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (33, 11, N'Preferencial', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (34, 11, N'Preferencial', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (35, 11, N'Preferencial', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (36, 11, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (37, 11, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (38, 11, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (39, 11, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (40, 11, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (41, 11, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (42, 11, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (43, 11, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (44, 11, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (45, 11, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (46, 11, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (47, 11, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (48, 11, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (49, 11, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (50, 11, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (51, 11, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (52, 11, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (53, 11, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (54, 11, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (55, 11, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (56, 11, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (57, 11, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (58, 11, N'VIP', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (59, 11, N'VIP', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (60, 11, N'VIP', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (61, 10, N'Preferencial', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (62, 10, N'Preferencial', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (63, 10, N'Preferencial', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (64, 10, N'Preferencial', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (65, 10, N'Preferencial', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (66, 10, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (67, 10, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (68, 10, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (69, 10, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (70, 10, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (71, 10, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (72, 10, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (73, 10, N'VIP', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (74, 10, N'VIP', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (75, 10, N'VIP', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (76, 10, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (77, 10, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (78, 10, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (79, 10, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (80, 10, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (81, 10, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (82, 10, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (83, 10, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (84, 10, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (85, 10, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (86, 10, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (87, 10, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (88, 10, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (89, 10, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (90, 10, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (91, 16, N'Preferencial', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (92, 16, N'Preferencial', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (93, 16, N'Preferencial', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (94, 16, N'Preferencial', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (95, 16, N'Preferencial', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (96, 16, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (97, 16, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (98, 16, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (99, 16, N'Adulto', N'Disponible')
GO
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (100, 16, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (101, 16, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (102, 16, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (103, 16, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (104, 16, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (105, 16, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (106, 16, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (107, 16, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (108, 16, N'VIP', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (109, 16, N'VIP', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (110, 16, N'VIP', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (111, 16, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (112, 16, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (113, 16, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (114, 16, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (115, 16, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (116, 16, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (117, 16, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (118, 16, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (119, 16, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (120, 16, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (121, 15, N'Preferencial', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (122, 15, N'Preferencial', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (123, 15, N'Preferencial', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (124, 15, N'Preferencial', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (125, 15, N'Preferencial', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (126, 15, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (127, 15, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (128, 15, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (129, 15, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (130, 15, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (131, 15, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (132, 15, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (133, 15, N'VIP', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (134, 15, N'VIP', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (135, 15, N'VIP', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (136, 15, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (137, 15, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (138, 15, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (139, 15, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (140, 15, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (141, 15, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (142, 15, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (143, 15, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (144, 15, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (145, 15, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (146, 15, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (147, 15, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (148, 15, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (149, 15, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (150, 15, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (151, 13, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (152, 13, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (153, 13, N'Preferencial', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (154, 13, N'Preferencial', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (155, 13, N'Preferencial', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (156, 13, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (157, 13, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (158, 13, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (159, 13, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (160, 13, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (161, 13, N'VIP', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (162, 13, N'VIP', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (163, 13, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (164, 13, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (165, 13, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (166, 13, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (167, 13, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (168, 13, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (169, 13, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (170, 13, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (171, 19, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (172, 19, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (173, 19, N'Preferencial', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (174, 19, N'Preferencial', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (175, 19, N'Preferencial', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (176, 19, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (177, 19, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (178, 19, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (179, 19, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (180, 19, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (181, 19, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (182, 19, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (183, 19, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (184, 19, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (185, 19, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (186, 19, N'VIP', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (187, 19, N'VIP', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (188, 19, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (189, 19, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (190, 19, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (191, 14, N'VIP', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (192, 14, N'VIP', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (193, 14, N'Preferencial', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (194, 14, N'Preferencial', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (195, 14, N'Preferencial', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (196, 14, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (197, 14, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (198, 14, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (199, 14, N'Adulto', N'Disponible')
GO
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (200, 14, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (201, 14, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (202, 14, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (203, 14, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (204, 14, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (205, 14, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (206, 14, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (207, 14, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (208, 14, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (209, 14, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (210, 14, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (211, 17, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (212, 17, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (213, 17, N'Preferencial', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (214, 17, N'Preferencial', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (215, 17, N'Preferencial', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (216, 17, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (217, 17, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (218, 17, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (219, 17, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (220, 17, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (221, 17, N'VIP', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (222, 17, N'VIP', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (223, 17, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (224, 17, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (225, 17, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (226, 17, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (227, 17, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (228, 17, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (229, 17, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (230, 17, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (231, 18, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (232, 18, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (233, 18, N'Preferencial', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (234, 18, N'Preferencial', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (235, 18, N'Preferencial', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (236, 18, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (237, 18, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (238, 18, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (239, 18, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (240, 18, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (241, 18, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (242, 18, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (243, 18, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (244, 18, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (245, 18, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (246, 18, N'VIP', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (247, 18, N'VIP', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (248, 18, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (249, 18, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (250, 18, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (251, 21, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (252, 21, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (253, 21, N'Preferencial', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (254, 21, N'Preferencial', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (255, 21, N'Preferencial', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (256, 21, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (257, 21, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (258, 21, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (259, 21, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (260, 21, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (261, 21, N'VIP', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (262, 21, N'VIP', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (263, 21, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (264, 21, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (265, 21, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (266, 21, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (267, 21, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (268, 21, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (269, 21, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (270, 21, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (271, 23, N'VIP', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (272, 23, N'VIP', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (273, 23, N'Preferencial', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (274, 23, N'Preferencial', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (275, 23, N'Preferencial', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (276, 23, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (277, 23, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (278, 23, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (279, 23, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (280, 23, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (281, 23, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (282, 23, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (283, 23, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (284, 23, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (285, 23, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (286, 23, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (287, 23, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (288, 23, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (289, 23, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (290, 23, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (291, 24, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (292, 24, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (293, 24, N'Preferencial', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (294, 24, N'Preferencial', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (295, 24, N'Preferencial', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (296, 24, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (297, 24, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (298, 24, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (299, 24, N'Adulto', N'Disponible')
GO
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (300, 24, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (301, 24, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (302, 24, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (303, 24, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (304, 24, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (305, 24, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (306, 24, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (307, 24, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (308, 24, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (309, 24, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (310, 24, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (311, 22, N'VIP', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (312, 22, N'VIP', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (313, 22, N'Preferencial', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (314, 22, N'Preferencial', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (315, 22, N'Preferencial', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (316, 22, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (317, 22, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (318, 22, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (319, 22, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (320, 22, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (321, 22, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (322, 22, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (323, 22, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (324, 22, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (325, 22, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (326, 22, N'VIP', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (327, 22, N'VIP', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (328, 22, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (329, 22, N'Adulto', N'Disponible')
INSERT [dbo].[TBL_ASIENTO] ([ID], [ID_VAGON], [TIPO], [ESTADO]) VALUES (330, 22, N'Adulto', N'Disponible')
SET IDENTITY_INSERT [dbo].[TBL_ASIENTO] OFF
INSERT [dbo].[TBL_CLIENTE] ([CEDULA], [NOMBRE], [APELLIDO], [TELEFONO], [RESIDENCIA], [CORREO], [CONTRASENA], [EDAD]) VALUES (N'116120107', N'Eduardo', N'Guerrero', N'84824599', N'San Jose, Barrio Latino. Grecia', N'jgm16@hotmail.com', N'4983a0ab83ed86e0e7213c8783940193', 0)
INSERT [dbo].[TBL_CLIENTES_NO_FRECUENTES] ([CEDULA], [NOMBRE], [CORREO], [TELEFONO], [ESTADO], [APELLIDO], [PROVINCIA], [DISTRITO], [CANTON]) VALUES (N'116120107', N'Eduardo', N'jgm16@hotmail.com', N'888', NULL, N'Guerrero', N'San jose', N'Montes de oca', N'Vargas Araya')
INSERT [dbo].[TBL_EMPRESA] ([CED_JURIDICA], [NOMBRE], [DIRECCION], [TELEFONO], [CORREO], [IMPUESTO]) VALUES (N'2-002-48661', N'Travel', N'Trenes de alta velocidad', N'2200-7000', N'tav_3@travel.cr', N'15')
SET IDENTITY_INSERT [dbo].[TBL_ESTACION] ON 

INSERT [dbo].[TBL_ESTACION] ([COD_ESTACION], [NOMBRE], [ESTADO], [LONGITUD], [LATITUD], [CENTRAL], [UBICACION], [KILOMETRO]) VALUES (15, N'San José', N'Abierta', CAST(-84.0833 AS Decimal(10, 4)), CAST(9.9333 AS Decimal(10, 4)), 2, 0xE6100000010CAEB6627FD9DD23406FF085C9540555C0, 0)
INSERT [dbo].[TBL_ESTACION] ([COD_ESTACION], [NOMBRE], [ESTADO], [LONGITUD], [LATITUD], [CENTRAL], [UBICACION], [KILOMETRO]) VALUES (16, N'Orotina', N'Abierta', CAST(-84.5230 AS Decimal(10, 4)), CAST(9.9105 AS Decimal(10, 4)), 2, 0xE6100000010C1904560E2DD22340B6F3FDD4782155C0, 30)
INSERT [dbo].[TBL_ESTACION] ([COD_ESTACION], [NOMBRE], [ESTADO], [LONGITUD], [LATITUD], [CENTRAL], [UBICACION], [KILOMETRO]) VALUES (17, N'Cartago', N'Abierta', CAST(-83.9166 AS Decimal(10, 4)), CAST(9.8666 AS Decimal(10, 4)), 2, 0xE6100000010C5D6DC5FEB2BB2340DFE00B93A9FA54C0, 0)
INSERT [dbo].[TBL_ESTACION] ([COD_ESTACION], [NOMBRE], [ESTADO], [LONGITUD], [LATITUD], [CENTRAL], [UBICACION], [KILOMETRO]) VALUES (18, N'Aeropuerto', N'Abierta', CAST(-84.2088 AS Decimal(10, 4)), CAST(9.9938 AS Decimal(10, 4)), 2, 0xE6100000010C9487855AD3FC2340E8D9ACFA5C0D55C0, 12)
INSERT [dbo].[TBL_ESTACION] ([COD_ESTACION], [NOMBRE], [ESTADO], [LONGITUD], [LATITUD], [CENTRAL], [UBICACION], [KILOMETRO]) VALUES (19, N'Heredia', N'Abierta', CAST(-84.1166 AS Decimal(10, 4)), CAST(9.9963 AS Decimal(10, 4)), 2, 0xE6100000010C75029A081BFE2340ACADD85F760755C0, 24)
INSERT [dbo].[TBL_ESTACION] ([COD_ESTACION], [NOMBRE], [ESTADO], [LONGITUD], [LATITUD], [CENTRAL], [UBICACION], [KILOMETRO]) VALUES (20, N'Desamparados', N'Abierta', CAST(-84.0488 AS Decimal(10, 4)), CAST(9.8133 AS Decimal(10, 4)), 2, 0xE6100000010C71AC8BDB68A02340DE02098A1F0355C0, 40)
INSERT [dbo].[TBL_ESTACION] ([COD_ESTACION], [NOMBRE], [ESTADO], [LONGITUD], [LATITUD], [CENTRAL], [UBICACION], [KILOMETRO]) VALUES (21, N'Parque Central', N'Abierta', CAST(-84.0796 AS Decimal(10, 4)), CAST(9.9329 AS Decimal(10, 4)), 1, 0xE6100000010C76E09C11A5DD2340BE30992A180555C0, 0)
INSERT [dbo].[TBL_ESTACION] ([COD_ESTACION], [NOMBRE], [ESTADO], [LONGITUD], [LATITUD], [CENTRAL], [UBICACION], [KILOMETRO]) VALUES (22, N'Alajuela', N'Abierta', CAST(-84.4348 AS Decimal(10, 4)), CAST(9.9311 AS Decimal(10, 4)), 2, 0xE6100000010C789CA223B9DC2340401361C3D31B55C0, 10)
INSERT [dbo].[TBL_ESTACION] ([COD_ESTACION], [NOMBRE], [ESTADO], [LONGITUD], [LATITUD], [CENTRAL], [UBICACION], [KILOMETRO]) VALUES (23, N'Autopista José María Castro', N'Abierta', CAST(-84.3167 AS Decimal(10, 4)), CAST(9.9643 AS Decimal(10, 4)), 2, 0xE6100000010CCB10C7BAB8ED23402AA913D0441455C0, 40)
INSERT [dbo].[TBL_ESTACION] ([COD_ESTACION], [NOMBRE], [ESTADO], [LONGITUD], [LATITUD], [CENTRAL], [UBICACION], [KILOMETRO]) VALUES (25, N'Corcovado', N'Cerrada', CAST(-8.2343 AS Decimal(10, 4)), CAST(9.9323 AS Decimal(10, 4)), 2, 0xE6100000010C211FF46C56DD2340D5E76A2BF67720C0, 0)
SET IDENTITY_INSERT [dbo].[TBL_ESTACION] OFF
INSERT [dbo].[TBL_ESTACIONES_POR_LINEA] ([ID_LINEA], [ID_ESTACION]) VALUES (11, 15)
INSERT [dbo].[TBL_ESTACIONES_POR_LINEA] ([ID_LINEA], [ID_ESTACION]) VALUES (11, 19)
INSERT [dbo].[TBL_ESTACIONES_POR_LINEA] ([ID_LINEA], [ID_ESTACION]) VALUES (12, 15)
INSERT [dbo].[TBL_ESTACIONES_POR_LINEA] ([ID_LINEA], [ID_ESTACION]) VALUES (12, 18)
INSERT [dbo].[TBL_ESTACIONES_POR_LINEA] ([ID_LINEA], [ID_ESTACION]) VALUES (12, 19)
INSERT [dbo].[TBL_ESTACIONES_POR_LINEA] ([ID_LINEA], [ID_ESTACION]) VALUES (13, 15)
INSERT [dbo].[TBL_ESTACIONES_POR_LINEA] ([ID_LINEA], [ID_ESTACION]) VALUES (13, 16)
INSERT [dbo].[TBL_ESTACIONES_POR_LINEA] ([ID_LINEA], [ID_ESTACION]) VALUES (16, 15)
INSERT [dbo].[TBL_ESTACIONES_POR_LINEA] ([ID_LINEA], [ID_ESTACION]) VALUES (16, 17)
INSERT [dbo].[TBL_ESTACIONES_POR_LINEA] ([ID_LINEA], [ID_ESTACION]) VALUES (16, 18)
INSERT [dbo].[TBL_ESTACIONES_POR_LINEA] ([ID_LINEA], [ID_ESTACION]) VALUES (16, 23)
INSERT [dbo].[TBL_EXCEPCION] ([CODIGO], [MENSAJE]) VALUES (N' CorreoNotExist', N'El correo no se encuentra registrado')
INSERT [dbo].[TBL_EXCEPCION] ([CODIGO], [MENSAJE]) VALUES (N'CedulaDuplicada', N'La cedula ya se encuentra registrada ')
INSERT [dbo].[TBL_EXCEPCION] ([CODIGO], [MENSAJE]) VALUES (N'CedulaEnBlanco', N'La cédula no debe dejarse en blanco.')
INSERT [dbo].[TBL_EXCEPCION] ([CODIGO], [MENSAJE]) VALUES (N'ColorLineaRepetido', N'Ya existe una línea con el color indicado.')
INSERT [dbo].[TBL_EXCEPCION] ([CODIGO], [MENSAJE]) VALUES (N'ContrasenaNotMatch', N'Contraseña no coinciden')
INSERT [dbo].[TBL_EXCEPCION] ([CODIGO], [MENSAJE]) VALUES (N'CorreoNotMatch', N'El correo ingresado es incorrecto')
INSERT [dbo].[TBL_EXCEPCION] ([CODIGO], [MENSAJE]) VALUES (N'Fatal', N'Error desconocido del sistema... FATAL!')
INSERT [dbo].[TBL_EXCEPCION] ([CODIGO], [MENSAJE]) VALUES (N'MatriculaTrenNoEncontrado', N'La matrícula del tren no se ha encontrado en el sistema.')
INSERT [dbo].[TBL_EXCEPCION] ([CODIGO], [MENSAJE]) VALUES (N'MatriculaTrenRepetido', N'Ya existe un tren con la matrícula indicada.')
INSERT [dbo].[TBL_EXCEPCION] ([CODIGO], [MENSAJE]) VALUES (N'NoData', N'No hay datos')
INSERT [dbo].[TBL_EXCEPCION] ([CODIGO], [MENSAJE]) VALUES (N'NombreEstacionRepetido', N'Ya existe una estación con el nombre indicado.')
INSERT [dbo].[TBL_EXCEPCION] ([CODIGO], [MENSAJE]) VALUES (N'NombreLineaRepetido', N'Ya existe una línea con el nombre indicado.')
INSERT [dbo].[TBL_EXCEPCION] ([CODIGO], [MENSAJE]) VALUES (N'PermisosConPuesto', N'El permiso tiene un puesto asignado')
INSERT [dbo].[TBL_EXCEPCION] ([CODIGO], [MENSAJE]) VALUES (N'PermisoYaIngreso', N'Permiso ya fue asignado')
INSERT [dbo].[TBL_EXCEPCION] ([CODIGO], [MENSAJE]) VALUES (N'PuestoConPermiso', N'El puesto, tiene asignado permisos')
INSERT [dbo].[TBL_EXCEPCION] ([CODIGO], [MENSAJE]) VALUES (N'TrenNotAsocLinea', N'No hay trenes asociados a esta linea')
SET IDENTITY_INSERT [dbo].[TBL_HISTORIALVIAJES] ON 

INSERT [dbo].[TBL_HISTORIALVIAJES] ([Id], [LINEA], [TREN], [ESTACION_ANTERIOR], [ESTACION_SIGUIENTE], [TIEMPO_ESTIMADO], [ACCION], [FECHA]) VALUES (7, N'Roja', N'123 - Pendolio', N'Prv: Heredia', N'Sig: Autopista José María Castro - 12:49:00', N'0:3.25', N'Inicio Tren', N'09/08/2016 12:45:43')
INSERT [dbo].[TBL_HISTORIALVIAJES] ([Id], [LINEA], [TREN], [ESTACION_ANTERIOR], [ESTACION_SIGUIENTE], [TIEMPO_ESTIMADO], [ACCION], [FECHA]) VALUES (8, N'Roja', N'123 - Pendolio', N'Prv: Cartago', N'Sig: Aeropuerto - 12:57:18', N'0:4.27', N'Se detuvo Tren', N'09/08/2016 12:52:56')
INSERT [dbo].[TBL_HISTORIALVIAJES] ([Id], [LINEA], [TREN], [ESTACION_ANTERIOR], [ESTACION_SIGUIENTE], [TIEMPO_ESTIMADO], [ACCION], [FECHA]) VALUES (9, N'Roja', N'123 - Pendolio', N'Prv: Cartago', N'Sig: Aeropuerto - 10:04:24', N'0:8.3', N'Inicio Tren', N'11/08/2016 9:56:24')
INSERT [dbo].[TBL_HISTORIALVIAJES] ([Id], [LINEA], [TREN], [ESTACION_ANTERIOR], [ESTACION_SIGUIENTE], [TIEMPO_ESTIMADO], [ACCION], [FECHA]) VALUES (10, N'Amarilla', N'196 - Elettro', N'Prox: San José', N'Sig: Orotina - 16:10:58.0500000', N'0:12.9', N'Inicio Tren', N'19/08/2016 15:58:51')
INSERT [dbo].[TBL_HISTORIALVIAJES] ([Id], [LINEA], [TREN], [ESTACION_ANTERIOR], [ESTACION_SIGUIENTE], [TIEMPO_ESTIMADO], [ACCION], [FECHA]) VALUES (11, N'Roja', N'123 - Pendolio', N'Prox: San José', N'Sig: Aeropuerto - 07:57:18', N'0:3.43', N'Inicio Tren', N'19/08/2016 7:53:36')
INSERT [dbo].[TBL_HISTORIALVIAJES] ([Id], [LINEA], [TREN], [ESTACION_ANTERIOR], [ESTACION_SIGUIENTE], [TIEMPO_ESTIMADO], [ACCION], [FECHA]) VALUES (12, N'Amarilla', N'196 - Elettro', N'Prox: San José', N'Sig: Orotina - 08:02:04.9200000', N'0:4.40', N'Inicio Tren', N'19/08/2016 8:01:49')
INSERT [dbo].[TBL_HISTORIALVIAJES] ([Id], [LINEA], [TREN], [ESTACION_ANTERIOR], [ESTACION_SIGUIENTE], [TIEMPO_ESTIMADO], [ACCION], [FECHA]) VALUES (13, N'Amarilla', N'196 - Elettro', N'Prox: San José', N'Sig: Orotina - 08:02:04.9200000', N'0:4.40', N'Se detuvo Tren', N'19/08/2016 8:01:55')
INSERT [dbo].[TBL_HISTORIALVIAJES] ([Id], [LINEA], [TREN], [ESTACION_ANTERIOR], [ESTACION_SIGUIENTE], [TIEMPO_ESTIMADO], [ACCION], [FECHA]) VALUES (14, N'NEWNEW', N'1234 - trensito', N'Prox: Cartago', N'Sig: Aeropuerto - 23:59:00', N'15:49.5', N'Se detuvo Tren', N'19/08/2016 8:10:15')
INSERT [dbo].[TBL_HISTORIALVIAJES] ([Id], [LINEA], [TREN], [ESTACION_ANTERIOR], [ESTACION_SIGUIENTE], [TIEMPO_ESTIMADO], [ACCION], [FECHA]) VALUES (15, N'Roja', N'123 - Pendolio', N'Prox: Aeropuerto', N'Sig: Heredia - 09:21:42', N'0:5.36', N'Se detuvo Tren', N'19/08/2016 9:18:01')
INSERT [dbo].[TBL_HISTORIALVIAJES] ([Id], [LINEA], [TREN], [ESTACION_ANTERIOR], [ESTACION_SIGUIENTE], [TIEMPO_ESTIMADO], [ACCION], [FECHA]) VALUES (16, N'Amarilla', N'196 - Elettro', N'Prox: San José', N'Sig: Orotina - 11:42:52.1400000', N'0:9.16', N'Inicio Tren', N'19/08/2016 11:33:41')
INSERT [dbo].[TBL_HISTORIALVIAJES] ([Id], [LINEA], [TREN], [ESTACION_ANTERIOR], [ESTACION_SIGUIENTE], [TIEMPO_ESTIMADO], [ACCION], [FECHA]) VALUES (17, N'Amarilla', N'196 - Elettro', N'Prox: San José', N'Sig: Orotina - 11:42:52.1400000', N'0:9.16', N'Se detuvo Tren', N'19/08/2016 11:34:18')
INSERT [dbo].[TBL_HISTORIALVIAJES] ([Id], [LINEA], [TREN], [ESTACION_ANTERIOR], [ESTACION_SIGUIENTE], [TIEMPO_ESTIMADO], [ACCION], [FECHA]) VALUES (18, N'Roja', N'123 - Pendolio', N'Prox: Heredia', N'Sig: San José - 13:02:36', N'0:0.14', N'Inicio Tren', N'21/08/2016 13:03:27')
INSERT [dbo].[TBL_HISTORIALVIAJES] ([Id], [LINEA], [TREN], [ESTACION_ANTERIOR], [ESTACION_SIGUIENTE], [TIEMPO_ESTIMADO], [ACCION], [FECHA]) VALUES (19, N'Roja', N'123 - Pendolio', N'Prox: Heredia', N'Sig: San José - 13:02:36', N'0:0.14', N'Se detuvo Tren', N'21/08/2016 13:03:41')
INSERT [dbo].[TBL_HISTORIALVIAJES] ([Id], [LINEA], [TREN], [ESTACION_ANTERIOR], [ESTACION_SIGUIENTE], [TIEMPO_ESTIMADO], [ACCION], [FECHA]) VALUES (20, N'Roja', N'123 - Pendolio', N'Prox: Heredia', N'Sig: San José - 10:35:00', N'0:0.22', N'Inicio Tren', N'31/08/2016 10:35:45')
SET IDENTITY_INSERT [dbo].[TBL_HISTORIALVIAJES] OFF
SET IDENTITY_INSERT [dbo].[TBL_HORARIOS] ON 

INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (241, N'St: 1 - 07:00:00', N'St: 1 - 07:01:00', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (242, N'St: 2 - 07:07:18', N'St: 2 - 07:08:18', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (243, N'St: 3 - 07:14:36', N'St: 3 - 07:15:36', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (244, N'St: 4 - 07:24:00', N'St: 4 - 07:25:00', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (245, N'St: 1 - 07:25:00', N'St: 1 - 07:26:00', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (246, N'St: 2 - 07:34:24', N'St: 2 - 07:35:24', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (247, N'St: 3 - 07:41:42', N'St: 3 - 07:42:42', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (248, N'St: 4 - 07:49:00', N'St: 4 - 07:50:00', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (249, N'St: 1 - 07:50:00', N'St: 1 - 07:51:00', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (250, N'St: 2 - 07:57:18', N'St: 2 - 07:58:18', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (251, N'St: 3 - 08:04:36', N'St: 3 - 08:05:36', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (252, N'St: 4 - 08:14:00', N'St: 4 - 08:15:00', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (253, N'St: 1 - 08:15:00', N'St: 1 - 08:16:00', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (254, N'St: 2 - 08:24:24', N'St: 2 - 08:25:24', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (255, N'St: 3 - 08:31:42', N'St: 3 - 08:32:42', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (256, N'St: 4 - 08:39:00', N'St: 4 - 08:40:00', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (257, N'St: 1 - 08:40:00', N'St: 1 - 08:41:00', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (258, N'St: 2 - 08:47:18', N'St: 2 - 08:48:18', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (259, N'St: 3 - 08:54:36', N'St: 3 - 08:55:36', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (260, N'St: 4 - 09:04:00', N'St: 4 - 09:05:00', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (261, N'St: 1 - 09:05:00', N'St: 1 - 09:06:00', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (262, N'St: 2 - 09:14:24', N'St: 2 - 09:15:24', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (263, N'St: 3 - 09:21:42', N'St: 3 - 09:22:42', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (264, N'St: 4 - 09:29:00', N'St: 4 - 09:30:00', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (265, N'St: 1 - 09:30:00', N'St: 1 - 09:31:00', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (266, N'St: 2 - 09:37:18', N'St: 2 - 09:38:18', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (267, N'St: 3 - 09:44:36', N'St: 3 - 09:45:36', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (268, N'St: 4 - 09:54:00', N'St: 4 - 09:55:00', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (269, N'St: 1 - 09:55:00', N'St: 1 - 09:56:00', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (270, N'St: 2 - 10:04:24', N'St: 2 - 10:05:24', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (271, N'St: 3 - 10:11:42', N'St: 3 - 10:12:42', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (272, N'St: 4 - 10:19:00', N'St: 4 - 10:20:00', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (273, N'St: 1 - 10:20:00', N'St: 1 - 10:21:00', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (274, N'St: 2 - 10:27:18', N'St: 2 - 10:28:18', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (275, N'St: 3 - 10:34:36', N'St: 3 - 10:35:36', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (276, N'St: 4 - 10:44:00', N'St: 4 - 10:45:00', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (277, N'St: 1 - 10:45:00', N'St: 1 - 10:46:00', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (278, N'St: 2 - 10:54:24', N'St: 2 - 10:55:24', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (279, N'St: 3 - 11:01:42', N'St: 3 - 11:02:42', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (280, N'St: 4 - 11:09:00', N'St: 4 - 11:10:00', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (281, N'St: 1 - 11:10:00', N'St: 1 - 11:11:00', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (282, N'St: 2 - 11:17:18', N'St: 2 - 11:18:18', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (283, N'St: 3 - 11:24:36', N'St: 3 - 11:25:36', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (284, N'St: 4 - 11:34:00', N'St: 4 - 11:35:00', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (285, N'St: 1 - 11:35:00', N'St: 1 - 11:36:00', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (286, N'St: 2 - 11:44:24', N'St: 2 - 11:45:24', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (287, N'St: 3 - 11:51:42', N'St: 3 - 11:52:42', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (288, N'St: 4 - 11:59:00', N'St: 4 - 12:00:00', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (289, N'St: 1 - 12:00:00', N'St: 1 - 12:01:00', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (290, N'St: 2 - 12:07:18', N'St: 2 - 12:08:18', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (291, N'St: 3 - 12:14:36', N'St: 3 - 12:15:36', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (292, N'St: 4 - 12:24:00', N'St: 4 - 12:25:00', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (293, N'St: 1 - 12:25:00', N'St: 1 - 12:26:00', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (294, N'St: 2 - 12:34:24', N'St: 2 - 12:35:24', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (295, N'St: 3 - 12:41:42', N'St: 3 - 12:42:42', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (296, N'St: 4 - 12:49:00', N'St: 4 - 12:50:00', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (297, N'St: 1 - 12:50:00', N'St: 1 - 12:51:00', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (298, N'St: 2 - 12:57:18', N'St: 2 - 12:58:18', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (299, N'St: 3 - 13:04:36', N'St: 3 - 13:05:36', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (300, N'St: 4 - 13:14:00', N'St: 4 - 13:15:00', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (301, N'St: 1 - 13:15:00', N'St: 1 - 13:16:00', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (302, N'St: 2 - 13:24:24', N'St: 2 - 13:25:24', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (303, N'St: 3 - 13:31:42', N'St: 3 - 13:32:42', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (304, N'St: 4 - 13:39:00', N'St: 4 - 13:40:00', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (305, N'St: 1 - 13:40:00', N'St: 1 - 13:41:00', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (306, N'St: 2 - 13:47:18', N'St: 2 - 13:48:18', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (307, N'St: 3 - 13:54:36', N'St: 3 - 13:55:36', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (308, N'St: 4 - 14:04:00', N'St: 4 - 14:05:00', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (309, N'St: 1 - 14:05:00', N'St: 1 - 14:06:00', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (310, N'St: 2 - 14:14:24', N'St: 2 - 14:15:24', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (311, N'St: 3 - 14:21:42', N'St: 3 - 14:22:42', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (312, N'St: 4 - 14:29:00', N'St: 4 - 14:30:00', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (313, N'St: 1 - 14:30:00', N'St: 1 - 14:31:00', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (314, N'St: 2 - 14:37:18', N'St: 2 - 14:38:18', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (315, N'St: 3 - 14:44:36', N'St: 3 - 14:45:36', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (316, N'St: 4 - 14:54:00', N'St: 4 - 14:55:00', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (317, N'St: 1 - 14:55:00', N'St: 1 - 14:56:00', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (318, N'St: 2 - 15:04:24', N'St: 2 - 15:05:24', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (319, N'St: 3 - 15:11:42', N'St: 3 - 15:12:42', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (320, N'St: 4 - 15:19:00', N'St: 4 - 15:20:00', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (321, N'St: 1 - 15:20:00', N'St: 1 - 15:21:00', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (322, N'St: 2 - 15:27:18', N'St: 2 - 15:28:18', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (323, N'St: 3 - 15:34:36', N'St: 3 - 15:35:36', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (324, N'St: 4 - 15:44:00', N'St: 4 - 15:45:00', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (325, N'St: 1 - 15:45:00', N'St: 1 - 15:46:00', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (326, N'St: 2 - 15:54:24', N'St: 2 - 15:55:24', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (327, N'St: 3 - 16:01:42', N'St: 3 - 16:02:42', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (328, N'St: 4 - 16:09:00', N'St: 4 - 16:10:00', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (329, N'St: 1 - 16:10:00', N'St: 1 - 16:11:00', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (330, N'St: 2 - 16:17:18', N'St: 2 - 16:18:18', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (331, N'St: 3 - 16:24:36', N'St: 3 - 16:25:36', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (332, N'St: 4 - 16:34:00', N'St: 4 - 16:35:00', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (333, N'St: 1 - 16:35:00', N'St: 1 - 16:36:00', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (334, N'St: 2 - 16:44:24', N'St: 2 - 16:45:24', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (335, N'St: 3 - 16:51:42', N'St: 3 - 16:52:42', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (336, N'St: 4 - 16:59:00', N'St: 4 - 17:00:00', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (337, N'St: 1 - 17:00:00', N'St: 1 - 17:01:00', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (338, N'St: 2 - 17:07:18', N'St: 2 - 17:08:18', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (339, N'St: 3 - 17:14:36', N'St: 3 - 17:15:36', N'123')
GO
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (340, N'St: 4 - 17:24:00', N'St: 4 - 17:25:00', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (341, N'St: 1 - 17:25:00', N'St: 1 - 17:26:00', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (342, N'St: 2 - 17:34:24', N'St: 2 - 17:35:24', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (343, N'St: 3 - 17:41:42', N'St: 3 - 17:42:42', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (344, N'St: 4 - 17:49:00', N'St: 4 - 17:50:00', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (345, N'St: 1 - 17:50:00', N'St: 1 - 17:51:00', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (346, N'St: 2 - 17:57:18', N'St: 2 - 17:58:18', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (347, N'St: 3 - 18:04:36', N'St: 3 - 18:05:36', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (348, N'St: 4 - 18:14:00', N'St: 4 - 18:15:00', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (349, N'St: 1 - 18:15:00', N'St: 1 - 18:16:00', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (350, N'St: 2 - 18:24:24', N'St: 2 - 18:25:24', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (351, N'St: 3 - 18:31:42', N'St: 3 - 18:32:42', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (352, N'St: 4 - 18:39:00', N'St: 4 - 18:40:00', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (353, N'St: 1 - 18:40:00', N'St: 1 - 18:41:00', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (354, N'St: 2 - 18:47:18', N'St: 2 - 18:48:18', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (355, N'St: 3 - 18:54:36', N'St: 3 - 18:55:36', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (356, N'St: 4 - 19:04:00', N'St: 4 - 19:05:00', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (357, N'St: 1 - 19:05:00', N'St: 1 - 19:06:00', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (358, N'St: 2 - 19:14:24', N'St: 2 - 19:15:24', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (359, N'St: 3 - 19:21:42', N'St: 3 - 19:22:42', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (360, N'St: 4 - 19:29:00', N'St: 4 - 19:30:00', N'123')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (361, N'St: 1 - 07:00:00', N'St: 1 - 07:01:00', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (362, N'St: 2 - 07:09:24', N'St: 2 - 07:10:24', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (363, N'St: 3 - 07:16:42', N'St: 3 - 07:17:42', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (364, N'St: 4 - 07:24:00', N'St: 4 - 07:25:00', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (365, N'St: 1 - 07:25:00', N'St: 1 - 07:26:00', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (366, N'St: 2 - 07:32:18', N'St: 2 - 07:33:18', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (367, N'St: 3 - 07:39:36', N'St: 3 - 07:40:36', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (368, N'St: 4 - 07:49:00', N'St: 4 - 07:50:00', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (369, N'St: 1 - 07:50:00', N'St: 1 - 07:51:00', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (370, N'St: 2 - 07:59:24', N'St: 2 - 08:00:24', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (371, N'St: 3 - 08:06:42', N'St: 3 - 08:07:42', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (372, N'St: 4 - 08:14:00', N'St: 4 - 08:15:00', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (373, N'St: 1 - 08:15:00', N'St: 1 - 08:16:00', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (374, N'St: 2 - 08:22:18', N'St: 2 - 08:23:18', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (375, N'St: 3 - 08:29:36', N'St: 3 - 08:30:36', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (376, N'St: 4 - 08:39:00', N'St: 4 - 08:40:00', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (377, N'St: 1 - 08:40:00', N'St: 1 - 08:41:00', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (378, N'St: 2 - 08:49:24', N'St: 2 - 08:50:24', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (379, N'St: 3 - 08:56:42', N'St: 3 - 08:57:42', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (380, N'St: 4 - 09:04:00', N'St: 4 - 09:05:00', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (381, N'St: 1 - 09:05:00', N'St: 1 - 09:06:00', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (382, N'St: 2 - 09:12:18', N'St: 2 - 09:13:18', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (383, N'St: 3 - 09:19:36', N'St: 3 - 09:20:36', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (384, N'St: 4 - 09:29:00', N'St: 4 - 09:30:00', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (385, N'St: 1 - 09:30:00', N'St: 1 - 09:31:00', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (386, N'St: 2 - 09:39:24', N'St: 2 - 09:40:24', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (387, N'St: 3 - 09:46:42', N'St: 3 - 09:47:42', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (388, N'St: 4 - 09:54:00', N'St: 4 - 09:55:00', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (389, N'St: 1 - 09:55:00', N'St: 1 - 09:56:00', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (390, N'St: 2 - 10:02:18', N'St: 2 - 10:03:18', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (391, N'St: 3 - 10:09:36', N'St: 3 - 10:10:36', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (392, N'St: 4 - 10:19:00', N'St: 4 - 10:20:00', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (393, N'St: 1 - 10:20:00', N'St: 1 - 10:21:00', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (394, N'St: 2 - 10:29:24', N'St: 2 - 10:30:24', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (395, N'St: 3 - 10:36:42', N'St: 3 - 10:37:42', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (396, N'St: 4 - 10:44:00', N'St: 4 - 10:45:00', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (397, N'St: 1 - 10:45:00', N'St: 1 - 10:46:00', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (398, N'St: 2 - 10:52:18', N'St: 2 - 10:53:18', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (399, N'St: 3 - 10:59:36', N'St: 3 - 11:00:36', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (400, N'St: 4 - 11:09:00', N'St: 4 - 11:10:00', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (401, N'St: 1 - 11:10:00', N'St: 1 - 11:11:00', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (402, N'St: 2 - 11:19:24', N'St: 2 - 11:20:24', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (403, N'St: 3 - 11:26:42', N'St: 3 - 11:27:42', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (404, N'St: 4 - 11:34:00', N'St: 4 - 11:35:00', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (405, N'St: 1 - 11:35:00', N'St: 1 - 11:36:00', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (406, N'St: 2 - 11:42:18', N'St: 2 - 11:43:18', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (407, N'St: 3 - 11:49:36', N'St: 3 - 11:50:36', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (408, N'St: 4 - 11:59:00', N'St: 4 - 12:00:00', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (409, N'St: 1 - 12:00:00', N'St: 1 - 12:01:00', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (410, N'St: 2 - 12:09:24', N'St: 2 - 12:10:24', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (411, N'St: 3 - 12:16:42', N'St: 3 - 12:17:42', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (412, N'St: 4 - 12:24:00', N'St: 4 - 12:25:00', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (413, N'St: 1 - 12:25:00', N'St: 1 - 12:26:00', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (414, N'St: 2 - 12:32:18', N'St: 2 - 12:33:18', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (415, N'St: 3 - 12:39:36', N'St: 3 - 12:40:36', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (416, N'St: 4 - 12:49:00', N'St: 4 - 12:50:00', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (417, N'St: 1 - 12:50:00', N'St: 1 - 12:51:00', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (418, N'St: 2 - 12:59:24', N'St: 2 - 13:00:24', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (419, N'St: 3 - 13:06:42', N'St: 3 - 13:07:42', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (420, N'St: 4 - 13:14:00', N'St: 4 - 13:15:00', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (421, N'St: 1 - 13:15:00', N'St: 1 - 13:16:00', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (422, N'St: 2 - 13:22:18', N'St: 2 - 13:23:18', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (423, N'St: 3 - 13:29:36', N'St: 3 - 13:30:36', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (424, N'St: 4 - 13:39:00', N'St: 4 - 13:40:00', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (425, N'St: 1 - 13:40:00', N'St: 1 - 13:41:00', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (426, N'St: 2 - 13:49:24', N'St: 2 - 13:50:24', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (427, N'St: 3 - 13:56:42', N'St: 3 - 13:57:42', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (428, N'St: 4 - 14:04:00', N'St: 4 - 14:05:00', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (429, N'St: 1 - 14:05:00', N'St: 1 - 14:06:00', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (430, N'St: 2 - 14:12:18', N'St: 2 - 14:13:18', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (431, N'St: 3 - 14:19:36', N'St: 3 - 14:20:36', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (432, N'St: 4 - 14:29:00', N'St: 4 - 14:30:00', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (433, N'St: 1 - 14:30:00', N'St: 1 - 14:31:00', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (434, N'St: 2 - 14:39:24', N'St: 2 - 14:40:24', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (435, N'St: 3 - 14:46:42', N'St: 3 - 14:47:42', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (436, N'St: 4 - 14:54:00', N'St: 4 - 14:55:00', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (437, N'St: 1 - 14:55:00', N'St: 1 - 14:56:00', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (438, N'St: 2 - 15:02:18', N'St: 2 - 15:03:18', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (439, N'St: 3 - 15:09:36', N'St: 3 - 15:10:36', N'208')
GO
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (440, N'St: 4 - 15:19:00', N'St: 4 - 15:20:00', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (441, N'St: 1 - 15:20:00', N'St: 1 - 15:21:00', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (442, N'St: 2 - 15:29:24', N'St: 2 - 15:30:24', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (443, N'St: 3 - 15:36:42', N'St: 3 - 15:37:42', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (444, N'St: 4 - 15:44:00', N'St: 4 - 15:45:00', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (445, N'St: 1 - 15:45:00', N'St: 1 - 15:46:00', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (446, N'St: 2 - 15:52:18', N'St: 2 - 15:53:18', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (447, N'St: 3 - 15:59:36', N'St: 3 - 16:00:36', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (448, N'St: 4 - 16:09:00', N'St: 4 - 16:10:00', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (449, N'St: 1 - 16:10:00', N'St: 1 - 16:11:00', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (450, N'St: 2 - 16:19:24', N'St: 2 - 16:20:24', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (451, N'St: 3 - 16:26:42', N'St: 3 - 16:27:42', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (452, N'St: 4 - 16:34:00', N'St: 4 - 16:35:00', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (453, N'St: 1 - 16:35:00', N'St: 1 - 16:36:00', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (454, N'St: 2 - 16:42:18', N'St: 2 - 16:43:18', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (455, N'St: 3 - 16:49:36', N'St: 3 - 16:50:36', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (456, N'St: 4 - 16:59:00', N'St: 4 - 17:00:00', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (457, N'St: 1 - 17:00:00', N'St: 1 - 17:01:00', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (458, N'St: 2 - 17:09:24', N'St: 2 - 17:10:24', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (459, N'St: 3 - 17:16:42', N'St: 3 - 17:17:42', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (460, N'St: 4 - 17:24:00', N'St: 4 - 17:25:00', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (461, N'St: 1 - 17:25:00', N'St: 1 - 17:26:00', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (462, N'St: 2 - 17:32:18', N'St: 2 - 17:33:18', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (463, N'St: 3 - 17:39:36', N'St: 3 - 17:40:36', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (464, N'St: 4 - 17:49:00', N'St: 4 - 17:50:00', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (465, N'St: 1 - 17:50:00', N'St: 1 - 17:51:00', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (466, N'St: 2 - 17:59:24', N'St: 2 - 18:00:24', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (467, N'St: 3 - 18:06:42', N'St: 3 - 18:07:42', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (468, N'St: 4 - 18:14:00', N'St: 4 - 18:15:00', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (469, N'St: 1 - 18:15:00', N'St: 1 - 18:16:00', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (470, N'St: 2 - 18:22:18', N'St: 2 - 18:23:18', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (471, N'St: 3 - 18:29:36', N'St: 3 - 18:30:36', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (472, N'St: 4 - 18:39:00', N'St: 4 - 18:40:00', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (473, N'St: 1 - 18:40:00', N'St: 1 - 18:41:00', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (474, N'St: 2 - 18:49:24', N'St: 2 - 18:50:24', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (475, N'St: 3 - 18:56:42', N'St: 3 - 18:57:42', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (476, N'St: 4 - 19:04:00', N'St: 4 - 19:05:00', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (477, N'St: 1 - 19:05:00', N'St: 1 - 19:06:00', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (478, N'St: 2 - 19:12:18', N'St: 2 - 19:13:18', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (479, N'St: 3 - 19:19:36', N'St: 3 - 19:20:36', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (480, N'St: 4 - 19:29:00', N'St: 4 - 19:30:00', N'208')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (481, N'1:00 AM', N'2:00 AM', N'2016-08-28')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (482, N'2:00 AM', N'3:00 AM', N'2016-08-28')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (483, N'3:00 AM', N'4:00 AM', N'2016-08-28')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (484, N'4:00 AM', N'5:00 AM', N'2016-08-28')
INSERT [dbo].[TBL_HORARIOS] ([ID], [HORA_SALIDA], [HORA_ARRIBO], [FECHA_SALIDA]) VALUES (485, N'6:00 AM', N'7:00 AM', N'28/8/2016')
SET IDENTITY_INSERT [dbo].[TBL_HORARIOS] OFF
INSERT [dbo].[TBL_INCIDENCIA] ([CODIGO], [DESCRIPCION], [DETALLE], [TIPO]) VALUES (N'001', N'Obstruccion en la via', N'Obstruccion en la via', N'Incidencia')
INSERT [dbo].[TBL_INCIDENCIA] ([CODIGO], [DESCRIPCION], [DETALLE], [TIPO]) VALUES (N'002', N'Reparaciones en el sistema', N'Reparaciones en el sistema', N'Incidencia')
INSERT [dbo].[TBL_INCIDENCIA] ([CODIGO], [DESCRIPCION], [DETALLE], [TIPO]) VALUES (N'003', N'Daños en la infraestructura', N'Daños en la infraestructura', N'Incidencia')
INSERT [dbo].[TBL_INCIDENCIA] ([CODIGO], [DESCRIPCION], [DETALLE], [TIPO]) VALUES (N'InvalidCode', N'Travel - Advertencia', N'Hola Usuario! Tenemos un problema... Código de confirmación no válida.', N'Notificar')
INSERT [dbo].[TBL_INCIDENCIA] ([CODIGO], [DESCRIPCION], [DETALLE], [TIPO]) VALUES (N'RecoveryPassword', N'Travel - Recuperación de contraseña', N'Hola Usuario! Su nuevo código es: ', N'Notificar')
INSERT [dbo].[TBL_INCIDENCIA] ([CODIGO], [DESCRIPCION], [DETALLE], [TIPO]) VALUES (N'WelcomeHome', N'Travel - Bienvenido', N'Hola Usuario! Bienvenido a Travel. Su contraseña es: ', N'Notificar')
SET IDENTITY_INSERT [dbo].[TBL_LINEA] ON 

INSERT [dbo].[TBL_LINEA] ([COD_LINEA], [NOMBRE], [COLOR], [DISTANCIA], [ESTADO], [ESTACION_INICIAL], [ESTACION_FINAL], [HORA_TRABAJO], [HORA_INICIO], [CANT_ESTACIONES], [COSTO_CIRCULACION], [COD_CENTRAL], [DURACION_RECORRIDO]) VALUES (11, N'Azul', N'Blue', 34, N'Abierta', 15, 19, 12, CAST(N'05:00:00' AS Time), NULL, CAST(1000.00 AS Decimal(18, 2)), 21, 24)
INSERT [dbo].[TBL_LINEA] ([COD_LINEA], [NOMBRE], [COLOR], [DISTANCIA], [ESTADO], [ESTACION_INICIAL], [ESTACION_FINAL], [HORA_TRABAJO], [HORA_INICIO], [CANT_ESTACIONES], [COSTO_CIRCULACION], [COD_CENTRAL], [DURACION_RECORRIDO]) VALUES (12, N'Roja', N'Red', 40, N'Abierta', 17, 23, 12, CAST(N'08:00:00' AS Time), NULL, CAST(1000.00 AS Decimal(18, 2)), 21, 0)
INSERT [dbo].[TBL_LINEA] ([COD_LINEA], [NOMBRE], [COLOR], [DISTANCIA], [ESTADO], [ESTACION_INICIAL], [ESTACION_FINAL], [HORA_TRABAJO], [HORA_INICIO], [CANT_ESTACIONES], [COSTO_CIRCULACION], [COD_CENTRAL], [DURACION_RECORRIDO]) VALUES (13, N'Amarilla', N'Yellow', 61, N'Abierta', 15, 16, 12, CAST(N'07:00:00' AS Time), NULL, CAST(1000.00 AS Decimal(18, 2)), 21, 30)
INSERT [dbo].[TBL_LINEA] ([COD_LINEA], [NOMBRE], [COLOR], [DISTANCIA], [ESTADO], [ESTACION_INICIAL], [ESTACION_FINAL], [HORA_TRABAJO], [HORA_INICIO], [CANT_ESTACIONES], [COSTO_CIRCULACION], [COD_CENTRAL], [DURACION_RECORRIDO]) VALUES (16, N'Nueva Linea', N'Green', 20, N'Abierta', 17, 18, 12, CAST(N'07:00:00' AS Time), NULL, CAST(1000.00 AS Decimal(18, 2)), 21, 0)
SET IDENTITY_INSERT [dbo].[TBL_LINEA] OFF
SET IDENTITY_INSERT [dbo].[TBL_PERMISO] ON 

INSERT [dbo].[TBL_PERMISO] ([CODIGO], [DESCRIPCION]) VALUES (1, N'Gestión de usuarios')
INSERT [dbo].[TBL_PERMISO] ([CODIGO], [DESCRIPCION]) VALUES (2, N'Bitácora de acciones')
INSERT [dbo].[TBL_PERMISO] ([CODIGO], [DESCRIPCION]) VALUES (3, N'Consultar tiempo de baja de la linea')
INSERT [dbo].[TBL_PERMISO] ([CODIGO], [DESCRIPCION]) VALUES (4, N'Consultar porcentaje de capacidad instalada')
INSERT [dbo].[TBL_PERMISO] ([CODIGO], [DESCRIPCION]) VALUES (5, N'Consultar historial de compras')
INSERT [dbo].[TBL_PERMISO] ([CODIGO], [DESCRIPCION]) VALUES (6, N'Consultar ingresos')
INSERT [dbo].[TBL_PERMISO] ([CODIGO], [DESCRIPCION]) VALUES (7, N'Consultar cantidad de pasajeros por estacion')
INSERT [dbo].[TBL_PERMISO] ([CODIGO], [DESCRIPCION]) VALUES (8, N'Consultar tiempo de trabajo de la linea')
INSERT [dbo].[TBL_PERMISO] ([CODIGO], [DESCRIPCION]) VALUES (9, N'Consultar capacidad del tren por estacion')
INSERT [dbo].[TBL_PERMISO] ([CODIGO], [DESCRIPCION]) VALUES (10, N'Gestion de clientes')
INSERT [dbo].[TBL_PERMISO] ([CODIGO], [DESCRIPCION]) VALUES (11, N'Dashboard')
INSERT [dbo].[TBL_PERMISO] ([CODIGO], [DESCRIPCION]) VALUES (12, N'Gestión de empresa')
INSERT [dbo].[TBL_PERMISO] ([CODIGO], [DESCRIPCION]) VALUES (13, N'Gestión de estaciones')
INSERT [dbo].[TBL_PERMISO] ([CODIGO], [DESCRIPCION]) VALUES (14, N'Gestión de líneas')
INSERT [dbo].[TBL_PERMISO] ([CODIGO], [DESCRIPCION]) VALUES (15, N'Visualizar mapa')
INSERT [dbo].[TBL_PERMISO] ([CODIGO], [DESCRIPCION]) VALUES (16, N'Control de permisos')
INSERT [dbo].[TBL_PERMISO] ([CODIGO], [DESCRIPCION]) VALUES (17, N'Gestión de puestos')
INSERT [dbo].[TBL_PERMISO] ([CODIGO], [DESCRIPCION]) VALUES (18, N'Gestión de trenes')
INSERT [dbo].[TBL_PERMISO] ([CODIGO], [DESCRIPCION]) VALUES (19, N'Gestión de tipos de tiquete')
INSERT [dbo].[TBL_PERMISO] ([CODIGO], [DESCRIPCION]) VALUES (20, N'Gestión de vagones')
INSERT [dbo].[TBL_PERMISO] ([CODIGO], [DESCRIPCION]) VALUES (21, N'Gestion de ventas')
INSERT [dbo].[TBL_PERMISO] ([CODIGO], [DESCRIPCION]) VALUES (26, N'Gestión de asientos')
INSERT [dbo].[TBL_PERMISO] ([CODIGO], [DESCRIPCION]) VALUES (27, N'Gestión de convenios')
INSERT [dbo].[TBL_PERMISO] ([CODIGO], [DESCRIPCION]) VALUES (28, N'Modificar horario de la línea')
INSERT [dbo].[TBL_PERMISO] ([CODIGO], [DESCRIPCION]) VALUES (29, N'Notificar eventualidades a clientes')
INSERT [dbo].[TBL_PERMISO] ([CODIGO], [DESCRIPCION]) VALUES (30, N'Modificar precio de tiquetes')
INSERT [dbo].[TBL_PERMISO] ([CODIGO], [DESCRIPCION]) VALUES (31, N'Consultar historial de vagones')
INSERT [dbo].[TBL_PERMISO] ([CODIGO], [DESCRIPCION]) VALUES (32, N'Iniciar tren')
INSERT [dbo].[TBL_PERMISO] ([CODIGO], [DESCRIPCION]) VALUES (33, N'Detener tren')
SET IDENTITY_INSERT [dbo].[TBL_PERMISO] OFF
INSERT [dbo].[TBL_PERMISO_PUESTO] ([COD_PERMISO], [COD_PUESTO]) VALUES (1, 1)
INSERT [dbo].[TBL_PERMISO_PUESTO] ([COD_PERMISO], [COD_PUESTO]) VALUES (2, 1)
INSERT [dbo].[TBL_PERMISO_PUESTO] ([COD_PERMISO], [COD_PUESTO]) VALUES (3, 1)
INSERT [dbo].[TBL_PERMISO_PUESTO] ([COD_PERMISO], [COD_PUESTO]) VALUES (4, 1)
INSERT [dbo].[TBL_PERMISO_PUESTO] ([COD_PERMISO], [COD_PUESTO]) VALUES (5, 1)
INSERT [dbo].[TBL_PERMISO_PUESTO] ([COD_PERMISO], [COD_PUESTO]) VALUES (6, 1)
INSERT [dbo].[TBL_PERMISO_PUESTO] ([COD_PERMISO], [COD_PUESTO]) VALUES (6, 8)
INSERT [dbo].[TBL_PERMISO_PUESTO] ([COD_PERMISO], [COD_PUESTO]) VALUES (7, 1)
INSERT [dbo].[TBL_PERMISO_PUESTO] ([COD_PERMISO], [COD_PUESTO]) VALUES (8, 1)
INSERT [dbo].[TBL_PERMISO_PUESTO] ([COD_PERMISO], [COD_PUESTO]) VALUES (9, 1)
INSERT [dbo].[TBL_PERMISO_PUESTO] ([COD_PERMISO], [COD_PUESTO]) VALUES (10, 1)
INSERT [dbo].[TBL_PERMISO_PUESTO] ([COD_PERMISO], [COD_PUESTO]) VALUES (10, 8)
INSERT [dbo].[TBL_PERMISO_PUESTO] ([COD_PERMISO], [COD_PUESTO]) VALUES (11, 1)
INSERT [dbo].[TBL_PERMISO_PUESTO] ([COD_PERMISO], [COD_PUESTO]) VALUES (11, 2)
INSERT [dbo].[TBL_PERMISO_PUESTO] ([COD_PERMISO], [COD_PUESTO]) VALUES (12, 1)
INSERT [dbo].[TBL_PERMISO_PUESTO] ([COD_PERMISO], [COD_PUESTO]) VALUES (13, 1)
INSERT [dbo].[TBL_PERMISO_PUESTO] ([COD_PERMISO], [COD_PUESTO]) VALUES (14, 1)
INSERT [dbo].[TBL_PERMISO_PUESTO] ([COD_PERMISO], [COD_PUESTO]) VALUES (15, 1)
INSERT [dbo].[TBL_PERMISO_PUESTO] ([COD_PERMISO], [COD_PUESTO]) VALUES (16, 1)
INSERT [dbo].[TBL_PERMISO_PUESTO] ([COD_PERMISO], [COD_PUESTO]) VALUES (17, 1)
INSERT [dbo].[TBL_PERMISO_PUESTO] ([COD_PERMISO], [COD_PUESTO]) VALUES (18, 1)
INSERT [dbo].[TBL_PERMISO_PUESTO] ([COD_PERMISO], [COD_PUESTO]) VALUES (19, 1)
INSERT [dbo].[TBL_PERMISO_PUESTO] ([COD_PERMISO], [COD_PUESTO]) VALUES (20, 1)
INSERT [dbo].[TBL_PERMISO_PUESTO] ([COD_PERMISO], [COD_PUESTO]) VALUES (21, 1)
INSERT [dbo].[TBL_PERMISO_PUESTO] ([COD_PERMISO], [COD_PUESTO]) VALUES (21, 8)
INSERT [dbo].[TBL_PERMISO_PUESTO] ([COD_PERMISO], [COD_PUESTO]) VALUES (26, 1)
INSERT [dbo].[TBL_PERMISO_PUESTO] ([COD_PERMISO], [COD_PUESTO]) VALUES (27, 1)
INSERT [dbo].[TBL_PERMISO_PUESTO] ([COD_PERMISO], [COD_PUESTO]) VALUES (28, 1)
INSERT [dbo].[TBL_PERMISO_PUESTO] ([COD_PERMISO], [COD_PUESTO]) VALUES (28, 2)
INSERT [dbo].[TBL_PERMISO_PUESTO] ([COD_PERMISO], [COD_PUESTO]) VALUES (29, 1)
INSERT [dbo].[TBL_PERMISO_PUESTO] ([COD_PERMISO], [COD_PUESTO]) VALUES (29, 2)
INSERT [dbo].[TBL_PERMISO_PUESTO] ([COD_PERMISO], [COD_PUESTO]) VALUES (30, 2)
INSERT [dbo].[TBL_PERMISO_PUESTO] ([COD_PERMISO], [COD_PUESTO]) VALUES (31, 1)
INSERT [dbo].[TBL_PERMISO_PUESTO] ([COD_PERMISO], [COD_PUESTO]) VALUES (32, 1)
INSERT [dbo].[TBL_PERMISO_PUESTO] ([COD_PERMISO], [COD_PUESTO]) VALUES (32, 2)
INSERT [dbo].[TBL_PERMISO_PUESTO] ([COD_PERMISO], [COD_PUESTO]) VALUES (33, 1)
INSERT [dbo].[TBL_PERMISO_PUESTO] ([COD_PERMISO], [COD_PUESTO]) VALUES (33, 2)
SET IDENTITY_INSERT [dbo].[TBL_PUESTO] ON 

INSERT [dbo].[TBL_PUESTO] ([ID], [NOMBRE]) VALUES (1, N'Administrador')
INSERT [dbo].[TBL_PUESTO] ([ID], [NOMBRE]) VALUES (2, N'Operador')
INSERT [dbo].[TBL_PUESTO] ([ID], [NOMBRE]) VALUES (8, N'Cajero')
SET IDENTITY_INSERT [dbo].[TBL_PUESTO] OFF
SET IDENTITY_INSERT [dbo].[TBL_RUTA] ON 

INSERT [dbo].[TBL_RUTA] ([ID], [LUGAR_SALIDA], [LUGAR_LLEGADA], [COD_LINEA], [NOMBRE]) VALUES (1, N'15', N'19', 11, N'San Jose-Heredia')
INSERT [dbo].[TBL_RUTA] ([ID], [LUGAR_SALIDA], [LUGAR_LLEGADA], [COD_LINEA], [NOMBRE]) VALUES (2, N'19', N'15', 11, N'Heredia-San Jose')
SET IDENTITY_INSERT [dbo].[TBL_RUTA] OFF
INSERT [dbo].[TBL_TARJETA] ([NUMERO], [TIPO], [FECHA_EXP], [CODIGO_SEG], [CED_CLIENTE], [TITULAR]) VALUES (N'1237539517896545', N'AmericanExpress', CAST(N'2369-12-17' AS Date), N'578', NULL, N'EDUARDO GUERRERO M.')
INSERT [dbo].[TBL_TARJETA] ([NUMERO], [TIPO], [FECHA_EXP], [CODIGO_SEG], [CED_CLIENTE], [TITULAR]) VALUES (N'1237896543579514', N'Master card', CAST(N'2021-07-17' AS Date), N'573', NULL, N'EDUARDO GUERRERO M.')
INSERT [dbo].[TBL_TARJETA] ([NUMERO], [TIPO], [FECHA_EXP], [CODIGO_SEG], [CED_CLIENTE], [TITULAR]) VALUES (N'1239879751236498', N'Master card', CAST(N'2020-11-16' AS Date), N'578', NULL, N'EDUARDO GUERRERO M')
SET IDENTITY_INSERT [dbo].[TBL_TIPO_TIQUETE] ON 

INSERT [dbo].[TBL_TIPO_TIQUETE] ([ID], [TIPO], [PRECIO]) VALUES (5, N'Adulto mayor', 900)
INSERT [dbo].[TBL_TIPO_TIQUETE] ([ID], [TIPO], [PRECIO]) VALUES (6, N'Adulto', 1000)
INSERT [dbo].[TBL_TIPO_TIQUETE] ([ID], [TIPO], [PRECIO]) VALUES (7, N'Ninno', 1000)
INSERT [dbo].[TBL_TIPO_TIQUETE] ([ID], [TIPO], [PRECIO]) VALUES (8, N'Discapacitado', 500)
INSERT [dbo].[TBL_TIPO_TIQUETE] ([ID], [TIPO], [PRECIO]) VALUES (14, N'VIP', 1600)
SET IDENTITY_INSERT [dbo].[TBL_TIPO_TIQUETE] OFF
SET IDENTITY_INSERT [dbo].[TBL_TREN] ON 

INSERT [dbo].[TBL_TREN] ([ID], [MODELO], [MATRICULA], [NOMBRE], [FECHA_COMPRA], [CANT_VAGONES], [COSTO], [DESCRIPCION], [ESTADO], [KILOMETRO], [COD_LINEA]) VALUES (23, N'YHT01', N'265', N'Llavero', N'12/03/2016', NULL, CAST(35100000.00 AS Decimal(18, 2)), N'Tren italiano. Puede alcanzar una velocidad máxima de 250km/h.', N'Activo', 0, 11)
INSERT [dbo].[TBL_TREN] ([ID], [MODELO], [MATRICULA], [NOMBRE], [FECHA_COMPRA], [CANT_VAGONES], [COSTO], [DESCRIPCION], [ESTADO], [KILOMETRO], [COD_LINEA]) VALUES (24, N'E505', N'196', N'Elettro', N'04/01/2016', NULL, CAST(49400000.00 AS Decimal(18, 2)), N'Tren japonés. Puede alcanzar una velocidad máxima de 350km/h.', N'Inactivo', 0, 13)
INSERT [dbo].[TBL_TREN] ([ID], [MODELO], [MATRICULA], [NOMBRE], [FECHA_COMPRA], [CANT_VAGONES], [COSTO], [DESCRIPCION], [ESTADO], [KILOMETRO], [COD_LINEA]) VALUES (25, N'KTX08', N'288', N'Renfe', N'29/03/2016', NULL, CAST(28200000.00 AS Decimal(18, 2)), N'Tren español. Puede alcanzar una velocidad máxima de 200km/h.', N'Inactivo', 24, 11)
INSERT [dbo].[TBL_TREN] ([ID], [MODELO], [MATRICULA], [NOMBRE], [FECHA_COMPRA], [CANT_VAGONES], [COSTO], [DESCRIPCION], [ESTADO], [KILOMETRO], [COD_LINEA]) VALUES (26, N'ETR05', N'123', N'Pendolio', N'08/06/2016', NULL, CAST(30800000.00 AS Decimal(18, 2)), N'Tren brasileño. Puede alcanzar una velocidad máxima de 300km/h.', N'Activo', 0, 12)
INSERT [dbo].[TBL_TREN] ([ID], [MODELO], [MATRICULA], [NOMBRE], [FECHA_COMPRA], [CANT_VAGONES], [COSTO], [DESCRIPCION], [ESTADO], [KILOMETRO], [COD_LINEA]) VALUES (27, N'ICE03', N'208', N'Querétaro', N'30/01/2016', NULL, CAST(50300000.00 AS Decimal(18, 2)), N'Tren alemán. Puede alcanzar una velocidad máxima de 250km/h.', N'Inactivo', 40, 12)
INSERT [dbo].[TBL_TREN] ([ID], [MODELO], [MATRICULA], [NOMBRE], [FECHA_COMPRA], [CANT_VAGONES], [COSTO], [DESCRIPCION], [ESTADO], [KILOMETRO], [COD_LINEA]) VALUES (30, N'Tren Nuevo', N'115', N'Tren Nuevo', N'28/08/2015', NULL, CAST(1000.00 AS Decimal(18, 2)), N'Tren rapido', N'Activo', 0, 16)
SET IDENTITY_INSERT [dbo].[TBL_TREN] OFF
INSERT [dbo].[TBL_USUARIO] ([CEDULA], [NOMBRE], [TELEFONO], [ID_PUESTO], [CONTRASENA], [CORREO]) VALUES (N'116120107', N'Eduardo Guerrero', N'84824599', 2, N'9b4e75d98cc9ba16cf26dba6c3eee3b6', N'eguerrerom@ucenfotec.ac.cr')
INSERT [dbo].[TBL_USUARIO] ([CEDULA], [NOMBRE], [TELEFONO], [ID_PUESTO], [CONTRASENA], [CORREO]) VALUES (N'116350952', N'Paula Ramírez', N'72661456', 8, N'181b30d3df1b264cd0991d6767958c42', N'mramirezh@ucenfotec.ac.cr')
INSERT [dbo].[TBL_USUARIO] ([CEDULA], [NOMBRE], [TELEFONO], [ID_PUESTO], [CONTRASENA], [CORREO]) VALUES (N'116510751', N'Andres Salas', N'86733185', 2, N'e9bfa90458b5912ba741d586a2a1504f', N'asalaso@ucenfotec.ac.cr')
INSERT [dbo].[TBL_USUARIO] ([CEDULA], [NOMBRE], [TELEFONO], [ID_PUESTO], [CONTRASENA], [CORREO]) VALUES (N'118273664', N'David Espinoza', N'88825162', 1, N'71877035ba542163fc23e93cc6b5644a', N'despinozaa@ucenfotec.ac.cr')
INSERT [dbo].[TBL_USUARIO] ([CEDULA], [NOMBRE], [TELEFONO], [ID_PUESTO], [CONTRASENA], [CORREO]) VALUES (N'207430945', N'Jose Gómez', N'62402974', 1, N'7a2994a0fd6e1621482fb7d2113beedd', N'jgomezc@ucenfotec.ac.cr')
INSERT [dbo].[TBL_USUARIO] ([CEDULA], [NOMBRE], [TELEFONO], [ID_PUESTO], [CONTRASENA], [CORREO]) VALUES (N'408290511', N'Jorge Mendez', N'85428551', 8, N'62dc29a83a56dd4eb1f8708b380aec4a', N'jorgem@gmail.com')
SET IDENTITY_INSERT [dbo].[TBL_VAGON] ON 

INSERT [dbo].[TBL_VAGON] ([Id], [CANT_ASIENTOS], [ID_TREN]) VALUES (9, 30, 23)
INSERT [dbo].[TBL_VAGON] ([Id], [CANT_ASIENTOS], [ID_TREN]) VALUES (10, 30, 23)
INSERT [dbo].[TBL_VAGON] ([Id], [CANT_ASIENTOS], [ID_TREN]) VALUES (11, 30, 23)
INSERT [dbo].[TBL_VAGON] ([Id], [CANT_ASIENTOS], [ID_TREN]) VALUES (13, 20, 265)
INSERT [dbo].[TBL_VAGON] ([Id], [CANT_ASIENTOS], [ID_TREN]) VALUES (14, 20, 288)
INSERT [dbo].[TBL_VAGON] ([Id], [CANT_ASIENTOS], [ID_TREN]) VALUES (15, 30, 208)
INSERT [dbo].[TBL_VAGON] ([Id], [CANT_ASIENTOS], [ID_TREN]) VALUES (16, 30, 123)
INSERT [dbo].[TBL_VAGON] ([Id], [CANT_ASIENTOS], [ID_TREN]) VALUES (17, 20, 123)
INSERT [dbo].[TBL_VAGON] ([Id], [CANT_ASIENTOS], [ID_TREN]) VALUES (18, 20, 208)
INSERT [dbo].[TBL_VAGON] ([Id], [CANT_ASIENTOS], [ID_TREN]) VALUES (19, 20, 196)
INSERT [dbo].[TBL_VAGON] ([Id], [CANT_ASIENTOS], [ID_TREN]) VALUES (21, 20, 265)
INSERT [dbo].[TBL_VAGON] ([Id], [CANT_ASIENTOS], [ID_TREN]) VALUES (22, 20, 208)
INSERT [dbo].[TBL_VAGON] ([Id], [CANT_ASIENTOS], [ID_TREN]) VALUES (23, 20, 196)
INSERT [dbo].[TBL_VAGON] ([Id], [CANT_ASIENTOS], [ID_TREN]) VALUES (24, 20, 196)
SET IDENTITY_INSERT [dbo].[TBL_VAGON] OFF
SET IDENTITY_INSERT [dbo].[TBL_VIAJE] ON 

INSERT [dbo].[TBL_VIAJE] ([ID], [ID_RUTA], [ID_TREN], [ID_HORARIO]) VALUES (1, 1, 23, 481)
INSERT [dbo].[TBL_VIAJE] ([ID], [ID_RUTA], [ID_TREN], [ID_HORARIO]) VALUES (2, 2, 24, 482)
INSERT [dbo].[TBL_VIAJE] ([ID], [ID_RUTA], [ID_TREN], [ID_HORARIO]) VALUES (3, 2, 23, 483)
INSERT [dbo].[TBL_VIAJE] ([ID], [ID_RUTA], [ID_TREN], [ID_HORARIO]) VALUES (4, 2, 24, 484)
SET IDENTITY_INSERT [dbo].[TBL_VIAJE] OFF
ALTER TABLE [dbo].[Canton]  WITH CHECK ADD  CONSTRAINT [FKCanton] FOREIGN KEY([numeroProvincia])
REFERENCES [dbo].[Provincia] ([numeroProvincia])
GO
ALTER TABLE [dbo].[Canton] CHECK CONSTRAINT [FKCanton]
GO
ALTER TABLE [dbo].[Distrito]  WITH CHECK ADD  CONSTRAINT [FKDistrito] FOREIGN KEY([numeroProvincia], [numeroCanton])
REFERENCES [dbo].[Canton] ([numeroProvincia], [numeroCanton])
GO
ALTER TABLE [dbo].[Distrito] CHECK CONSTRAINT [FKDistrito]
GO
ALTER TABLE [dbo].[TBL_ASIENTO]  WITH CHECK ADD FOREIGN KEY([ID_VAGON])
REFERENCES [dbo].[TBL_VAGON] ([Id])
GO
ALTER TABLE [dbo].[TBL_ESTACIONES_POR_LINEA]  WITH CHECK ADD  CONSTRAINT [TBL_ESTACION_TBL_ESTACIONES_POR_LINEA_FK] FOREIGN KEY([ID_ESTACION])
REFERENCES [dbo].[TBL_ESTACION] ([COD_ESTACION])
GO
ALTER TABLE [dbo].[TBL_ESTACIONES_POR_LINEA] CHECK CONSTRAINT [TBL_ESTACION_TBL_ESTACIONES_POR_LINEA_FK]
GO
ALTER TABLE [dbo].[TBL_ESTACIONES_POR_LINEA]  WITH CHECK ADD  CONSTRAINT [TBL_LINEA_TBL_ESTACIONES_POR_LINEA_FK] FOREIGN KEY([ID_LINEA])
REFERENCES [dbo].[TBL_LINEA] ([COD_LINEA])
GO
ALTER TABLE [dbo].[TBL_ESTACIONES_POR_LINEA] CHECK CONSTRAINT [TBL_LINEA_TBL_ESTACIONES_POR_LINEA_FK]
GO
ALTER TABLE [dbo].[TBL_HISTORIAL]  WITH CHECK ADD  CONSTRAINT [FK__TBL_HISTO__CED_C__33D4B598] FOREIGN KEY([CED_CLIENTE])
REFERENCES [dbo].[TBL_CLIENTE] ([CEDULA])
GO
ALTER TABLE [dbo].[TBL_HISTORIAL] CHECK CONSTRAINT [FK__TBL_HISTO__CED_C__33D4B598]
GO
ALTER TABLE [dbo].[TBL_HISTORIAL]  WITH CHECK ADD  CONSTRAINT [FK__TBL_HISTO__ID_TI__34C8D9D1] FOREIGN KEY([ID_TIQUETE])
REFERENCES [dbo].[TBL_TIQUETE] ([ID])
GO
ALTER TABLE [dbo].[TBL_HISTORIAL] CHECK CONSTRAINT [FK__TBL_HISTO__ID_TI__34C8D9D1]
GO
ALTER TABLE [dbo].[TBL_PERMISO_PUESTO]  WITH CHECK ADD  CONSTRAINT [FK_TBL_PERMISO_PUESTO_TBL_PERMISO] FOREIGN KEY([COD_PERMISO])
REFERENCES [dbo].[TBL_PERMISO] ([CODIGO])
GO
ALTER TABLE [dbo].[TBL_PERMISO_PUESTO] CHECK CONSTRAINT [FK_TBL_PERMISO_PUESTO_TBL_PERMISO]
GO
ALTER TABLE [dbo].[TBL_PERMISO_PUESTO]  WITH CHECK ADD  CONSTRAINT [FK_TBL_PERMISO_PUESTO_TBL_PUESTO] FOREIGN KEY([COD_PUESTO])
REFERENCES [dbo].[TBL_PUESTO] ([ID])
GO
ALTER TABLE [dbo].[TBL_PERMISO_PUESTO] CHECK CONSTRAINT [FK_TBL_PERMISO_PUESTO_TBL_PUESTO]
GO
ALTER TABLE [dbo].[TBL_RUTA]  WITH CHECK ADD  CONSTRAINT [FK__TBL_RUTA__COD_LI__1332DBDC] FOREIGN KEY([COD_LINEA])
REFERENCES [dbo].[TBL_LINEA] ([COD_LINEA])
GO
ALTER TABLE [dbo].[TBL_RUTA] CHECK CONSTRAINT [FK__TBL_RUTA__COD_LI__1332DBDC]
GO
ALTER TABLE [dbo].[TBL_TARJETA]  WITH CHECK ADD  CONSTRAINT [FK__TBL_TARJE__CED_C__398D8EEE] FOREIGN KEY([CED_CLIENTE])
REFERENCES [dbo].[TBL_CLIENTE] ([CEDULA])
GO
ALTER TABLE [dbo].[TBL_TARJETA] CHECK CONSTRAINT [FK__TBL_TARJE__CED_C__398D8EEE]
GO
ALTER TABLE [dbo].[TBL_TIQUETE]  WITH CHECK ADD  CONSTRAINT [FK__TBL_TIQUE__ID_AS__3A81B327] FOREIGN KEY([ID_ASIENTO])
REFERENCES [dbo].[TBL_ASIENTO] ([ID])
GO
ALTER TABLE [dbo].[TBL_TIQUETE] CHECK CONSTRAINT [FK__TBL_TIQUE__ID_AS__3A81B327]
GO
ALTER TABLE [dbo].[TBL_TIQUETE]  WITH CHECK ADD  CONSTRAINT [FK__TBL_TIQUE__ID_TI__3B75D760] FOREIGN KEY([ID_TIPO_TIQUETE])
REFERENCES [dbo].[TBL_TIPO_TIQUETE] ([ID])
GO
ALTER TABLE [dbo].[TBL_TIQUETE] CHECK CONSTRAINT [FK__TBL_TIQUE__ID_TI__3B75D760]
GO
ALTER TABLE [dbo].[TBL_TIQUETE]  WITH CHECK ADD  CONSTRAINT [FK__TBL_TIQUE__ID_VI__3C69FB99] FOREIGN KEY([ID_VIAJE])
REFERENCES [dbo].[TBL_VIAJE] ([ID])
GO
ALTER TABLE [dbo].[TBL_TIQUETE] CHECK CONSTRAINT [FK__TBL_TIQUE__ID_VI__3C69FB99]
GO
ALTER TABLE [dbo].[TBL_TREN]  WITH CHECK ADD  CONSTRAINT [FK__TBL_TREN__COD_LI__3D5E1FD2] FOREIGN KEY([COD_LINEA])
REFERENCES [dbo].[TBL_LINEA] ([COD_LINEA])
GO
ALTER TABLE [dbo].[TBL_TREN] CHECK CONSTRAINT [FK__TBL_TREN__COD_LI__3D5E1FD2]
GO
/****** Object:  StoredProcedure [dbo].[CRE_ACCION_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CRE_ACCION_PR]
	@P_ID_USUARIO VARCHAR(50),
	@P_TIPO_ACCION VARCHAR(50),
	@P_FECHA DATETIME
AS
	 INSERT INTO TBL_ACCION(ID_USUARIO,TIPO_ACCION,FECHA) 
	 VALUES (@P_ID_USUARIO,@P_TIPO_ACCION,@P_FECHA)
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[CRE_ASIENTO_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CRE_ASIENTO_PR]
	@P_ID_VAGON NVARCHAR(50),
	@P_TIPO NVARCHAR(50),
	@P_ESTADO NVARCHAR(50)

AS
	INSERT INTO TBL_ASIENTO(ID_VAGON,TIPO,ESTADO)
	VALUES (@P_ID_VAGON,@P_TIPO,@P_ESTADO)
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[CRE_CLIENTE_NO_FRECUENTE_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CRE_CLIENTE_NO_FRECUENTE_PR]
	@P_CEDULA NVARCHAR(50),
	@P_NOMBRE NVARCHAR(50),
	@P_APELLIDO NVARCHAR(50),
	@P_CORREO NVARCHAR(50),
	@P_TELEFONO NVARCHAR(50),
	@P_PROVINCIA NVARCHAR(50),
	@P_CANTON NVARCHAR(50),
	@P_DISTRITO NVARCHAR(50)
	
AS
BEGIN
	INSERT INTO TBL_CLIENTES_NO_FRECUENTES (CEDULA,NOMBRE,APELLIDO,CORREO,TELEFONO,PROVINCIA,CANTON,DISTRITO) VALUES (@P_CEDULA,@P_NOMBRE,@P_APELLIDO,@P_CORREO,@P_TELEFONO,@P_PROVINCIA,@P_CANTON,@P_DISTRITO)
return 0

END

SET ANSI_NULLS ON


GO
/****** Object:  StoredProcedure [dbo].[CRE_CLIENTE_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CRE_CLIENTE_PR]
	@P_CEDULA NVARCHAR(50),
	@P_NOMBRE NVARCHAR(50),
	@P_APELLIDO NVARCHAR(50),
	@P_TELEFONO NVARCHAR(50),
	@P_RESIDENCIA NVARCHAR(100),
	@P_CORREO NVARCHAR(50),
	@P_CONTRASENA NVARCHAR(MAX),
	@P_EDAD INT
AS
BEGIN
	INSERT INTO TBL_CLIENTE (CEDULA,NOMBRE,APELLIDO,TELEFONO,RESIDENCIA, CORREO, CONTRASENA, EDAD) 
	VALUES (@P_CEDULA,@P_NOMBRE,@P_APELLIDO,@P_TELEFONO,@P_RESIDENCIA,@P_CORREO, @P_CONTRASENA, @P_EDAD)
return 0

END

SET ANSI_NULLS ON


GO
/****** Object:  StoredProcedure [dbo].[CRE_CONVENIO_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CRE_CONVENIO_PR]
	@P_NOMBRE nvarchar(50),
	@P_DESCUENTO decimal(18,2)
AS
	 INSERT INTO TBL_CONVENIO(NOMBRE,DESCUENTO) VALUES (@P_NOMBRE,@P_DESCUENTO)
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[CRE_ESTACION_POR_LINEA_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CRE_ESTACION_POR_LINEA_PR]
	@P_ID_LINEA INT,
	@P_ID_ESTACION INT
AS
	INSERT INTO TBL_ESTACIONES_POR_LINEA (ID_LINEA, ID_ESTACION)
	VALUES (@P_ID_LINEA, @P_ID_ESTACION)
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[CRE_ESTACION_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CRE_ESTACION_PR]
	@P_NOMBRE VARCHAR(250),
	@P_ESTADO VARCHAR(50),
	@P_LATITUD FLOAT(53),
	@P_LONGITUD FLOAT(53),
	@P_CENTRAL INT,
	@P_KILOMETRO INT
AS
	INSERT INTO TBL_ESTACION (NOMBRE, ESTADO, LATITUD, LONGITUD, CENTRAL, UBICACION, KILOMETRO) 
	VALUES (@P_NOMBRE, @P_ESTADO, @P_LATITUD, @P_LONGITUD, @P_CENTRAL, (geography::Parse('POINT(' + CAST(@P_LONGITUD AS VARCHAR(20)) + ' ' + CAST(@P_LATITUD AS VARCHAR(20)) + ')')), @P_KILOMETRO)
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[CRE_HISTORIALVIAJE_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CRE_HISTORIALVIAJE_PR]
	@P_LINEA NVARCHAR(50),
	@P_TREN NVARCHAR(50),
	@P_ESTACION_ANTERIOR NVARCHAR(50),
	@P_ESTACION_SIGUIENTE NVARCHAR(50),
	@P_TIEMPO_ESTIMADO NVARCHAR(50),
	@P_ACCION NVARCHAR(50),
	@P_FECHA NVARCHAR(50)
AS
	INSERT INTO TBL_HISTORIALVIAJES
	VALUES (@P_LINEA, @P_TREN, @P_ESTACION_ANTERIOR, @P_ESTACION_SIGUIENTE, @P_TIEMPO_ESTIMADO, @P_ACCION, @P_FECHA)
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[CRE_LINEA_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CRE_LINEA_PR]
	@P_NOMBRE VARCHAR(250),
	@P_COLOR VARCHAR(50),
	@P_DISTANCIA DECIMAL(18, 2),
	@P_ESTADO VARCHAR(50),
	@P_ESTACION_INICIAL INT,
	@P_ESTACION_FINAL INT,
	@P_HORA_TRABAJO INT,
	@P_HORA_INICIO VARCHAR(50),
	@P_COSTO_CIRCULACION DECIMAL(18, 2),
	@P_COD_CENTRAL INT,
	@P_DURACION_RECORRIDO INT
AS
	INSERT INTO TBL_LINEA (NOMBRE, COLOR, DISTANCIA, ESTADO, ESTACION_INICIAL, ESTACION_FINAL, HORA_TRABAJO, HORA_INICIO, COSTO_CIRCULACION, COD_CENTRAL, DURACION_RECORRIDO) 
	VALUES (@P_NOMBRE, @P_COLOR, @P_DISTANCIA, @P_ESTADO, @P_ESTACION_INICIAL, @P_ESTACION_FINAL, @P_HORA_TRABAJO, CONVERT(DATETIME,REPLACE(@P_HORA_INICIO, '.', ':')), @P_COSTO_CIRCULACION, @P_COD_CENTRAL, @P_DURACION_RECORRIDO)
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[CRE_PERMISO_POR_PUESTO_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CRE_PERMISO_POR_PUESTO_PR]
	@P_COD_PERMISO INT,
	@P_COD_PUESTO INT
AS
	INSERT INTO TBL_PERMISO_PUESTO (COD_PERMISO,COD_PUESTO) VALUES (@P_COD_PERMISO,@P_COD_PUESTO)
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[CRE_PUESTO_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CRE_PUESTO_PR]
   @P_NOMBRE NVARCHAR(50)
   AS
   INSERT INTO TBL_PUESTO (NOMBRE) VALUES (@P_NOMBRE)
return 0


GO
/****** Object:  StoredProcedure [dbo].[CRE_RUTA_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CRE_RUTA_PR]
	@P_COD_LINEA INT,
	@P_LUGAR_SALIDA INT,
	@P_LUGAR_LLEGADA INT,
	@P_NOMBRE NVARCHAR(50)

AS
	INSERT INTO TBL_RUTA(COD_LINEA,LUGAR_SALIDA,LUGAR_LLEGADA ,NOMBRE)
	VALUES (@P_COD_LINEA,@P_LUGAR_SALIDA ,@P_LUGAR_LLEGADA ,@P_NOMBRE)
RETURN 0


GO
/****** Object:  StoredProcedure [dbo].[CRE_TARJETA_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CRE_TARJETA_PR]
	@P_NUMERO NVARCHAR(50),
	@P_TIPO NVARCHAR(50),
	@P_FECHA_EXP DATETIME,
	@P_CODIGO_SEG NVARCHAR(50),
	@P_TITULAR NVARCHAR(50)
AS
BEGIN
   INSERT INTO TBL_TARJETA (NUMERO,TIPO,FECHA_EXP,CODIGO_SEG,TITULAR) VALUES(@P_NUMERO,@P_TIPO,@P_FECHA_EXP,@P_CODIGO_SEG,@P_TITULAR)
   return 0;
END


GO
/****** Object:  StoredProcedure [dbo].[CRE_TIPO_TIQUETE_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CRE_TIPO_TIQUETE_PR]
	@P_TIPO nvarchar(50),
	@P_PRECIO INT
AS
	 INSERT INTO TBL_TIPO_TIQUETE(TIPO,PRECIO) VALUES (@P_TIPO,@P_PRECIO)
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[CRE_TREN_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CRE_TREN_PR]
	@P_MODELO NVARCHAR(50),
	@P_MATRICULA NVARCHAR(50),
	@P_NOMBRE NVARCHAR(50),
	@P_FECHA_COMPRA NVARCHAR(50),
	@P_COSTO DECIMAL(18,2),
	@P_DESCRIPCION NVARCHAR(100),
	@P_ESTADO NVARCHAR(50)
AS
	INSERT INTO TBL_TREN(MODELO,MATRICULA,NOMBRE,FECHA_COMPRA,COSTO,DESCRIPCION,ESTADO)
	VALUES (@P_MODELO,@P_MATRICULA,@P_NOMBRE,@P_FECHA_COMPRA,@P_COSTO,@P_DESCRIPCION,@P_ESTADO)
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[CRE_USUARIO_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CRE_USUARIO_PR]
	@P_CEDULA    NVARCHAR(50),
    @P_NOMBRE    VARCHAR(50),
    @P_TELEFONO  NVARCHAR(8),
	@P_ID_PUESTO INT,
	@P_CONTRASENA NVARCHAR(MAX), 
    @P_CORREO NVARCHAR(MAX)

AS
	INSERT INTO TBL_USUARIO (CEDULA,NOMBRE,TELEFONO,ID_PUESTO,CONTRASENA,CORREO) VALUES (@P_CEDULA,@P_NOMBRE,@P_TELEFONO,@P_ID_PUESTO,@P_CONTRASENA,@P_CORREO);
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[CRE_VAGON_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CRE_VAGON_PR]
	@P_CANT_ASIENTOS VARCHAR(50),
	@P_ID_TREN VARCHAR(50)
AS
	INSERT INTO TBL_VAGON (CANT_ASIENTOS,ID_TREN) 
	VALUES (@P_CANT_ASIENTOS,@P_ID_TREN)
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[CRE_VIAJE_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CRE_VIAJE_PR]
	@P_ID_HORARIO INT,
	@P_ID_RUTA INT,
	@P_ID_TREN INT
AS
	INSERT INTO TBL_VIAJE(ID_HORARIO,ID_RUTA,ID_TREN)
	VALUES (@P_ID_HORARIO,@P_ID_RUTA,@P_ID_TREN)
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[DEL_CLIENTE_NO_FRECUENTE_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DEL_CLIENTE_NO_FRECUENTE_PR]
	@P_CEDULA NVARCHAR(50)
AS
BEGIN
   DELETE TBL_CLIENTES_NO_FRECUENTES 
   WHERE CEDULA = @P_CEDULA
return 0
END

SET ANSI_NULLS ON


GO
/****** Object:  StoredProcedure [dbo].[DEL_CLIENTE_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DEL_CLIENTE_PR]
	@P_CEDULA NVARCHAR(50)
AS
BEGIN
   DELETE TBL_CLIENTE 
   WHERE CEDULA = @P_CEDULA
return 0
END

SET ANSI_NULLS ON


GO
/****** Object:  StoredProcedure [dbo].[DEL_CONVENIO_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DEL_CONVENIO_PR]
	@P_ID int
AS
	Delete From TBL_CONVENIO Where ID=@P_ID
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[DEL_ESTACION_POR_LINEA_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DEL_ESTACION_POR_LINEA_PR]
	@P_ID_LINEA INT
AS
	DELETE 
	FROM TBL_ESTACIONES_POR_LINEA
	WHERE ID_LINEA = @P_ID_LINEA
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[DEL_ESTACION_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DEL_ESTACION_PR]
	@P_COD_ESTACION INT
AS
	DELETE 
	FROM TBL_ESTACION
	WHERE COD_ESTACION = @P_COD_ESTACION
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[DEL_LINEA_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DEL_LINEA_PR]
	@P_COD_LINEA INT
AS
	DELETE 
	FROM TBL_LINEA
	WHERE COD_LINEA = @P_COD_LINEA
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[DEL_PERMISO_POR_PUESTO_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DEL_PERMISO_POR_PUESTO_PR]
	@P_COD_PERMISO INT
AS
	DELETE TBL_PERMISO_PUESTO
	WHERE COD_PERMISO = @P_COD_PERMISO
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[DEL_PERMISO_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DEL_PERMISO_PR]
	@P_CODIGO INT
AS
	DELETE TBL_PERMISO
	WHERE CODIGO = @P_CODIGO
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[DEL_PUESTO_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DEL_PUESTO_PR]
   @P_ID INT
   AS
   DELETE TBL_PUESTO
   WHERE ID = @P_ID
return 0


GO
/****** Object:  StoredProcedure [dbo].[DEL_TIPO_TIQUETE_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DEL_TIPO_TIQUETE_PR]
	@P_ID int
AS
	Delete From TBL_TIPO_TIQUETE Where ID=@P_ID
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[DEL_TREN_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DEL_TREN_PR]
	@P_MATRICULA VARCHAR(50)
AS
	DELETE 
	FROM TBL_TREN
	WHERE MATRICULA = @P_MATRICULA
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[DEL_USUARIO_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DEL_USUARIO_PR]
	@P_CEDULA    NVARCHAR(50)
   
AS
	DELETE  FROM TBL_USUARIO
	WHERE CEDULA = @P_CEDULA
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[DEL_VAGON_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DEL_VAGON_PR]
	@P_ID INT
AS
	DELETE 
	FROM TBL_VAGON
	WHERE ID = @P_ID
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[Procedure]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Procedure]
	@param1 int = 0,
	@param2 int
AS
	SELECT @param1, @param2
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[RET_ALL_HISTORIALVIAJES_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_ALL_HISTORIALVIAJES_PR]

AS
	SELECT * FROM TBL_HISTORIALVIAJES
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[RET_ASIENTOS_POR_VAGON_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_ASIENTOS_POR_VAGON_PR]
    @P_ID_VAGON INT
AS
	SELECT *
	FROM TBL_ASIENTO
	WHERE ID_VAGON = @P_ID_VAGON
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[RET_CLIENTE_AUTH_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE[dbo].[RET_CLIENTE_AUTH_PR]
	@P_CORREO NVARCHAR(MAX),
	@P_CONTRASENA NVARCHAR(MAX)
AS
	SELECT NOMBRE, CORREO, CONTRASENA
	from TBL_CLIENTE
	WHERE CORREO = @P_CORREO AND CONTRASENA = @P_CONTRASENA
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[RET_CLIENTE_NO_FRECUENTE_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RET_CLIENTE_NO_FRECUENTE_PR]
	@P_CEDULA NVARCHAR(50)
AS
BEGIN
   SELECT * FROM TBL_CLIENTES_NO_FRECUENTES
   WHERE CEDULA = @P_CEDULA
return 0
END

GO
/****** Object:  StoredProcedure [dbo].[RET_CLIENTE_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RET_CLIENTE_PR]
	@P_CEDULA NVARCHAR(50)
AS
BEGIN
   SELECT * FROM TBL_CLIENTE
   WHERE CEDULA = @P_CEDULA
return 0
END

GO
/****** Object:  StoredProcedure [dbo].[RET_CONVENIO_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_CONVENIO_PR]
	@P_NOMBRE varchar(50)
AS
	SELECT * FROM TBL_CONVENIO WHERE NOMBRE = @P_NOMBRE
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[RET_ESTACION_CENTRAL]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_ESTACION_CENTRAL]
	
AS
	SELECT * FROM TBL_ESTACION WHERE CENTRAL = 1
RETURN 0


GO
/****** Object:  StoredProcedure [dbo].[RET_ESTACION_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_ESTACION_PR]
	@P_COD_ESTACION INT
AS
	SELECT CONVERT(VARCHAR(100),COD_ESTACION) AS COD_ESTACION, NOMBRE, ESTADO, LATITUD, LONGITUD, CENTRAL, KILOMETRO
	FROM TBL_ESTACION
	WHERE COD_ESTACION = @P_COD_ESTACION
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[RET_ESTACIONES_POR_LINEA_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_ESTACIONES_POR_LINEA_PR]
    @P_ID_LINEA INT
AS
	SELECT CONVERT(VARCHAR(100), e.COD_ESTACION) AS COD_ESTACION, e.NOMBRE, e.ESTADO, e.LATITUD, e.LONGITUD, e.CENTRAL, e.UBICACION, e.KILOMETRO
	FROM TBL_ESTACION e
	INNER JOIN TBL_ESTACIONES_POR_LINEA el
	ON (e.COD_ESTACION = el.ID_ESTACION)
	INNER JOIN TBL_LINEA l
	ON (l.COD_LINEA = el.ID_LINEA)
	WHERE l.COD_LINEA = @P_ID_LINEA
	ORDER BY e.KILOMETRO ASC
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[RET_HORARIO_BY_HORA_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_HORARIO_BY_HORA_PR]
	@P_HORA_SALIDA NVARCHAR(50),
	@P_HORA_ARRIBO NVARCHAR(50),
	@P_FECHA_SALIDA NVARCHAR(50)
AS
	SELECT *
	FROM TBL_HORARIOS
	WHERE HORA_ARRIBO = @P_HORA_ARRIBO AND HORA_SALIDA = @P_HORA_SALIDA AND FECHA_SALIDA = @P_FECHA_SALIDA
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[RET_HORARIO_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_HORARIO_PR]
	@P_ID INT
AS
	SELECT *
	FROM TBL_HORARIOS
	WHERE ID = @P_ID
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[RET_INCIDENCIA_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RET_INCIDENCIA_PR]
	@P_CODIGO NVARCHAR(50)
AS
	SELECT * FROM TBL_INCIDENCIA WHERE CODIGO = @P_CODIGO
RETURN 0



GO
/****** Object:  StoredProcedure [dbo].[RET_LINEA_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_LINEA_PR]
	@P_COD_LINEA INT
AS
	SELECT CONVERT(VARCHAR(100),COD_LINEA) AS COD_LINEA, NOMBRE, COLOR, DISTANCIA, ESTADO, ESTACION_INICIAL, ESTACION_FINAL, HORA_TRABAJO, CONVERT(VARCHAR(5),HORA_INICIO) AS HORA_INICIO, COSTO_CIRCULACION, COD_CENTRAL, DURACION_RECORRIDO
	FROM TBL_LINEA
	WHERE COD_LINEA = @P_COD_LINEA
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[RET_PERMISO_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_PERMISO_PR]
	@P_CODIGO INT
AS
	SELECT * FROM TBL_PERMISO
	WHERE CODIGO = @P_CODIGO
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[RET_PUESTO_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[RET_PUESTO_PR]

   @P_ID int

   AS
   SELECT * FROM TBL_PUESTO
   WHERE ID = @P_ID
return 0

GO
/****** Object:  StoredProcedure [dbo].[RET_RUTA_BY_NOMBRE_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_RUTA_BY_NOMBRE_PR]
	@P_NOMBRE NVARCHAR(50)
AS
	SELECT *
	FROM TBL_RUTA
	WHERE NOMBRE = @P_NOMBRE
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[RET_RUTA_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_RUTA_PR]
	@P_ID INT
AS
	SELECT *
	FROM TBL_RUTA
	WHERE ID = @P_ID
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[RET_TIPO_TIQUETE_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_TIPO_TIQUETE_PR]
	@P_TIPO varchar(50)
AS
	SELECT * FROM TBL_TIPO_TIQUETE WHERE TIPO = @P_TIPO
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[RET_TREN_BY_ID_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_TREN_BY_ID_PR]
	@P_ID INT
AS
	SELECT *
	FROM TBL_TREN
	WHERE ID = @P_ID
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[RET_TREN_BY_NOMBRE_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_TREN_BY_NOMBRE_PR]
	@P_NOMBRE NVARCHAR(50)
AS
	SELECT *
	FROM TBL_TREN
	WHERE NOMBRE = @P_NOMBRE
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[RET_TREN_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_TREN_PR]
	@P_MATRICULA VARCHAR(50)
AS
	SELECT *
	FROM TBL_TREN
	WHERE MATRICULA = @P_MATRICULA
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[RET_ULTIMO_VAGON_REG_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_ULTIMO_VAGON_REG_PR]

AS
	SELECT * 
	FROM TBL_VAGON 
	WHERE Id = (SELECT MAX(Id) FROM TBL_VAGON) 
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[RET_USUARIO_AUTH_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE[dbo].[RET_USUARIO_AUTH_PR]
	@P_CORREO NVARCHAR(MAX),
	@P_CONTRASENA NVARCHAR(MAX)
AS
	SELECT NOMBRE, CORREO, CONTRASENA, ID_PUESTO
	from TBL_USUARIO
	WHERE CORREO = @P_CORREO AND CONTRASENA = @P_CONTRASENA
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[RET_USUARIO_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_USUARIO_PR]
	@P_CEDULA NVARCHAR(50)
AS
	SELECT * FROM TBL_USUARIO
	WHERE CEDULA = @P_CEDULA
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[RET_VAGON_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_VAGON_PR]
	@P_ID INT
AS
	SELECT *
	FROM TBL_VAGON
	WHERE ID = @P_ID
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[RET_VAGONES_POR_TREN_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_VAGONES_POR_TREN_PR]
	@P_ID_TREN INT
AS
	SELECT *
	FROM TBL_VAGON
	WHERE ID_TREN = @P_ID_TREN
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[RET_VIAJE_BY_ID_HORARIO_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_VIAJE_BY_ID_HORARIO_PR]
	@P_ID_HORARIO INT,
	@P_ID_RUTA INT
AS
	SELECT *
	FROM TBL_VIAJE
	WHERE ID_HORARIO = @P_ID_HORARIO AND ID_RUTA = @P_ID_RUTA
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[RETALL_ACCION_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RETALL_ACCION_PR]

AS
	SELECT *
	FROM TBL_ACCION
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[RETALL_ASIENTOS_ADULTO_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RETALL_ASIENTOS_ADULTO_PR]
	@P_ID VARCHAR(50)
AS
	SELECT *
	FROM TBL_ASIENTO
	WHERE TIPO = 'Adulto' AND ID_VAGON = @P_ID
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[RETALL_ASIENTOS_ADULTOMAYOR_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RETALL_ASIENTOS_ADULTOMAYOR_PR]
	@P_ID VARCHAR(50)
AS
	SELECT *
	FROM TBL_ASIENTO
	WHERE TIPO = 'Adulto Mayor' AND ID_VAGON = @P_ID
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[RETALL_ASIENTOS_POR_VAGON_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RETALL_ASIENTOS_POR_VAGON_PR]
	@P_ID_VAGON INT
AS
	SELECT *
	FROM TBL_ASIENTO
	WHERE ID_VAGON = @P_ID_VAGON
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[RETALL_ASIENTOS_VIP_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RETALL_ASIENTOS_VIP_PR]
	@P_ID VARCHAR(50)
AS
	SELECT *
	FROM TBL_ASIENTO
	WHERE TIPO = 'VIP' AND ID_VAGON = @P_ID
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[RETALL_CLIENTE_NO_FRECUENTE_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RETALL_CLIENTE_NO_FRECUENTE_PR]
	
AS
BEGIN
   SELECT * FROM TBL_CLIENTES_NO_FRECUENTES
return 0
END

SET ANSI_NULLS ON


GO
/****** Object:  StoredProcedure [dbo].[RETALL_CLIENTE_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RETALL_CLIENTE_PR]
	
AS
BEGIN
   SELECT * FROM TBL_CLIENTE
return 0
END

SET ANSI_NULLS ON


GO
/****** Object:  StoredProcedure [dbo].[RETALL_CONVENIO_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RETALL_CONVENIO_PR]

AS
	SELECT * FROM dbo.TBL_CONVENIO
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[RETALL_EMPRESA_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RETALL_EMPRESA_PR]

AS
	SELECT * FROM TBL_EMPRESA
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[RETALL_ESTACIONES_POR_LINEA_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RETALL_ESTACIONES_POR_LINEA_PR]
	@P_ID_LINEA INT
AS
	SELECT T_E.*
	FROM TBL_ESTACION T_E
	JOIN TBL_ESTACIONES_POR_LINEA T_E_L ON (T_E.COD_ESTACION = T_E_L.ID_ESTACION)
	WHERE T_E_L.ID_LINEA = @P_ID_LINEA
	ORDER BY T_E.KILOMETRO ASC
RETURN 0


GO
/****** Object:  StoredProcedure [dbo].[RETALL_ESTACIONES_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RETALL_ESTACIONES_PR]
	
AS
	SELECT CONVERT(VARCHAR(100),COD_ESTACION) AS COD_ESTACION, NOMBRE, ESTADO, LATITUD, LONGITUD, CENTRAL, KILOMETRO
	FROM TBL_ESTACION
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[RETALL_EXCEPCIONES_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RETALL_EXCEPCIONES_PR]

AS
SELECT * 
FROM TBL_EXCEPCION

GO
/****** Object:  StoredProcedure [dbo].[RETALL_HORARIOS_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RETALL_HORARIOS_PR]
	
AS
	SELECT * FROM TBL_HORARIOS
RETURN 0


GO
/****** Object:  StoredProcedure [dbo].[RETALL_INCIDENCIAS_POR_TIPO_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RETALL_INCIDENCIAS_POR_TIPO_PR]
	@P_TIPO VARCHAR(50)
AS
	SELECT * 
	FROM TBL_INCIDENCIA 
	WHERE TIPO = @P_TIPO
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[RETALL_LINEAS_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RETALL_LINEAS_PR]
	
AS
	SELECT CONVERT(VARCHAR(100),COD_LINEA) AS COD_LINEA, NOMBRE, COLOR, DISTANCIA, ESTADO, ESTACION_INICIAL, ESTACION_FINAL, HORA_TRABAJO, CONVERT(VARCHAR(5),HORA_INICIO) AS HORA_INICIO, COSTO_CIRCULACION, COD_CENTRAL, DURACION_RECORRIDO
	FROM TBL_LINEA
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[RETALL_PERMISO_POR_PUESTO_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RETALL_PERMISO_POR_PUESTO_PR]
    @P_COD_PUESTO INT
AS
    SELECT TBL_PERMISO.CODIGO,TBL_PERMISO.DESCRIPCION
	FROM TBL_PERMISO_PUESTO
	INNER JOIN TBL_PERMISO 
	ON TBL_PERMISO_PUESTO.COD_PERMISO = TBL_PERMISO.CODIGO
	WHERE TBL_PERMISO_PUESTO.COD_PUESTO = @P_COD_PUESTO
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[RETALL_PERMISO_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RETALL_PERMISO_PR]
	
AS
	SELECT * FROM TBL_PERMISO
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[RETALL_PUESTO_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RETALL_PUESTO_PR]
   AS
   SELECT * FROM TBL_PUESTO
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[RETALL_RUTAS_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RETALL_RUTAS_PR]

AS
	SELECT *
	FROM TBL_RUTA
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[RETALL_TARJETA_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RETALL_TARJETA_PR]

AS
BEGIN
  SELECT * FROM TBL_TARJETA
END


GO
/****** Object:  StoredProcedure [dbo].[RETALL_TIPO_TIQUETE_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RETALL_TIPO_TIQUETE_PR]

AS
	SELECT * FROM dbo.TBL_TIPO_TIQUETE
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[RETALL_TRENES_POR_LINEA_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RETALL_TRENES_POR_LINEA_PR]
	@P_COD_LINEA INT
AS
	SELECT T_T.*
	FROM TBL_TREN T_T
	JOIN TBL_LINEA T_L 
	ON (T_L.COD_LINEA = T_T.COD_LINEA)
	WHERE T_T.COD_LINEA = @P_COD_LINEA
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[RETALL_TRENES_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RETALL_TRENES_PR]

AS
	SELECT *
	FROM TBL_TREN
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[RETALL_USUARIO_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RETALL_USUARIO_PR]
	
AS
	SELECT u.CEDULA,u.NOMBRE,u.TELEFONO,TBL_PUESTO.NOMBRE as 'PUESTO',u.CORREO
	FROM TBL_USUARIO u
	INNER JOIN TBL_PUESTO
	ON u.ID_PUESTO = TBL_PUESTO.ID
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[RETALL_VAGONES_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RETALL_VAGONES_PR]

AS
	SELECT * 
	FROM TBL_VAGON
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[RETALL_VIAJES_BY_FECHA_RUTA_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RETALL_VIAJES_BY_FECHA_RUTA_PR]
	@P_ID_RUTA INT,
	@P_FECHA_SALIDA NVARCHAR(50)
AS
	SELECT t.ID,t.ID_HORARIO,t.ID_RUTA,t.ID_TREN
	FROM TBL_VIAJE t
	INNER JOIN TBL_HORARIOS h ON h.ID=t.ID_HORARIO
    WHERE h.FECHA_SALIDA = @P_FECHA_SALIDA AND t.ID_RUTA = @P_ID_RUTA
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[RETALL_VIAJES_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RETALL_VIAJES_PR]
	
AS
	SELECT *
	FROM TBL_VIAJE
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[RETAUTENTIFICA_USUARIO_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE[dbo].[RETAUTENTIFICA_USUARIO_PR]
@P_CORREO NVARCHAR(MAX)
AS
Select ID_PUESTO,NOMBRE,CORREO,CONTRASENA from TBL_USUARIO
WHERE CORREO = @P_CORREO 

return 0

GO
/****** Object:  StoredProcedure [dbo].[RETNAME_ESTACION_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RETNAME_ESTACION_PR]
	@P_NOMBRE VARCHAR(50)
AS
	SELECT CONVERT(VARCHAR(100),COD_ESTACION) AS COD_ESTACION, NOMBRE, ESTADO, LATITUD, LONGITUD, CENTRAL, KILOMETRO
	FROM TBL_ESTACION
	WHERE NOMBRE = @P_NOMBRE 
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[RETNAME_LINEA_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RETNAME_LINEA_PR]
	@P_NOMBRE VARCHAR(50)
AS
	SELECT CONVERT(VARCHAR(100),COD_LINEA) AS COD_LINEA, NOMBRE, COLOR, DISTANCIA, ESTADO, ESTACION_INICIAL, ESTACION_FINAL, HORA_TRABAJO, CONVERT(VARCHAR(5),HORA_INICIO) AS HORA_INICIO, COSTO_CIRCULACION, COD_CENTRAL, DURACION_RECORRIDO
	FROM TBL_LINEA
	WHERE NOMBRE = @P_NOMBRE
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[RETNAME_PUESTO_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RETNAME_PUESTO_PR]
	@P_NOMBRE NVARCHAR(50)
AS
	SELECT * FROM TBL_PUESTO
	WHERE NOMBRE = @P_NOMBRE
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[UPD_ASIENTO_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UPD_ASIENTO_PR]
   @P_ID INT,
   @P_TIPO NVARCHAR(50)
   AS
   UPDATE TBL_ASIENTO
   SET TIPO = @P_TIPO
   WHERE ID = @P_ID
return 0

GO
/****** Object:  StoredProcedure [dbo].[UPD_CLIENTE_NO_FRECUENTE_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UPD_CLIENTE_NO_FRECUENTE_PR]
	@P_CEDULA NVARCHAR(50),
	@P_NOMBRE NVARCHAR(50),
	@P_APELLIDO NVARCHAR(50),
	@P_CORREO NVARCHAR(50),
	@P_TELEFONO NVARCHAR(50),
	@P_PROVINCIA NVARCHAR(50),
	@P_CANTON NVARCHAR(50),
	@P_DISTRITO NVARCHAR(50)
AS
BEGIN
   UPDATE  TBL_CLIENTES_NO_FRECUENTES 
   SET NOMBRE = @P_NOMBRE,
       APELLIDO = @P_APELLIDO,
	   CORREO = @P_CORREO,
	   TELEFONO = @P_TELEFONO,
	   PROVINCIA = @P_PROVINCIA,
	   CANTON = @P_CANTON,
	   DISTRITO = @P_DISTRITO
	   WHERE CEDULA = @P_CEDULA
return 0
END


GO
/****** Object:  StoredProcedure [dbo].[UPD_CLIENTE_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UPD_CLIENTE_PR]
	@P_CEDULA NVARCHAR(50),
	@P_NOMBRE NVARCHAR(50),
	@P_APELLIDO NVARCHAR(50),
	@P_TELEFONO NVARCHAR(50),
	@P_RESIDENCIA NVARCHAR(100),
	@P_CORREO NVARCHAR(50),
	@P_CONTRASENA NVARCHAR(MAX),
	@P_EDAD INT

AS
BEGIN
   UPDATE  TBL_CLIENTE 
   SET NOMBRE = @P_CEDULA,
       APELLIDO = @P_APELLIDO,
	   CORREO = @P_CORREO,
	   TELEFONO = @P_TELEFONO,
	   RESIDENCIA = @P_RESIDENCIA
	   WHERE CEDULA = @P_CEDULA
return 0
END

SET ANSI_NULLS ON


GO
/****** Object:  StoredProcedure [dbo].[UPD_CONVENIO_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UPD_CONVENIO_PR]
	@P_ID int,
	@P_NOMBRE nvarchar(50),
	@P_DESCUENTO decimal(18,2)
AS
	UPDATE TBL_CONVENIO
	SET NOMBRE = @P_NOMBRE, DESCUENTO = @P_DESCUENTO
	WHERE ID = @P_ID
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[UPD_EMPRESA_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UPD_EMPRESA_PR]

	@P_CED_JURIDICA nvarchar(50),
	@P_NOMBRE nvarchar(50),
	@P_DIRECCION nvarchar(50),
	@P_TELEFONO nvarchar(50),
	@P_CORREO nvarchar(50),
	@P_IMPUESTO nvarchar(50)

AS
	UPDATE TBL_EMPRESA
	SET CED_JURIDICA = @P_CED_JURIDICA, NOMBRE = @P_NOMBRE, DIRECCION = @P_DIRECCION, TELEFONO = @P_TELEFONO, CORREO = @P_CORREO, IMPUESTO = @P_IMPUESTO
	WHERE CED_JURIDICA = CED_JURIDICA
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[UPD_ESTACION_POR_LINEA_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UPD_ESTACION_POR_LINEA_PR]
	@P_ID_LINEA INT,
	@P_ID_ESTACION INT
AS
	UPDATE TBL_ESTACIONES_POR_LINEA
	SET ID_LINEA = @P_ID_LINEA, ID_ESTACION = @P_ID_ESTACION
	WHERE ID_LINEA = @P_ID_LINEA AND ID_ESTACION = @P_ID_ESTACION
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[UPD_ESTACION_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UPD_ESTACION_PR]
	@P_COD_ESTACION INT,
	@P_NOMBRE VARCHAR(250),
	@P_ESTADO VARCHAR(50),
	@P_LATITUD FLOAT(53),
	@P_LONGITUD FLOAT(53),
	@P_CENTRAL INT,
	@P_KILOMETRO INT
AS
	UPDATE TBL_ESTACION
	SET NOMBRE = @P_NOMBRE, ESTADO = @P_ESTADO, LATITUD = @P_LATITUD, LONGITUD = @P_LONGITUD, CENTRAL = @P_CENTRAL,
	UBICACION = geography::Parse('POINT(' + CAST(@P_LONGITUD AS VARCHAR(20)) + ' ' + CAST(@P_LATITUD AS VARCHAR(20)) + ')'),
	KILOMETRO = @P_KILOMETRO
	WHERE COD_ESTACION = @P_COD_ESTACION
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[UPD_LINEA_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UPD_LINEA_PR]
	@P_COD_LINEA INT,
	@P_NOMBRE VARCHAR(250),
	@P_COLOR VARCHAR(50),
	@P_DISTANCIA INT,
	@P_ESTADO VARCHAR(50),
	@P_ESTACION_INICIAL INT,
	@P_ESTACION_FINAL INT,
	@P_HORA_TRABAJO INT,
	@P_HORA_INICIO VARCHAR(50),
	@P_COSTO_CIRCULACION DECIMAL(18, 2),
	@P_COD_CENTRAL INT,
	@P_DURACION_RECORRIDO INT
AS
	UPDATE TBL_LINEA
	SET NOMBRE = @P_NOMBRE, COLOR = @P_COLOR, DISTANCIA = @P_DISTANCIA, ESTADO = @P_ESTADO, ESTACION_INICIAL = @P_ESTACION_INICIAL, ESTACION_FINAL = @P_ESTACION_FINAL, HORA_TRABAJO = @P_HORA_TRABAJO, HORA_INICIO = CONVERT(DATETIME,REPLACE(@P_HORA_INICIO, '.', ':')), COSTO_CIRCULACION = @P_COSTO_CIRCULACION, COD_CENTRAL = @P_COD_CENTRAL, DURACION_RECORRIDO = @P_DURACION_RECORRIDO
	WHERE COD_LINEA = @P_COD_LINEA
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[UPD_LINEA_TREN_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UPD_LINEA_TREN_PR]
	@P_KILOMETRO INT,
	@P_COD_LINEA VARCHAR(50),
	@P_MATRICULA VARCHAR(50)

AS
	UPDATE TBL_TREN
	SET KILOMETRO = @P_KILOMETRO, COD_LINEA = @P_COD_LINEA
	WHERE MATRICULA = @P_MATRICULA
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[UPD_PERMISO_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UPD_PERMISO_PR]
	@P_CODIGO INT,
	@P_DESCRIPCION NVARCHAR(100)
AS
	UPDATE TBL_PERMISO
	SET  DESCRIPCION = @P_DESCRIPCION
	WHERE CODIGO = @P_CODIGO
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[UPD_PUESTO_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UPD_PUESTO_PR]
   @P_ID INT,
   @P_NOMBRE NVARCHAR(50)
   AS
   UPDATE TBL_PUESTO
   SET NOMBRE = @P_NOMBRE
   WHERE ID = @P_ID
return 0


GO
/****** Object:  StoredProcedure [dbo].[UPD_TIPO_TIQUETE_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UPD_TIPO_TIQUETE_PR]
	@P_ID int,
	@P_TIPO nvarchar(50),
	@P_PRECIO INT
AS
	UPDATE TBL_TIPO_TIQUETE
	SET TIPO = @P_TIPO, PRECIO = @P_PRECIO
	WHERE ID = @P_ID
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[UPD_TREN_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UPD_TREN_PR]

	@P_MODELO NVARCHAR(50),
	@P_MATRICULA NVARCHAR(50),
	@P_NOMBRE NVARCHAR(50),
	@P_FECHA_COMPRA NVARCHAR(50),
	@P_COSTO DECIMAL(18,2),
	@P_DESCRIPCION NVARCHAR(100),
	@P_ESTADO NVARCHAR(50)

AS
	UPDATE TBL_TREN
	SET MODELO = @P_MODELO,NOMBRE = @P_NOMBRE ,FECHA_COMPRA = @P_FECHA_COMPRA,COSTO = @P_COSTO,DESCRIPCION = @P_DESCRIPCION,ESTADO = @P_ESTADO
	WHERE MODELO = @P_MODELO
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[UPD_USUARIO_PR]    Script Date: 20/09/2016 13:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UPD_USUARIO_PR]
	@P_CEDULA    NVARCHAR(50),
    @P_NOMBRE    VARCHAR(50),
    @P_TELEFONO  NVARCHAR(8),
	@P_ID_PUESTO	 INT,
	@P_CONTRASENA NVARCHAR(MAX), 
    @P_CORREO NVARCHAR(20)

AS
	UPDATE TBL_USUARIO
	SET NOMBRE = @P_NOMBRE,
	    TELEFONO = @P_TELEFONO,
		ID_PUESTO = @P_ID_PUESTO,
		CONTRASENA = @P_CONTRASENA,
		CORREO = @P_CORREO
     WHERE CEDULA = @P_CEDULA;
RETURN 0

GO
USE [master]
GO
ALTER DATABASE [TRV_DB] SET  READ_WRITE 
GO
