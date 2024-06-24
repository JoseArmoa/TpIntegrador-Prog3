using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using System.Data.SqlClient;
using System.Data;

namespace Dao
{
    public class AccesoPacientes
    {
        AccesoDB db = new AccesoDB();

        public Boolean existeDNI(Pacientes pac)
        {
            string consulta = "SELECT * FROM Pacientes " +
                "WHERE DniPaciente = '" + pac.dni + "'";
            return db.existe(consulta);
        }

        public int agregarPacientes(ref Pacientes pac)
        {
            SqlCommand sc = new SqlCommand();
            ParametrosAgregar(ref sc, ref pac);
            return db.EjecutarProcedimientoAlmacenado(ref sc, "spAgregarPacientes");
        }

        public void ParametrosAgregar(ref SqlCommand sc, ref Pacientes pac)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = sc.Parameters.Add("@NOMBRE", SqlDbType.VarChar);
            SqlParametros.Value = pac.nombre;
            SqlParametros = sc.Parameters.Add("@APELLIDO", SqlDbType.VarChar);
            SqlParametros.Value = pac.apellido;
            SqlParametros = sc.Parameters.Add("@DNI", SqlDbType.NChar);
            SqlParametros.Value = pac.dni;
            SqlParametros = sc.Parameters.Add("@IDLOCALIDAD", SqlDbType.Int);
            SqlParametros.Value = pac.iDLocalidad;
            SqlParametros = sc.Parameters.Add("@DIRECCION", SqlDbType.VarChar);
            SqlParametros.Value = pac.direccion;
            SqlParametros = sc.Parameters.Add("@EMAIL", SqlDbType.VarChar);
            SqlParametros.Value = pac.email;
            SqlParametros = sc.Parameters.Add("@TELEFONO", SqlDbType.NChar);
            SqlParametros.Value = pac.telefono;
            SqlParametros = sc.Parameters.Add("@FECHANAC", SqlDbType.DateTime);
            SqlParametros.Value = pac.FechNac;
        }

        public DataTable getTablaPacientesListar()
        {
            string consulta = "Select DniPaciente,NombrePaciente, ApellidoPaciente, Direccion_Paciente,Telefono_Paciente,FechaNacimiento From Pacientes";
            return db.ObtenerTabla("Pacientes", consulta);
        }

        public DataTable getTablaFiltrada(Pacientes pac)
        {
            string consulta = "Select DniPaciente,NombrePaciente, ApellidoPaciente, Direccion_Paciente,Telefono_Paciente,FechaNacimiento From Pacientes WHERE DniPaciente = '" + pac.dni + "'";
            return db.ObtenerTabla("Pacientes", consulta);
        }

        public void AgregarParametrosEliminar(ref SqlCommand sc, Pacientes pac)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = sc.Parameters.Add("@DNI", SqlDbType.VarChar);
            SqlParametros.Value = pac.dni;
        }

        public int EliminarPaciente(Pacientes pac)
        {
            SqlCommand sc = new SqlCommand();
            AgregarParametrosEliminar(ref sc, pac);
            return db.EjecutarProcedimientoAlmacenado(ref sc, "spEliminarPaciente");

            //--spEliminarPaciente

            //CREATE PROCEDURE spEliminarPaciente
            //(
            //@DNI varchar(8)
            //)
            //AS
            //DELETE FROM Pacientes
            //WHERE Dni_Pa = @DNI
            //RETURN
        }

        public void AgregarParametrosActualizar(ref SqlCommand sc, Pacientes pac)
        {
            SqlParameter sqlParameter = new SqlParameter();
            sqlParameter = sc.Parameters.Add("@DNI", SqlDbType.VarChar);
            sqlParameter.Value = pac.dni;
            sqlParameter = sc.Parameters.Add("@NOMBRE", SqlDbType.VarChar);
            sqlParameter.Value = pac.nombre;
            sqlParameter = sc.Parameters.Add("@APELLIDO", SqlDbType.VarChar);
            sqlParameter.Value = pac.apellido;
            sqlParameter = sc.Parameters.Add("@FECHANACIMIENTO", SqlDbType.Date);
            sqlParameter.Value = pac.FechNac;
            sqlParameter = sc.Parameters.Add("@NACIONALIDAD", SqlDbType.VarChar);
            sqlParameter.Value = pac.nacionalidad;
            sqlParameter = sc.Parameters.Add("@SEXO", SqlDbType.VarChar);
            sqlParameter.Value = pac.sexo;
        }


        public int  ActualizarPacientes(Pacientes pac)
        {
            SqlCommand sc = new SqlCommand();
            AgregarParametrosActualizar(ref sc, pac);
            return db.EjecutarProcedimientoAlmacenado(ref sc, "spActualizarPaciente");

            /*
                CREATE PROCEDURE spActualizarPaciente
            (
                  @DNI varchar(8),
                  @NOMBRE varchar(30),
                  @APELLIDO varchar(30),
                  @FECHANACIMIENTO Date,
                  @NACIONALIDAD varchar(30),
                  @SEXO varchar(9)
            )
                AS
                UPDATE Pacientes
                SET
                  Nombre_Pa = @NOMBRE,
                  Apellido_Pa = @Apellido,
                  FechaNacimiento_Pa = @FECHANACIMIENTO,
                  Nacionalidad_Pa = @NACIONALIDAD,
                  Sexo_Pa = @SEXO
                WHERE Dni_Pa = @DNI
                RETURN

             */
        }




    }
}
