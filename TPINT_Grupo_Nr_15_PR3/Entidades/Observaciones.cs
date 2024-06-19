using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    class Observaciones
    {
        private string Observacion;
        private int ID_Observaciones;

        Observaciones()
        {

        }

        public int iDLocalidad
        {
            get { return ID_Observaciones; }
            set { ID_Observaciones = value; }
        }

        public string observaciones
        {
            get { return Observacion; }
            set { Observacion = value; }
        }
    }
}
