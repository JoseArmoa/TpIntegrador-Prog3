using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dao;
using System.Data;

namespace Negocio
{
    public class ControladorLocalidad
    {
        AccesoLocalidad acceso = new AccesoLocalidad();
        public DataTable ObtenerLocalidades(int idProvincia)
        {
            return acceso.GetTablaLocalidad(idProvincia);
        }
    }
}
