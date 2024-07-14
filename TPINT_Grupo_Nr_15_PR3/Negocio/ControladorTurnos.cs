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

        public DataTable getTablaTurnosMedicos(Turnos tur)
        {
            return acceTur.getTablaTurnosListarMedico(tur);
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

        public string ObtenerLegajoMed(Usuarios usu)
        {
            return acceTur.ObtenerLegajoMedico(usu);
        }

        public bool hayDisponibles(string legajo, DateTime fecha)
        {
            return acceTur.comprobarDisponibilidad(legajo, fecha);
        }

        public DataTable getTurnosDisponibles(string legajo, string fecha)
        {
            return acceTur.getTurnosDisponibles(legajo, fecha);
        }

        public bool asignarTurno(ref Turnos tu)
        {
            if(acceTur.agregarTurno(ref tu) > 0)
            {
                return true;
            }

            return false;
        }


    }
}
