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


            /*CREATE PROCEDURE spAgregarHorario
                (
                @LEGAJO nchar(5),
                 @DIASEMANA int,
                    @HORAENTRADA time,
                    @HORASALIDA time
                ) AS
                INSERT INTO HorariosMedico(LegajoMedico_Horario, DiaSemana_Horario, HoraIngreso, HoraSalida)

                SELECT @LEGAJO, @DIASEMANA, @HORAENTRADA, @HORASALIDA
    
                GO*/
        }
        public void parametrosAgregar(ref SqlCommand cm, ref HorarioMedico hm)
        {
            SqlParameter parameter = cm.Parameters.Add("@LEGAJO", SqlDbType.VarChar);
            parameter.Value = hm.LegajoMed;
            parameter = cm.Parameters.Add("@DIASEMANA", SqlDbType.Int);
            parameter.Value = hm.DiaSemana;
            parameter = cm.Parameters.Add("@HORAENTRADA", SqlDbType.Time);
            parameter.Value = hm.HoraEntrada;
            parameter = cm.Parameters.Add("@HORASALIDA", SqlDbType.Time);
            parameter.Value = hm.HoraSalida;
        }

        public DataTable obtenerTabla(ref Medicos medico)
        {
            string consulta = "SELECT * FROM viewHorarios WHERE Legajo = '" + medico.legajo + "'";

            return acceso.ObtenerTabla("viewHorarios", consulta);

            //CREATE VIEW viewHorarios
            //AS
            //SELECT LegajoMedico_Horario AS Legajo, Nombre AS Dia, HoraIngreso AS Ingreso, HoraSalida AS Salida
            //FROM HorariosMedico INNER JOIN DiaSemana ON HorariosMedico.DiaSemana_Horario = DiaSemana.NumDia
            //GO

        }
    }
}
