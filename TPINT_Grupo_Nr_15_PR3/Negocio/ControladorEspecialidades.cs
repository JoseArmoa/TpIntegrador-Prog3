using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Dao;

namespace Negocio
{
    public class ControladorEspecialidades
    {
        AccesoEspecialidad accesoEspecialidad = new AccesoEspecialidad();

        public DataTable getTabla() 
        {
            return accesoEspecialidad.obtenerTabla();
        }
    }
}
