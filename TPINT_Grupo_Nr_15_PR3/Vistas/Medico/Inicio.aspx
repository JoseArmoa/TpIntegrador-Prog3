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
     <link rel="stylesheet" href="..\estilos.css" />
</head>
<body>
    <form id="form1" runat="server">
        <header>
           <asp:LinkButton class="links" ID="lbInicio" runat="server" PostBackUrl="~/Medico/Inicio.aspx">CLINICA GRUPO 15</asp:LinkButton>
            <div class="usuario">
                <asp:Button CssClass="btn user" ID="btnUsuario" runat="server" Height="25px" OnClick="btnUsuario_Click" Text="Usuario" />               
                <asp:Panel ID="PanelUsuario" runat="server" Height="55px" Visible="false" Width="244px">
                    <div class="nombreUsuario">
                        <span>Usuario: </span>
                        <asp:Label ID="lblNombreUsuario" runat="server"></asp:Label>
                    </div>   
                    <asp:HyperLink ID="hlCerrarSesion" runat="server" NavigateUrl="~/Login.aspx">Cerrar Sesion</asp:HyperLink> <br />
                    <asp:HyperLink ID="hlModificarUsuario" runat="server" NavigateUrl="~/Medico/EditarUsuario.aspx">Editar Usuario</asp:HyperLink>
                </asp:Panel>
            </div>
        </header>

        <div class="formulario">
            <h1>INICIO</h1>
            <br />
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Medico/AdministrarTurnos.aspx">Administrar Turnos</asp:HyperLink>
            <br />
            <br />
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Medico/EditarUsuario.aspx">Configurar Usuario</asp:HyperLink>
        </div>
    </form>
</body>
</html>
