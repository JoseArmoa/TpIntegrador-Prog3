using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using System.Data;

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

    }
}
