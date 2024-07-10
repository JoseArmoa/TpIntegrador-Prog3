using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Turnos
    {
        private int IdTurno;
        private string Medico;
        private int Dia;
        private DateTime Fecha;
        private DateTime Hora;
        private string DniPaciente;
        private bool Asistio;

        public int iDturno
        {
            get { return IdTurno; }
            set { IdTurno = value; }
        }

        public string medico
        {
            get { return Medico; }
            set { Medico = value; }
        }

        public int dia
        {
            get { return Dia; }
            set { Dia = value; }
        }

        public DateTime fecha
        {
            get { return Fecha; }
            set { Fecha = value; }
        }

        public DateTime hora
        {
            get { return Hora; }
            set { Hora = value; }
        }

        public string dnipaciente
        {
            get { return DniPaciente; }
            set { DniPaciente = value; }
        }

        public bool asistio
        {
            get { return Asistio; }
            set { Asistio = value; }
        }
    }
}
