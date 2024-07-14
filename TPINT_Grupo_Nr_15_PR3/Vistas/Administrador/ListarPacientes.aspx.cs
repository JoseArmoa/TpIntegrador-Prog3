using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using System.Data;
using Entidades;

namespace Vistas
{
    public partial class ListarPacientes : System.Web.UI.Page
    {
        ControladorPacientes contrPacientes = new ControladorPacientes();
        Pacientes pac = new Pacientes();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"] != null)
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

            gvListarPacientes.DataSource = contrPacientes.getTabla();
            gvListarPacientes.DataBind();
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            string dni = txtFiltrar.Text.Trim();
            DataTable resultado = contrPacientes.filtrarPorDNI(dni);
            if (resultado != null)
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
            PanelUsuario.Visible = !PanelUsuario.Visible;
        }

        protected void btnBuscar_Command(object sender, CommandEventArgs e)
        {
            if (txtFiltrar.Text == "")
            {
                lblMensaje.Text = "";
                CargarGD();
            }
        }

        protected void gvListarPacientes_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string DniPaciente = ((Label)gvListarPacientes.Rows[e.RowIndex].FindControl("lb_it_DNI")).Text;
          
            pac.dni = DniPaciente;
            contrPacientes.EliminarPacientes(pac);

            CargarGD();

        }

        protected void gvListarPacientes_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvListarPacientes.EditIndex = e.NewEditIndex;
            CargarGD();

        }

        protected void gvListarPacientes_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvListarPacientes.EditIndex = -1;
            CargarGD();
        }

        protected void gvListarPacientes_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string DniPaciente = ((Label)gvListarPacientes.Rows[e.RowIndex].FindControl("lb_it_DNI")).Text;
            string NombrePaciente = ((TextBox)gvListarPacientes.Rows[e.RowIndex].FindControl("txt_eit_Nombre")).Text;
            string ApellidoPaciente = ((TextBox)gvListarPacientes.Rows[e.RowIndex].FindControl("txt_eit_Apellido")).Text;
            string Direccion = ((TextBox)gvListarPacientes.Rows[e.RowIndex].FindControl("txt_eit_Direccion")).Text;
            string Telefno = ((TextBox)gvListarPacientes.Rows[e.RowIndex].FindControl("txt_eit_telefono")).Text;
            string Fecha = ((TextBox)gvListarPacientes.Rows[e.RowIndex].FindControl("txt_eit_FechNac")).Text;
            
            pac.dni = DniPaciente;
            pac.nombre = NombrePaciente;
            pac.apellido = ApellidoPaciente;
            pac.direccion = Direccion;
            pac.telefono = Fecha;

            contrPacientes.ActualizarPacientes(pac);
            gvListarPacientes.EditIndex = -1;
            CargarGD();

        }

        protected void lbObservaciones_Click(object sender, EventArgs e)
        {
            MultiViewObservacion.ActiveViewIndex = 0;
        }

        protected void btnOcultar_Click(object sender, EventArgs e)
        {
            MultiViewObservacion.ActiveViewIndex = -1;
        }

        protected void lbObservaciones_Command(object sender, CommandEventArgs e)
        {
            Observaciones obs = new Observaciones();
            ControladorObservaciones constr = new ControladorObservaciones();

            if (e.CommandName == "comandoObservaiones")
            {
                string arguments = (string)e.CommandArgument;

                obs.dnipaciente = arguments;

                gvObservaciones.DataSource = constr.getTablaObservaciones(ref obs);
                gvObservaciones.DataBind();
            }
        }
    }


}