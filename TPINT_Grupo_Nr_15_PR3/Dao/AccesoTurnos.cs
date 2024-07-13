using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using System.Data;
using System.Data.SqlClient;

namespace Dao
{
    public class AccesoTurnos
    {

        AccesoDB db = new AccesoDB();

        public Boolean existeDNITurno(Turnos tur)
        {
            string consulta = "SELECT * FROM Pacientes " +
                "WHERE DniPaciente_TA = '" + tur.dnipaciente + "'";
            return db.existe(consulta);
        }

        public DataTable getTablaTurnosListar()
        {
            string consulta = "Select IdTurno AS [ID Turnos],FechaTurno AS Fecha,HoraTurno AS Hora,NombrePaciente AS Nombre,ApellidoPaciente AS Apellido,DniPaciente_TA AS DNI,Asistio AS Asistio " +
                "From Turnos inner join Pacientes " +
                "ON DniPaciente = DniPaciente_TA";
            return db.ObtenerTabla("Turnos", consulta);
        }

        public DataTable getTablaFiltradaTurnos(Turnos tur)
        {
            string consulta = "Select FechaTurno,HoraTurno,NombrePaciente,ApellidoPaciente,DniPaciente_TA,Asistio " +
                "From Turnos inner join Pacientes " +
                "ON DniPaciente = DniPaciente_TA" +
                " WHERE DniPaciente_TA = '" + tur.dnipaciente + "'";
            return db.ObtenerTabla("Turnos", consulta);
        }


        //Comprueba que en la fecha pasado como parametro exista por lo menos un turno sin asignar
        public bool comprobarDisponibilidad(string legajo, DateTime fecha)
        {
            string consulta = "SELECT dbo.HorasDisponibles(@LEGAJO, @FECHA) as Existe";
            SqlCommand cmd = new SqlCommand();

            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = cmd.Parameters.Add("@LEGAJO", SqlDbType.NChar, 5);
            SqlParametros.Value = legajo;
            SqlParametros = cmd.Parameters.Add("@FECHA", SqlDbType.Date);
            SqlParametros.Value = fecha;

            return db.esVerdadero(ref cmd, consulta);
        }


        //Obtiene una tabla de horarios disponibles segun la fecha y el legajo pasado como parametro.
        public DataTable getTurnosDisponibles(string legajo, string fecha)
        {
            string consulta = "SELECT HoraDisponible as Hora, FechaDisponible " +
                              "FROM HorariosXDiaXMedicoXDl " +
                              "WHERE LegajoMedico = @LEGAJO  and FechaDisponible = @FECHA and Asignado = 0 ";

            SqlCommand cmd = new SqlCommand();

            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = cmd.Parameters.Add("@LEGAJO", SqlDbType.NChar, 5);
            SqlParametros.Value = legajo;
            SqlParametros = cmd.Parameters.Add("@FECHA", SqlDbType.Date);
            SqlParametros.Value = fecha;

            return db.ObtenerTabla("Horarios", consulta, cmd);
        }
    }
}
