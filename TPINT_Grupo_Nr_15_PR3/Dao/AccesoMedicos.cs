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
        }

        public Boolean agregarMedico(Medicos med)
        {
            SqlCommand cm = new SqlCommand();
            parametrosAgregar(ref cm, ref med);
            int filasAfectadadas = acceso.EjecutarProcedimientoAlmacenado(ref cm, "spAgregarMedico");
            if(filasAfectadadas > 0)
            {
                return true;
            }
            return false;
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
            SqlParametros = cmd.Parameters.Add("@IDUSURIO", SqlDbType.Int);
            SqlParametros.Value = med.iDUsuario;
            SqlParametros = cmd.Parameters.Add("@NACIONALIDAD", SqlDbType.VarChar);
            SqlParametros.Value = med.nacionalidad;
            SqlParametros = cmd.Parameters.Add("@SEXO", SqlDbType.VarChar);
            SqlParametros.Value = med.sexo;

        }

        public void AgregarParametrosEliminar(ref SqlCommand sc, Medicos medico)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = sc.Parameters.Add("@LEGAJO", SqlDbType.VarChar);
            SqlParametros.Value = medico.legajo;
        }

        public int EliminarMedico(Medicos medico)
        {
            SqlCommand sc = new SqlCommand();
            AgregarParametrosEliminar(ref sc, medico);
            return acceso.EjecutarProcedimientoAlmacenado(ref sc, "spEliminarMedico");

            //--spEliminarMedico

            //CREATE PROCEDURE spEliminarMedico
            //(
            //@LEGAJO varchar(4)
            //)
            //AS
            //DELETE FROM Medicos
            //WHERE Legajo_Me = @LEGAJO
            //RETURN
        }



    }
}
