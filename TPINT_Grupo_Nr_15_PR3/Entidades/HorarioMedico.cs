using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class HorarioMedico
    {
        private string legajoMed;
        private int diaSemana;
        private string horaEntrada;
        private string horaSalida;

        public HorarioMedico()
        {
        }

        public string LegajoMed { get => legajoMed; set => legajoMed = value; }
        public int DiaSemana { get => diaSemana; set => diaSemana = value; }
        public string HoraEntrada { get => horaEntrada; set => horaEntrada = value; }
        public string HoraSalida { get => horaSalida; set => horaSalida = value; }
    }
}
