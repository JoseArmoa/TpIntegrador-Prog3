<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="Vistas.Medico.Inicio" %>

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
            width: 95%;
            margin-left: 1039px;
            margin-bottom: 0px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style2">
                <tr>
                    <td>
                        <table class="auto-style1">
                            <tr>
                                <td>
                        <asp:Button ID="btnUsuario" runat="server" OnClick="btnUsuario_Click" Text="Usuario" Width="123px" />
                                    <asp:Panel ID="PanelUsuario" runat="server" Width="244px" Visible="false">
                                        Usuario :
                                        <asp:Label ID="lblNombreUsuario" runat="server"></asp:Label>
                                        <br />
                                        <asp:HyperLink ID="hlCerrarSesion" runat="server" NavigateUrl="~/Login.aspx">CerrarSesion</asp:HyperLink>
                                        <br />
                                        <asp:HyperLink ID="hlModificarUsuario" runat="server" NavigateUrl="~/Medico/EditarUsuario.aspx">Editar Usuario</asp:HyperLink>
                                    </asp:Panel>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        <h1>INICIO</h1>
        <br />
        <br />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Medico/AministrarTurnos.aspx">Administrar Turnos</asp:HyperLink>
        <br />
        <br />
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Medico/EditarUsuario.aspx">Configurar Usuario</asp:HyperLink>
    </form>
</body>
</html>
