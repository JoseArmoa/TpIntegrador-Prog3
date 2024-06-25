using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;

namespace Dao
{
    public class AccesoMedicos
    {
        AccesoDB acceso = new AccesoDB();
        public AccesoMedicos()
        {

        }

        public DataTable obtenerTabla()
        {
            string consulta = "SELECT * FROM viewMedicos";
     
            return acceso.ObtenerTabla("Medicos", consulta);

            //CREATE VIEW viewMedicos
            //AS
            //SELECT LegajoMedico AS Legajo, NombreMedico AS Nombre, ApellidoMedico AS Apellido, DniMedico AS DNI, NombreEspecialidad AS Especialidad
            //FROM Medicos INNER JOIN Especialidades ON Medicos.IdEspecialidad_Med = Especialidades.IdEspecialidad
            //GO
        }

        public DataTable obtenerTablaMedicoPorLegajo(string legajo)
        {
            string consulta = "SELECT * FROM viewMedicos WHERE Legajo = '" + legajo + "'";

            return acceso.ObtenerTabla("Medicos", consulta);

            //CREATE VIEW viewMedicos
            //AS
            //SELECT LegajoMedico AS Legajo, NombreMedico AS Nombre, ApellidoMedico AS Apellido, DniMedico AS DNI, NombreEspecialidad AS Especialidad
            //FROM Medicos INNER JOIN Especialidades ON Medicos.IdEspecialidad_Med = Especialidades.IdEspecialidad
            //GO
        }

        public Boolean agregarMedico(Medicos med)
        {
            SqlCommand cm = new SqlCommand();
            parametrosAgregar(ref cm, ref med);
            int filasAfectadadas = acceso.EjecutarProcedimientoAlmacenado(ref cm, "spAgregarMedico");
            if (filasAfectadadas > 0)
            {
                return true;
            }
            return false;


            /*
                 ALTER PROCEDURE spAgregarMedico
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
	                @IDUSUARIO int,
	                @NACIONALIDAD varchar(15),
	                @SEXO varchar(15)
	                )
	                AS
	                INSERT INTO Medicos(LegajoMedico,NombreMedico,ApellidoMedico,DniMedico,IdEspecialidad_Med,FechaNacimiento,Direccion_Med,IdLocalidad_Med,Telefono_Med,Email_Med,IdUsuario_Med,Sexo_Med,Nacionalidad)
	                SELECT @LEGAJO ,@NOMBRE,@APELLIDO,@DNI, @IDESPECIALIDAD, @FECHANACIMIENTO, @DIRECCION,@IDLOCALIDAD,@TELEFONO,@EMAIL,@IDUSUARIO,@SEXO,@NACIONALIDAD
	                GO
             */
        }

        public void parametrosAgregar(ref SqlCommand cmd, ref Medicos med)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = cmd.Parameters.Add("@LEGAJO", SqlDbType.VarChar);
            SqlParametros.Value = med.legajo;
            SqlParametros = cmd.Parameters.Add("@NOMBRE", SqlDbType.VarChar);
            SqlParametros.Value = med.nombre;
            SqlParametros = cmd.Parameters.Add("@APELLIDO", SqlDbType.VarChar);
            SqlParametros.Value = med.apellido;
            SqlParametros = cmd.Parameters.Add("@DNI", SqlDbType.VarChar);
            SqlParametros.Value = med.dni;
            SqlParametros = cmd.Parameters.Add("@IDESPECIALIDAD", SqlDbType.Int);
            SqlParametros.Value = med.IDespecialidad;
            SqlParametros = cmd.Parameters.Add("@FECHANACIMIENTO", SqlDbType.Date);
            SqlParametros.Value = med.FechaNac;
            SqlParametros = cmd.Parameters.Add("@DIRECCION", SqlDbType.VarChar);
            SqlParametros.Value = med.direccion;
            SqlParametros = cmd.Parameters.Add("@IDLOCALIDAD", SqlDbType.Int);
            SqlParametros.Value = med.iDLocalidad;
            SqlParametros = cmd.Parameters.Add("@TELEFONO", SqlDbType.VarChar);
            SqlParametros.Value = med.telefono;
            SqlParametros = cmd.Parameters.Add("@EMAIL", SqlDbType.VarChar);
            SqlParametros.Value = med.email;
            SqlParametros = cmd.Parameters.Add("@IDUSUARIO", SqlDbType.Int);
            SqlParametros.Value = med.iDUsuario;
            SqlParametros = cmd.Parameters.Add("@NACIONALIDAD", SqlDbType.VarChar);
            SqlParametros.Value = med.nacionalidad;
            SqlParametros = cmd.Parameters.Add("@SEXO", SqlDbType.VarChar);
            SqlParametros.Value = med.sexo;

        }

        private void AgregarParametrosEliminar(ref SqlCommand sc, Medicos medico)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = sc.Parameters.Add("@LEGAJO", SqlDbType.NChar, 5);
            SqlParametros.Value = medico.legajo;
        }

        public int EliminarMedico(Medicos medico)
        {
            SqlCommand sc = new SqlCommand();
            AgregarParametrosEliminar(ref sc, medico);
            return acceso.EjecutarProcedimientoAlmacenado(ref sc, "spEliminarMedico");

            //--spEliminarMedico     ( REALIZA BAJA LOGICA )

            //CREATE PROCEDURE spEliminarMedicos
            //(
            //@LEGAJO nchar(5)
            //)
            //AS
            //UPDATE  Medicos
            //SET
            //Estado_Med = 0
            //WHERE LegajoMedico = @LEGAJO
            //RETURN
        }

        private void AgregarParametrosActualizar(ref SqlCommand cmd, Medicos med)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = cmd.Parameters.Add("@LEGAJO", SqlDbType.NChar, 5);
            SqlParametros.Value = med.legajo;
            SqlParametros = cmd.Parameters.Add("@NOMBRE", SqlDbType.VarChar, 50);
            SqlParametros.Value = med.nombre;
            SqlParametros = cmd.Parameters.Add("@APELLIDO", SqlDbType.VarChar, 50);
            SqlParametros.Value = med.apellido;
            SqlParametros = cmd.Parameters.Add("@DNI", SqlDbType.NChar, 9);
            SqlParametros.Value = med.dni;
            SqlParametros = cmd.Parameters.Add("@ESPECIALIDAD", SqlDbType.Int);
            SqlParametros.Value = med.IDespecialidad;
        }

        public int ActualizarMedico(Medicos medico)
        {
            SqlCommand cmd = new SqlCommand();
            AgregarParametrosActualizar(ref cmd, medico);

            return acceso.EjecutarProcedimientoAlmacenado(ref cmd, "spActualizarMedicoS");

            //-- spActualizarMedicoS

            //CREATE PROCEDURE spActualizarMedicos
            //(
            //@LEGAJO nchar(5),
            //@NOMBRE varchar(50),
            //@APELLIDO varchar(50),
            //@DNI nchar(9),
            //@ESPECIALIDAD int
            //)
            //AS
            //UPDATE  Medicos
            //SET
            //NombreMedico = @NOMBRE,
            //ApellidoMedico = @APELLIDO,
            //DniMedico = @DNI,
            //IdEspecialidad_Med = @ESPECIALIDAD
            //WHERE LegajoMedico = @LEGAJO
            //RETURN
        }
    }
}
