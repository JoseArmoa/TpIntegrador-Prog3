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
    public partial class CagarPacientes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"] != null)
            {
                lblNombreUsuario.Text = Session["Usuario"].ToString();
            }

            if (!IsPostBack)
            {
                //cargarDdlLocalidad(ddlLocalidad);
                //cargarDdlProvincias(ddlProvinciaPacientes);
            }

        }

        public void cargarDdlLocalidad(DropDownList ddl)
        {
            ControladorLocalidad cl = new ControladorLocalidad();
           // ddl.DataSource = cl.ObtenerddlProvincia();
            ddl.DataTextField = "Nombre";
            ddl.DataValueField = "ID";
            ddl.DataBind();
        }

        public void cargarDdlProvincias(DropDownList ddl)
        {

        }

        protected void ButtonbtnVerUsuario_Click(object sender, EventArgs e)
        {
            PanelUsuario.Visible = !PanelUsuario.Visible;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string mensaje = "";
            ControladorPacientes controlador = new ControladorPacientes();
            Pacientes paciente = new Pacientes();
            paciente.nombre = txtNombrePacientes.Text.Trim();
            paciente.apellido = txtApellidoPacientes.Text.Trim();
            paciente.dni = txtDNIPacientes.Text.Trim();
            paciente.iDLocalidad = Convert.ToInt32(ddlLocalidad.SelectedValue);
            paciente.direccion = txtDireccionPacientes.Text.Trim();
            paciente.email = txtEmailPacientes.Text.Trim();
            paciente.telefono = txtTelefonoPacientes.Text.Trim();
            paciente.iDProvincia = Convert.ToInt32(ddlProvinciaPacientes.SelectedValue);
            paciente.FechNac = txtFechaNacimientoPaciente.Text.Trim();

            if (controlador.agregarPaciente(ref paciente, ref mensaje))
            {
                lblMensaje.Text = "Sucursal agregada con exito";
            }
            else
            {
                lblMensaje.Text = mensaje;
            }

            txtNombrePacientes.Text = "";
            txtApellidoPacientes.Text = "";
            txtDireccionPacientes.Text = "";
            txtDNIPacientes.Text = "";
            ddlLocalidad.SelectedIndex = 0;
            ddlProvinciaPacientes.SelectedIndex = 0;
            txtFechaNacimientoPaciente.Text = "";
            txtEmailPacientes.Text = "";
            txtTelefonoPacientes.Text = "";
        }


    }
}