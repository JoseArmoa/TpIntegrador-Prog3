<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CargarMedico.aspx.cs" Inherits="Vistas.Administrador.CargarMedico" %>

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
            height: 33px;
        }
        .auto-style3 {
            width: 63%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td colspan="3">
                        <table class="auto-style3">
                            <tr>
                                <td>
                <asp:Button ID="ButtonbtnVerUsuario" runat="server" Text="Usuario" Height="25px" OnClick="ButtonbtnVerUsuario_Click" />
                                    <asp:Panel ID="PanelUsuario" runat="server" Visible="false">
                                        Usuario :
                                        <asp:Label ID="lblNombreUsuario" runat="server"></asp:Label>
                                        <br />
                                        <asp:HyperLink ID="hlCerrarSesion" runat="server" NavigateUrl="~/Login.aspx">Cerrar Sesion</asp:HyperLink>
                                        <br />
                                    </asp:Panel>
                                </td>
                            </tr>
                        </table>
                        <h1>Agregar Médico</h1>
                    </td>
                </tr>
                <tr>
                    <td>Nombre:</td>
                    <td>
                        <asp:TextBox ID="txtNombreMedico" runat="server"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>Apellido:</td>
                    <td>
                        <asp:TextBox ID="txtApellidoMedico" runat="server"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>DNI:</td>
                    <td>
                        <asp:TextBox ID="txtDniMedico" runat="server"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>Fecha de Nacimiento:</td>
                    <td>
                        <asp:TextBox ID="txtFNMedico" runat="server"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>Dirección:</td>
                    <td>
                        <asp:TextBox ID="txtDireccionMedico" runat="server"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>Provincia::</td>
                    <td>
                        <asp:DropDownList ID="ddlProvincias" runat="server">
                        </asp:DropDownList>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">Localidad:</td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddlLocalidades" runat="server">
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style2"></td>
                </tr>
                <tr>
                    <td>Nacionalidad:</td>
                    <td>
                        <asp:TextBox ID="txtNacionalidadMedico" runat="server"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>Sexo:</td>
                    <td>
                        <asp:TextBox ID="txtSexoMedico" runat="server"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>Teléfono:</td>
                    <td>
                        <asp:TextBox ID="txtTelefonoMedico" runat="server"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td>
                        <asp:TextBox ID="txtEmailMedico" runat="server"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>Especialidad:</td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server">
                        </asp:DropDownList>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>Usuario:</td>
                    <td>
                        <asp:TextBox ID="txtUsuarioMedico" runat="server"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td>
                        <asp:TextBox ID="txtPassMedico" runat="server"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:Button ID="btnAgregar" runat="server" Text="Agregar" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>Legajo asignado:</td>
                    <td>
                        <asp:Label ID="lblLegajo" runat="server"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>
                        <asp:HyperLink ID="hlVolverInicio" runat="server" NavigateUrl="~/Administrador/Inicio.aspx">Volver al Inicio</asp:HyperLink>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
