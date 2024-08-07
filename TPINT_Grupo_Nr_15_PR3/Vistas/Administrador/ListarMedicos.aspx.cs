﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocio;
using System.Data;

namespace Vistas.Administrador
{
    public partial class ListarMedicos : System.Web.UI.Page
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

            if(!IsPostBack)
            {
                CargarGD();
                gvHorariosMedico.Visible = false;
                btnOcultarHorarios.Visible = false;
                cargarFilltro();
            }
        }

        protected void CargarGD(DataTable dt = null)
        {
            if(dt == null)
            {
                ControladorMedicos negMedicos = new ControladorMedicos();

                gvListarMedicos.DataSource = negMedicos.getTabla();
                gvListarMedicos.DataBind();
            } else
            {
                gvListarMedicos.DataSource = dt;
                gvListarMedicos.DataBind();
            }
        }

        protected void ButtonbtnVerUsuario_Click(object sender, EventArgs e)
        {
            PanelUsuario.Visible = !PanelUsuario.Visible;
        }

        protected void gvListarMedicos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            String legajo = ((Label)gvListarMedicos.Rows[e.RowIndex].FindControl("lbl_it_Legajo")).Text;
            Medicos medico = new Medicos();
            medico.legajo = legajo;

            ControladorMedicos cMedicos = new ControladorMedicos();
            cMedicos.EliminarMedico(medico);

            CargarGD();
        }


        protected void gvListarMedicos_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvListarMedicos.EditIndex = e.NewEditIndex;
            CargarGD();
        }

        protected void cargarDDL(DropDownList ddl, DataTable dt)
        {
            ddl.DataSource = dt;
            ddl.DataTextField = "Nombre";
            ddl.DataValueField = "Id";
            ddl.DataBind();
        }

        protected void gvListarMedicos_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if(e.Row.RowType == DataControlRowType.DataRow)
            {
                DropDownList ddl = (DropDownList)e.Row.FindControl("ddl_eit_Especialidad");
                if (ddl != null)
                {
                    ControladorEspecialidades ce = new ControladorEspecialidades();
                    cargarDDL(ddl, ce.getTabla());

                    Label lblLegajo = (Label)e.Row.FindControl("lbl_eit_Legajo");
                    ControladorMedicos cm = new ControladorMedicos();
                    string id = cm.getIdEspecialidad(lblLegajo.Text);

                    ddl.SelectedValue = id;
                    
                }

            }
        }

        protected void gvListarMedicos_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string Legajo = ((Label)gvListarMedicos.Rows[e.RowIndex].FindControl("lbl_eit_Legajo")).Text;
            string Nombre = ((TextBox)gvListarMedicos.Rows[e.RowIndex].FindControl("txt_eit_Nombre")).Text;
            string Apellido = ((TextBox)gvListarMedicos.Rows[e.RowIndex].FindControl("txt_eit_Apellido")).Text;
            string Dni = ((Label)gvListarMedicos.Rows[e.RowIndex].FindControl("lbl_eit_Dni")).Text;
            int Especialidad = Int32.Parse( ((DropDownList)gvListarMedicos.Rows[e.RowIndex].FindControl("ddl_eit_Especialidad")).SelectedItem.Value);
          

            Medicos medico = new Medicos();
            medico.legajo = Legajo;
            medico.nombre = Nombre;
            medico.apellido = Apellido;
            medico.dni = Dni;
            medico.IDespecialidad = Especialidad;

            ControladorMedicos cm = new ControladorMedicos();
            cm.ActualizarMedico(medico);

            gvListarMedicos.EditIndex = -1;
            CargarGD();
        }

        protected void gvListarMedicos_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvListarMedicos.EditIndex = -1;
            CargarGD();
        }

        protected void CargarHorario(string legajo)
        {
            ControladorHorario horario = new ControladorHorario();

            gvHorariosMedico.DataSource = horario.getTabla(legajo);
            gvHorariosMedico.DataBind();
        }

        protected void gvListarMedicos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName == "verHorarios")
            {             
                int fila = Convert.ToInt32(e.CommandArgument);
                string Legajo = ( (Label)gvListarMedicos.Rows[fila].FindControl("lbl_it_Legajo") ).Text;

                CargarHorario(Legajo);
                gvHorariosMedico.Visible= true;
                btnOcultarHorarios.Visible = true;
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            ControladorMedicos negMedicos = new ControladorMedicos();

            string filtro = txtLegajo.Text;

            CargarGD(negMedicos.getTablaFiltrada(filtro));
        }

        protected void btnMostrarTodos_Click(object sender, EventArgs e)
        {
            CargarGD();
        }

        protected void btnOcultarHorarios_Click(object sender, EventArgs e)
        {
            gvHorariosMedico.Visible = false;
            btnOcultarHorarios.Visible = false;
        }

        protected void txtLegajo_TextChanged(object sender, EventArgs e)
        {
            ControladorMedicos negMedicos = new ControladorMedicos();

            string filtro = txtLegajo.Text;

            CargarGD(negMedicos.getTablaFiltrada(filtro));
        }

        protected void gvListarMedicos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvListarMedicos.PageIndex = e.NewPageIndex;
            CargarGD();
        }

        protected void cargarFilltro()
        {
            ControladorEspecialidades ce = new ControladorEspecialidades();
            cargarDDL(ddlFiltroEspecialidad, ce.getTabla());
            ListItem lt = new ListItem("-Selecione una Especialidad-", "-1");
            ddlFiltroEspecialidad.Items.Insert(0, lt);
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            ControladorMedicos negMedicos = new ControladorMedicos();

            string id = ddlFiltroEspecialidad.SelectedItem.Text;


            CargarGD(negMedicos.getTablaFiltradaEspecialidad(id));
            ddlFiltroEspecialidad.SelectedValue = "-1";
        }

    }
}