using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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

            if(e.Day.Date < hoy)
            {
                e.Day.IsSelectable = false;
            }
        }

        protected void ButtonbtnVerUsuario_Click(object sender, EventArgs e)
        {
            PanelUsuario.Visible = !PanelUsuario.Visible;
        }
    }
}