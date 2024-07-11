using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using System.Data;

namespace Dao
{
    public class AccesoHorariosTrabajo
    {
        private AccesoDB acceso = new AccesoDB();

        public AccesoHorariosTrabajo()
        {
        }

        public DataTable obtenerTabla()
        {
            string consulta = "SELECT * FROM view_HorariosTrabajo";

            return acceso.ObtenerTabla("view_HorariosTrabajo", consulta);
        }

        //CREATE VIEW view_HorariosTrabajo
        //AS
        //SELECT Concat((Convert(varchar(5), HoraIngreso, 108)),' a ' ,(Convert(varchar(5), HoraSalida, 108)) ) AS Id,
        //      TipoHorario AS Nombre
        //FROM HorariosTrabajo
        //GO
    }
}
