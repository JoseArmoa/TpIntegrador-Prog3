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
IdTurno int,
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



INSERT INTO HorariosTrabajo(HoraIngreso,HoraSalida,TipoHorario)
SELECT '8:00', '14:00','Mañana' UNION
SELECT '14:00', '19:00','Tarde' UNION
SELECT '8:00', '19:00','Doble Jornada'
GO

INSERT INTO DiaSemana(NumDIa,Nombre)
SELECT 1,'Lunes' UNION
SELECT 2,'Martes' UNION
SELECT 3,'Miercoles' UNION
SELECT 4,'Jueves' UNION
SELECT 5,'Viernes' UNION
SELECT 6,'Sabado' UNION
SELECT 7,'Domingo' 
GO

INSERT INTO Especialidades (NombreEspecialidad)
SELECT  'Cardiología' UNION
SELECT  'Pediatría' UNION
SELECT  'Dermatología' UNION
SELECT  'Neurología' UNION
SELECT  'Ginecología'
GO

INSERT INTO Provincias (NombreProvincia) SELECT 'Buenos Aires' UNION 
SELECT 'Cordoba' UNION 
SELECT 'Corrientes' UNION
SELECT 'Formosa'
GO

INSERT INTO Localidades (IdProvinciaLocalidad,NombreLocalidad) SELECT 1,'Berazategui' UNION 
SELECT 1, 'Hurlingham' UNION 
SELECT 2,'General Roca'  UNION 
SELECT 2,'San Justo' UNION 
SELECT 3,'Bella Vista' UNION 
SELECT 3,'Lavalle' UNION 
SELECT 4,'El Colorado' UNION
SELECT 4,'Fortín Soledad'
GO

 CREATE PROCEDURE spEliminarPacientes
 (
   @DNIPACIENTE nchar(5)
 )
 AS
 Update Pacientes
 SET Estado_Paciente = 0
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

 CREATE PROCEDURE spEliminarMedicos
 (
	@LEGAJO nchar(5)
 )
 AS 
 UPDATE	Medicos
 SET 
 Estado_Med = 0
 WHERE LegajoMedico = @LEGAJO
 RETURN
 GO

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
	@IDTURNO int,
	@LEGAJOMED nchar(5),
	@DIASEMANA int,
	@HORATURNO time,
	@FECHATURNO date,
	@DNIPACIENTE nchar(10)
 )
 AS
 INSERT INTO Turnos (IdTurno,LegajoMedico_Turno,DiaSemana_Turno,HoraTurno,FechaTurno,DniPaciente_TA)
 SELECT @IDTURNO,@LEGAJOMED,@DIASEMANA,@HORATURNO,@FECHATURNO,@DNIPACIENTE
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


 CREATE PROCEDURE spPorcentajeTurnosPorEspecialidad
 (
	@IdEspecialidad int
 )
 AS
 SELECT 
 NombreEspecialidad,
 SUM(CASE WHEN IdEspecialidad = @IdEspecialidad THEN 1 END)* 100 / COUNT(Turnos.IdTurno) AS [Promedio Por Especialidad]
 FROM (((Especialidades INNER JOIN Medicos
 ON IdEspecialidad = IdEspecialidad_Med) INNER JOIN HorariosXDiaXMedico
 ON Medicos.LegajoMedico=LegajoMedico_HorXDiaXMed) INNER JOIN HorariosXDiaXMedicoXDl
 ON LegajoMedico_HorXDiaXMed=HorariosXDiaXMedicoXDl.LegajoMedico
 AND DiaSemana_HorXDiaXMed=DiaSemana 
 AND HoraTrabajo_HorXDiaXMed=HoraDisponible) INNER JOIN Turnos
 ON DiaSemana=DiaSemana_Turno
 AND FechaDisponible=FechaTurno
 AND HoraDisponible=HoraTurno
 AND HorariosXDiaXMedicoXDl.LegajoMedico=LegajoMedico_Turno
 GROUP BY(NombreEspecialidad)
 GO

 CREATE VIEW viewMedicos
 AS
 SELECT LegajoMedico AS Legajo, NombreMedico AS Nombre, ApellidoMedico AS Apellido, DniMedico AS DNI, NombreEspecialidad AS Especialidad
 FROM Medicos INNER JOIN Especialidades ON Medicos.IdEspecialidad_Med = Especialidades.IdEspecialidad
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

CREATE VIEW view_HorariosTrabajo
AS
SELECT  Concat( (Convert(varchar(5), HoraIngreso, 108)),' a ' ,(Convert(varchar(5), HoraSalida, 108)) ) AS Id,
		TipoHorario AS Nombre
FROM HorariosTrabajo
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

INSERT INTO Medicos(LegajoMedico, DniMedico, NombreMedico, ApellidoMedico, IdEspecialidad_Med, IdLocalidad_Med,FechaNacimiento)
SELECT '44444', '39748590', 'Jose', 'Armoa', 1, 1, '1996/10/05'

EXEC spCargarHorariosXDiaXMedico '44444',1,'8:00','14:00'
EXEC spCargarHorariosXDiaXMedico '44444',4,'14:00','19:00'
EXEC spVerDisponibles '11111', '2024/07/19' 
go

CREATE VIEW viewHorariosMedico
AS
SELECT DISTINCT  LegajoMedico_HorXDiaXMed as Legajo, Nombre as Dia, HoraIngresoMedico_HorXDiaXMed as Ingreso, HoraSalidaMedico_HorXDiaXMed as Salida
FROM HorariosXDiaXMedico INNER JOIN DiaSemana 
ON DiaSemana_HorXDiaXMed = NumDia
GO

