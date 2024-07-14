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
   public class AccesoObservacion
    {
        AccesoDB db = new AccesoDB();
        public int agregarObservacion(ref Observaciones obs)
        {
            SqlCommand sc = new SqlCommand();
            ParametrosAgregar(ref sc, ref obs);
            return db.EjecutarProcedimientoAlmacenado(ref sc, "spAgregarObservacion");
        }

        public void ParametrosAgregar(ref SqlCommand sc, ref Observaciones obs)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = sc.Parameters.Add("@IDTURNO", SqlDbType.Int);
            SqlParametros.Value = obs.iDturno;
            SqlParametros = sc.Parameters.Add("@OBSERVACIONES", SqlDbType.Text);
            SqlParametros.Value = obs.observaciones;
            SqlParametros = sc.Parameters.Add("@DNIPACIENTE", SqlDbType.NChar);
            SqlParametros.Value = obs.dnipaciente;
        }

        public int MostrarObservacion(ref Observaciones obs)
        {
            SqlCommand sc = new SqlCommand();
            ParametrosMostrar(ref sc, ref obs);
            return db.EjecutarProcedimientoAlmacenado(ref sc, "spMostrarObservacion");
        }

        public void ParametrosMostrar(ref SqlCommand sc, ref Observaciones obs)
        {
            SqlParameter sqlpram = new SqlParameter();
            sqlpram = sc.Parameters.Add("@DNIPACIENTE", SqlDbType.NChar);
            sqlpram.Value = obs.dnipaciente;
        }

        public DataTable obtenerTabla(ref Observaciones obs)
        {
            string consulta = "SELECT FechaTurno,Observaciones.Observacion " +
                "FROM (Pacientes inner join Turnos " +
                "ON Pacientes.DniPaciente = Turnos.DniPaciente_TA) inner join Observaciones " +
                "ON Turnos.IdTurno = Observaciones.IdTurno_Obs " +
                "AND Turnos.DniPaciente_TA = Observaciones.DniPaciente_Obs " +
                " WHERE DniPaciente_Obs= '" + obs.dnipaciente + "'";

            return db.ObtenerTabla("Observaciones", consulta);
        }
    }
}
