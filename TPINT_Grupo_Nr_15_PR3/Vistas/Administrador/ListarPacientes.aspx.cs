﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vistas
{
    public partial class ListarPacientes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"] != null)
            {
                lblNombreUsuario.Text = Session["Usuario"].ToString();
            }
        }


        protected void btnBuscar_Click(object sender, EventArgs e)
        {

        }

        protected void ButtonbtnVerUsuario_Click(object sender, EventArgs e)
        {
            panelUsuario.Visible = !panelUsuario.Visible;
        }
    }
}