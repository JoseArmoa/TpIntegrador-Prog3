using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;

namespace Vistas
{
    public partial class VerTurnos : System.Web.UI.Page
    {
        ControladorTurnos contrTurnos = new ControladorTurnos();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["Usuario"]!=null)
            {
                lblNombreUsuario.Text = Session["Usuario"].ToString();
            }

            if (!IsPostBack)
            {
                CargarGD();
            }
        }

        protected void CargarGD()
        {

            gvTurnos.DataSource = contrTurnos.getTablaTurnosAdministrador();
            gvTurnos.DataBind();
        }

        protected void ButtonbtnVerUsuario_Click(object sender, EventArgs e)
        {
            PanelUsuario.Visible = !PanelUsuario.Visible;
        }
    }
}