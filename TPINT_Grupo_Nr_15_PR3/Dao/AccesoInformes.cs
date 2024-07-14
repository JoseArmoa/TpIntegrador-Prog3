using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dao
{
    public class AccesoInformes
    {
        static AccesoDB acceso = new AccesoDB();

        public AccesoInformes()
        {

        }

        public DataTable AsitenciasPorFecha(DateTime inicio, DateTime final)
        {
            SqlCommand cmd = new SqlCommand();
            SqlParameter sqlParameter = new SqlParameter();

            sqlParameter = cmd.Parameters.Add("@FECHAINICIO", SqlDbType.DateTime);
            sqlParameter.Value = inicio;
            sqlParameter = cmd.Parameters.Add("@FECHAFINAL", SqlDbType.DateTime);
            sqlParameter.Value = final;

            string consulta = "SELECT 'Asistio' as Tipo, SUM(CASE WHEN Asistio = 1 THEN 1 ElSE 0 END) as Cantidad " +
                              "FROM Turnos " +
                              "UNION " +
                              "SELECT 'No asistio' as Tipo, SUM(CASE WHEN Asistio = 0 THEN 1 ElSE 0 END) as Cantidad " +
                              "FROM Turnos " +
                              "WHERE FechaTurno >= @FECHAINICIO and FechaTurno <= @FECHAFINAL ";

            return acceso.ObtenerTabla("Asistencias", consulta, cmd);
        }
    }
}
