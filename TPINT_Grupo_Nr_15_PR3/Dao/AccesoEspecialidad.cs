using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dao
{
    public class AccesoEspecialidad
    {
        AccesoDB acceso = new AccesoDB();

        public DataTable obtenerTabla()
        {
            string consulta = "Select IdEspecialidad as Id, NombreEspecialidad as Nombre FROM Especialidades";

            return acceso.ObtenerTabla("Especialidades", consulta);
        }
    }
}
