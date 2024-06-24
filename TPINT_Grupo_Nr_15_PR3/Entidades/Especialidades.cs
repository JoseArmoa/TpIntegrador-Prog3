using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Especialidades
    {
        private int ID_Especialidades;
        private string Nombre;

        public Especialidades()
        {

        }

        public int iDEspecialidad
        {
            get { return ID_Especialidades; }
            set { ID_Especialidades = value; }
        }

        public string nombre
        {
            get { return Nombre; }
            set { Nombre = value; }
        }
    }
}
