<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CagarPacientes.aspx.cs" Inherits="Vistas.CagarPacientes" %>

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
            width: 176px;
        }
        .auto-style3 {
            width: 176px;
            height: 43px;
        }
        .auto-style4 {
            height: 43px;
        }
        .auto-style5 {
            width: 218px;
        }
        .auto-style6 {
            height: 43px;
            width: 218px;
        }
        .auto-style7 {
            height: 26px;
        }
        .auto-style8 {
            width: 36%;
            margin-left: 601px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="auto-style1">
            <tr>
                <td class="auto-style2"><h1>Agregar Pacientes</h1></td>
                <td class="auto-style5">&nbsp;</td>
                <td>
                    <table class="auto-style8">
                        <tr>
                            <td class="auto-style7">
                <asp:Button ID="ButtonbtnVerUsuario" runat="server" Text="Usuario" Height="25px" OnClick="ButtonbtnVerUsuario_Click" />
                                <asp:Panel ID="PanelUsuario" runat="server" Visible="false">
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
                <td class="auto-style3">Apellido :</td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtApellidoPacientes" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style4"></td>
            </tr>
            <tr>
                <td class="auto-style3">DNI :</td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtDNIPacientes" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style4"></td>
            </tr>
            <tr>
                <td class="auto-style3">Direccion :</td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtDireccionPacientes" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style4"></td>
            </tr>
            <tr>
                <td class="auto-style3">Localidad :</td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtLocalidadPacientes" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style4"></td>
            </tr>
            <tr>
                <td class="auto-style3"></td>
                <td class="auto-style6">
                    <asp:Button ID="Button1" runat="server" Text="Button" />
                </td>
                <td class="auto-style4"></td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
                <td>
                    <asp:HyperLink ID="hlVolverInicio" runat="server" NavigateUrl="~/OpcionesPacientes.aspx">Volver a Inicio</asp:HyperLink>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
