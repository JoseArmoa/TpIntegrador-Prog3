using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace Dao
{
    public class AccesoLocalidad
    {
        AccesoDB db = new AccesoDB();
        public DataTable GetTablaLocalidad()
        {
            return db.ObtenerTabla("Localidad", "Select [ID_Localidad] AS ID, [Nombre] From Localidad");
        }
    }
}
