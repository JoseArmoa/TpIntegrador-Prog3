﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    class Provincias
    {
        private int ID_Provincia;
        private string Nombre;

        public Provincias()
        {

        }

        public int idProvincia
        {
            get { return ID_Provincia; }
            set { ID_Provincia = value; }
        }

        public string nombre
        {
            get { return Nombre; }
            set { Nombre = value; }
        }
    }
}
