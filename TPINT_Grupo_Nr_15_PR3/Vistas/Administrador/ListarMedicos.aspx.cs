using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocio;

namespace Vistas.Administrador
{
    public partial class ListarMedicos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"] != null)
            {
                lblNombreUsuario.Text = Session["Usuario"].ToString();
            }
        }

        protected void ButtonbtnVerUsuario_Click(object sender, EventArgs e)
        {
            PanelUsuario.Visible = !PanelUsuario.Visible;
        }

        protected void gvListarMedicos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            String legajo = ((Label)gvListarMedicos.Rows[e.RowIndex].FindControl("lbl_it_Legajo")).Text;
            Medicos medico = new Medicos();
            medico.legajo = legajo;

            ControladorMedicos cMedicos = new ControladorMedicos();
            cMedicos.EliminarMedico(medico);

            //CargarGD();
        }
    }
}