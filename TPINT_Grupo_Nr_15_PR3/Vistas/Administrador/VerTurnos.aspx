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
    <link rel="stylesheet" href="..\estilos.css" />
</head>
<body>
    <form id="form1" runat="server">
        <header>
           <asp:LinkButton class="links" ID="lbInicio" runat="server" PostBackUrl="~/Administrador/Inicio.aspx">CLINICA GRUPO 15</asp:LinkButton>
            <asp:HyperLink class="links" ID="hlListarMedicos" runat="server" NavigateUrl="~/Administrador/ListarMedicos.aspx">Listar Medicos</asp:HyperLink>
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

        <div class="formulario">
            <h1>Turnos</h1>
            <br />
            <br />
            <asp:GridView CssClass="grid" ID="GridView1" runat="server" AutoGenerateColumns="False">
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
            <asp:HyperLink CssClass="btn secundario" ID="hlVolverInicio" runat="server" NavigateUrl="~/Administrador/Inicio.aspx">Volver a Inicio</asp:HyperLink>
        </div>
    </form>
</body>
</html>
