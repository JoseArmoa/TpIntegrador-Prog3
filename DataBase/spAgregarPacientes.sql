USE Clinica
GO

CREATE PROCEDURE spAgregarPacientes
                (
	                @NOMBRE varchar(50),
	                @APELLIDO varchar(50),
                    @DNI nchar(5),
	                @IDLOCALIDAD int,
	                @DIRECCION varchar(50),
					@EMAIL varchar(50),
					@TELEFONO nchar(11),
					@FECHANAC DateTime
                ) AS
                INSERT INTO Pacientes(NombrePaciente, ApellidoPaciente,DniPaciente,Direccion_Paciente, Email_Paciente, Telefono_Paciente,IdLocalidad_Paciente, FechaNacimiento)
                SELECT @NOMBRE,  @APELLIDO, @DNI,@DIRECCION,@EMAIL,@TELEFONO,@IDLOCALIDAD,@FECHANAC
                GO



