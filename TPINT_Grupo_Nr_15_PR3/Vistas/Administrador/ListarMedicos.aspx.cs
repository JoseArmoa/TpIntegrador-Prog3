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
            ddl.DataValueField = "Id";
            ddl.DataBind();
        }


        protected void gvListarMedicos_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvListarMedicos.EditIndex = e.NewEditIndex;

            CargarGD();
        }

        protected void gvListarMedicos_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if(e.Row.RowType == DataControlRowType.DataRow)
            {
                DropDownList ddl = (DropDownList)e.Row.FindControl("ddl_eit_Especialidad");
                if(ddl != null)
                {
                    ControladorEspecialidades ce = new ControladorEspecialidades();
                    cargarDDL(ddl, ce.getTabla());
                }

            }
        }

        protected void gvListarMedicos_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string Legajo = ((Label)gvListarMedicos.Rows[e.RowIndex].FindControl("lbl_eit_Legajo")).Text;
            string Nombre = ((TextBox)gvListarMedicos.Rows[e.RowIndex].FindControl("txt_eit_Nombre")).Text;
            string Apellido = ((TextBox)gvListarMedicos.Rows[e.RowIndex].FindControl("txt_eit_Apellido")).Text;
            string Dni = ((TextBox)gvListarMedicos.Rows[e.RowIndex].FindControl("txt_eit_Dni")).Text;
            int Especialidad = Int32.Parse( ((DropDownList)gvListarMedicos.Rows[e.RowIndex].FindControl("ddl_eit_Especialidad")).SelectedItem.Value);
          

            Medicos medico = new Medicos();
            medico.legajo = Legajo;
            medico.nombre = Nombre;
            medico.apellido = Apellido;
            medico.dni = Dni;
            medico.IDespecialidad = Especialidad;

            ControladorMedicos cm = new ControladorMedicos();
            cm.ActualizarMedico(medico);

            gvListarMedicos.EditIndex = -1;
            CargarGD();
        }

        protected void gvListarMedicos_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvListarMedicos.EditIndex = -1;
            CargarGD();
        }
    }
}