using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Entidades;
using System.Data;
using System.Globalization;

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
                ControladorProvincia cp = new ControladorProvincia();
                cargarDDL(ddlProvinciaPacientes, cp.getTabla());
                ListItem lt = new ListItem("-Seleccione una Provincia-", "-1");
                ddlProvinciaPacientes.Items.Insert(0, lt);
                lt = new ListItem("-Seleccione una Localidad-", "-1");
                ddlLocalidad.Items.Add(lt);
                ddlLocalidad.Enabled = false;
            }

        }

        public void cargarDDL(DropDownList ddl, DataTable dt)
        {
            ddl.DataSource = dt;
            ddl.DataTextField = "Nombre";
            ddl.DataValueField = "ID";
            ddl.DataBind();
        }

        protected void ButtonbtnVerUsuario_Click(object sender, EventArgs e)
        {
            PanelUsuario.Visible = !PanelUsuario.Visible;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string formatoFecha = "dd/MM/yyyy";
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
            paciente.sexo = txtSexoPaciente.Text.Trim();
            paciente.nacionalidad = txtNacionalidadPaciente.Text.Trim();
            // Convertir la cadena de fecha a DateTime
            DateTime fechaNacimiento;
            if (DateTime.TryParseExact(txtFechaNacimientoPaciente.Text.Trim(), formatoFecha, CultureInfo.InvariantCulture, DateTimeStyles.None, out fechaNacimiento))
            {
                paciente.FechNac = fechaNacimiento;

                if (controlador.agregarPaciente(ref paciente))
                {
                    lblMensaje.Text = "Paciente agregado con éxito";
                }
                else
                {
                    lblMensaje.Text = "El DNI ya existe en la base de datos";
                }
            }
            else
            {
                lblMensaje.Text = "La fecha de nacimiento no es válida. Formato esperado: " + formatoFecha;
            }

            LimpiarCampos();
        }

        public void LimpiarCampos()
        {
            txtNombrePacientes.Text = "";
            txtApellidoPacientes.Text = "";
            txtDireccionPacientes.Text = "";
            txtDNIPacientes.Text = "";
            ddlLocalidad.SelectedIndex = 0;
            ddlProvinciaPacientes.SelectedIndex = 0;
            txtFechaNacimientoPaciente.Text = "";
            txtEmailPacientes.Text = "";
            txtTelefonoPacientes.Text = "";
            txtSexoPaciente.Text = "";
            txtNacionalidadPaciente.Text = "";
        }

        protected void ddlProvinciaPacientes_SelectedIndexChanged(object sender, EventArgs e)
        {
            Provincias prov = new Provincias();
            prov.idProvincia = Convert.ToInt32(ddlProvinciaPacientes.SelectedValue);
            if (ddlProvinciaPacientes.SelectedValue != "-1")
            {
                ControladorLocalidad cl = new ControladorLocalidad();
                cargarDDL(ddlLocalidad, cl.ObtenerLocalidades(prov.idProvincia));
                ListItem lt = new ListItem("-Selecione una Localidad-", "-1");
                ddlLocalidad.Items.Insert(0, lt);
                ddlLocalidad.Enabled = true;
            }
            else
            {
                ddlLocalidad.SelectedIndex = 0;
                ddlLocalidad.Enabled = false;
            }
        }
    }
}