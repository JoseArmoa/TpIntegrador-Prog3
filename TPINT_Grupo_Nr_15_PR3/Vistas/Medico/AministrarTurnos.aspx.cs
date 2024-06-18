using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vistas.Medico
{
    public partial class AministrarTurnos : System.Web.UI.Page
    {
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

            DataRow dr = dt.NewRow();
            dr["Fecha"] = "17/7/2024";
            dr["Hora"] = "9:00";
            dr["Nombre"] = "Juan";
            dr["Apellido"] = "Perez";
            dr["DNI"] = "11111";
            dt.Rows.Add(dr);

            gdHoy.DataSource = dt;
            gdHoy.DataBind();

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {   /**
            //Funcionalidad para guardar la observacion en base de datos
            **/
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
            panelUsuario.Visible = !panelUsuario.Visible;
        }
    }
}