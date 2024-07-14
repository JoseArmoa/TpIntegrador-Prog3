using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;

namespace Vistas.Administrador
{
    public partial class Informes : System.Web.UI.Page
    {
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
                MultiView1.ActiveViewIndex = 0;   
            }
        }

        protected void lbPasarVista_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = MultiView1.ActiveViewIndex + 1;
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = MultiView1.ActiveViewIndex - 1;
        }

        protected void VAusentes_Activate(object sender, EventArgs e)
        {
            lblInforme1.Text = "";
            lblInforme2.Text = "";
            Chart1.Visible = false;
        }

        protected void VEspecialidades_Activate(object sender, EventArgs e)
        {

            
            DataTable dt = new DataTable();
            DataColumn dc = new DataColumn("Especialidad", Type.GetType("System.String"));
            dt.Columns.Add(dc);
            dc = new DataColumn("Porcentaje", Type.GetType("System.Decimal"));
            dt.Columns.Add(dc);

            DataRow dr = dt.NewRow();
            dr["Especialidad"] = "Clinico";
            dr["Porcentaje"] = 35.5M;
            dt.Rows.Add(dr);

            dr = dt.NewRow();
            dr["Especialidad"] = "Cardiologo";
            dr["Porcentaje"] = 25.5M;
            dt.Rows.Add(dr);

            dr = dt.NewRow();
            dr["Especialidad"] = "Neurologo";
            dr["Porcentaje"] = 14.5M;
            dt.Rows.Add(dr);

            dr = dt.NewRow();
            dr["Especialidad"] = "Odontologo";
            dr["Porcentaje"] = 24.5M;
            dt.Rows.Add(dr);

            foreach (DataRow d in dt.Rows)
            {
                chartEspecialidades.Series[0].Points.AddXY(d[0], d[1]);
                chartEspecialidades.Titles.Add(d[0].ToString());
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            chartEspecialidades.Visible = false;
            Chart3.Visible = true;

            DataTable dt = new DataTable();
            DataColumn dc = new DataColumn("Tiempo", Type.GetType("System.Decimal"));
            dt.Columns.Add(dc);
            dc = new DataColumn("Cantidad", Type.GetType("System.Int32"));
            dt.Columns.Add(dc);

            DataRow dr = dt.NewRow();
            dr["Tiempo"] = 6;
            dr["Cantidad"] = 8;
            dt.Rows.Add(dr);

            dr = dt.NewRow();
            dr["Tiempo"] = 7;
            dr["Cantidad"] = 10;
            dt.Rows.Add(dr);

            dr = dt.NewRow();
            dr["Tiempo"] = 10;
            dr["Cantidad"] = 5;
            dt.Rows.Add(dr);

            dr = dt.NewRow();
            dr["Tiempo"] = 12;
            dr["Cantidad"] = 10;
            dt.Rows.Add(dr);

            foreach (DataRow d in dt.Rows)
            {
                Chart3.Series[0].Points.AddXY(d[0], d[1]);
            }
        }

        protected void ButtonbtnVerUsuario_Click(object sender, EventArgs e)
        {
            PanelUsuario.Visible = !PanelUsuario.Visible;
        }

        protected void btnVer_Click(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            ControladorInformes ci = new ControladorInformes();
            DateTime inicio = DateTime.Parse(txtInicio.Text);
            DateTime final = DateTime.Parse(txtFinal.Text);
            dt = ci.getTablaAsistencias(inicio, final);
            int cantAsistencias = Convert.ToInt32(dt.Rows[0][1]);
            int cantInasitencias = Convert.ToInt32(dt.Rows[1][1]);
            int totalTurno = cantAsistencias + cantInasitencias;
            decimal PorcentajeAsistencia = totalTurno > 0 ? (decimal)cantAsistencias / totalTurno * 100 : 0;

            foreach (DataRow d in dt.Rows)
            {
                Chart1.Series[0].Points.AddXY(d[0], d[1]);
            }
            Chart1.Visible = true;

            lblInforme1.Text = "Desde la fecha " + txtInicio.Text + " hasta " + txtFinal.Text + " hubo un total de " + totalTurno + " turnos.";
            lblInforme2.Text = $"Solo el {PorcentajeAsistencia:F2}% asistió.";
        }
    }
}