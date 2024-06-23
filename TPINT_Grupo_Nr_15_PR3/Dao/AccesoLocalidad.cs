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
        public DataTable GetTablaLocalidad(int idProvincia)
        {
            return db.ObtenerTabla("Localidad", "Select [IdLocalidad] AS Id, [NombreLocalidad] as Nombre From Localidades WHERE IdProvinciaLocalidad = " + idProvincia);
        }
    }
}
