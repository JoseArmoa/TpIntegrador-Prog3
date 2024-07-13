using System;
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

            if(!IsPostBack)
            {
                CargarGD();
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
            String legajo = ((Label)gvListarMedicos.Rows[e.RowIndex].FindControl("lbl_eit_Legajo")).Text;
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
                }

            }
        }

        protected void gvListarMedicos_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string Legajo = ((Label)gvListarMedicos.Rows[e.RowIndex].FindControl("lbl_eit_Legajo")).Text;
            string Nombre = ((TextBox)gvListarMedicos.Rows[e.RowIndex].FindControl("txt_eit_Nombre")).Text;
            string Apellido = ((TextBox)gvListarMedicos.Rows[e.RowIndex].FindControl("txt_eit_Apellido")).Text;
            string Dni = ((TextBox)gvListarMedicos.Rows[e.RowIndex].FindControl("txt_eit_Dni")).Text;
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
            }
        }

     /// ---------- MODIFICAR Y ELIMINAR HORARIOS MEDICOS -------
  
        //protected void gvHorariosMedico_RowDeleting(object sender, GridViewDeleteEventArgs e)
        //{
        //    String legajo = ((Label)gvHorariosMedico.Rows[e.RowIndex].FindControl("lbl_Legajo_HS")).Text;
        //    int dia = Convert.ToInt32( ((Label)gvHorariosMedico.Rows[e.RowIndex].FindControl("lbl_Dia_HS")).Text);

        //    HorarioMedico hm = new HorarioMedico();
        //    hm.LegajoMed = legajo;
        //    hm.DiaSemana = dia;

        //    ControladorHorario cHorario = new ControladorHorario();
        //    cHorario.EliminarHorario(ref hm);

        //    CargarHorario(legajo);
        //}

        //protected void gvHorariosMedico_RowEditing(object sender, GridViewEditEventArgs e)
        //{
        //    String legajo = ((Label)gvHorariosMedico.Rows[e.NewEditIndex].FindControl("lbl_Legajo_HS")).Text;
        //    gvHorariosMedico.EditIndex = e.NewEditIndex;        

        //    CargarHorario(legajo);
        //}

        //protected void gvHorariosMedico_RowDataBound(object sender, GridViewRowEventArgs e)
        //{
        //    if (e.Row.RowType == DataControlRowType.DataRow)
        //    {
        //        DropDownList ddl = (DropDownList)e.Row.FindControl("ddl_eit_Dias");
        //        if (ddl != null)
        //        {
        //            ControladorDia cd = new ControladorDia();
        //            cargarDDL(ddl, cd.getTabla());
        //        }

        //    }
        //}

        //protected void gvHorariosMedico_RowUpdating(object sender, GridViewUpdateEventArgs e)
        //{
        //    string Legajo = ((Label)gvHorariosMedico.Rows[e.RowIndex].FindControl("lbl_eit_Legajo")).Text;
        //    int Dia = Convert.ToInt32(((DropDownList)gvHorariosMedico.Rows[e.RowIndex].FindControl("ddl_eit_Dias")).SelectedItem.Value);
        //    TimeSpan Ingreso = TimeSpan.Parse( ((TextBox)gvHorariosMedico.Rows[e.RowIndex].FindControl("txt_eit_Entrada")).Text );
        //    TimeSpan Egreso = TimeSpan.Parse( ((TextBox)gvHorariosMedico.Rows[e.RowIndex].FindControl("txt_eit_Salida")).Text );

        //    HorarioMedico hm = new HorarioMedico();
        //    hm.LegajoMed = Legajo;
        //    hm.DiaSemana = Dia;
        //    hm.HoraEntrada = Ingreso;
        //    hm.HoraSalida = Egreso;

        //    ControladorHorario ch = new ControladorHorario();
        //    ch.ActualizarHorario(ref hm);

        //    gvHorariosMedico.EditIndex = -1;
        //    CargarHorario(Legajo);
        //}

        //protected void gvHorariosMedico_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        //{
        //    string Legajo = ((Label)gvHorariosMedico.Rows[e.RowIndex].FindControl("lbl_eit_Legajo")).Text;

        //    gvHorariosMedico.EditIndex = -1;
        //    CargarHorario(Legajo);
        //}

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            ControladorMedicos negMedicos = new ControladorMedicos();

            string legajo = txtLegajo.Text;

            CargarGD(negMedicos.getTablaMedico(legajo));
        }

        protected void btnMostrarTodos_Click(object sender, EventArgs e)
        {
            CargarGD();
        }
    }
}