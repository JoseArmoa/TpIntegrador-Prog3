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
    <link rel="stylesheet" href="..\estilos.css" />
</head>
<body>
    <form id="form1" runat="server">
       <header>
           <asp:LinkButton class="links" ID="lbInicio" runat="server" PostBackUrl="~/Administrador/Inicio.aspx">CLINICA GRUPO 15</asp:LinkButton>
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
            <br />
            <h1>Menu Administrador:</h1>
            <br />
            <p> 
                <asp:HyperLink ID="HLTurnos" runat="server" NavigateUrl="~/Administrador/VerTurnos.aspx">TURNOS</asp:HyperLink>
            </p>
            <br />
            <p>
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Administrador/Informes.aspx">INFORMES</asp:HyperLink>
            </p>
            <br />
            <p>
                <asp:HyperLink ID="hlPacientes" runat="server" NavigateUrl="~/Administrador/CargarPacientes.aspx">PACIENTES</asp:HyperLink>
            </p>
            <br />
            <p>
                <asp:HyperLink ID="hlMedicos" runat="server" NavigateUrl="~/Administrador/ListarMedicos.aspx">MEDICOS</asp:HyperLink>
            </p>
            <p>&nbsp;</p>

        </div>
    </form>
</body>
</html>
