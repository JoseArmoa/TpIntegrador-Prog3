<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AministrarTurnos.aspx.cs" Inherits="Vistas.Medico.AministrarTurnos" %>

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
            width: 49px;
        }
        .auto-style4 {
            width: 15px;
        }
        .auto-style6 {
            width: 15px;
            font-size: xx-large;
        }
        .auto-style11 {
            width: 209px;
        }
        .auto-style12 {
            width: 236px;
        }
        .auto-style13 {
            width: 322px;
        }
        .auto-style14 {
            width: 209px;
            height: 23px;
        }
        .auto-style15 {
            width: 236px;
            height: 23px;
        }
        .auto-style16 {
            width: 322px;
            height: 23px;
        }
        .auto-style17 {
            height: 23px;
        }
        .auto-style18 {
            width: 293px;
            text-align: center;
        }
        .auto-style19 {
            text-align: center;
            width: 716px;
        }
        .auto-style20 {
            width: 43px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <table class="auto-style1">
                <tr>
                    <td class="auto-style18">
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Medico/AministrarTurnos.aspx">Ver Turnos Asignados</asp:HyperLink>
                    </td>
                    <td class="auto-style19">
                        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Medico/EditarUsuario.aspx">Editar Usuario</asp:HyperLink>
                    </td>
                    <td class="auto-style20">&nbsp;</td>
                    <td>
                        <asp:Button ID="btnUsuario" runat="server" OnClick="btnUsuario_Click" Text="Usuario" Width="123px" />
                        <asp:Panel ID="panelUsuario" runat="server" Visible ="false">
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

        </div>
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style6"><strong>TURNOS</strong></td>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style3">DNI</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="Buscar" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <asp:GridView ID="gdHoy" runat="server" AutoGenerateColumns="False" Width="344px">
                <Columns>
                    <asp:TemplateField HeaderText="Fecha">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Fecha") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Hora">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Hora") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Nombre">
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("Nombre") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Apellido">
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("Apellido") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="DNI ">
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("DNI") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Asistio">
                        <EditItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="CheckBox2" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Acciones">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Cargar Observacion</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:Label ID="lblMensaje" runat="server"></asp:Label>
            <asp:MultiView ID="MultiView1" runat="server">
                <asp:View ID="View1" runat="server" OnActivate="Page_Load">
                    <table class="auto-style1">
                        <tr>
                            <td class="auto-style14">Nombre:
                                <asp:Label ID="lblNombre" runat="server"></asp:Label>
                            </td>
                            <td class="auto-style15">Apellido:
                                <asp:Label ID="lblApellido" runat="server"></asp:Label>
                            </td>
                            <td class="auto-style16">&nbsp;</td>
                            <td class="auto-style17"></td>
                        </tr>
                        <tr>
                            <td class="auto-style14">DNI:
                                <asp:Label ID="lblDni" runat="server"></asp:Label>
                            </td>
                            <td class="auto-style15">Fecha:
                                <asp:Label ID="lblFecha" runat="server"></asp:Label>
                            </td>
                            <td class="auto-style16"></td>
                            <td class="auto-style17"></td>
                        </tr>
                        <tr>
                            <td class="auto-style11">Observacion: </td>
                            <td class="auto-style12">&nbsp;</td>
                            <td class="auto-style13">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style11">
                                <asp:TextBox ID="TextBox2" runat="server" Height="138px" Width="216px"></asp:TextBox>
                            </td>
                            <td class="auto-style12">&nbsp;</td>
                            <td class="auto-style13">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style11">&nbsp;</td>
                            <td class="auto-style12">
                                <asp:Button ID="btnGuardar" runat="server" OnClick="btnGuardar_Click" Text="Guardar" />
                                &nbsp;
                                <asp:Button ID="btnCancelar" runat="server" OnClick="btnCancelar_Click" Text="Cancelar" />
                            </td>
                            <td class="auto-style13">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </asp:View>
            </asp:MultiView>
            <br />
            <br />
            <br />
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
    </form>
</body>
</html>
