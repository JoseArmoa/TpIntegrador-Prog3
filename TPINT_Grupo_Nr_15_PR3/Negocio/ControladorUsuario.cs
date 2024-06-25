using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dao;
using Entidades;
using System.Data;

namespace Negocio
{
    public class ControladorUsuario
    {
        AccesoUsuario accUsuario = new AccesoUsuario();

        public bool existeUsuario(string nombreUsuario)
        {
            return accUsuario.existeNombreUsuario(nombreUsuario);
        }

        public bool comprobarContrasenia(string nombreUsuario, string pass)
        {
            return accUsuario.comprobarContrasenia(nombreUsuario, pass);
        }
        public bool agregarUsuario(ref Usuarios usu, ref string mensaje)
        {

            mensaje = null;

            if (accUsuario.existeUsuario(usu))
            {
                mensaje = "El Usuario ya existe en la base de datos";
                return false;
            }
            int filasAfectadas = accUsuario.agregarUsuario(ref usu);


            if (filasAfectadas > 0)
            {
                return true;
            }
            mensaje = "Hubo un error al guardar";
            return false;
        }

        public bool EliminarUsuario(Usuarios usu)
        {
            int filasAfectadas = accUsuario.EliminarUsuario(usu);
            if (filasAfectadas > 0)
            {
                return true;
            }
            return false;
        }

        public bool ActualizarUsuario(Usuarios usu)
        {
            int filasAfectadas = accUsuario.ActualizarUsuario(usu);
            if (filasAfectadas == 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public Usuarios obtenerUsuario(Usuarios usu)
        {
            return accUsuario.obtenerUsuario(usu.nombreUsuario);
        }

    }
}
