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
        private TimeSpan horaEntrada;
        private TimeSpan horaSalida;

        public HorarioMedico()
        {
        }

        public string LegajoMed { get => legajoMed; set => legajoMed = value; }
        public int DiaSemana { get => diaSemana; set => diaSemana = value; }
        public TimeSpan HoraEntrada { get => horaEntrada; set => horaEntrada = value; }
        public TimeSpan HoraSalida { get => horaSalida; set => horaSalida = value; }
    }
}
