USE master
GO

CREATE DATABASE Clinica
GO

USE Clinica
GO

CREATE TABLE Provincias
(
IdProvincia int identity(1,1),
NombreProvincia varchar(50) unique not null,
CONSTRAINT PK_Provincia primary key(IdProvincia)
)
GO

CREATE TABLE Localidades
(
IdLocalidad int identity(1,1) not null,
NombreLocalidad varchar(50) not null,
IdProvinciaLocalidad int not null,
CONSTRAINT PK_Localidad primary key(IdLocalidad),
CONSTRAINT FK_IdProvincia foreign key(IdProvinciaLocalidad) references Provincias(IdProvincia)
)
GO

CREATE TABLE Especialidades
(
IdEspecialidad int identity (1,1),
CONSTRAINT PK_Especialidades primary key(IdEspecialidad),
NombreEspecialidad varchar(50)
)
GO

CREATE TABLE Usuarios
(
IdUsuario int identity(1,1),
CONSTRAINT PK_Usuarios primary key(IdUsuario),
NombreUsuario varchar(30) unique not null,
Contrasenia varchar(30)not null,
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

IdUsuario_Med int null,
CONSTRAINT FK_Usuario_Med foreign key(IdUsuario_Med) references Usuarios(IdUsuario),

Telefono_Med nchar(11) null,
Direccion_Med varchar(50)null,
Email_Med varchar(50)null,
Sexo_Med varchar(50)null,
Nacionalidad varchar(50)null,
Estado_Med bit default (1)
)
GO

