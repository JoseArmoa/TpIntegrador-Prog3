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
    public partial class CargarMedico : System.Web.UI.Page
    {
        static List<HorarioMedico> horarios = new List<HorarioMedico>();
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

        protected void btnAgregarDiayHorario_Click(object sender, EventArgs e)
        {
            HorarioMedico hm = new HorarioMedico();
            if(lblDiasyHorario.Text == "")
            {
                lblDiasyHorario.Text = ddlDias.SelectedItem.Text + " " + ddlHorario.SelectedValue;
                hm.LegajoMed = lblLegajo.Text;
                hm.DiaSemana = Convert.ToInt32(ddlDias.SelectedValue);
                hm.HoraEntrada = ddlHorario.SelectedValue.Trim().Split('a')[0];
                hm.HoraSalida = ddlHorario.SelectedValue.Trim().Split('a')[1];

                horarios.Add(hm);
            }
            else
            {
                lblDiasyHorario.Text += "<br>" + ddlDias.SelectedItem.Text + " " + ddlHorario.SelectedValue;
                hm.LegajoMed = lblLegajo.Text;
                hm.DiaSemana = Convert.ToInt32(ddlDias.SelectedValue);
                hm.HoraEntrada = ddlHorario.SelectedValue.Trim().Split('a')[0];
                hm.HoraSalida = ddlHorario.SelectedValue.Trim().Split('a')[1];

                horarios.Add(hm);
            }
        }
    }
}