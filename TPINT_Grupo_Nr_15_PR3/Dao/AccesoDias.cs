using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace Dao
{
    public class AccesoDias
    {
        static AccesoDB acceso = new AccesoDB();

        public AccesoDias()
        {

        }

        public DataTable obtenerTabla()
        {
            string consulta = "SELECT NumDia as Id, Nombre FROM DiaSemana " +
                "WHERE NumDia < 6 " +
                " ORDER BY Id";

            return acceso.ObtenerTabla("DiaSemana", consulta);
        }
    }
}
