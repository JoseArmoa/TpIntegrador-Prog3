using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dao;
using System.Data;

namespace Negocio
{
    public class ControladorHorariosTrabajo
    {
        private AccesoHorariosTrabajo ht = new Dao.AccesoHorariosTrabajo();

        public ControladorHorariosTrabajo()
        {
        }

        public DataTable getTabla()
        {
            return ht.obtenerTabla();
        }
    }
}
