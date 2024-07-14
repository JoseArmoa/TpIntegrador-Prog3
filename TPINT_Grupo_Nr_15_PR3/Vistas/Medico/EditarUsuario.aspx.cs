using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocio;

namespace Vistas.Medico
{
    public partial class EditarUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            txtNombreUsuario.Text = "";
            txtContaseña.Text = "";
            txtRepetirContraseña.Text = "";
            lblMensaje.Text = "Operacion Cancelada";
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            Usuarios usuario = new Usuarios();
            usuario.nombreUsuario = txtNombreUsuario.Text;
            usuario.contraseña = txtContaseña.Text;

            ControladorUsuario cUsu = new ControladorUsuario();
            usuario.iDUsuario = cUsu.obtenerUsuario(usuario).iDUsuario;

            lblMensaje.Text = Convert.ToString(usuario.iDUsuario);

            if (cUsu.ActualizarUsuario(usuario))
            {
                lblMensaje.Text = "Se actualizo la contraseña correctamente";
            }
            else
            {
                lblMensaje.Text = " No se pudo actualizar la contraseña ";
            }
            txtNombreUsuario.Text = "";
        }
    }
}