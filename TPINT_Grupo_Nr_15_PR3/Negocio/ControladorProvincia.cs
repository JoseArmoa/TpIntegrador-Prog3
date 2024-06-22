using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using Dao;
using System.Data;

namespace Negocio
{
    public class ControladorProvincia
    {
        AccesoProvincia accesoProvincia = new AccesoProvincia();

        DataTable getTabla()
        {
            return accesoProvincia.obtenerTablaFiltrada();
        }
    }
}
