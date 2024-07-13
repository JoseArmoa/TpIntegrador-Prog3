using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Entidades;

namespace Vistas.Medico
{
    public partial class AministrarTurnos : System.Web.UI.Page
    {
        ControladorTurnos controlTur = new ControladorTurnos();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["Usuario"]!=null)
            {
                lblNombreUsuario.Text = Session["Usuario"].ToString();
            }

            DataTable dt = new DataTable();
            DataColumn dc = new DataColumn("Fecha",Type.GetType("System.String"));
            dt.Columns.Add(dc);
            dc = new DataColumn("Hora", Type.GetType("System.String"));
            dt.Columns.Add(dc);
            dc = new DataColumn("Nombre", Type.GetType("System.String"));
            dt.Columns.Add(dc);
            dc = new DataColumn("Apellido", Type.GetType("System.String"));
            dt.Columns.Add(dc);
            dc = new DataColumn("DNI", Type.GetType("System.String"));
            dt.Columns.Add(dc);
            dc = new DataColumn("Id Turno", typeof(int));
            dt.Columns.Add(dc);

            /* DataRow dr = dt.NewRow();
             dr["Fecha"] = "17/7/2024";
             dr["Hora"] = "9:00";
             dr["Nombre"] = "Juan";
             dr["Apellido"] = "Perez";
             dr["DNI"] = "11111";
             dt.Rows.Add(dr);

             gdTurnos.DataSource = dt;
             gdTurnos.DataBind();*/


            if (!IsPostBack)
            {
                CargarGD();
            }
        }

        protected void CargarGD()
        {

            gvTurnos.DataSource = controlTur.getTablaTurnosMedicos();
            gvTurnos.DataBind();
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            Observaciones obs = new Observaciones();
            ControladorObservaciones contrObs = new ControladorObservaciones();
            obs.observaciones = txtObservacion.Text.Trim();
            obs.dnipaciente = lblDni.Text.Trim();
            obs.iDturno =  int.Parse(lblIdTurno.Text.Trim());

            if (contrObs.agregarObservacion(ref obs))
            {
                lblmensajes.Text = "Se agrego la Observacion correctamente";
            }
            else
            {
                lblmensajes.Text = "La Observacion no se agrego correctamente";
            }

            lblMensaje.Text = "Cambios Guardados correctamente.";
            MultiView1.ActiveViewIndex = -1;
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            lblMensaje.Text = "Operacion Cancelada";
            MultiView1.ActiveViewIndex = -1;
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }

        protected void btnUsuario_Click(object sender, EventArgs e)
        {
            PanelUsuario.Visible = !PanelUsuario.Visible;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string dni = txtFiltarTurnos.Text.Trim();
            DataTable resultado = controlTur.filtrarTurnoPorDNI(dni);
            if (resultado != null)
            {
                lblMensaje.Text = "";
                gvTurnos.DataSource = controlTur.filtrarTurnoPorDNI(dni);
                gvTurnos.DataBind();
            }
            else
            {
                lblmensajes.Text = "DNI inexistente ";
            }
        }

        protected void Button1_Command(object sender, CommandEventArgs e)
        {
            if (txtFiltarTurnos.Text == "")
            {
                lblmensajes.Text = "";
                CargarGD();
            }
        }

        protected void LinkButton1_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "comandoSeleccionar")
            {
                string[] arguments = e.CommandArgument.ToString().Split('-');
                lblNombre.Text = arguments[1];
                lblApellido.Text = arguments[2];
                lblDni.Text = arguments[3];
                lblFecha.Text = arguments[4];
                lblIdTurno.Text = arguments[0];
            }
        }
    }
}