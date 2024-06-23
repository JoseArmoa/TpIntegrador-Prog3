USE Clinica
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