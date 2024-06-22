using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using Entidades;
using System.Data;

namespace Dao
{
    public class AccesoHorarios
    {
        AccesoDB acceso = new AccesoDB();

        public AccesoHorarios() { }

        public bool agregarHorario(ref HorarioMedico hm)
        {
            SqlCommand cm = new SqlCommand();
            parametrosAgregar(ref cm, ref hm);
            int filasAfectadas = acceso.EjecutarProcedimientoAlmacenado(ref cm, "spAgregarHorario");
            if(filasAfectadas > 0)
            {
                return true;
            }
            return false;
        }
        public void parametrosAgregar(ref SqlCommand cm, ref HorarioMedico hm)
        {
            SqlParameter parameter = cm.Parameters.Add("@LEGAJOMEDICO", SqlDbType.VarChar);
            parameter.Value = hm.LegajoMed;
            parameter = cm.Parameters.Add("@DIASEMANA", SqlDbType.Int);
            parameter.Value = hm.DiaSemana;
            parameter = cm.Parameters.Add("@HORAENTRADA", SqlDbType.Time);
            parameter.Value = hm.HoraEntrada;
            parameter = cm.Parameters.Add("@HORASALIDA", SqlDbType.Time);
            parameter.Value = hm.HoraSalida;
        }
    }
}
