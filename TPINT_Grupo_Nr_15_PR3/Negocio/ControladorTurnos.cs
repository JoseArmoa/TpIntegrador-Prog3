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

        public DataTable getTablaTurnos()
        {
            return acceTur.getTablaTurnosListar();
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


    }
}
