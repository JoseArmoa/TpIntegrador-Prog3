﻿using System;
using System.Collections.Generic;
using System.Data;
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

            if (!IsPostBack)
            {
                ControladorProvincia cp = new ControladorProvincia();
                cargarDDL(ddlProvincias, cp.getTabla());
                ListItem lt = new ListItem("-Selecione una Provincia-", "-1");
                ddlProvincias.Items.Insert(0, lt);
                lt = new ListItem("-Selecione una Localidad-", "-1");
                ddlLocalidades.Items.Add(lt);
                ControladorEspecialidades ce = new ControladorEspecialidades();
                cargarDDL(ddlEspecialidades, ce.getTabla());
                lt = new ListItem("-Selecione una Especialidad-", "-1");
                ddlEspecialidades.Items.Insert(0, lt);
            }
        }

        protected void ButtonbtnVerUsuario_Click(object sender, EventArgs e)
        {
            PanelUsuario.Visible = !PanelUsuario.Visible;
        }

        protected void btnAgregarDiayHorario_Click(object sender, EventArgs e)
        {
            HorarioMedico hm = new HorarioMedico();
            lblHorarioRepetido.Text = "";

            TimeSpan horaEntrada = TimeSpan.Parse(ddlHorario.SelectedValue.Trim().Split('a')[0]);
            TimeSpan horaSalida = TimeSpan.Parse(ddlHorario.SelectedValue.Trim().Split('a')[1]);
            int diaSemana = Convert.ToInt32(ddlDias.SelectedValue);

            // Verifica si el horario ya existe o se sobrepone con uno existente
            foreach (var horario in horarios)
            {
                if (horario.DiaSemana == diaSemana &&
                   (horario.HoraEntrada < horaSalida && horaEntrada < horario.HoraSalida))
                {
                    lblHorarioRepetido.Text = "El horario ya está agregado o se sobrepone con uno existente";
                    return;
                }
            }

            // Si no, agrega el horario
            hm.LegajoMed = txtLegajoMedico.Text;
            hm.DiaSemana = diaSemana;
            hm.HoraEntrada = horaEntrada;
            hm.HoraSalida = horaSalida;

            horarios.Add(hm);

            // Actualizar lblDiasyHorario
            if (lblDiasyHorario.Text == "")
            {
                lblDiasyHorario.Text = ddlDias.SelectedItem.Text + " " + ddlHorario.SelectedValue;
            }
            else
            {
                lblDiasyHorario.Text += "<br>" + ddlDias.SelectedItem.Text + " " + ddlHorario.SelectedValue;
            }

            // Resetear los DropdownLists
            ddlDias.SelectedIndex = 0;
            ddlHorario.SelectedIndex = 0;
        }

        protected void cargarDDL(DropDownList ddl, DataTable dt)
        {
            ddl.DataSource = dt;
            ddl.DataTextField = "Nombre";
            ddl.DataValueField = "Id";
            ddl.DataBind();
        }

        protected void ddlProvincias_SelectedIndexChanged(object sender, EventArgs e)
        {
            Provincias prov = new Provincias();
            prov.idProvincia = Convert.ToInt32(ddlProvincias.SelectedValue);
            if(ddlProvincias.SelectedValue != "-1")
            {
                ControladorLocalidad cl = new ControladorLocalidad();
                cargarDDL(ddlLocalidades, cl.ObtenerLocalidades(prov.idProvincia));
                ListItem lt = new ListItem("-Selecione una Localidad-", "-1");
                ddlLocalidades.Items.Insert(0, lt);
                ddlLocalidades.Enabled = true;
            }
            else
            {
                ddlLocalidades.SelectedIndex = 0;
                ddlLocalidades.Enabled = false;
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string mensaje = "";
                Medicos med = new Medicos();

                med.legajo = txtLegajoMedico.Text;
                med.dni = txtDniMedico.Text;
                med.apellido = txtApellidoMedico.Text;
                med.nombre = txtNombreMedico.Text;
                med.FechaNac = DateTime.Parse(txtFNMedico.Text);
                med.direccion = txtDireccionMedico.Text;
                med.IDespecialidad = Convert.ToInt32(ddlEspecialidades.SelectedValue);
                med.iDLocalidad = Convert.ToInt32(ddlLocalidades.SelectedValue);
                med.nacionalidad = txtNacionalidadMedico.Text;
                med.telefono = txtTelefonoMedico.Text;
                med.email = txtEmailMedico.Text;
                med.sexo = txtSexoMedico.Text;

                Usuarios usuarioMedico = new Usuarios();
                usuarioMedico.nombreUsuario = txtUsuarioMedico.Text;
                usuarioMedico.contraseña = txtPassMedico.Text;
                usuarioMedico.tipousuario = "Medico";

                ControladorUsuario cu = new ControladorUsuario();
                if (!cu.agregarUsuario(ref usuarioMedico, ref mensaje))
                {
                    lblMensajeUsuario.Text = mensaje;
                    return;
                }


                med.iDUsuario = cu.obtenerUsuario(usuarioMedico).iDUsuario;

                ControladorHorario ch = new ControladorHorario();
                ControladorMedicos cm = new ControladorMedicos();
                if (cm.AgregarMedico(ref med))
                {
                    cargarHorarios(ch);
                    lblMensajeAgregar.Text = "Registro agregado";

                    txtLegajoMedico.Text = "";
                    txtDniMedico.Text = "";
                    txtApellidoMedico.Text = "";
                    txtNombreMedico.Text = "";
                    txtFNMedico.Text = "";
                    txtDireccionMedico.Text = "";
                    ddlEspecialidades.SelectedIndex = 0;
                    ddlProvincias.SelectedIndex = 0;
                    ddlLocalidades.SelectedIndex = 0;
                    txtNacionalidadMedico.Text = "";
                    txtTelefonoMedico.Text = "";
                    txtEmailMedico.Text = "" ;
                    txtSexoMedico.Text = "";

                    txtUsuarioMedico.Text = "";
                    txtPassMedico.Text = "";

                    lblDiasyHorario.Text = "";

                    horarios = new List<HorarioMedico>();
                }
                else
                {
                    lblMensajeAgregar.Text = "No se pudo agregar registro";
                }
            }
        }

        void cargarHorarios(ControladorHorario ch)
        {
            foreach(HorarioMedico hm in horarios)
            {
                HorarioMedico horario = hm;
                ch.agregarHorario(ref horario);
            }
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if(lblDiasyHorario.Text != "")
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }
    }
}