using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class HorariosTrabajo
    {
        private TimeSpan ingreso;
        private TimeSpan salida;
        private string tipoHorario;

        public HorariosTrabajo()
        {
        }

        public TimeSpan Ingreso { get => ingreso; set => ingreso = value; }
        public TimeSpan Salida { get => salida; set => salida = value; }
        public string TipoHorario { get => tipoHorario; set => tipoHorario = value; }
    }
}
