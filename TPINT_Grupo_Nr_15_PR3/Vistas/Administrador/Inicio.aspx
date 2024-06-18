<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="Vistas.Inicio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 19%;
            margin-left: 1065px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td>
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
            <h1>Menu Administrador:</h1>
            <p> </p>
            <p> 
                <asp:HyperLink ID="HLTurnos" runat="server" NavigateUrl="~/OpcionesTurno.aspx">TURNOS</asp:HyperLink>
            </p>
            <p>
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Administrador/Informes.aspx">INFORMES</asp:HyperLink>
            </p>
            <p>
                <asp:HyperLink ID="hlPacientes" runat="server" NavigateUrl="~/ListarPacientes.aspx">PACIENTES</asp:HyperLink>
            </p>
            <p>
                <asp:HyperLink ID="hlMedicos" runat="server" NavigateUrl="~/Administrador/ListarMedicos.aspx">MEDICOS</asp:HyperLink>
            </p>
            <p>&nbsp;</p>

        </div>
        <div>
            <h1>Clínica Médica Salud</h1>
        </div>
    </form>
</body>
</html>
