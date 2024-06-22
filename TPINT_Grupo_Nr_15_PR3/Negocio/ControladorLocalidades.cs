using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dao;
using Entidades;

namespace Negocio
{
    class ControladorLocalidades
    {
        AccesoLocalidades accesoLocalidades = new AccesoLocalidades();

        DataTable getTabla(Provincias prov)
        {
            return accesoLocalidades.obtenerTablaFiltrada(prov.idProvincia);
        }
    }
}