CREATE TABLE Pacientes
(
DniPaciente nchar(10),
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
Nacionalidad varchar(50)null,
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

CREATE TABLE HorariosTrabajo
(
HoraIngreso Time,
HoraSalida Time,
CONSTRAINT PK_Horarios primary key(HoraIngreso,HoraSalida),

TipoHorario varchar(15),
Estado_Horario bit default (1)
)
GO

CREATE TABLE HorariosXDiaXMedico
(
HoraIngresoMedico_HorXDiaXMed Time,
HoraSalidaMedico_HorXDiaXMed Time,
CONSTRAINT FK_HorarioMedico_HorXDiaXMed foreign key(HoraIngresoMedico_HorXDiaXMed,HoraSalidaMedico_HorXDiaXMed) references HorariosTrabajo(HoraIngreso,HoraSalida),

DiaSemana_HorXDiaXMed int,
CONSTRAINT FK_DiaSemana_HorXDiaXMed foreign key(DiaSemana_HorXDiaXMed) references DiaSemana(NumDia),

HoraTrabajo_HorXDiaXMed Time,
CONSTRAINT CK_HoraTrabajo CHECK (HoraTrabajo_HorXDiaXMed >= HoraIngresoMedico_HorXDiaXMed AND HoraTrabajo_HorXDiaXMed < HoraSalidaMedico_HorXDiaXMed), 

LegajoMedico_HorXDiaXMed nchar(5)
CONSTRAINT FK_LegajoMedico_HorXDiaXMed foreign key(LegajoMedico_HorXDiaXMed) references Medicos(LegajoMedico),

Habilitado bit default 1,

CONSTRAINT PK_HorariosXDiaXMedico primary key(DiaSemana_HorXDiaXMed,LegajoMedico_HorXDiaXMed, HoraTrabajo_HorXDiaXMed)
)
GO

CREATE TABLE DiasLaborales
(
FechaDia Date,
CONSTRAINT PK_DiasLaborales primary key(FechaDia)
)
GO

CREATE TABLE HorariosXDiaXMedicoXDl
(
LegajoMedico nchar(5),
DiaSemana int,
HoraDisponible Time,
CONSTRAINT FK_HorarioMedico foreign key(DiaSemana,LegajoMedico,HoraDisponible) references HorariosXDiaXMedico(DiaSemana_HorXDiaXMed,LegajoMedico_HorXDiaXMed,HoraTrabajo_HorXDiaXMed),

FechaDisponible Date,
CONSTRAINT CK_Fecha CHECK (DiaSemana = datepart(weekday,FechaDisponible)),

CONSTRAINT PK_HorariosXDiaXMedicoXDl primary key(LegajoMedico, DiaSemana,HoraDisponible,FechaDisponible),

Asignado Bit default 0
)
GO

CREATE TABLE Turnos
(
IdTurno int identity,
CONSTRAINT PK_Turnos primary key(IdTurno),

LegajoMedico_Turno nchar(5),
DiaSemana_Turno int,
HoraTurno Time,
FechaTurno Date,
CONSTRAINT FK_HorariosXDiaXMedicoXDl_Turnos foreign key(LegajoMedico_Turno, DiaSemana_Turno,HoraTurno,FechaTurno) references HorariosXDiaXMedicoXDl(LegajoMedico, DiaSemana,HoraDisponible,FechaDisponible),

DniPaciente_TA nchar(10),
CONSTRAINT FK_DniPaciente_TA foreign key(DniPaciente_TA) references Pacientes(DniPaciente),

Asistio bit default 0,
)
GO

CREATE TABLE Observaciones
(
IdObservacion int identity(1,1),
CONSTRAINT PK_Observaciones primary key(IdObservacion),

IdTurno_Obs int,
CONSTRAINT FK_IdTurno_OBS foreign key(IdTurno_Obs) references Turnos(IdTurno),

DniPaciente_Obs nchar(10),
CONSTRAINT FK_Dni_OBS foreign key(DniPaciente_OBS) references Pacientes(DniPaciente),

Observacion text not null
)
GO

CREATE TABLE TurnosCancelados
(
IDTurnoCancelado int,
DniPaciente_TC nchar(10),
FechaCancelo date,
CONSTRAINT PK_TurnosCancelados primary key (IDTurnoCancelado),
CONSTRAINT FK_Turnos foreign key(IDTurnoCancelado) REFERENCES Turnos(IdTurno),
CONSTRAINT FK_DniPaciente foreign key (DniPaciente_TC) REFERENCES Pacientes(DniPaciente)
)
GO



INSERT INTO HorariosTrabajo(HoraIngreso,HoraSalida,TipoHorario)
SELECT '8:00', '14:00','Mañana' UNION
SELECT '14:00', '19:00','Tarde' UNION
SELECT '8:00', '19:00','Doble Jornada'
GO

INSERT INTO DiaSemana(NumDIa,Nombre)
SELECT 1,'Lunes' UNION
SELECT 2,'Marter' UNION
SELECT 3,'Miercoles' UNION
SELECT 4,'Jueves' UNION
SELECT 5,'Viernes' UNION
SELECT 6,'Sabado' UNION
SELECT 7,'Domingo' 
GO

INSERT INTO Especialidades (NombreEspecialidad)
SELECT 'Cardiología' UNION
SELECT 'Pediatría' UNION
SELECT 'Dermatología' UNION
SELECT 'Neurología' UNION
SELECT 'Ginecología' UNION
SELECT 'Psiquiatría' UNION
SELECT 'Urología' UNION
SELECT 'Cirugía Plástica' UNION
SELECT 'Traumatología' UNION
SELECT 'Otorrinolaringología'
GO



--Agregue Provincias Restantes
INSERT INTO Provincias (NombreProvincia)
SELECT 'Buenos Aires' UNION 
SELECT 'Catamarca' UNION 
SELECT 'Chaco' UNION 
SELECT 'Chubut' UNION 
SELECT 'Córdoba' UNION 
SELECT 'Corrientes' UNION 
SELECT 'Entre Ríos' UNION 
SELECT 'Formosa' UNION 
SELECT 'Jujuy' UNION 
SELECT 'La Pampa' UNION 
SELECT 'La Rioja' UNION 
SELECT 'Mendoza' UNION 
SELECT 'Misiones' UNION 
SELECT 'Neuquén' UNION 
SELECT 'Río Negro' UNION 
SELECT 'Salta' UNION 
SELECT 'San Juan' UNION 
SELECT 'San Luis' UNION 
SELECT 'Santa Cruz' UNION 
SELECT 'Santa Fe' UNION 
SELECT 'Santiago del Estero' UNION 
SELECT 'Tierra del Fuego' UNION 
SELECT 'Tucumán' 
GO


-- Buenos Aires
INSERT INTO Localidades (NombreLocalidad, IdProvinciaLocalidad)
SELECT 'La Plata', 1 UNION 
SELECT 'Mar del Plata', 1 UNION 
SELECT 'Tandil', 1 UNION 
SELECT 'Bahía Blanca', 1 UNION 
SELECT 'Olavarría', 1 UNION 
SELECT 'Junín', 1 UNION 
SELECT 'San Nicolás', 1 UNION 
SELECT 'Pergamino', 1 UNION 
SELECT 'Lanús', 1 UNION 
SELECT 'Lomas de Zamora', 1 UNION 
SELECT 'Avellaneda', 1 UNION 
SELECT 'Morón', 1 UNION
SELECT 'Quilmes', 1 UNION 
SELECT 'Vicente López', 1 UNION 
SELECT 'San Fernando', 1 UNION
SELECT 'González Catán', 1 UNION
SELECT 'San Justo', 1 UNION 
SELECT 'Sáenz Peña', 1 UNION 
SELECT 'Sarandí', 1 UNION 
SELECT 'San Martín', 1 UNION 
SELECT 'Rafael Calzada', 1 UNION
SELECT 'Belén de Escobar',1 
GO

-- Catamarca
INSERT INTO Localidades (NombreLocalidad, IdProvinciaLocalidad)
SELECT 'San Fernando del Valle de Catamarca', 2 UNION 
SELECT 'Fray Mamerto Esquiú', 2 UNION 
SELECT 'Belén', 2 UNION 
SELECT 'Santa María', 2 UNION 
SELECT 'Hualfín', 2
GO

-- Chaco 
INSERT INTO Localidades (NombreLocalidad, IdProvinciaLocalidad)
SELECT 'Resistencia', 3 UNION 
SELECT 'San Fernando del Valle de Catamarca', 3 UNION 
SELECT 'Barranqueras', 3 UNION 
SELECT 'Fontana', 3 UNION 
SELECT 'Vilelas', 3 UNION 
SELECT 'Sáenz Peña', 3 UNION 
SELECT 'Villa Ángela', 3 UNION 
SELECT 'Charata', 3 UNION 
SELECT 'Las Breñas', 3 UNION 
SELECT 'San Bernardo', 3
GO

-- Chubut 
INSERT INTO Localidades (NombreLocalidad, IdProvinciaLocalidad)
SELECT 'Rawson', 4 UNION 
SELECT 'Trelew', 4 UNION 
SELECT 'Comodoro Rivadavia', 4 UNION 
SELECT 'Puerto Madryn', 4 UNION
SELECT 'El Maitén', 4 UNION 
SELECT 'Sarmiento', 4 UNION 
SELECT 'Tecka', 4 UNION 
SELECT 'Cushamen', 4 UNION 
SELECT 'Rada Tilly', 4 UNION 
SELECT 'Paso de Indios', 4 UNION 
SELECT 'José de San Martín', 4
GO

-- Córdoba 
INSERT INTO Localidades (NombreLocalidad, IdProvinciaLocalidad)
SELECT 'Córdoba', 5 UNION 
SELECT 'Villa María', 5 UNION 
SELECT 'Villa Carlos Paz', 5 UNION 
SELECT 'Río Cuarto', 5 UNION 
SELECT 'Bell Ville', 5 UNION 
SELECT 'Morteros', 5 UNION 
SELECT 'Jesús María', 5 UNION 
SELECT 'Córdoba' ,5 UNION 
SELECT 'Laguna Larga', 5  UNION 
SELECT 'Calchín', 5
GO

-- Corrientes 
INSERT INTO Localidades (NombreLocalidad, IdProvinciaLocalidad)
SELECT 'Corrientes', 6 UNION 
SELECT 'Goya', 6 UNION 
SELECT 'Paso de los Libres', 6 UNION 
SELECT 'Mercedes', 6 UNION 
SELECT 'Bella Vista', 6 UNION 
SELECT 'Santa Lucía', 6 UNION 
SELECT 'Saladas', 6 UNION 
SELECT 'Ituzaingó', 6 UNION 
SELECT 'Riachuelo', 6
GO

-- Entre Ríos 
INSERT INTO Localidades (NombreLocalidad, IdProvinciaLocalidad)
SELECT 'Paraná', 7 UNION 
SELECT 'Concordia', 7 UNION 
SELECT 'Gualeguaychú', 7 UNION 
SELECT 'Gualeguay', 7 UNION 
SELECT 'Chajarí', 7 UNION 
SELECT 'Villaguay', 7 UNION 
SELECT 'Colón', 7 UNION 
SELECT 'Federal', 7
GO

-- Formosa 
INSERT INTO Localidades (NombreLocalidad, IdProvinciaLocalidad)
SELECT 'Formosa', 8 UNION 
SELECT 'Clorinda', 8 UNION 
SELECT 'Pirané', 8 UNION 
SELECT 'Las Lomitas', 8 
GO

-- Jujuy 
INSERT INTO Localidades (NombreLocalidad, IdProvinciaLocalidad)
SELECT 'San Salvador de Jujuy', 9 UNION 
SELECT 'Palpala', 9 UNION 
SELECT 'Perico', 9 UNION 
SELECT 'El Carmen', 9 UNION 
SELECT 'San Francisco', 9 UNION 
SELECT 'Yala', 9 UNION 
SELECT 'Monterrico', 9 UNION 
SELECT 'Fresno', 9 UNION 
SELECT 'La Esperanza', 9
GO

-- La Pampa 
INSERT INTO Localidades (NombreLocalidad, IdProvinciaLocalidad)
SELECT 'Santa Rosa', 10 UNION 
SELECT 'General Pico', 10 UNION 
SELECT 'Realicó', 10 UNION 
SELECT 'Rancul', 10 UNION 
SELECT 'La Maruja', 10 UNION 
SELECT 'Catriló', 10 UNION 
SELECT 'La Adela', 10 UNION 
SELECT 'Conhello', 10 UNION 
SELECT 'Cabrera', 10
GO

-- La Rioja 
INSERT INTO Localidades (NombreLocalidad, IdProvinciaLocalidad)
SELECT 'La Rioja', 11 UNION 
SELECT 'Chilecito', 11 UNION 
SELECT 'Villa Unión', 11 UNION 
SELECT 'Famatina', 11 UNION 
SELECT 'Sanagasta', 11
GO

-- Mendoza 
INSERT INTO Localidades (NombreLocalidad, IdProvinciaLocalidad)
SELECT 'Mendoza', 12 UNION 
SELECT 'San Rafael', 12 UNION 
SELECT 'Godoy Cruz', 12 UNION 
SELECT 'Luján de Cuyo', 12 UNION 
SELECT 'Santa Rosa', 12 UNION 
SELECT 'Junín', 12 UNION 
SELECT 'La Paz', 12 UNION 
SELECT 'San Carlos', 12 UNION 
SELECT 'Las Heras', 12 UNION 
SELECT 'La Consulta', 12
GO

-- Misiones 
INSERT INTO Localidades (NombreLocalidad, IdProvinciaLocalidad)
SELECT 'Posadas', 13 UNION 
SELECT 'Oberá', 13 UNION 
SELECT 'Eldorado', 13 UNION 
SELECT 'Iguazú', 13 UNION 
SELECT 'Posadas', 13 
GO

-- Neuquén 
INSERT INTO Localidades (NombreLocalidad, IdProvinciaLocalidad)
SELECT 'Neuquén', 14 UNION 
SELECT 'San Martín de los Andes', 14 UNION 
SELECT 'Villa La Angostura', 14 UNION 
SELECT 'Zapala', 14 UNION 
SELECT 'Plottier', 14 UNION 
SELECT 'Las Lajas', 14 
GO

-- Río Negro 
INSERT INTO Localidades (NombreLocalidad, IdProvinciaLocalidad)
SELECT 'Viedma', 15 UNION 
SELECT 'San Carlos de Bariloche', 15 UNION 
SELECT 'General Roca', 15 UNION 
SELECT 'Cipolletti', 15 UNION 
SELECT 'Catriel', 15
GO

-- Salta 
INSERT INTO Localidades (NombreLocalidad, IdProvinciaLocalidad)
SELECT 'Salta', 16 UNION 
SELECT 'San Lorenzo', 16 UNION 
SELECT 'Rosario de la Frontera', 16 UNION
SELECT 'Cerrillos', 16 UNION 
SELECT 'Campo Quijano', 16 UNION 
SELECT 'La Merced', 16 UNION 
SELECT 'La Caldera', 16
GO

-- San Juan 
INSERT INTO Localidades (NombreLocalidad, IdProvinciaLocalidad)
SELECT 'San Juan', 17 UNION 
SELECT 'Rivadavia', 17 UNION 
SELECT 'Rawson', 17 UNION 
SELECT 'Jáchal', 17 UNION 
SELECT 'Caucete', 17 UNION 
SELECT 'Santa Lucía', 17 UNION 
SELECT 'Calingasta', 17 UNION 
SELECT 'Pocito', 17
GO

-- San Luis 
INSERT INTO Localidades (NombreLocalidad, IdProvinciaLocalidad)
SELECT 'San Luis', 18 UNION 
SELECT 'Villa Mercedes', 18 UNION 
SELECT 'La Punta', 18 UNION
SELECT 'San Jerónimo', 18 UNION
SELECT 'Renca', 18 UNION 
SELECT 'Los Molles', 18
GO

-- Santa Cruz 
INSERT INTO Localidades (NombreLocalidad, IdProvinciaLocalidad)
SELECT 'Río Gallegos', 19 UNION 
SELECT 'El Calafate', 19 UNION 
SELECT 'Caleta Olivia', 19 UNION 
SELECT 'Trescientos Treinta y Tres', 19 UNION
SELECT 'San Julián', 19 UNION 
SELECT 'El Paraíso', 19
GO

-- Santa Fe 
INSERT INTO Localidades (NombreLocalidad, IdProvinciaLocalidad)
SELECT 'Santa Fe', 20 UNION 
SELECT 'Rosario', 20 UNION 
SELECT 'Villa Constitución', 20 UNION 
SELECT 'El Trébol', 20 UNION
SELECT 'Gálvez', 20 UNION
SELECT 'Pujato', 20 UNION 
SELECT 'Firmat', 20
GO

-- Santiago del Estero 
INSERT INTO Localidades (NombreLocalidad, IdProvinciaLocalidad)
SELECT 'Santiago del Estero', 21 UNION
SELECT 'La Banda', 21 UNION
SELECT 'Termas de Río Hondo', 21 UNION 
SELECT 'Loreto', 21 UNION  
SELECT 'Colonia Dora', 21 UNION 
SELECT 'Bandera', 21
GO

-- Tierra del Fuego 
INSERT INTO Localidades (NombreLocalidad, IdProvinciaLocalidad)
SELECT 'Ushuaia', 22 UNION 
SELECT 'Río Grande', 22 UNION 
SELECT 'Tolhuin', 22 UNION 
SELECT 'Puerto Almanza', 22 UNION
SELECT 'Río Irigoyen', 22 
GO

-- Tucumán 
INSERT INTO Localidades (NombreLocalidad, IdProvinciaLocalidad)
SELECT 'San Miguel de Tucumán', 23 UNION 
SELECT 'Concepción', 23 UNION 
SELECT 'Yerba Buena', 23 UNION 
SELECT 'Tafí Viejo', 23 UNION 
SELECT 'Ranchillos', 23 UNION 
SELECT 'El Manantial', 23
GO


 CREATE PROCEDURE spEliminarPacientes
 (
   @DNIPACIENTE nchar(5)
 )
 AS
 DELETE FROM Pacientes
 WHERE DniPaciente = @DNIPACIENTE
 RETURN
 GO

 CREATE PROCEDURE spAgregarPacientes
 (
	 @NOMBRE varchar(50),
	 @APELLIDO varchar(50),
     @DNI nchar(10),
	 @IDLOCALIDAD int,
	 @DIRECCION varchar(50),
	 @EMAIL varchar(50),
	 @TELEFONO nchar(11),
	 @NACIONALIDAD varchar(50),
	 @SEXO varchar(50),
	 @FECHANAC DateTime
 )
 AS
 INSERT INTO Pacientes(NombrePaciente, ApellidoPaciente,DniPaciente,Direccion_Paciente, Email_Paciente, Telefono_Paciente,IdLocalidad_Paciente, FechaNacimiento,Nacionalidad,Sexo_Paciente)
 SELECT @NOMBRE,  @APELLIDO, @DNI,@DIRECCION,@EMAIL,@TELEFONO,@IDLOCALIDAD,@FECHANAC,@NACIONALIDAD,@SEXO
 GO

 CREATE PROCEDURE spActualizarPacientes
 (
     @DNI nchar(5),
     @NOMBRE varchar(50),
     @APELLIDO varchar(50),
     @DIRECCION varchar(50),
     @TELEFONO varchar(50),
	 @NACIONALIDAD varchar(50),
	 @SEXO varchar(50),
     @FECHANACIMIENTO DateTime
       
 )
 AS
 UPDATE Pacientes
 SET
 NombrePaciente = @NOMBRE,
 ApellidoPaciente = @APELLIDO,
 Direccion_Paciente = @DIRECCION,      
 Telefono_Paciente = @TELEFONO,
 FechaNacimiento = @FECHANACIMIENTO,
 Nacionalidad = @NACIONALIDAD,
 Sexo_Paciente = @SEXO
 WHERE DniPaciente = @DNI
 RETURN
 GO

ALTER PROCEDURE spEliminarMedicos
 (
	@LEGAJO nchar(5)
 )
 AS 
 UPDATE	Medicos
 SET Estado_Med = 0
 WHERE LegajoMedico = @LEGAJO
 GO

 exec spEliminarMedicos '00001'

CREATE PROCEDURE spAgregarMedico
 (
	@LEGAJO nchar(5),
    @NOMBRE varchar(50),
	@APELLIDO varchar(50),
    @DNI varchar(10),
	@IDESPECIALIDAD int,
	@FECHANACIMIENTO Date,
	@DIRECCION varchar(50),
	@IDLOCALIDAD int,
	@TELEFONO varchar(11),
    @EMAIL varchar(50),
	@NACIONALIDAD varchar(15),
	@SEXO varchar(15)
 )
 AS
 INSERT INTO Medicos(LegajoMedico,NombreMedico,ApellidoMedico,DniMedico,IdEspecialidad_Med,FechaNacimiento,Direccion_Med,IdLocalidad_Med,Telefono_Med,Email_Med,Sexo_Med,Nacionalidad)
 SELECT @LEGAJO ,@NOMBRE,@APELLIDO,@DNI, @IDESPECIALIDAD, @FECHANACIMIENTO, @DIRECCION,@IDLOCALIDAD,@TELEFONO,@EMAIL,@SEXO,@NACIONALIDAD
 GO

 CREATE PROCEDURE spActualizarMedicos
 (
	@LEGAJO nchar(5),
	@NOMBRE varchar(50),
	@APELLIDO varchar(50),
	@DNI nchar(9),
	@ESPECIALIDAD int
 )
 AS 
 UPDATE	Medicos
 SET 
 NombreMedico = @NOMBRE,
 ApellidoMedico = @APELLIDO,
 DniMedico = @DNI,
 IdEspecialidad_Med = @ESPECIALIDAD
 WHERE LegajoMedico = @LEGAJO
 RETURN
 GO

 CREATE PROCEDURE spAgregarTurnos
 (
	@LEGAJOMED nchar(5),
	@DIASEMANA int,
	@HORATURNO time,
	@FECHATURNO date,
	@DNIPACIENTE nchar(10)
 )
 AS
 INSERT INTO Turnos (LegajoMedico_Turno,DiaSemana_Turno,HoraTurno,FechaTurno,DniPaciente_TA)
 SELECT @LEGAJOMED,@DIASEMANA,@HORATURNO,@FECHATURNO,@DNIPACIENTE
 GO

 CREATE PROCEDURE spActualizarTurno
 (
	@IDTURNO int,
	@LEGAJOMED nchar(5),
	@DIASEMANA int,
	@HORATURNO time,
	@FECHATURNO date,
	@DNIPACIENTE nchar(10)
 )
 AS
 UPDATE Turnos
 SET
 LegajoMedico_Turno = @LEGAJOMED,
 DiaSemana_Turno =@DIASEMANA,
 HoraTurno = @HORATURNO,
 FechaTurno = @FECHATURNO,
 DniPaciente_TA = @DNIPACIENTE
 WHERE IdTurno = @IDTURNO
 GO

 CREATE PROCEDURE spAgregarObservacion
 (
	@IDTURNO int,
	@DNIPACIENTE nchar(10),
	@OBSERVACIONES text
 )
 AS
 INSERT INTO Observaciones (IdTurno_Obs,DniPaciente_Obs,Observacion)
 SELECT @IDTURNO,@DNIPACIENTE,@OBSERVACIONES
 GO

 CREATE PROCEDURE spActualizarObservacion
 (
	@IDOBSERVACION int,
	@IDTURNO int,
	@DNIPACIENTE nchar(10),
	@OBSERVACIONES text
 )
 AS
 UPDATE Observaciones
 SET
 IdTurno_Obs = @IDTURNO,
 DniPaciente_Obs = @DNIPACIENTE,
 Observacion = @OBSERVACIONES
 WHERE IdObservacion = @IDOBSERVACION
 GO

 CREATE PROCEDURE spEliminarObservacion
 (
	@IDOBSERVACION int
 )
 AS
 DELETE FROM Observaciones
 WHERE IdObservacion = @IDOBSERVACION
 GO


 CREATE VIEW viewMedicos
 AS
 SELECT LegajoMedico AS Legajo, NombreMedico AS Nombre, ApellidoMedico AS Apellido, DniMedico AS DNI, NombreEspecialidad AS Especialidad
 FROM Medicos INNER JOIN Especialidades ON Medicos.IdEspecialidad_Med = Especialidades.IdEspecialidad
 WHERE Estado_Med = 1
 GO


 -- spHabilitarDias recibe como parametro una fecha y a partir del dia actual va cargando la fecha en DiasLaborales siempre y cuando no sea fin de semana (Luego manualmente se eliminaran fechas correspondientes a feriados)
 CREATE PROCEDURE spHabilitarDias
 (
 @FECHAFINAL Date
 )
 AS
 DECLARE @FECHAINICIO Date = getdate()
 WHILE @FECHAINICIO <= @FECHAFINAL
 BEGIN
	IF(datepart(WEEKDAY, @FECHAINICIO) < 6)
		BEGIN
			INSERT INTO DiasLaborales(FechaDia)
			SELECT @FECHAINICIO
		END
	SET @FECHAINICIO = DATEADD(day,1,@FECHAINICIO)
END
GO


--spCargarHorarioXDiaXMedico recorre el rango de HorariosTrabajo correspondiente y cargando cada hora con el dia y el legajo que se pasen como parametro
CREATE PROCEDURE spCargarHorariosXDiaXMedico
(
@LEGAJO nchar(5),
@DIASEMANA int,
@HORAENTRADA Time,
@HORASALIDA Time
)
AS
DECLARE @HORAINICIO Time = @HORAENTRADA
WHILE @HORAINICIO < @HORASALIDA
BEGIN
	INSERT INTO HorariosXDiaXMedico(LegajoMedico_HorXDiaXMed, DiaSemana_HorXDiaXMed, HoraIngresoMedico_HorXDiaXMed, HoraSalidaMedico_HorXDiaXMed, HoraTrabajo_HorXDiaXMed)
	SELECT @LEGAJO, @DIASEMANA, @HORAENTRADA, @HORASALIDA, @HORAINICIO
	SET @HORAINICIO = DATEADD(HOUR,1,@HORAINICIO)
END
GO

--spCargarHorariosXDiaXMedicoDL carga cada hora de trabajo correspondiente al legajo y numero de dia que se envian por parametro a un rango de fechas que se envian por parametro y previamente deberan estar habilitadas en DiasLaborales
CREATE PROCEDURE spCargarHorariosXDiaXMedicoDL
(
@LEGAJO nchar(5),
@DIA int,
@FECHAINICIO Date,
@FECHAFINAL Date
)
AS
WHILE @FECHAINICIO <= @FECHAFINAL
BEGIN
	IF(@DIA = DATEPART(WEEKDAY,@FECHAINICIO))
	BEGIN	
		DECLARE @HORAINICIO Time = (SELECT MIN(HoraTrabajo_HorXDiaXMed)
																		FROM HorariosXDiaXMedico
																		WHERE LegajoMedico_HorXDiaXMed = @LEGAJO and DiaSemana_HorXDiaXMed = @DIA)
		DECLARE @HORAFINAL Time = (SELECT MAX(HoraTrabajo_HorXDiaXMed)
																		FROM HorariosXDiaXMedico
																		WHERE LegajoMedico_HorXDiaXMed = @LEGAJO and DiaSemana_HorXDiaXMed = @DIA)
		WHILE @HORAINICIO < @HORAFINAL
		BEGIN
			INSERT INTO HorariosXDiaXMedicoXDl(LegajoMedico,DiaSemana,FechaDisponible,HoraDisponible)
			SELECT @LEGAJO, @DIA, @FECHAINICIO, @HORAINICIO
			SET @HORAINICIO = DATEADD(HOUR,1,@HORAINICIO)
		END
	END
	SET @FECHAINICIO = DATEADD(DAY,1,@FECHAINICIO)
END
GO

--Cree un TRIGGER para que al momento de cargar las horas en HorarioXDiaXMedico se carguen en HorariosXDiaXMedicoXDL  con las fechas habilitadas hasta el momento.
CREATE TRIGGER TR_CARGARHORARIOSXDIAXMEDICOXDL
ON HorariosXDiaXMedico AFTER INSERT
AS
BEGIN
	SET DATEFIRST 1
	DECLARE @FECHAINICIO Date = getDate()
	DECLARE @FECHAFINAL Date = (SELECT MAX(FechaDia) FROM DiasLaborales)
	WHILE @FECHAINICIO <= @FECHAFINAL
	BEGIN
		IF((SELECT DiaSemana_HorXDiaXMed FROM inserted) = DATEPART(WEEKDAY,@FECHAINICIO))
		BEGIN	
			INSERT INTO HorariosXDiaXMedicoXDl(LegajoMedico,DiaSemana,HoraDisponible,FechaDisponible)
			SELECT LegajoMedico_HorXDiaXMed, DiaSemana_HorXDiaXMed, HoraTrabajo_HorXDiaXMed, @FECHAINICIO FROM inserted
		END
		SET @FECHAINICIO = DATEADD(DAY,1,@FECHAINICIO)
	END
END
GO

--spVerDisponibles muestras las horas disponibles segun el legajo y fecha que se envian como parametro
CREATE PROCEDURE spVerDisponibles
(
@LEGAJO nchar(5),
@FECHA Date
)
AS
SELECT HoraDisponible, FechaDisponible
FROM HorariosXDiaXMedicoXDl
WHERE LegajoMedico = @LEGAJO and FechaDisponible = @FECHA and Asignado = 0 
GO

CREATE TRIGGER TR_CREARUSUARIO
ON Medicos AFTER INSERT
AS
BEGIN 
--CREAMOS EL USUARIO CONCATENANDO APELLIDO Y LOS PRIMEROS 4 DIGITOS DEL DNI
INSERT INTO Usuarios(NombreUsuario, Contrasenia, TipoUsuario)
SELECT CONCAT(ApellidoMedico,LEFT(DniMedico,4)), CONCAT(ApellidoMedico,DniMedico), 'Medico' FROM inserted

UPDATE M
SET M.IdUsuario_Med = U.IdUsuario
FROM (Medicos as M INNER JOIN inserted as I
ON M.LegajoMedico = I.LegajoMedico) INNER JOIN Usuarios as U
ON U.NombreUsuario = CONCAT(I.ApellidoMedico, LEFT(I.DniMedico,4))
END
GO

CREATE TRIGGER TR_ASIGNARTURNO
ON Turnos AFTER INSERT
AS
BEGIN
DECLARE @Hora Time = (SELECT HoraTurno FROM inserted)
DECLARE @Fecha Date = (SELECT FechaTurno FROM inserted)
DECLARE @Legajo nchar(5) = (SELECT LegajoMedico_Turno FROM inserted)
DECLARE @Dia int = (SELECT DiaSemana_Turno FROM inserted)
UPDATE HorariosXDiaXMedicoXDl
SET Asignado = 1
WHERE LegajoMedico = @Legajo and HoraDisponible = @Hora and DiaSemana = @Dia and FechaDisponible = @Fecha
END
GO

--En caso de que se de de baja un medico, se deshabilitan todos los horariosXdiaXmedicos cargados
CREATE TRIGGER TR_DESHABILITAR_HORARIOSXDIAXMEDICO
ON Medicos AFTER UPDATE
AS
BEGIN
	IF UPDATE(Estado_Med)
	BEGIN
	DECLARE @LEGAJO nchar(5)= (SELECT LegajoMedico FROM inserted)
	UPDATE HorariosXDiaXMedico
	SET Habilitado = 0
	WHERE LegajoMedico_HorXDiaXMed = @LEGAJO
	END
END
GO

--SI se da de baja un horarioXdiaXmedico se deshabilitan de la tabla HorariosXdiaXmedicoXdl
ALTER TRIGGER TR_DESHABILITAR_HORARIOSXDIAXMEDICOXDL
ON HorariosXDiaXMedico AFTER UPDATE
AS
BEGIN
	IF UPDATE(Habilitado)
	BEGIN
		UPDATE HorariosXDiaXMedicoXDl
		SET  Asignado = 1
		FROM HorariosXDiaXMedicoXDl hxdxd
        INNER JOIN inserted i
        ON hxdxd.LegajoMedico = i.LegajoMedico_HorXDiaXMed
        AND hxdxd.DiaSemana = i.DiaSemana_HorXDiaXMed
        AND hxdxd.HoraDisponible = i.HoraTrabajo_HorXDiaXMed;
	END
END
GO

CREATE FUNCTION HorasDisponibles
(
    @LEGAJO nchar(5),
    @FECHA Date
)
RETURNS BIT
AS
BEGIN
    DECLARE @Existe BIT;

    -- Verifica si existen horas disponibles
    IF EXISTS (
        SELECT 1
        FROM HorariosXDiaXMedicoXDl
        WHERE LegajoMedico = @LEGAJO 
          AND FechaDisponible = @FECHA 
          AND Asignado = 0
    )
    BEGIN
        SET @Existe = 1;  -- Verdadero, hay horas disponibles
    END
    ELSE
    BEGIN
        SET @Existe = 0;  -- Falso, no hay horas disponibles
    END

    RETURN @Existe;
END;
GO



EXEC spHabilitarDias  '2024/12/31'

DELETE  FROM DiasLaborales WHERE FechaDia = '2024/7/9'
GO
DELETE  FROM DiasLaborales WHERE FechaDia = '2024/10/11'
GO
DELETE  FROM DiasLaborales WHERE FechaDia = '2024/11/18'
GO
DELETE  FROM DiasLaborales WHERE FechaDia = '2024/12/25'
GO

-- Insertar médicos


INSERT INTO Medicos (LegajoMedico, NombreMedico, ApellidoMedico, DniMedico, FechaNacimiento, IdEspecialidad_Med, IdLocalidad_Med, Telefono_Med, Direccion_Med, Email_Med, Sexo_Med, Nacionalidad)
SELECT '00001', 'Emiliano', 'Martínez', '123456789', '1992-09-02', 1, 9, '01111111111', 'Calle Falsa 123', 'emartinez@mail.com', 'Masculino', 'Argentina' UNION
SELECT '00007', 'Leandro', 'Paredes', '445678901', '1994-06-29', 2,17, '01111111114', 'Calle Falsa 606', 'lparedes@mail.com', 'Masculino', 'Argentina' UNION
SELECT '00008', 'Enzo', 'Fernández', '889012345', '2001-01-17', 3, 18, '05555555556', 'Calle Falsa 909', 'efernandez@mail.com', 'Masculino', 'Argentina' UNION
SELECT '00009', 'Lionel', 'Messi', '112345678', '1987-06-24', 4,158, '08888888889', 'Calle Falsa 101', 'lmessi@mail.com', 'Masculino', 'Argentina' UNION
SELECT '00011', 'Julián', 'Álvarez', '156789012', '2000-01-31', 5, 50, '01111111113', 'Calle Falsa 404', 'jalvarez@mail.com', 'Masculino', 'Argentina' UNION
SELECT '00015', 'Vanina', 'Correa', '567890123', '1983-08-14', 6, 166, '01111111115', 'Calle Falsa 505', 'vcorrea@mail.com', 'Femenino', 'Argentina' UNION
SELECT '00016', 'Estefanía', 'Banini', '678901234', '1990-06-21', 7,75, '01111111116', 'Calle Falsa 606', 'ebanini@mail.com', 'Femenino', 'Argentina' UNION
SELECT '00017', 'Aldana', 'Cometti', '789012345', '1996-03-03', 8,52, '01111111117', 'Calle Falsa 707', 'acometti@mail.com', 'Femenino', 'Argentina' UNION
SELECT '00018', 'Florencia', 'Bonsegundo', '890123456', '1993-07-14', 9,67, '01111111118', 'Calle Falsa 808', 'fbonsegundo@mail.com', 'Femenino', 'Argentina' UNION
SELECT '00019', 'Sole', 'Jaimes', '901234567', '1989-01-20', 10,95, '01111111119', 'Calle Falsa 909', 'sjaimes@mail.com', 'Femenino', 'Argentina' 
GO

EXEC spCargarHorariosXDiaXMedico '00001',1,'8:00','14:00'
GO
EXEC spCargarHorariosXDiaXMedico '00007',2,'14:00','19:00'
GO
EXEC spCargarHorariosXDiaXMedico '00008',3,'8:00','14:00'
GO
EXEC spCargarHorariosXDiaXMedico '00011',5,'8:00','14:00'
GO
EXEC spCargarHorariosXDiaXMedico '00015',1,'14:00','19:00'
GO
EXEC spCargarHorariosXDiaXMedico '00016',2,'8:00','14:00'
GO
EXEC spCargarHorariosXDiaXMedico '00017',3,'14:00','19:00'
GO
EXEC spCargarHorariosXDiaXMedico '00018',4,'8:00','14:00'
GO
EXEC spCargarHorariosXDiaXMedico '00019',5,'14:00','19:00'
GO
EXEC spCargarHorariosXDiaXMedico '00001',3,'8:00','19:00'
GO
EXEC spCargarHorariosXDiaXMedico '00001',5,'8:00','19:00'
GO
EXEC spCargarHorariosXDiaXMedico '00009',1,'8:00','19:00'
GO
EXEC spCargarHorariosXDiaXMedico '00009',2,'8:00','19:00'
GO
EXEC spCargarHorariosXDiaXMedico '00009',3,'8:00','14:00'
GO
EXEC spCargarHorariosXDiaXMedico '00009',4,'8:00','19:00'
GO
EXEC spCargarHorariosXDiaXMedico '00009',5,'8:00','19:00'
GO




-- Insertar pacientes 
INSERT INTO Pacientes (DniPaciente, NombrePaciente, ApellidoPaciente, FechaNacimiento, IdLocalidad_Paciente, Telefono_Paciente, Direccion_Paciente, Email_Paciente, Sexo_Paciente, Nacionalidad)
SELECT '778901234', 'Alexis', 'Mac Allister', '1998-12-24', 111, '04444444445', 'Calle Falsa 808', 'amacallister@mail.com', 'Masculino', 'Argentina' UNION
SELECT '134567890', 'Lautaro', 'Martínez', '1997-08-22',2, '01010101011', 'Avenida Siempreviva 789', 'lmartinez@mail.com', 'Masculino', 'Argentina' UNION
SELECT '145678901', 'Paulo', 'Dybala', '1993-11-15',53, '01111111112', 'Calle Falsa 303', 'pdybala@mail.com', 'Masculino', 'Argentina' UNION
SELECT '167890123', 'Nicolás', 'González', '1998-04-06',3, '01111111114', 'Calle Falsa 505', 'ngonzalez@mail.com', 'Masculino', 'Argentina' UNION
SELECT '167890125', 'Vanina', 'Preininger', '1994-06-11', 1, '01111111134', 'Calle Falsa 2424', 'vpreininger@mail.com', 'Femenino', 'Argentina' UNION
SELECT '178901234', 'Camila', 'Gómez Ares', '1994-12-26', 24, '01111111135', 'Calle Falsa 2525', 'cgomez@mail.com', 'Femenino', 'Argentina' UNION
SELECT '189012345', 'Daiana', 'Chávez', '1996-07-25', 59, '01111111136', 'Calle Falsa 2626', 'dchavez@mail.com', 'Femenino', 'Argentina' UNION
SELECT '190123456', 'Evelina', 'Cabrera', '1988-06-26',48, '01111111137', 'Calle Falsa 2727', 'ecabrera@mail.com', 'Femenino', 'Argentina' UNION
SELECT '201234567', 'Vanina', 'Correa', '1983-08-14',38, '01111111138', 'Calle Falsa 2828', 'vcorrea2@mail.com', 'Femenino', 'Argentina' 
GO

INSERT INTO Usuarios(NombreUsuario, Contrasenia, TipoUsuario)
SELECT 'Adminitrador', 'admin1234', 'Admin'

EXEC spVerDisponibles '11111', '2024/07/19'
GO

CREATE VIEW viewHorariosMedico
AS
SELECT DISTINCT  LegajoMedico_HorXDiaXMed as Legajo, Nombre as Dia, HoraIngresoMedico_HorXDiaXMed as Ingreso, HoraSalidaMedico_HorXDiaXMed as Salida
FROM HorariosXDiaXMedico INNER JOIN DiaSemana 
ON DiaSemana_HorXDiaXMed = NumDia
GO



CREATE TRIGGER tr_TurnosCancelados
ON Turnos AFTER DELETE
AS 
BEGIN
--CUANDO BORRAMOS UN TURNOS LO INSERTAMOS EN LA TABLA TURNOS CANCELADOS

INSERT INTO TurnosCancelados(IDTurnoCancelado,DniPaciente_TC,FechaCancelo)
SELECT IdTurno,DniPaciente_TA,FechaTurno FROM deleted
END
GO


--MEDICOS DISPONIBLES Y SU ESPECIALIDAD
SELECT E.NombreEspecialidad, HDM.LegajoMedico_HorXDiaXMed
FROM ((Especialidades AS E INNER JOIN Medicos AS M
ON E.IdEspecialidad = M.IdEspecialidad_Med) INNER JOIN HorariosXDiaXMedico AS HDM
ON M.LegajoMedico = HDM.LegajoMedico_HorXDiaXMed)
GO

--PROVINCIA DE LOS PACIENTES
SELECT P.NombreProvincia, PA.NombrePaciente + PA.ApellidoPaciente AS [Nombre Completo]
FROM (Provincias AS P INNER JOIN Localidades AS L
ON P.IdProvincia = L.IdProvinciaLocalidad) INNER JOIN Pacientes AS PA
ON L.IdLocalidad = PA.IdLocalidad_Paciente
GO

--LOS TURNOS CANCELADOS DE CADA PACIENTE
SELECT P.NombrePaciente + P.ApellidoPaciente AS [Nombre Completo], TC.FechaCancelo AS [Fecha Cancelada]
FROM (Pacientes AS P INNER JOIN Turnos AS T
ON P.DniPaciente = T.DniPaciente_TA) INNER JOIN TurnosCancelados AS TC
ON T.IdTurno = TC.IDTurnoCancelado
AND T.DniPaciente_TA = TC.DniPaciente_TC
AND T.FechaTurno = TC.FechaCancelo
GO

INSERT INTO Pacientes(DniPaciente,NombrePaciente,ApellidoPaciente,FechaNacimiento,IdLocalidad_Paciente,Telefono_Paciente,Direccion_Paciente,Email_Paciente,Sexo_Paciente,Nacionalidad,Estado_Paciente)
SELECT '10023','Luciano','Ramirez','2004-03-21',1,'1568552025','ituzaingo200','luciano_ram','Masculino','Argentina',1
GO

INSERT INTO Medicos(LegajoMedico,NombreMedico,ApellidoMedico,DniMedico,FechaNacimiento,IdEspecialidad_Med,IdLocalidad_Med, Telefono_Med,Direccion_Med,Email_Med,Sexo_Med,Nacionalidad,Estado_Med)
SELECT '2001','Agustina','Villalba','41','2001-09-03',1,1,'1564885692','sucre101','agus_villalba','Femenino','Argentina',1
GO

INSERT INTO HorariosXDiaXMedico(HoraIngresoMedico_HorXDiaXMed,HoraSalidaMedico_HorXDiaXMed,DiaSemana_HorXDiaXMed,HoraTrabajo_HorXDiaXMed,LegajoMedico_HorXDiaXMed,Habilitado)
SELECT '08:00','14:00',4,'09:00','2001',1
GO

INSERT INTO Turnos(LegajoMedico_Turno,DiaSemana_Turno,HoraTurno,FechaTurno,DniPaciente_TA,Asistio)
SELECT '2001',4,'09:00','2024-07-18','10023',1
GO

SELECT * FROM Pacientes

Select IdTurno AS [ID Turnos],FechaTurno AS Fecha,HoraTurno AS Hora,NombrePaciente AS Nombre,ApellidoPaciente AS Apellido,DniPaciente_TA AS DNI,Asistio AS Asistio
From Turnos inner join Pacientes 
ON DniPaciente = DniPaciente_TA
GO

Select Turnos.FechaTurno, Turnos.DniPaciente_TA,Pacientes.NombrePaciente,Especialidades.NombreEspecialidad, Asistio,Observacion
From (((((Especialidades inner join Medicos
ON IdEspecialidad = IdEspecialidad_Med) inner join HorariosXDiaXMedico
ON LegajoMedico = LegajoMedico_HorXDiaXMed) inner join HorariosXDiaXMedicoXDl
ON LegajoMedico_HorXDiaXMed = HorariosXDiaXMedicoXDl.LegajoMedico
AND DiaSemana_HorXDiaXMed =DiaSemana
AND HoraTrabajo_HorXDiaXMed = HoraDisponible) inner join Turnos
ON HorariosXDiaXMedicoXDl.LegajoMedico = LegajoMedico_Turno
AND DiaSemana = DiaSemana_Turno
AND FechaDisponible = FechaTurno
AND HorariosXDiaXMedicoXDl.HoraDisponible = HoraTurno) inner join Pacientes
ON DniPaciente_TA = DniPaciente) inner join Observaciones
ON DniPaciente = DniPaciente_Obs
GO

CREATE TRIGGER TR_CREARUSUARIO_Admin
ON Administradores
AFTER INSERT
AS
BEGIN 
--CREAMOS EL USUARIO CONCATENANDO APELLIDO Y LOS PRIMEROS 4 DIGITOS DEL DNI
INSERT INTO Usuarios(NombreUsuario, Contrasenia, TipoUsuario)
SELECT CONCAT(ApellidoAdmin,LEFT(DniAdmin,4)), CONCAT(ApellidoAdmin,DniAdmin), 'Admin' FROM inserted

UPDATE A
SET A.IdUsuario_Admin = U.IdUsuario
FROM (Administradores as A INNER JOIN inserted as I
ON A.LegajoAdmin = I.LegajoAdmin) INNER JOIN Usuarios as U
ON U.NombreUsuario = CONCAT(I.ApellidoAdmin, LEFT(I.DniAdmin,4))
END
GO


INSERT INTO Administradores (LegajoAdmin, NombreAdmin, ApellidoAdmin, DniAdmin)
SELECT 'A001', 'Carolina', 'Alvarez', '39888222' 
GO



CREATE PROCEDURE CalcularPorcentajeAsistencias
    @FechaInicio DATE,
    @FechaFin DATE
AS
BEGIN
    WITH CTE_Contador AS (
        SELECT
            SUM(CASE WHEN Asistio = 1 THEN 1 ELSE 0 END) AS TotalAsistencias,
            SUM(CASE WHEN Asistio = 0 THEN 1 ELSE 0 END) AS TotalInasistencias,
            COUNT(*) AS Total
        FROM
            Turnos
        WHERE
            FechaTurno BETWEEN @FechaInicio AND @FechaFin
    )
    SELECT
        'ASISTENCIAS' AS Tipo,
        CAST(TotalAsistencias * 100.0 / Total AS DECIMAL(5, 2)) AS Porcentaje
    FROM
        CTE_Contador
    UNION ALL
    SELECT
        'INASISTENCIAS' AS Tipo,
        CAST(TotalInasistencias * 100.0 / Total AS DECIMAL(5, 2)) AS Porcentaje
    FROM
        CTE_Contador;
END;

SELECT  
SUM(CASE WHEN Asistio = 1 THEN 1 ElSE 0 END) as SiAsistio,
SUM(CASE WHEN Asistio = 0 THEN 1 ElSE 0 END) as NoAsistio,
COUNT(*) as Total
FROM Turnos
WHERE FechaTurno >= '2024/07/14' and FechaTurno <= '2024/12/30'


SELECT 'Asistio' as Tipo, SUM(CASE WHEN Asistio = 1 THEN 1 ElSE 0 END) as Cantidad
FROM Turnos
UNION
SELECT 'No asistio' as Tipo, SUM(CASE WHEN Asistio = 0 THEN 1 ElSE 0 END) as Cantidad
FROM Turnos
WHERE FechaTurno >= '2024/07/14' and FechaTurno <= '2024/12/30'

EXEC CalcularPorcentajeAsistencias '2024/07/14', '2024/12/30'
GO
