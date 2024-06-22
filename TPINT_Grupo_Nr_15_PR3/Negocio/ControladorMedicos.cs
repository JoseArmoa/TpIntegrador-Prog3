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
    class ControladorMedicos
    {
        AccesoMedicos accMed = new AccesoMedicos();

        public DataTable getTabla()
        {
            return accMed.obtenerTabla();
        }

        public bool AgregarMedico(ref Medicos med)
        {
            if (accMed.agregarMedico(med))
            {
                return true;
            }
            return false;
        }
    }
}
