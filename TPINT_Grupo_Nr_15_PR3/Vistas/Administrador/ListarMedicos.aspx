﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListarMedicos.aspx.cs" Inherits="Vistas.Administrador.ListarMedicos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">

        .auto-style1 {
            width: 100%;
        }
        .auto-style4 {
            height: 45px;
        }
        .auto-style3 {
            height: 382px;
        }
        .auto-style2 {
            height: 31px;
        }
        </style>
    <link rel="stylesheet" href="..\estilos.css" />
</head>
<body>
    <form id="form1" runat="server">
       <header>
           <asp:LinkButton class="links" ID="lbInicio" runat="server" PostBackUrl="~/Administrador/Inicio.aspx">CLINICA GRUPO 15</asp:LinkButton>
            <asp:HyperLink class="links" ID="hlListarPacientes" runat="server" NavigateUrl="~/Administrador/ListarPacientes.aspx">Listar Pacientes</asp:HyperLink>
            <asp:HyperLink class="links" ID="hlInformes" runat="server" NavigateUrl="~/Administrador/Informes.aspx">Informes</asp:HyperLink>
            <asp:HyperLink class="links" ID="hlTurnos" runat="server" NavigateUrl="~/Administrador/VerTurnos.aspx">Listar Turnos</asp:HyperLink>
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
                    <td colspan="3">
                        <h1>Administrar Médicos</h1>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">Legajo: </td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtLegajo" runat="server" MaxLength="5" AutoPostBack="true" OnTextChanged="txtLegajo_TextChanged"></asp:TextBox>
                    &nbsp;
                        <asp:RequiredFieldValidator ID="rvLegajo" runat="server" ControlToValidate="txtLegajo" ErrorMessage="Ingrese un legajo" ValidationGroup="GrupoBuscar">*</asp:RequiredFieldValidator>
                    &nbsp;&nbsp;
                        <asp:Button class="btn" ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click" ValidationGroup="GrupoBuscar" />
                        &nbsp;&nbsp;&nbsp;
                        <asp:Button class="btn secundario" ID="btnAgregar" runat="server" PostBackUrl="~/Administrador/CargarMedico.aspx" Text="Agregar" />
                    </td>
                    <td class="auto-style4">
                        &nbsp;&nbsp;
                        &nbsp;
                        </td>
                </tr>
                <tr>
                    <td class="auto-style4">Especialidad:&nbsp;&nbsp; </td>
                    <td class="auto-style4">
                        <asp:DropDownList ID="ddlFiltroEspecialidad" runat="server" ValidationGroup="GrupoFiltro">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvFiltroEspecialidad" runat="server" ControlToValidate="ddlFiltroEspecialidad" ErrorMessage="Seleccione una Especialidad" InitialValue="-1" ValidationGroup="GrupoFiltro">*</asp:RequiredFieldValidator>
