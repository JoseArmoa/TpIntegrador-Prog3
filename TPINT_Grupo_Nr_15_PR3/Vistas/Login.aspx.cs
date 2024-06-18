using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vistas
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["Usuario"] = null;
        }

        protected void btnIniciarSesion_Click(object sender, EventArgs e)
        {
            //Para borrar el nombre de Usuario agregado anteriormente//
           

            if(Session["Usuario"]==null)
            {
                Session["Usuario"] = txtEmail.Text;
            }
        }
    }
}