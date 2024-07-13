<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CargarPacientes.aspx.cs" Inherits="Vistas.CagarPacientes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">

        .auto-style19 {
            width: 100%;
            height: 455px;
        }
        .auto-style2 {
            width: 257px;
        }
        .auto-style5 {
            width: 265px;
        }
        .auto-style7 {
            height: 26px;
        }
        .auto-style3 {
            width: 257px;
            height: 43px;
        }
        .auto-style6 {
            height: 43px;
            width: 265px;
        }
        .auto-style4 {
            height: 43px;
        }
        .auto-style14 {
            width: 257px;
            height: 45px;
        }
        .auto-style15 {
            height: 45px;
            width: 265px;
        }
        .auto-style16 {
            height: 45px;
        }
        .auto-style11 {
            width: 257px;
            height: 61px;
        }
        .auto-style1 {
            width: 100%;
        }
        .auto-style9 {
            height: 41px;
        }
        .auto-style12 {
            height: 61px;
            width: 265px;
        }
        .auto-style10 {
            width: 100%;
            height: 34px;
        }
        .auto-style13 {
            height: 61px;
        }
        .auto-style18 {
            width: 100%;
            height: 31px;
            margin-top: 12px;
        }
        .auto-style17 {
            width: 100%;
            height: 38px;
        }
        .auto-style20 {
            height: 26px;
            width: 531px;
        }
        .auto-style21 {
            width: 531px;
        }
        .auto-style28 {
            height: 94px;
        }
    </style>
    <link rel="stylesheet" href="..\estilos.css" />
