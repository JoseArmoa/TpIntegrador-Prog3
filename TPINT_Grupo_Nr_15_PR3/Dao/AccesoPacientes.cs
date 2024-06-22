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

        AccesoDB accesoPacientes = new AccesoDB();

        public AccesoPacientes() { }

        public DataTable obtenerTabla()
        {
            string consulta = "SELECT * FROM viewPacientes";
            return accesoPacientes.ObtenerTabla("Pacientes", consulta);

        }

        public Boolean AgregarPaciente(Pacientes pac)
        {
            SqlCommand cm = new SqlCommand();
            parametrosAgregar(ref cm, ref pac);
            int filasAfectadadas = accesoPacientes.EjecutarProcedimientoAlmacenado(ref cm, "spAgregarPaciente");
            if (filasAfectadadas > 0)
            {
                return true;
            }
            return false;
        }

        public void parametrosAgregar(ref SqlCommand cmd, ref Pacientes pac)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = cmd.Parameters.Add("@DNI", SqlDbType.VarChar);
            SqlParametros.Value = pac.dni;
            SqlParametros = cmd.Parameters.Add("@NOMBRE", SqlDbType.VarChar);
            SqlParametros.Value = pac.nombre;
            SqlParametros = cmd.Parameters.Add("@APELLIDO", SqlDbType.VarChar);
            SqlParametros.Value = pac.apellido;
            SqlParametros = cmd.Parameters.Add("@FECHANACIMIENTO", SqlDbType.Date);
            SqlParametros.Value = pac.FechNac;
            SqlParametros = cmd.Parameters.Add("@DIRECCION", SqlDbType.VarChar);
            SqlParametros.Value = pac.direccion;
            SqlParametros = cmd.Parameters.Add("@IDPROVINCIA", SqlDbType.Int);
            SqlParametros.Value = pac.iDProvincia;
            SqlParametros = cmd.Parameters.Add("@IDLOCALIDAD", SqlDbType.Int);
            SqlParametros.Value = pac.iDLocalidad;
            SqlParametros = cmd.Parameters.Add("@TELEFONO", SqlDbType.VarChar);
            SqlParametros.Value = pac.telefono;
            SqlParametros = cmd.Parameters.Add("@EMAIL", SqlDbType.VarChar);
            SqlParametros.Value = pac.email;
            SqlParametros = cmd.Parameters.Add("@NACIONALIDAD", SqlDbType.VarChar);
            SqlParametros.Value = pac.nacionalidad;
            SqlParametros = cmd.Parameters.Add("@SEXO", SqlDbType.VarChar);
            SqlParametros.Value = pac.sexo;

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
            return accesoPacientes.EjecutarProcedimientoAlmacenado(ref sc, "spEliminarPaciente");

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
            return accesoPacientes.EjecutarProcedimientoAlmacenado(ref sc, "spActualizarPaciente");

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

        public Pacientes ObtenerPacientesPorDni(string dni)
        {
            AccesoDB db = new AccesoDB();

            Pacientes pacientes = new Pacientes();

            string consulta = "SELECT Dni_Pa AS Dni, Nombre_Pa AS Nombre, Apellido_Pa AS Apellido, Nacionalidad_Pa AS Nacionalidad, Sexo_Pa AS Sexo, FechaNacimiento_Pa AS Fecha Nacimiento FROM Sucursal " +
                "WHERE Dni_Pa= " + dni;
            DataTable dt = db.ObtenerTabla("Pacientes", consulta);
            DataRow dr = dt.Rows[0];
            pacientes.dni = dr["Dni"].ToString();
            pacientes.nombre = dr["Nombre"].ToString();
            pacientes.apellido = dr["Apellido"].ToString();
            pacientes.FechNac = dr["FechaNacimiento"].ToString();
            pacientes.nacionalidad= dr["Nacionalidad"].ToString();
            pacientes.sexo = dr["Sexo"].ToString();


            return pacientes;
        }



    }
}
