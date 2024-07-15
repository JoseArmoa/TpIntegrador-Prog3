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
            string consulta = "SELECT * FROM Turnos " +
                "WHERE DniPaciente_TA = '" + tur.dnipaciente + "'";
            return db.existe(consulta);
        }

        public DataTable getTablaTurnosListarMedico(Turnos tur)
        {
            string consulta = "Select IdTurno AS [ID Turnos],FechaTurno AS Fecha,HoraTurno AS Hora,NombrePaciente AS Nombre,ApellidoPaciente AS Apellido,DniPaciente_TA AS DNI,Asistio AS Asistio " +
                "From Turnos inner join Pacientes " +
                "ON DniPaciente = DniPaciente_TA " +
                "where LegajoMedico_Turno = '" + tur.medico + "'";
            return db.ObtenerTabla("Turnos", consulta);
        }

        public string ObtenerLegajoMedico(Usuarios usuario)
        {
            string consulta = "select Medicos.LegajoMedico " +
                              "from Usuarios inner join Medicos " +
                              "on Usuarios.IdUsuario = Medicos.IdUsuario_Med " +
                              "where Usuarios.IdUsuario = ' " + usuario.iDUsuario + "'";

            return db.ObtenerLegajoMedicoPorUsuario(consulta);
        }

        public DataTable getTablaTurnosListarAdministrador()
        {
            string consulta = "Select * FROM viewTurnos " +
                              "ORDER BY FechaTurno";
            return db.ObtenerTabla("Turnos", consulta);


            /*
             *  CREATE VIEW viewTurnos
                AS
                Select Asistio,DATEADD(SECOND, DATEDIFF(SECOND, '00:00:00', Turnos.HoraTurno), CAST(Turnos.FechaTurno AS DateTime)) as FechaTurno, Turnos.DniPaciente_TA,Pacientes.NombrePaciente,Especialidades.NombreEspecialidad,Observacion 
                From(((((Especialidades inner join Medicos 
                ON IdEspecialidad = IdEspecialidad_Med) inner join HorariosXDiaXMedico 
                ON LegajoMedico = LegajoMedico_HorXDiaXMed) inner join HorariosXDiaXMedicoXDl 
                ON LegajoMedico_HorXDiaXMed = HorariosXDiaXMedicoXDl.LegajoMedico 
                AND DiaSemana_HorXDiaXMed = DiaSemana 
                AND HoraTrabajo_HorXDiaXMed = HoraDisponible) inner join Turnos 
                ON HorariosXDiaXMedicoXDl.LegajoMedico = LegajoMedico_Turno 
                AND DiaSemana = DiaSemana_Turno 
                AND FechaDisponible = FechaTurno 
                AND HorariosXDiaXMedicoXDl.HoraDisponible = HoraTurno) inner join Pacientes 
                ON DniPaciente_TA = DniPaciente) FULL OUTER JOIN Observaciones 
                ON Pacientes.DniPaciente = DniPaciente_Obs 
                GO 
            */
        }

        public DataTable getTablaFiltradaTurnos(Turnos tur)
        {
            string consulta = "Select IdTurno AS [ID Turnos], FechaTurno as Fecha,HoraTurno as Hora,NombrePaciente as Nombre,ApellidoPaciente as Apellido,DniPaciente_TA as DNI,Asistio " +
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

        public int agregarTurno(ref Turnos tu)
        {
            SqlCommand cmd = new SqlCommand();
            agregarParametrosTurno(ref cmd,ref tu);
            int filas = db.EjecutarProcedimientoAlmacenado(ref cmd, "spAgregarTurnos");
            return filas;
        }

        public void agregarParametrosTurno(ref SqlCommand cmd, ref Turnos tu)
        {
            SqlParameter sqlParametros = new SqlParameter();
            sqlParametros = cmd.Parameters.Add("@LEGAJOMED", SqlDbType.NChar, 5);
            sqlParametros.Value = tu.medico;
            sqlParametros = cmd.Parameters.Add("@FECHATURNO", SqlDbType.DateTime);
            sqlParametros.Value = tu.fecha;
            sqlParametros = cmd.Parameters.Add("@HORATURNO", SqlDbType.Time);
            sqlParametros.Value = tu.hora;
            sqlParametros = cmd.Parameters.Add("@DIASEMANA", SqlDbType.Int);
            sqlParametros.Value = tu.dia;
            sqlParametros = cmd.Parameters.Add("@DNIPACIENTE", SqlDbType.NChar, 10);
            sqlParametros.Value = tu.dnipaciente;
        }
    }
}
