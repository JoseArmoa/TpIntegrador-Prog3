using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dao;
using System.Data;

namespace Negocio
{
    public class ControladorDia
    {
        AccesoDias acceso = new AccesoDias();

        public DataTable getTabla()
        {
            return acceso.obtenerTabla();
        }
        
    }
}
