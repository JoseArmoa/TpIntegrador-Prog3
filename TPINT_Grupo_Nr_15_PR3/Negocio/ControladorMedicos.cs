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

        public DataTable getTablaXEspecialidad(string especialidad)
        {
            return accMed.obtenerTablaXEspecialidad(especialidad);
        }
        public DataTable getTablaFiltrada(string filtro)
        {
            return accMed.obtenerTablaMedicoFiltrada(filtro);
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

        public string getIdEspecialidad(string Legajo)
        {
            return accMed.obtenerIdEspecialidad(Legajo);
        }

        public DataTable getTablaFiltradaEspecialidad(string especialidad)
        {
            return accMed.ObtenerTablaFiltrada2(especialidad);
        }

        public bool existeDni(ref Medicos med)
        {
            return accMed.ExisteDNI(ref med);
        }

        public bool existeLegajo(ref Medicos med)
        {
            return accMed.ExisteLegajo(ref med);
        }
    }
}
