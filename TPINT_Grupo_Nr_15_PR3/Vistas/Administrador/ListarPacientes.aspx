<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListarPacientes.aspx.cs" Inherits="Vistas.ListarPacientes" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style3 {
            height: 50px;
            }
        .auto-style8 {
            width: 60px;
        }
        .auto-style10 {
            height: 66px;
            }
        .auto-style11 {
            height: 66px;
            width: 60px;
        }
        .auto-style14 {
            height: 50px;
            width: 395px;
        }
        .auto-style15 {
            height: 66px;
            width: 395px;
        }
        .auto-style17 {
            width: 395px;
        }
        .auto-style18 {
            height: 11px;
        }
        .auto-style19 {
            width: 60px;
            height: 11px;
        }
        .auto-style20 {
            width: 395px;
            height: 11px;
        }
        .auto-style21 {
            height: 65px;
            }
        .auto-style22 {
            height: 65px;
            width: 60px;
        }
        .auto-style23 {
            height: 65px;
            width: 395px;
        }
    </style>
    <link rel="stylesheet" href="..\estilos.css" />
</head>
<body>
    <form id="form1" runat="server">
        <header>
           <asp:LinkButton class="links" ID="lbInicio" runat="server" PostBackUrl="~/Administrador/Inicio.aspx">CLINICA GRUPO 15</asp:LinkButton>
            <asp:HyperLink class="links" ID="hlAsignacionTurnos" runat="server" NavigateUrl="~/Administrador/AsignacionTurnos.aspx">Asignar Turno</asp:HyperLink>
           <asp:HyperLink class="links" ID="hlListarMedicos" runat="server" NavigateUrl="~/Administrador/ListarMedicos.aspx">Listar Medicos</asp:HyperLink>
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
           <table class="auto-style1">
            <tr>
                <td class="auto-style18"></td>
                <td class="auto-style19" colspan="3">&nbsp;</td>
                <td class="auto-style20">

                </td>
                <td class="auto-style20"></td>
            </tr>
            <tr>
                <td class="auto-style3" colspan="5"><h1>Administrar Pacientes</h1></td>
                <td class="auto-style14"></td>
            </tr>
            <tr>
                <td class="auto-style10">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                <td class="auto-style11">Dni Pacientes:&nbsp;&nbsp; <asp:TextBox ID="txtFiltrar" runat="server" Height="16px"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtFiltrar" ErrorMessage="El numero de Dni ingresado no es valido" ValidationExpression="^[1-9]\d*$" ValidationGroup="Grupo2">*</asp:RegularExpressionValidator>
                </td>
                <td class="auto-style11">
                    <asp:Button CssClass="btn" ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click" OnCommand="btnBuscar_Command" ValidationGroup="Grupo2" style="margin-left: 0" />
                &nbsp;</td>
                <td class="auto-style11">
                    <asp:Button CssClass="btn secundario" ID="btnAgregar" runat="server" Text="Agregar" OnClick="btnBuscar_Click" PostBackUrl="~/Administrador/CagarPacientes.aspx" />
                </td>
                <td class="auto-style15">
    &nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;
                    </td>
                <td class="auto-style15">
                    </td>
            </tr>
            <tr>
                <td class="auto-style10">&nbsp;</td>
                <td class="auto-style11" colspan="3">
                    <asp:Label ID="lblMensaje" runat="server"></asp:Label>
                </td>
                <td class="auto-style15">
                    &nbsp;</td>
                <td class="auto-style15">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style21">
                    &nbsp;</td>
                <td class="auto-style22" colspan="3">
                    <asp:GridView CssClass="grid"  ID="gvListarPacientes" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" OnRowCancelingEdit="gvListarPacientes_RowCancelingEdit" OnRowEditing="gvListarPacientes_RowEditing" OnRowUpdating="gvListarPacientes_RowUpdating" AllowPaging="True" PageSize="5" OnSelectedIndexChanged="gvListarPacientes_SelectedIndexChanged">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField HeaderText="DNI">
                                <EditItemTemplate>
                                    <asp:Label ID="lb_eit_Dni" runat="server"></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lb_it_DNI" runat="server" Text='<%# Bind("DniPaciente") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Nombre">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_eit_Nombre" runat="server"></asp:TextBox>
                                    &nbsp;<asp:RegularExpressionValidator ID="revNombre" runat="server" ControlToValidate="txt_eit_Nombre" ErrorMessage="Solo se permiten Caracteres" ValidationExpression="^[A-Za-zs]+$">*</asp:RegularExpressionValidator>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbl_it_Nombre" runat="server" Text='<%# Bind("NombrePaciente") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Apellido">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_eit_Apellido" runat="server"></asp:TextBox>
                                    &nbsp;<asp:RegularExpressionValidator ID="revApellido" runat="server" ControlToValidate="txt_eit_Apellido" ErrorMessage="Solo se permiten Caracteres" ValidationExpression="^[A-Za-zs]+$">*</asp:RegularExpressionValidator>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lb_it_Apellido" runat="server" Text='<%# Bind("ApellidoPaciente") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Direccion">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_eit_Direccion" runat="server"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lb_it_Direccion" runat="server" Text='<%# Bind("Direccion_Paciente") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Telefono">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_eit_telefono" runat="server"></asp:TextBox>
                                    &nbsp;<asp:RegularExpressionValidator ID="revNacionalidad" runat="server" ControlToValidate="txt_eit_Telefono" ErrorMessage="Solo se permiten Numeros" ValidationExpression="^\+?54?\s?(9\s?)?(\(?\d{2,4}\)?[\s.-]?)?[\d\s.-]{6,8}$
    ">*</asp:RegularExpressionValidator>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lb_it_Telefono" runat="server" Text='<%# Bind("Telefono_Paciente") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Fecha Nacimiento">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_eit_FechNac" runat="server" TextMode="Date"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lb_it_FechaNac" runat="server" Text='<%# Bind("FechaNacimiento") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Observaciones">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbObservaciones" runat="server" CommandArgument='<%# Eval("DniPaciente") %>' CommandName="comandoObservaiones" OnClick="lbObservaciones_Click" OnCommand="lbObservaciones_Command">Ver Observaciones</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="#7C6F57" />
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#E3EAEB" />
                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F8FAFA" />
                        <SortedAscendingHeaderStyle BackColor="#246B61" />
                        <SortedDescendingCellStyle BackColor="#D4DFE1" />
                        <SortedDescendingHeaderStyle BackColor="#15524A" />
                    </asp:GridView>
                </td>
                <td class="auto-style23">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" />
                </td>
                <td class="auto-style23"></td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td class="auto-style8" colspan="3">
                    <asp:ValidationSummary ID="ValidationSummary2" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="Grupo2" Width="404px" />
                </td>
                <td class="auto-style17">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </td>
                <td class="auto-style17">
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td class="auto-style8" colspan="3">
                    <asp:MultiView ID="MultiViewObservacion" runat="server">
                        <asp:View ID="View1" runat="server">
                            <table class="auto-style1">
                                <tr>
                                    <td>
                                        <asp:GridView ID="gvObservaciones" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" PageSize="5">
                                            <AlternatingRowStyle BackColor="White" />
                                            <Columns>
                                                <asp:TemplateField HeaderText="Fechas">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblFechas" runat="server" Text='<%# Bind("FechaTurno") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Observaciones">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblObservacion" runat="server" Text='<%# Bind("Observacion") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <EditRowStyle BackColor="#7C6F57" />
                                            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                            <RowStyle BackColor="#E3EAEB" />
                                            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                            <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                            <SortedAscendingHeaderStyle BackColor="#246B61" />
                                            <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                            <SortedDescendingHeaderStyle BackColor="#15524A" />
                                        </asp:GridView>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Button ID="btnOcultar" runat="server" Height="35px" OnClick="btnOcultar_Click" Text="Ocultar" Width="151px" />
                                    </td>
                                </tr>
                            </table>
                        </asp:View>
                    </asp:MultiView>
                </td>
                <td colspan="2">
                    <asp:HyperLink CssClass="btn secundario" ID="hlVolverInicio" runat="server" NavigateUrl="~/Administrador/Inicio.aspx">Volver a Inicio</asp:HyperLink>
                </td>
            </tr>
        </table>
        </div>
    </form>
</body>
</html>
