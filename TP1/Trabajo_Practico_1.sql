CREATE DATABASE Trabajo_Practico_1
GO 
USE Trabajo_Practico_1
GO
CREATE TABLE TiposUsuarios(
	IdTipoUsuario INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	TipoUsuario VARCHAR(50) NOT NULL
)
GO
CREATE TABLE Usuarios(
	IdUsuario INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	Nombre VARCHAR(50) NOT NULL,
	Apellido VARCHAR(50) NOT NULL,
	IdTipoUsuario INT NOT NULL FOREIGN KEY REFERENCES TiposUsuarios(IdTipoUsuario)
)
GO
CREATE TABLE TiposArchivos(
	IdTipoArchivo INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	TipoArchivo VARCHAR(50) NOT NULL
)
GO
CREATE TABLE Permisos(
	IdPermiso INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	Nombre VARCHAR(50) NOT NULL
)
GO
CREATE TABLE Archivos(
	IdArchivo INT NOT NULL PRIMARY KEY IDENTITY(1,1), 	
	IdUsuarioDuenio INT NOT NULL FOREIGN KEY REFERENCES Usuarios(IdUsuario),
	Nombre VARCHAR(50) NOT NULL,
	Extension VARCHAR(50) NOT NULL,
	Descripcion VARCHAR(100) NOT NULL,
	IDTipoArchivo INT NOT NULL FOREIGN KEY REFERENCES TiposArchivos(IdTipoArchivo),
	Tamanio BIGINT NOT NULL,
	FechaCreacion DATE NOT NULL,
	FechaUltimaModificacion DATE NOT NULL,
	Eliminado BIT NOT NULL
)
GO
CREATE TABLE ArchivosCompartidos(
	IdArchivo INT NOT NULL,
	IdUsuario INT NOT NULL, 
	IdPermiso INT NOT NULL, 
	FechaCompartido DATE,
	PRIMARY KEY (IdArchivo, IdUsuario),
	FOREIGN KEY (IdArchivo) REFERENCES Archivos(IdArchivo),
	FOREIGN KEY (IdUsuario) REFERENCES Usuarios(IdUsuario),
	FOREIGN KEY (IdPermiso) REFERENCES Permisos(IdPermiso),
)
GO
