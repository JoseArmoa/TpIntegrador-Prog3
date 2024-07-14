<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdministrarTurnos.aspx.cs" Inherits="Vistas.Medico.AministrarTurnos" %>

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
            <div>
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style6"><strong>TURNOS</strong></td>
                        <td class="auto-style3">&nbsp;</td>
                        <td class="auto-style2">&nbsp;</td>
                        <td>
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="Grupo1" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style4">&nbsp;</td>
                        <td class="auto-style3">DNI</td>
                        <td class="auto-style2">
                            <asp:TextBox ID="txtFiltarTurnos" runat="server"></asp:TextBox>
                        </td>
                        <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtFiltarTurnos" ErrorMessage="El numero de Dni ingresado no es valido" ValidationExpression="^[1-9]\d*$" ValidationGroup="Grupo1">*</asp:RegularExpressionValidator>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button CssClass="btn" ID="Button1" runat="server" Text="Buscar" OnClick="Button1_Click" OnCommand="Button1_Command" ValidationGroup="Grupo1" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="lblmensajes" runat="server"></asp:Label>
                        </td> 
                        <td>&nbsp;</td>
                    </tr>
                </table>
                <asp:GridView CssClass="grid" ID="gvTurnos" runat="server" AutoGenerateColumns="False" Width="344px" AllowPaging="True" PageSize="5">
                    <Columns>
                        <asp:TemplateField HeaderText="ID Turnos">
                            <ItemTemplate>
                                <asp:Label ID="lblIdTurnos" runat="server" Text='<%# Bind("[Id Turnos]") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Fecha">
                            <ItemTemplate>
                                <asp:Label ID="lblFecha" runat="server" Text='<%# Bind("Fecha") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Hora">
                            <ItemTemplate>
                                <asp:Label ID="lblHora" runat="server" Text='<%# Bind("Hora") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Nombre">
                            <ItemTemplate>
                                <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("Nombre") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Apellido">
                            <ItemTemplate>
                                <asp:Label ID="lblApellido" runat="server" Text='<%# Bind("Apellido") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="DNI ">
                            <ItemTemplate>
                                <asp:Label ID="lblDNI" runat="server" Text='<%# Bind("DNI") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Asistio">
                            <EditItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Bind("Asistio") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Acciones">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" CommandArgument='<%# Eval("[Id Turnos]")+"-"+Eval("Nombre")+"-"+Eval("Apellido")+"-"+Eval("DNI")+"-"+Eval("Fecha") %>' CommandName="comandoSeleccionar" OnCommand="LinkButton1_Command">Cargar Observacion</asp:LinkButton>
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
                                <td class="auto-style12">Id Turno:
                                    <asp:Label ID="lblIdTurno" runat="server"></asp:Label>
                                </td>
                                <td class="auto-style13">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style11">
                                    <asp:TextBox ID="txtObservacion" runat="server" Height="138px" Width="216px"></asp:TextBox>
                                </td>
                                <td class="auto-style12">&nbsp;</td>
                                <td class="auto-style13">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style11">&nbsp;</td>
                                <td class="auto-style12">
                                    <asp:Button CssClass="btn success" ID="btnGuardar" runat="server" OnClick="btnGuardar_Click" Text="Guardar" />
                                    &nbsp;
                                    <asp:Button CssClass="btn secundario" ID="btnCancelar" runat="server" OnClick="btnCancelar_Click" Text="Cancelar" />
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
        </div>
    </form>
</body>
</html>
