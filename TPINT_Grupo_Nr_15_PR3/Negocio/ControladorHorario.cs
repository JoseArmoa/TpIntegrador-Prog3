using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using Dao;

namespace Negocio
{
    public class ControladorHorario
    {
        AccesoHorarios accHor = new AccesoHorarios();

        public bool agregarHorario(ref HorarioMedico hm)
        {
            if(accHor.agregarHorario(ref hm))
            {
                return true;
            }
            return false;
        }
    }
}
