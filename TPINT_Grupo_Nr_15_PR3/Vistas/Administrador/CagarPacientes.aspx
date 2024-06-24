<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CagarPacientes.aspx.cs" Inherits="Vistas.CagarPacientes" %>

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
        .auto-style8 {
            width: 36%;
            margin-left: 601px;
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
        .auto-style22 {
            width: 251%;
            height: 49px;
        }
        .auto-style23 {
            width: 269px;
        }
        .auto-style24 {
            width: 231px;
        }
        .auto-style25 {
            height: 46px;
        }
        .auto-style26 {
            width: 257px;
            height: 94px;
        }
        .auto-style27 {
            width: 265px;
            height: 94px;
        }
        .auto-style28 {
            height: 94px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="auto-style19">
            <tr>
                <td class="auto-style26">
                    <h1>Agregar Pacientes</h1>
                </td>
                <td class="auto-style27">
                    <table class="auto-style22">
                        <tr>
                            <td class="auto-style23">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                            <td class="auto-style24">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <table class="auto-style1">
                                    <tr>
                                        <td class="auto-style25">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:HyperLink ID="hlVolverInicio" runat="server" NavigateUrl="~/Administrador/Inicio.aspx">Volver a Inicio</asp:HyperLink>
                                        </td>
                                    </tr>
                                </table>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:HyperLink ID="hlListarPacientes" runat="server" NavigateUrl="~/Administrador/ListarPacientes.aspx">Listar Pacientes</asp:HyperLink>
                            </td>
                        </tr>
                    </table>
                </td>
                <td class="auto-style28">
                    <table class="auto-style8">
                        <tr>
                            <td class="auto-style7">
                                <asp:Button ID="ButtonbtnVerUsuario" runat="server" Height="25px" OnClick="ButtonbtnVerUsuario_Click" Text="Usuario" />
                                <asp:Panel ID="PanelUsuario" runat="server" Height="46px" Visible="false" Width="248px">
                                    Usuario :
                                    <asp:Label ID="lblNombreUsuario" runat="server"></asp:Label>
                                    <br />
                                    <asp:HyperLink ID="hlCerrarSesion" runat="server" NavigateUrl="~/Login.aspx">Cerrar Sesion</asp:HyperLink>
                                </asp:Panel>
                            </td>
                        </tr>
                    </table>
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
                    <asp:Button ID="btnAceptarPacientes" runat="server" OnClick="Button1_Click" Text="Aceptar" ValidationGroup="Grupo1" />
                </td>
            </tr>
            <tr>
                <td class="auto-style21">&nbsp;</td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </td>
            </tr>
        </table>
    </form>
</body>
</html>
