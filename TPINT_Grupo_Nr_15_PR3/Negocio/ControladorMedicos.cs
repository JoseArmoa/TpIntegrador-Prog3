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
    public class ControladorMedicos
    {
        AccesoMedicos accMed = new AccesoMedicos();

        public DataTable getTabla()
        {
            return accMed.obtenerTabla();
        }

        public DataTable getTablaMedico(string legajo)
        {
            return accMed.obtenerTablaMedicoPorLegajo(legajo);
        }

        public bool AgregarMedico(ref Medicos med)
        {
            if (accMed.agregarMedico(med))
            {
                return true;
            }
            return false;
        }

        public bool EliminarMedico(Medicos medico)
        {
            int filasAfectadas = accMed.EliminarMedico(medico);
            if (filasAfectadas > 0)
            {
                return true;
            }
            return false;
        }

        public bool ActualizarMedico(Medicos medico)
        {
            int filasAfectadas = accMed.ActualizarMedico(medico);
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
