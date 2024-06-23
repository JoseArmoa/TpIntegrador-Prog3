using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Usuarios
    {
        private int Idusuario;
        private string NombreUsuario;
        private string Contraseña;
        private string TipoUsuario;

        Usuarios()
        {

        }

        public int iDUsuario
        {
            get { return Idusuario; }
            set { Idusuario = value; }
        }

        public string nombreUsuario
        {
            get { return NombreUsuario; }
            set { NombreUsuario = value; }
        }

        public string contraseña
        {
            get { return Contraseña; }
            set { Contraseña = value; }
        }

        public string tipousuario
        {
            get { return TipoUsuario; }
            set { TipoUsuario = value; }
        }

    }
}
