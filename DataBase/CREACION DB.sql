CREATE DATABASE Clinica
GO

USE Clinica
GO

CREATE TABLE Provincias
(
IdProvincia int identity,
NombreProvincia varchar(50) unique not null,
CONSTRAINT PK_Provincia primary key(IdProvincia)
)
GO

CREATE TABLE Localidades
(
IdLocalidad int identity not null,
NombreLocalidad varchar(50) not null,
IdProvinciaLocalidad int not null,
CONSTRAINT PK_Localidad primary key(IdLocalidad),
CONSTRAINT FK_IdProvincia foreign key(IdProvinciaLocalidad) references Provincias(IdProvincia)
)
GO

CREATE TABLE Especialidades
(
IdEspecialidad int,
CONSTRAINT PK_Especialidades primary key(IdEspecialidad),
NombreEspecialidad varchar(50)
)
GO

CREATE TABLE Usuarios
(
IdUsuario int identity,
CONSTRAINT PK_Usuarios primary key(IdUsuario),
NombreUsuario varchar(15) unique not null,
Contrasenia varchar(15)not null,
TipoUsuario varchar(15) not null,
Estado bit default (1)
)
GO

CREATE TABLE Medicos
(
LegajoMedico nchar(5),
CONSTRAINT PK_Medicos primary key(LegajoMedico),

NombreMedico varchar(50) not null,
ApellidoMedico varchar(50)not null,
DniMedico nchar(9) unique not null,
FechaNacimiento Date not null,

IdEspecialidad_Med int not null,
CONSTRAINT FK_Especialidades_Med foreign key(IdEspecialidad_Med) references Especialidades(IdEspecialidad),

IdLocalidad_Med int,
CONSTRAINT FK_Localidades_Med foreign key(IdLocalidad_Med) references Localidades(IdLocalidad),

IdUsuario_Med int not null,
CONSTRAINT FK_Usuario_Med foreign key(IdUsuario_Med) references Usuarios(IdUsuario),

Telefono_Med nchar(11) null,
Direccion_Med varchar(50)null,
Email_Med varchar(50)null,
Sexo_Med varchar(50)null,
Estado_Med bit default (1)
)
GO

CREATE TABLE Pacientes
(
DniPaciente nchar(5),
CONSTRAINT PK_Pacientes primary key(DniPaciente),

NombrePaciente varchar(50)not null,
ApellidoPaciente varchar(50)not null,
FechaNacimiento Date not null,

IdLocalidad_Paciente int,
CONSTRAINT FK_Localidades_Paciente foreign key(IdLocalidad_Paciente) references Localidades(IdLocalidad),

Telefono_Paciente nchar(11) null,
Direccion_Paciente varchar(50)null,
Email_Paciente varchar(50)null,
Sexo_Paciente varchar(50)null,
Estado_Paciente bit default (1)
)
GO

CREATE TABLE Administradores
(
LegajoAdmin nchar(5) unique,
CONSTRAINT PK_Administradores primary key(LegajoAdmin),

NombreAdmin varchar(50) not null,
ApellidoAdmin varchar(50)not null,
DniAdmin nchar(10)unique,

IdUsuario_Admin int,
CONSTRAINT FK_Usuarios_Admin foreign key(IdUsuario_Admin) references Usuarios(IdUsuario),

Estado bit default(1)
)
GO

CREATE TABLE DiaSemana
(
NumDia int,
CONSTRAINT PK_DiaSemana primary key(NumDia),
Nombre varchar(15) unique
)
GO

CREATE TABLE HorariosMedico
(
LegajoMedico_Horario nchar(5),
CONSTRAINT FK_LegajoMedico_Horarios foreign key(LegajoMedico_Horario) references Medicos(LegajoMedico),

DiaSemana_Horario int,
CONSTRAINT FK_DiaSemana_Horario foreign key(DiaSemana_Horario) references DiaSemana(NumDia),

CONSTRAINT PK_HorariosMedico primary key(LegajoMedico_Horario,DiaSemana_Horario),


HoraIngreso Time,
HoraSalida Time,
Estado_Horario bit default (1)
)
GO

