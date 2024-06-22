using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dao
{
    
    public class AccesoLocalidades
    {
        static AccesoDB acceso = new AccesoDB();

        public AccesoLocalidades()
        {

        }

        public DataTable obtenerTablaFiltrada(int idProvincia)
        {
            string consulta = "SELECT Nombre, IdLocalidad FROM Localidades WHERE IdProvincia = " + idProvincia;
            
            return acceso.ObtenerTabla("Localidades",consulta);
        }
    }
}
