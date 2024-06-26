﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CargarMedico.aspx.cs" Inherits="Vistas.Administrador.CargarMedico" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">

        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 33px;
        }
        .auto-style3 {
            width: 63%;
        }
        .auto-style4 {
            width: 359px;
        }
        .auto-style5 {
            height: 33px;
            width: 359px;
        }
        .auto-style8 {
            width: 359px;
            height: 30px;
        }
        .auto-style9 {
            height: 30px;
        }
        .auto-style10 {
            width: 359px;
            height: 22px;
        }
        .auto-style11 {
            height: 22px;
        }
        .auto-style12 {
            width: 359px;
            height: 26px;
        }
        .auto-style13 {
            height: 26px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td colspan="3">
                        <table class="auto-style3">
                            <tr>
                                <td>
                <asp:Button ID="ButtonbtnVerUsuario" runat="server" Text="Usuario" Height="25px" OnClick="ButtonbtnVerUsuario_Click" />
                                    <asp:Panel ID="PanelUsuario" runat="server" Visible="false">
                                        Usuario :
                                        <asp:Label ID="lblNombreUsuario" runat="server"></asp:Label>
                                        <br />
                                        <asp:HyperLink ID="hlCerrarSesion" runat="server" NavigateUrl="~/Login.aspx">Cerrar Sesion</asp:HyperLink>
                                        <br />
                                    </asp:Panel>
                                </td>
                            </tr>
                        </table>
                        <h1>Agregar Médico</h1>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style12">Legajo:</td>
                    <td class="auto-style13">
                        <asp:TextBox ID="txtLegajoMedico" runat="server" MaxLength="5"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rvLegajo" runat="server" ControlToValidate="txtLegajoMedico" ErrorMessage="Ingresa un legajo" ValidationGroup="GrupoAgregarMedico">*</asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style13">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style12">Nombre:</td>
                    <td class="auto-style13">
                        <asp:TextBox ID="txtNombreMedico" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rvNombre" runat="server" ControlToValidate="txtNombreMedico" ErrorMessage="Ingrese un nombre" ValidationGroup="GrupoAgregarMedico">*</asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style13"></td>
                </tr>
                <tr>
                    <td class="auto-style12">Apellido:</td>
                    <td class="auto-style13">
                        <asp:TextBox ID="txtApellidoMedico" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rvApellido" runat="server" ControlToValidate="txtApellidoMedico" ErrorMessage="Ingrese un apellido" ValidationGroup="GrupoAgregarMedico">*</asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style13"></td>
                </tr>
                <tr>
                    <td class="auto-style4">DNI:</td>
                    <td>
                        <asp:TextBox ID="txtDniMedico" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rvDni" runat="server" ControlToValidate="txtDniMedico" ErrorMessage="Ingrese un dni" ValidationGroup="GrupoAgregarMedico">*</asp:RequiredFieldValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">Fecha de Nacimiento:</td>
                    <td>
                        <asp:TextBox ID="txtFNMedico" runat="server" TextMode="Date"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rvFecha" runat="server" ControlToValidate="txtFNMedico" ErrorMessage="Ingrese una fecha" ValidationGroup="GrupoAgregarMedico">*</asp:RequiredFieldValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">Dirección:</td>
                    <td>
                        <asp:TextBox ID="txtDireccionMedico" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rvDireccion" runat="server" ControlToValidate="txtDireccionMedico" ErrorMessage="Ingrese una direccion" ValidationGroup="GrupoAgregarMedico">*</asp:RequiredFieldValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">Provincia:</td>
                    <td>
                        <asp:DropDownList ID="ddlProvincias" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlProvincias_SelectedIndexChanged">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rvProvincia" runat="server" ControlToValidate="ddlProvincias" ErrorMessage="Seleccione una Provincia" InitialValue="-1" ValidationGroup="GrupoAgregarMedico">*</asp:RequiredFieldValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style5">Localidad:</td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddlLocalidades" runat="server" Enabled="False">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rvLocalidad" runat="server" ControlToValidate="ddlLocalidades" ErrorMessage="Seleccione una localidad" InitialValue="-1" ValidationGroup="GrupoAgregarMedico">*</asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style2"></td>
                </tr>
                <tr>
                    <td class="auto-style4">Nacionalidad:</td>
                    <td>
                        <asp:TextBox ID="txtNacionalidadMedico" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rvNacionalidad" runat="server" ControlToValidate="txtNacionalidadMedico" ErrorMessage="Ingrese una nacionalidad" ValidationGroup="GrupoAgregarMedico">*</asp:RequiredFieldValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">Sexo:</td>
                    <td>
                        <asp:TextBox ID="txtSexoMedico" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rvSexo" runat="server" ControlToValidate="txtSexoMedico" ErrorMessage="Ingrese el sexo" ValidationGroup="GrupoAgregarMedico">*</asp:RequiredFieldValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">Teléfono:</td>
                    <td>
                        <asp:TextBox ID="txtTelefonoMedico" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rvTelefono" runat="server" ControlToValidate="txtTelefonoMedico" ErrorMessage="Ingrese un telefono" ValidationGroup="GrupoAgregarMedico">*</asp:RequiredFieldValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">Email:</td>
                    <td>
                        <asp:TextBox ID="txtEmailMedico" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rvEmail" runat="server" ControlToValidate="txtEmailMedico" ErrorMessage="Ingrese un email" ValidationGroup="GrupoAgregarMedico">*</asp:RequiredFieldValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">Especialidad:</td>
                    <td>
                        <asp:DropDownList ID="ddlEspecialidades" runat="server">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rvEspecialidades" runat="server" ControlToValidate="ddlEspecialidades" ErrorMessage="Seleccione una Especialidad" InitialValue="-1" ValidationGroup="GrupoAgregarMedico">*</asp:RequiredFieldValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">Usuario:</td>
                    <td>
                        <asp:TextBox ID="txtUsuarioMedico" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rvUsuario" runat="server" ControlToValidate="txtUsuarioMedico" ErrorMessage="Ingrese un nombre de ususario" ValidationGroup="GrupoAgregarMedico">*</asp:RequiredFieldValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">Password:</td>
                    <td>
                        <asp:TextBox ID="txtPassMedico" runat="server" TextMode="Password"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:RequiredFieldValidator ID="rvContraseña" runat="server" ControlToValidate="txtPassMedico" ErrorMessage="Ingresa una contraseña" ValidationGroup="GrupoAgregarMedico">*</asp:RequiredFieldValidator>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="lblMensajeUsuario" runat="server"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">Dia y Horiario de atencion:</td>
                    <td>
                        <asp:DropDownList ID="ddlDias" runat="server">
                            <asp:ListItem Value="0">-Seleccione un dia-</asp:ListItem>
                            <asp:ListItem Value="1">Lunes</asp:ListItem>
                            <asp:ListItem Value="2">Martes</asp:ListItem>
                            <asp:ListItem Value="3">Miercoles</asp:ListItem>
                            <asp:ListItem Value="4">Jueves</asp:ListItem>
                            <asp:ListItem Value="5">Viernes</asp:ListItem>
                            <asp:ListItem Value="6">Sabado</asp:ListItem>
                        </asp:DropDownList>
&nbsp;
                        <asp:DropDownList ID="ddlHorario" runat="server">
                            <asp:ListItem Value="0">-Seleccione un Turno</asp:ListItem>
                            <asp:ListItem Value="9:00 a 14:00">Mañana</asp:ListItem>
                            <asp:ListItem Value="14:00 a 19:00">Tarde</asp:ListItem>
                            <asp:ListItem Value="9:00 a 19:00">Completo</asp:ListItem>
                        </asp:DropDownList>
&nbsp;
                        <asp:Button ID="btnAgregarDiayHorario" runat="server" OnClick="btnAgregarDiayHorario_Click" Text="Agregar" ValidationGroup="GrupoAgregarHorario" />
                        <asp:RequiredFieldValidator ID="rvDias" runat="server" ControlToValidate="ddlDias" ErrorMessage="Seleccione un Dia" InitialValue="0" ValidationGroup="GrupoAgregarHorario">*</asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator ID="rvHorario" runat="server" ControlToValidate="ddlHorario" ErrorMessage="Seleccione un Turno" InitialValue="0" ValidationGroup="GrupoAgregarHorario">*</asp:RequiredFieldValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style10"></td>
                    <td class="auto-style11">
                        <asp:Label ID="lblDiasyHorario" runat="server"></asp:Label>
                    &nbsp;
                        <asp:CustomValidator ID="CustomValidator1" runat="server" OnServerValidate="CustomValidator1_ServerValidate" ValidationGroup="GrupoAgregarMedico">Agregue al menos 1 horario.</asp:CustomValidator>
&nbsp;
                        <asp:Label ID="lblHorarioRepetido" runat="server"></asp:Label>
                    </td>
                    <td class="auto-style11"></td>
                </tr>
                <tr>
                    <td class="auto-style8"></td>
                    <td class="auto-style9">
                        <asp:Button ID="btnAgregar" runat="server" Text="Agregar" OnClick="btnAgregar_Click" ValidationGroup="GrupoAgregarMedico" />
                    </td>
                    <td class="auto-style9"></td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:Label ID="lblMensajeAgregar" runat="server"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td>
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="GrupoAgregarMedico" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td>
                        <asp:ValidationSummary ID="ValidationSummary2" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="GrupoAgregarHorario" />
                    </td>
                    <td>
                        <asp:HyperLink ID="hlVolverInicio" runat="server" NavigateUrl="~/Administrador/Inicio.aspx">Volver al Inicio</asp:HyperLink>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
