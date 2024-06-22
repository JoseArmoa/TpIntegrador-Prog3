using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;

namespace Vistas
{
    public partial class ListarPacientes : System.Web.UI.Page
    {
        ControladorPacientes contrPacientes = new ControladorPacientes();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"] != null)
            {
                lblNombreUsuario.Text = Session["Usuario"].ToString();
            }

            if (!IsPostBack)
            {
                gvListarPacientes.DataSource = contrPacientes.getTabla();
                gvListarPacientes.DataBind();
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            string dni = txtFiltrar.Text.Trim();
            txtFiltrar.Text = "";
            if (contrPacientes.filtrarPorDNI(dni) != null)
            {
                lblMensaje.Text = "";
                gvListarPacientes.DataSource = contrPacientes.filtrarPorDNI(dni);
                gvListarPacientes.DataBind();
            }
            else
            {
                lblMensaje.Text = "DNI inexistente ";
            }
        }

        protected void ButtonbtnVerUsuario_Click(object sender, EventArgs e)
        {
            panelUsuario.Visible = !panelUsuario.Visible;
        }

        protected void btnBuscar_Command(object sender, CommandEventArgs e)
        {
            if (txtFiltrar.Text == "")
            {
                lblMensaje.Text = "";
                gvListarPacientes.DataSource = contrPacientes.getTabla();
                gvListarPacientes.DataBind();
            }
        }
    }
    }
}