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
    public class ControladorObservaciones
    {
        AccesoObservacion acceObs = new AccesoObservacion();


        public bool agregarObservacion(ref Observaciones obs)
        {
            int filasAfectadas = acceObs.agregarObservacion(ref obs);


            if (filasAfectadas > 0)
            {
                return true;
            }
            return false;
        }

        public DataTable getTablaObservaciones(ref Observaciones obs)
        {
            return acceObs.obtenerTabla(ref obs);
        }
    }
}
