using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace Dao
{
    class AccesoEspecialidades
    {
        static AccesoDB acceso = new AccesoDB();

        public AccesoEspecialidades() {}

        public DataTable obtenerTabla()
        {
            string consulta = "SELECT IdEspecialidad as ID, NombreEspecialidad AS Especialidad  FROM Especialidades";

            return acceso.ObtenerTabla("Especialidades", consulta);
        }
    }
}
