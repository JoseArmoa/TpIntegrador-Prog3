USE Clinica
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
