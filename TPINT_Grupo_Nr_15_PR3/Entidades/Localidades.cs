using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    class Localidades
    {
        private string ID_Localidad;
        private string Nombre;

        public Localidades() 
        {

        }

        public string iDLocalidad
        {
            get { return ID_Localidad; }
            set { ID_Localidad = value; }
        }

        public string nombre
        {
            get { return Nombre; }
            set { Nombre = value; }
        }
    }
}
