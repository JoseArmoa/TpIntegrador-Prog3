<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditarUsuario.aspx.cs" Inherits="Vistas.Medico.EditarUsuario" %>

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
            width: 132px;
        }
        .auto-style3 {
            width: 132px;
            height: 23px;
            text-align: right;
        }
        .auto-style4 {
            height: 23px;
        }
        .auto-style5 {
            width: 132px;
            text-align: right;
        }
        .auto-style6 {
            width: 147px;
        }
        .auto-style7 {
            height: 23px;
            width: 147px;
        }
    </style>
     <link rel="stylesheet" href="..\estilos.css" />
</head>
<body>
    <form id="form1" runat="server">
        <header>
           <asp:LinkButton class="links" ID="lbInicio" runat="server" PostBackUrl="~/Medico/Inicio.aspx">CLINICA GRUPO 15</asp:LinkButton>
        </header>

        <div class="formulario">
            <div>
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style18">
                            <h1>Editar Usuario</h1>

                        </td>
                    </tr>
                </table>
            </div>
            <div>
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style6">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style5">Nombre Usuario:</td>
                        <td class="auto-style6">
                            <asp:TextBox ID="txtNombreUsuario" runat="server"></asp:TextBox>
                        </td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style3">Contraseña:</td>
                        <td class="auto-style7">
                            <asp:TextBox ID="txtContaseña" runat="server" TextMode="Password"></asp:TextBox>
                        </td>
                        <td class="auto-style4"></td>
                        <td class="auto-style4"></td>
                    </tr>
                    <tr>
                        <td class="auto-style2">Repetir Contraseña:</td>
                        <td class="auto-style6">
                            <asp:TextBox ID="txtRepetirContraseña" runat="server" TextMode="Password"></asp:TextBox>
                        </td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style6">
                            &nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style2"></td>
                        <td class="auto-style6">
                            <asp:Button CssClass="btn success" ID="btnGuardar" runat="server" Text="Guardar" OnClick="btnGuardar_Click" />
                         </td>
                        <td>
                            <asp:Button CssClass="btn dark" ID="btnCancelar" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <asp:Label ID="lblMensaje" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style6">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:LinkButton CssClass="btn secundario" ID="lbVolverInicio" runat="server" PostBackUrl="~/Medico/Inicio.aspx">Volver al Inicio</asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </form>
</body>
</html>
