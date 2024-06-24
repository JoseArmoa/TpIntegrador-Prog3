using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocio;
using System.Data;

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

            if(!IsPostBack)
            {
                CargarGD();
            }
        }

        protected void CargarGD()
        {
            ControladorMedicos negMedicos = new ControladorMedicos();

            gvListarMedicos.DataSource = negMedicos.getTabla();
            gvListarMedicos.DataBind();
        }

        protected void ButtonbtnVerUsuario_Click(object sender, EventArgs e)
        {
            PanelUsuario.Visible = !PanelUsuario.Visible;
        }

        protected void gvListarMedicos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            String legajo = ((Label)gvListarMedicos.Rows[e.RowIndex].FindControl("lbl_eit_Legajo")).Text;
            Medicos medico = new Medicos();
            medico.legajo = legajo;

            ControladorMedicos cMedicos = new ControladorMedicos();
            cMedicos.EliminarMedico(medico);

            CargarGD();
        }

        protected void cargarDDL(DropDownList ddl, DataTable dt)
        {
            ddl.DataSource = dt;
            ddl.DataTextField = "Nombre";
            ddl.DataValueField = "ID";
            ddl.DataBind();
        }



        protected void gvListarMedicos_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvListarMedicos.EditIndex = e.NewEditIndex;
            //CargarGD();
        }
    }
}