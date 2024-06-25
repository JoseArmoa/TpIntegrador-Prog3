using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using Dao;
using System.Data;

namespace Negocio
{
    public class ControladorHorario
    {
        AccesoHorarios accHor = new AccesoHorarios();

        public bool agregarHorario(ref HorarioMedico hm)
        {
            if(accHor.agregarHorario(ref hm))
            {
                return true;
            }
            return false;
        }

        public DataTable getTabla(string Legajo)
        {
            Medicos medico = new Medicos();
            medico.legajo = Legajo;
            return accHor.obtenerTabla(ref medico);
        }

        public bool EliminarHorario(ref HorarioMedico hm)
        {
            int filasAfectadas = accHor.EliminarHorario(ref hm);
            if (filasAfectadas > 0)
            {
                return true;
            }
            return false;
        }

        public bool ActualizarHorario(ref HorarioMedico hm)
        {
            int filasAfectadas = accHor.ActualizarHorario(ref hm);
            if (filasAfectadas == 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}
