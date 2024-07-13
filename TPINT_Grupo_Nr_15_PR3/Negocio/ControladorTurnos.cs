using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dao;
using System.Data;
using Entidades;

namespace Negocio
{
    public class ControladorTurnos
    {
        AccesoTurnos acceTur = new AccesoTurnos();

        public DataTable getTablaTurnosMedicos()
        {
            return acceTur.getTablaTurnosListarMedico();
        }

        public DataTable getTablaTurnosAdministrador()
        {
            return acceTur.getTablaTurnosListarAdministrador();
        }

        public DataTable filtrarTurnoPorDNI(string dniTur)
        {
            Turnos turno = new Turnos();
            turno.dnipaciente = dniTur;
            if (acceTur.existeDNITurno(turno))
            {
                return acceTur.getTablaFiltradaTurnos(turno);
            }
            return null;

        }

        public bool hayDisponibles(string legajo, DateTime fecha)
        {
            return acceTur.comprobarDisponibilidad(legajo, fecha);
        }


    }
}
