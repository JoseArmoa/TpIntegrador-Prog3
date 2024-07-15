<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CargarMedico.aspx.cs" Inherits="Vistas.Administrador.CargarMedico" %>

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
        .auto-style14 {
            width: 359px;
            height: 39px;
        }
        .auto-style15 {
            height: 39px;
        }
    </style>
     <link rel="stylesheet" href="..\estilos.css" />
</head>
<body>
    <form id="form1" runat="server">
        <header>
           <asp:LinkButton class="links" ID="lbInicio" runat="server" PostBackUrl="~/Administrador/Inicio.aspx">CLINICA GRUPO 15</asp:LinkButton>
             <asp:HyperLink class="links" ID="HyperLink1" runat="server" NavigateUrl="~/Administrador/ListarPacientes.aspx">Listar Pacientes</asp:HyperLink>
            <asp:HyperLink class="links" ID="hlTurnos" runat="server" NavigateUrl="~/Administrador/VerTurnos.aspx">Listar Turnos</asp:HyperLink>
            <asp:HyperLink class="links" ID="hlInformes" runat="server" NavigateUrl="~/Administrador/Informes.aspx">Informes</asp:HyperLink>
            <div class="usuario">
                <asp:Button CssClass="btn user" ID="ButtonbtnVerUsuario" runat="server" Height="25px" OnClick="ButtonbtnVerUsuario_Click" Text="Usuario" />               
                <asp:Panel ID="PanelUsuario" runat="server" Height="46px" Visible="false" Width="248px">
                    <div class="nombreUsuario">
                        <span>Usuario: </span>
                        <asp:Label ID="lblNombreUsuario" runat="server"></asp:Label>
                    </div>   
                    <asp:HyperLink ID="hlCerrarSesion" runat="server" NavigateUrl="~/Login.aspx">Cerrar Sesion</asp:HyperLink>
                </asp:Panel>
            </div>
        </header>
        <div class="formulario">
            <table class="auto-style1">
                <tr>
                    <td colspan="3">
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
                        <asp:RegularExpressionValidator ID="revNombre" runat="server" ControlToValidate="txtNombreMedico" ErrorMessage="El nombre sólo puede contener letras" ValidationExpression="^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$" ValidationGroup="GrupoAgregarMedico">*</asp:RegularExpressionValidator>
                    </td>
                    <td class="auto-style13"></td>
                </tr>
                <tr>
                    <td class="auto-style12">Apellido:</td>
                    <td class="auto-style13">
                        <asp:TextBox ID="txtApellidoMedico" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rvApellido" runat="server" ControlToValidate="txtApellidoMedico" ErrorMessage="Ingrese un apellido" ValidationGroup="GrupoAgregarMedico">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revApellido" runat="server" ControlToValidate="txtApellidoMedico" ErrorMessage="El apellido sólo puede contener letras" ValidationExpression="^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$" ValidationGroup="GrupoAgregarMedico">*</asp:RegularExpressionValidator>
                    </td>
                    <td class="auto-style13"></td>
                </tr>
                <tr>
                    <td class="auto-style14">DNI:</td>
                    <td class="auto-style15">
                        <asp:TextBox ID="txtDniMedico" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rvDni" runat="server" ControlToValidate="txtDniMedico" ErrorMessage="Ingrese un dni" ValidationGroup="GrupoAgregarMedico">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revDni" runat="server" ControlToValidate="txtDniMedico" ErrorMessage="El DNI sólo puede contener números" ValidationExpression="^[1-9]\d*$" ValidationGroup="GrupoAgregarMedico">*</asp:RegularExpressionValidator>
                    </td>
                    <td class="auto-style15"></td>
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
                    <td class="auto-style14">Provincia:</td>
                    <td class="auto-style15">
                        <asp:DropDownList ID="ddlProvincias" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlProvincias_SelectedIndexChanged">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rvProvincia" runat="server" ControlToValidate="ddlProvincias" ErrorMessage="Seleccione una Provincia" InitialValue="-1" ValidationGroup="GrupoAgregarMedico">*</asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style15"></td>
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
                        <asp:RegularExpressionValidator ID="revNacionalidad" runat="server" ControlToValidate="txtNacionalidadMedico" ErrorMessage="La Nacionalidad sólo puede contener letras" ValidationExpression="^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$" ValidationGroup="GrupoAgregarMedico">*</asp:RegularExpressionValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">Sexo:</td>
                    <td>
                        <asp:TextBox ID="txtSexoMedico" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rvSexo" runat="server" ControlToValidate="txtSexoMedico" ErrorMessage="Ingrese el sexo" ValidationGroup="GrupoAgregarMedico">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revSexoMedico" runat="server" ControlToValidate="txtSexoMedico" ErrorMessage="Sexo sólo debe contener letras" ValidationExpression="^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$" ValidationGroup="GrupoAgregarMedico">*</asp:RegularExpressionValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style14">Teléfono:</td>
                    <td class="auto-style15">
                        <asp:TextBox ID="txtTelefonoMedico" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rvTelefono" runat="server" ControlToValidate="txtTelefonoMedico" ErrorMessage="Ingrese un telefono" ValidationGroup="GrupoAgregarMedico">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revTelefono" runat="server" ControlToValidate="txtTelefonoMedico" ErrorMessage="El Teléfono sólo debe contener números" ValidationExpression="^[1-9]\d*$" ValidationGroup="GrupoAgregarMedico">*</asp:RegularExpressionValidator>
                    </td>
                    <td class="auto-style15"></td>
                </tr>
                <tr>
                    <td class="auto-style4">Email:</td>
                    <td>
                        <asp:TextBox ID="txtEmailMedico" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rvEmail" runat="server" ControlToValidate="txtEmailMedico" ErrorMessage="Ingrese un email" ValidationGroup="GrupoAgregarMedico">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmailMedico" ErrorMessage="El Email ingresado no es válido" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="GrupoAgregarMedico">*</asp:RegularExpressionValidator>
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
                    <td class="auto-style4">Dia y Horiario de atencion:</td>
                    <td>
                        <asp:DropDownList ID="ddlDias" runat="server">
                        </asp:DropDownList>
&nbsp;
                        <asp:DropDownList ID="ddlHorario" runat="server">
                        </asp:DropDownList>
&nbsp;
                        <asp:Button CssClass="btn" ID="btnAgregarDiayHorario" runat="server" OnClick="btnAgregarDiayHorario_Click" Text="Agregar" ValidationGroup="GrupoAgregarHorario" />
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
                        <asp:Button CssClass="btn success" ID="btnAgregar" runat="server" Text="Agregar" OnClick="btnAgregar_Click" ValidationGroup="GrupoAgregarMedico" />
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
                    <td>
                        <asp:HyperLink CssClass="btn secundario" ID="hlVolverInicio" runat="server" NavigateUrl="~/Administrador/Inicio.aspx">Volver al Inicio</asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td>
                        <asp:ValidationSummary ID="ValidationSummary2" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="GrupoAgregarHorario" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
