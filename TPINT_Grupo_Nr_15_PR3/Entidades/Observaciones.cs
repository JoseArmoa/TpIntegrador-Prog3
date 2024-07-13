using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Observaciones
    {
        private string Observacion;
        private int ID_Turno;
        private string DniPaciente;

        public int iDturno
        {
            get { return ID_Turno; }
            set { ID_Turno = value; }
        }

        public string observaciones
        {
            get { return Observacion; }
            set { Observacion = value; }
        }

        public string dnipaciente
        {
            get { return DniPaciente; }
            set { DniPaciente = value; }
        }
    }
}
