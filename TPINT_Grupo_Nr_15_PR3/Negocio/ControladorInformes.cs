using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dao;

namespace Negocio
{
    public class ControladorInformes
    {
        AccesoInformes accesoInformes = new AccesoInformes();

        public ControladorInformes()
        {

        }

        public DataTable getTablaAsistencias(DateTime inicio, DateTime final)
        {
            return accesoInformes.AsitenciasPorFecha(inicio, final);
        }
    }
}
