using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocio;
using System.Data;

namespace Vistas
{
    public partial class CargarTurnos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"] != null)
            {
                lblNombreUsuario.Text = Session["Usuario"].ToString();
            }

            if (!IsPostBack)
            {
                ControladorEspecialidades ce = new ControladorEspecialidades();
                cargarDDL(ddlEspecialidades, ce.getTabla());
                ListItem lt = new ListItem("-Selecione una Especialidad-", "-1");
                ddlEspecialidades.Items.Insert(0, lt);
                lt = new ListItem("-Selecione un Médico-", "-1");
                ddlMedicos.Items.Insert(0, lt);
            }
        }

        protected void btnTurnos_Click(object sender, EventArgs e)
        {
            Calendar1.Visible = !Calendar1.Visible;
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            DataList1.Visible = true;
           
            /*
             * 
             * Aca crearia una funcion para cargar el datalist con una lista de horarios que contenga el nombre del medico y el horario disponible segun la especialidad seleccionada en la fecha que se selecciono. 
             * 
             * */
            lblFecha.Text = Calendar1.SelectedDate.ToShortDateString();
            Calendar1.Visible = false;
        }

        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {

            //Ahora cargamos el calendario con la condicion de que no se pueda seleccionar una fecha anterior al dia actual, luego creare una funcion que no deje seleccionar en una fecha que no tenga turnos disponibles segun la especialidad.
            DateTime hoy = System.DateTime.Today;
            ControladorTurnos ct = new ControladorTurnos();
            string legajo = ddlMedicos.SelectedItem.Value;

            if(e.Day.Date < hoy || !ct.hayDisponibles(legajo, e.Day.Date))
            {
                e.Day.IsSelectable = false;
                e.Cell.Enabled = false;
                
            }
        }

        protected void ButtonbtnVerUsuario_Click(object sender, EventArgs e)
        {
            PanelUsuario.Visible = !PanelUsuario.Visible;
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            Pacientes paciente = new Pacientes();
            paciente.dni = txtDni.Text;

            ControladorPacientes cp = new ControladorPacientes();
            if(cp.buscarPaciente(ref paciente) != null)
            {
                lblNombrePaciente.Text = paciente.nombre + " " + paciente.apellido;
            } 
            else
            {
                lblNombrePaciente.Text = "No existe el paciente";
            }
        }

        protected void cargarDDL(DropDownList ddl, DataTable dt, string value = "Id")
        {
            ddl.DataSource = dt;
            ddl.DataTextField = "Nombre";
            ddl.DataValueField = value;
            ddl.DataBind();
        }

        protected void ddlEspecialidades_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(ddlEspecialidades.SelectedValue != "-1")
            {
                string especialidad = ddlEspecialidades.SelectedItem.Text;
                ControladorMedicos me = new ControladorMedicos();
                cargarDDL(ddlMedicos, me.getTablaXEspecialidad(especialidad), "Legajo");
                ListItem lt = new ListItem("-Selecione un Médico-", "-1");
                ddlMedicos.Items.Insert(0, lt);
                ddlMedicos.Enabled = true;
            }
            else
            {
                ddlMedicos.SelectedIndex = 0;
                ddlMedicos.Enabled = false;
            }
        }
    }
}