</head>
<body>
    <form id="form1" runat="server">
       <header>
           <asp:LinkButton class="links" ID="lbInicio" runat="server" PostBackUrl="~/Administrador/Inicio.aspx">CLINICA GRUPO 15</asp:LinkButton>
            <asp:HyperLink class="links" ID="hlAsignacionTurnos" runat="server" NavigateUrl="~/Administrador/AsignacionTurnos.aspx">Asignar Turno</asp:HyperLink>
           <asp:HyperLink class="links" ID="hlListarPacientes" runat="server" NavigateUrl="~/Administrador/ListarPacientes.aspx">Listar Pacientes</asp:HyperLink>
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
        <div  class="formulario">
            <table class="auto-style19">
                <tr>
                    <td class="auto-style28" colspan="3">
                        <h1>Agregar Pacientes</h1>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">Nombre : </td>
                    <td class="auto-style6">
                        <asp:TextBox ID="txtNombrePacientes" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNombrePacientes" ErrorMessage="El Paciente debe ingresar su Nombre" ValidationGroup="Grupo1">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtNombrePacientes" ErrorMessage="El Nombre ingresado no es valido" ValidationExpression="^[A-Za-z]+$" ValidationGroup="Grupo1">*</asp:RegularExpressionValidator>
                    </td>
                    <td class="auto-style4"></td>
                </tr>
                <tr>
                    <td class="auto-style14">Apellido :</td>
                    <td class="auto-style15">
                        <asp:TextBox ID="txtApellidoPacientes" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtApellidoPacientes" ErrorMessage="El Paciente debe ingresar su Apellido" ValidationGroup="Grupo1">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtApellidoPacientes" ErrorMessage="El Apellido ingresado no es valido" ValidationExpression="^[A-Za-z]+$" ValidationGroup="Grupo1">*</asp:RegularExpressionValidator>
                    </td>
                    <td class="auto-style16"></td>
                </tr>
                <tr>
                    <td class="auto-style11">DNI :<table class="auto-style1">
                        <tr>
                            <td class="auto-style9">Fecha de Nacimiento :</td>
                        </tr>
                        </table>
                    </td>
                    <td class="auto-style12">
                        <asp:TextBox ID="txtDNIPacientes" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtDNIPacientes" ErrorMessage="El Paciente debe ingresar su Dni" ValidationGroup="Grupo1">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtDNIPacientes" ErrorMessage="El numero de Dni  ingresado no es valido" ValidationExpression="^[1-9]\d*$" ValidationGroup="Grupo1">*</asp:RegularExpressionValidator>
                        <asp:RangeValidator ID="rvDniPacientes" runat="server" ControlToValidate="txtDNIPacientes" ErrorMessage="El numero de DNI no es valido" MaximumValue="999999999" MinimumValue="100000000" Type="Integer" ValidationGroup="Grupo1">*</asp:RangeValidator>
                        <table class="auto-style10">
                            <tr>
                                <td>
                                    <asp:TextBox ID="txtFechaNacimientoPaciente" runat="server" Height="19px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtFechaNacimientoPaciente" ErrorMessage="El Paciente debe ingresar su Fecha de Nacimiento" ValidationGroup="Grupo1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td class="auto-style13">
                        <asp:ValidationSummary ID="ValidationSummary3" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="Grupo1" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">Sexo:</td>
                    <td class="auto-style6">
                        <asp:TextBox ID="txtSexoPaciente" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="revSexoPaciente" runat="server" ControlToValidate="txtSexoPaciente" ErrorMessage="El sexo ingresado no es valido" ValidationExpression="^[A-Za-z]+$" ValidationGroup="Grupo1">*</asp:RegularExpressionValidator>
                    </td>
                    <td class="auto-style4">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">Nacionalidad:</td>
                    <td class="auto-style6">
                        <asp:TextBox ID="txtNacionalidadPaciente" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="revNacionalidadPaciente" runat="server" ControlToValidate="txtNacionalidadPaciente" ErrorMessage="Nacionalidad no valida" ValidationExpression="^[A-Za-z]+$" ValidationGroup="Grupo1">*</asp:RegularExpressionValidator>
                    </td>
                    <td class="auto-style4">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">Direccion :</td>
                    <td class="auto-style6">
                        <asp:TextBox ID="txtDireccionPacientes" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="txtDireccionPacientes" ErrorMessage="Direccion ingresada invalida solo se permiten letras y numeros" ValidationExpression="^[A-Za-z0-9\s]+$" ValidationGroup="Grupo1">*</asp:RegularExpressionValidator>
                    </td>
                    <td class="auto-style4"></td>
                </tr>
                <tr>
                    <td class="auto-style3">Provincia:<table cellspacing="3" class="auto-style18">
                        <tr>
                            <td>Localidad :</td>
                        </tr>
                        </table>
                    </td>
                    <td class="auto-style6">
                        <asp:DropDownList ID="ddlProvinciaPacientes" runat="server" OnSelectedIndexChanged="ddlProvinciaPacientes_SelectedIndexChanged" AutoPostBack="True">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddlProvinciaPacientes" ErrorMessage="El Paciente debe ingresar su Provincia" ValidationGroup="Grupo1">*</asp:RequiredFieldValidator>
                        <table cellspacing="3" class="auto-style17">
                            <tr>
                                <td>
                                    <asp:DropDownList ID="ddlLocalidad" runat="server">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlLocalidad" ErrorMessage="El Paciente debe ingresar su Localidad" ValidationGroup="Grupo1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td class="auto-style4">
                        <asp:Label ID="lblMensaje" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">Email : </td>
                    <td class="auto-style6">
                        <asp:TextBox ID="txtEmailPacientes" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="revCorreo0" runat="server" ControlToValidate="txtEmailPacientes" ErrorMessage="Los caracteres ingresados en el Email del Paciente son Incorrectos" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="Grupo1">*</asp:RegularExpressionValidator>
                    </td>
                    <td class="auto-style4"></td>
                </tr>
                <tr>
                    <td class="auto-style2">Telefono : </td>
                    <td class="auto-style5">
                        <asp:TextBox ID="txtTelefonoPacientes" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtTelefonoPacientes" ErrorMessage="El numero de Telefono ingresado no es valido" ValidationExpression="^[1-9]\d*$" ValidationGroup="Grupo1">*</asp:RegularExpressionValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style20">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                    <td class="auto-style7">
                        <asp:Button class="btn success" ID="btnAceptarPacientes" runat="server" OnClick="Button1_Click" Text="Aceptar" ValidationGroup="Grupo1" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style21">&nbsp;</td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </td>
                </tr>
            </table>            
        </div>
    </form>
</body>
</html>