&nbsp;&nbsp;
                        <asp:Button CssClass="btn" ID="btnFiltrar" runat="server" OnClick="btnFiltrar_Click" Text="Filtrar" ValidationGroup="GrupoFiltro" />
                    </td>
                    <td class="auto-style4">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style4">
                        &nbsp;&nbsp;
                        <asp:Button class="btn" ID="btnMostrarTodos" runat="server" Text="Mostrar Todos" OnClick="btnMostrarTodos_Click" />
                        &nbsp;&nbsp;
                    </td>
                    <td class="auto-style4">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3"></td>
                    <td class="auto-style3" id="ddl_eit_Especialidad">
                        <asp:GridView CssClass="grid" ID="gvListarMedicos" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="10" GridLines="Vertical" PageSize="4" ShowHeaderWhenEmpty="True" OnRowDeleting="gvListarMedicos_RowDeleting" OnRowEditing="gvListarMedicos_RowEditing" OnRowDataBound="gvListarMedicos_RowDataBound" OnRowUpdating="gvListarMedicos_RowUpdating" OnRowCancelingEdit="gvListarMedicos_RowCancelingEdit" OnRowCommand="gvListarMedicos_RowCommand" OnPageIndexChanging="gvListarMedicos_PageIndexChanging">
                            <AlternatingRowStyle BackColor="#DCDCDC" />
                            <Columns>
                                <asp:TemplateField HeaderText="Acciones">
                                    <EditItemTemplate>
                                        <asp:LinkButton ID="lbActualizar" runat="server" CommandName="Update" ValidationGroup="Grupo1">Actualizar</asp:LinkButton>
                                        &nbsp;
                                        <asp:LinkButton ID="lbCancelar" runat="server" CommandName="Cancel">Cancelar</asp:LinkButton>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbEditar" runat="server" CommandName="Edit">Editar</asp:LinkButton>
                                    <br />
                                        <asp:LinkButton ID="lbEliminar" runat="server" CommandName="Delete" OnClientClick="return confirm('¿Estás seguro de que quieres eliminar este registro?');">Eliminar</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Legajo">
                                    <EditItemTemplate>
                                        <asp:Label ID="lbl_eit_Legajo" runat="server" Text='<%# Bind("Legajo") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_Legajo" runat="server" Text='<%# Bind("Legajo") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Nombre">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_eit_Nombre" runat="server" Text='<%# Bind("Nombre") %>'></asp:TextBox>
                                        &nbsp;<asp:RequiredFieldValidator ID="rfv_eit_Nombre" runat="server" ControlToValidate="txt_eit_Nombre" ErrorMessage="Debe ingresar un nombre de médico" ValidationGroup="Grupo1">*</asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="rev_eit_Nombre" runat="server" ControlToValidate="txt_eit_Nombre" ErrorMessage="El nombre sólo debe contener letras " ValidationExpression="^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$" ValidationGroup="Grupo1">*</asp:RegularExpressionValidator>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_Nombre" runat="server" Text='<%# Bind("Nombre") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Apellido">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_eit_Apellido" runat="server" Text='<%# Bind("Apellido") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfv_eit_Apellido" runat="server" ControlToValidate="txt_eit_Apellido" ErrorMessage="Debe ingresar el apellido del médico" ValidationGroup="Grupo1">*</asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="rev_eit_Apellido" runat="server" ControlToValidate="txt_eit_Apellido" ErrorMessage="El apellido sólo puede contener letras" ValidationExpression="^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$" ValidationGroup="Grupo1">*</asp:RegularExpressionValidator>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_Apellido" runat="server" Text='<%# Bind("Apellido") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Dni">
                                    <EditItemTemplate>
                                        <asp:Label ID="lbl_eit_Dni" runat="server" Text='<%# Bind("DNI") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_Dni" runat="server" Text='<%# Bind("DNI") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Especialidad">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="ddl_eit_Especialidad" runat="server">
                                        </asp:DropDownList>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_Especialidad" runat="server" Text='<%# Bind("Especialidad") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:ButtonField ButtonType="Button" CommandName="verHorarios" HeaderText="Horarios" Text="Ver Horarios" ShowHeader="True" />
                            </Columns>
                            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#0000A9" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#000065" />
                        </asp:GridView>
                    </td>
                    <td class="auto-style3">
                        <asp:ValidationSummary ID="vsEditarMedicos" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="Grupo1" />
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="GrupoBuscar" />
                        <asp:ValidationSummary ID="vsFiltro" runat="server" ValidationGroup="GrupoFiltro" ShowMessageBox="True" ShowSummary="False" />
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style2 nombreUsuario">
                        <asp:GridView CssClass="grid" ID="gvHorariosMedico" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" PageSize="6" ShowHeaderWhenEmpty="True" >
                            <AlternatingRowStyle BackColor="#DCDCDC" />
                            <Columns>
                                <asp:TemplateField HeaderText="Legajo">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_Legajo_HS" runat="server" Text='<%# Bind("Legajo") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Día">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_Dia_HS" runat="server" Text='<%# Bind("Dia") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Hora Entrada">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_Entrada_HS" runat="server" Text='<%# Bind("Ingreso") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Hora Salida">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_eit_Salida" runat="server" TextMode="Time" Text='<%# Bind("Salida") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_Salida_HS" runat="server" Text='<%# Bind("Salida") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#0000A9" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#000065" />
                        </asp:GridView>
                        <asp:Button CssClass="btn" ID="btnOcultarHorarios" runat="server" OnClick="btnOcultarHorarios_Click" Text="Ocultar Horarios" />
                    </td>
                    <td class="auto-style2">&nbsp;</td>
                </tr>
            </table>
        
            <table class="auto-style1">
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:HyperLink CssClass="btn secundario" ID="hlVolverInicio" runat="server" NavigateUrl="~/Administrador/Inicio.aspx">Volver al Inicio</asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
