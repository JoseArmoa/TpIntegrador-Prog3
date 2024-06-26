﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Vistas.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            Iniciar Sesión</div>
        <div>

            <table class="auto-style1">
                <tr>
                    <td>Usuario:</td>
                    <td>
                        <asp:TextBox ID="txtNombreUsuario" runat="server" ValidationGroup="Grupo1"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rvNombreUsuario" runat="server" ControlToValidate="txtNombreUsuario" ErrorMessage="Ingrese el nombre de usuario" ValidationGroup="Grupo1">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>Contraseña:</td>
                    <td>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" ValidationGroup="Grupo1"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rvPass" runat="server" ControlToValidate="txtPassword" ErrorMessage="Ingrese la contraseña" ValidationGroup="Grupo1">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:Label ID="lblMensaje" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td id="btnIniciarSesion" aria-disabled="True">&nbsp;</td>
                    <td id="btnIniciarSesion" aria-disabled="True">
                        <asp:Button ID="btnIniciarSesion" runat="server" Text="Iniciar Sesión" ValidationGroup="Grupo1" OnClick="btnIniciarSesion_Click" />
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="Grupo1" />
                    </td>
                </tr>
            </table>

        </div>
    </form>
</body>
</html>
