using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dao
{
    public class AccesoProvincia
    {
        static AccesoDB acceso = new AccesoDB();

        public AccesoProvincia()
        {

        }

        public DataTable obtenerTabla()
        {
            string consulta = "SELECT NombreProvincia as Nombre, IdProvincia as Id FROM Provincias";

            return acceso.ObtenerTabla("Provincia", consulta);
        }
    }

}
