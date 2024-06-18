<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VerTurnos.aspx.cs" Inherits="Vistas.VerTurnos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 27%;
            height: 28px;
            margin-left: 967px;
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
                            Usuario :&nbsp;
                            <asp:Label ID="lblNombreUsuario" runat="server"></asp:Label>
                            <br />
                            <asp:HyperLink ID="hlCerrarSesion" runat="server" NavigateUrl="~/Login.aspx">Cerrar Sesion</asp:HyperLink>
                        </asp:Panel>
                    </td>
                </tr>
            </table>
            <h1>Turnos</h1>
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:TemplateField HeaderText="Acciones">
                        <ItemTemplate>
                            <asp:CheckBox ID="cbPresente" runat="server" Text="Asistencia" />
                            &nbsp;
                            <asp:LinkButton ID="LinkButton2" runat="server">Cargar Observacion</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Fecha"></asp:TemplateField>
                    <asp:TemplateField HeaderText="DNI "></asp:TemplateField>
                    <asp:TemplateField HeaderText="Nombre"></asp:TemplateField>
                    <asp:TemplateField HeaderText="Especialidad"></asp:TemplateField>
                </Columns>
            </asp:GridView>
            <br />
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:HyperLink ID="hlVolverInicio" runat="server" NavigateUrl="~/OpcionesTurno.aspx">Volver a Inicio</asp:HyperLink>
        </div>
    </form>
</body>
</html>
