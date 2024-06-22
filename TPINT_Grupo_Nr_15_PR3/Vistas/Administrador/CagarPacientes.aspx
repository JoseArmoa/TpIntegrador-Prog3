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
            width: 199px;
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
            width: 199px;
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
            width: 199px;
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
            width: 199px;
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
            width: 465px;
        }
        .auto-style21 {
            width: 465px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="auto-style19">
            <tr>
                <td class="auto-style2">
                    <h1>Agregar Pacientes</h1>
                </td>
                <td class="auto-style5">&nbsp;</td>
                <td>
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
                </td>
                <td class="auto-style4"></td>
            </tr>
            <tr>
                <td class="auto-style14">Apellido :</td>
                <td class="auto-style15">
                    <asp:TextBox ID="txtApellidoPacientes" runat="server"></asp:TextBox>
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
                    <table class="auto-style10">
                        <tr>
                            <td>
                                <asp:TextBox ID="txtFechaNacimientoPaciente" runat="server" Height="19px"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </td>
                <td class="auto-style13"></td>
            </tr>
            <tr>
                <td class="auto-style3">Direccion :</td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtDireccionPacientes" runat="server"></asp:TextBox>
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
                    <asp:DropDownList ID="ddlProvinciaPacientes" runat="server">
                    </asp:DropDownList>
                    <table cellspacing="3" class="auto-style17">
                        <tr>
                            <td>
                                <asp:DropDownList ID="ddlLocalidad" runat="server" OnSelectedIndexChanged="ddlLocalidad_SelectedIndexChanged">
                                </asp:DropDownList>
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
                </td>
                <td class="auto-style4"></td>
            </tr>
            <tr>
                <td class="auto-style2">Telefono : </td>
                <td class="auto-style5">
                    <asp:TextBox ID="txtTelefonoPacientes" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <table class="auto-style1">
            <tr>
                <td class="auto-style20">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                <td class="auto-style7">
                    <asp:Button ID="btnAceptarPacientes" runat="server" OnClick="Button1_Click" Text="Aceptar" />
                </td>
            </tr>
            <tr>
                <td class="auto-style21">&nbsp;</td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:HyperLink ID="hlVolverInicio" runat="server" NavigateUrl="~/OpcionesPacientes.aspx">Volver a Inicio</asp:HyperLink>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
