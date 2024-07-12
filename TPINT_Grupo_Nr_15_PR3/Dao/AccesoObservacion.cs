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
            SqlParametros.Value = obs.iDObservacion;
            SqlParametros = sc.Parameters.Add("@OBSERVACIONES", SqlDbType.Text);
            SqlParametros.Value = obs.observaciones;
            SqlParametros = sc.Parameters.Add("@DNIPACIENTE", SqlDbType.NChar);
            SqlParametros.Value = obs.dnipaciente;
        }
    }
}
