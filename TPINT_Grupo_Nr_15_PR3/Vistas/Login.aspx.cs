using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Entidades;


namespace Vistas
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["Usuario"] = null;
        }

        protected void btnIniciarSesion_Click(object sender, EventArgs e)
        {
            ControladorUsuario cu = new ControladorUsuario();
            Usuarios usu = new Usuarios();
            usu.nombreUsuario = txtNombreUsuario.Text;
            if (cu.existeUsuario(usu.nombreUsuario))
            {
                if(!cu.comprobarContrasenia(usu.nombreUsuario, txtPassword.Text))
                {
                    lblMensaje.Text = "Contraseña incorrecta";
                    return;
                }

                usu = cu.obtenerUsuario(usu);

                redirigir(ref usu);
            } else
            {
                lblMensaje.Text = "Usuario Incorrecto";
            }
        }

        void redirigir(ref Usuarios usuarios)
        {
            Session["Usuario"] = usuarios.nombreUsuario;
            if(usuarios.tipousuario == "Admin")
            {
                Response.Redirect("Administrador/Inicio.aspx");
            }
            else
            {
                Response.Redirect("Medico/Inicio.aspx");
            }
        }
 
    }
}