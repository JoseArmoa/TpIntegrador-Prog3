﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListarPacientes.aspx.cs" Inherits="Vistas.ListarPacientes" %>

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
            width: 289px;
        }
        .auto-style4 {
            width: 289px;
        }
        .auto-style5 {
            width: 289px;
            height: 31px;
        }
        .auto-style7 {
            height: 50px;
            width: 60px;
        }
        .auto-style8 {
            width: 60px;
        }
        .auto-style9 {
            width: 60px;
            height: 31px;
        }
        .auto-style10 {
            height: 66px;
            width: 289px;
        }
        .auto-style11 {
            height: 66px;
            width: 60px;
        }
        .auto-style13 {
            margin-top: 0px;
        }
        .auto-style14 {
            height: 50px;
            width: 395px;
        }
        .auto-style15 {
            height: 66px;
            width: 395px;
        }
        .auto-style16 {
            width: 395px;
            height: 31px;
        }
        .auto-style17 {
            width: 395px;
        }
        .auto-style18 {
            width: 289px;
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
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <table class="auto-style1">
        <tr>
            <td class="auto-style18"></td>
            <td class="auto-style19"></td>
            <td class="auto-style20">
                <asp:Button ID="ButtonbtnVerUsuario" runat="server" Text="Usuario" Height="25px" OnClick="ButtonbtnVerUsuario_Click" />
                <asp:Panel ID="panelUsuario" runat="server" CssClass="auto-style13" Height="42px" Visible="False" Width="256px">
                    Usuario :
                    <asp:Label ID="lblNombreUsuario" runat="server"></asp:Label>
                    <br />
                    <asp:HyperLink ID="hlCerrarSesion" runat="server" NavigateUrl="~/Login.aspx">Cerrar Sesion</asp:HyperLink>
                    <br />
                    <br />
                </asp:Panel>
            </td>
            <td class="auto-style20"></td>
        </tr>
        <tr>
            <td class="auto-style3"><h1>Administrar Pacientes</h1></td>
            <td class="auto-style7">&nbsp;</td>
            <td class="auto-style14"></td>
            <td class="auto-style14">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style10">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
            <td class="auto-style11">Dni Pacientes:&nbsp;&nbsp; <asp:TextBox ID="txtFiltrar" runat="server" Height="16px"></asp:TextBox>
            </td>
            <td class="auto-style15">
&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click" OnCommand="btnBuscar_Command" />
            &nbsp;&nbsp;
                <asp:Button ID="btnAgregar" runat="server" Text="Agregar" OnClick="btnBuscar_Click" PostBackUrl="~/Administrador/CagarPacientes.aspx" />
            </td>
            <td class="auto-style15">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style5">
                <asp:Label ID="lblMensaje" runat="server"></asp:Label>
            </td>
            <td class="auto-style9">
                <asp:GridView ID="gvListarPacientes" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="Acciones">
                            <EditItemTemplate>
                                <asp:LinkButton ID="lbActualizar" runat="server" CommandName="Update">Actualizar</asp:LinkButton>
                                &nbsp;
                                <asp:LinkButton ID="lbCancelar" runat="server" CommandName="Cancel">Cancelar</asp:LinkButton>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="lbEditar" runat="server" CommandName="Edit">Editar</asp:LinkButton>
                                &nbsp;
                                <asp:LinkButton ID="lbEliminar" runat="server" CommandName="Delete">Eliminar</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
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
                                <asp:TextBox ID="txt_eit_Sexo" runat="server"></asp:TextBox>
                                &nbsp;<asp:RegularExpressionValidator ID="revSexo" runat="server" ControlToValidate="txt_eit_Sexo" ErrorMessage="Solo se permiten Caracteres" ValidationExpression="^[A-Za-zs]+$">*</asp:RegularExpressionValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lb_it_Direccion" runat="server" Text='<%# Bind("Direccion_Paciente") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Telefono">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_eit_Nacionalidad" runat="server"></asp:TextBox>
                                &nbsp;<asp:RegularExpressionValidator ID="revNacionalidad" runat="server" ControlToValidate="txt_eit_Nacionalidad" ErrorMessage="Solo se permiten Caracteres" ValidationExpression="^[A-Za-zs]+$">*</asp:RegularExpressionValidator>
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
                                <asp:LinkButton ID="lbObservaciones" runat="server">Ver Observaciones</asp:LinkButton>
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
            <td class="auto-style16">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" />
            </td>
            <td class="auto-style16">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style8">&nbsp;</td>
            <td class="auto-style17">
                <asp:HyperLink ID="hlVolverInicio" runat="server" NavigateUrl="~/Administrador/Inicio.aspx">Volver a Inicio</asp:HyperLink>
            </td>
            <td class="auto-style17">
                &nbsp;</td>
        </tr>
    </table>
    </form>
</body>
</html>
