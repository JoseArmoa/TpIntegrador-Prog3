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
            else
            {
                Response.Redirect("../Login.aspx");
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

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            MultiViewObservacion.ActiveViewIndex = 0;
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            MultiViewObservacion.ActiveViewIndex = -1;
        }

        protected void LinkButton2_Command(object sender, CommandEventArgs e)
        {
            if(e.CommandName == "comandoTurnos")
            {
                string[] arguments = e.CommandArgument.ToString().Split('-');

                lblNombre.Text = arguments[0];
                lblDni.Text = arguments[1];
                lblObservacion.Text = arguments[2];
            }
        }

        protected void gvTurnos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvTurnos.PageIndex = e.NewPageIndex;
            CargarGD();
        }
    }
}