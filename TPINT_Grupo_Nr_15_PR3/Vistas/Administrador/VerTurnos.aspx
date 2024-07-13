<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VerTurnos.aspx.cs" Inherits="Vistas.VerTurnos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style2 {
            width: 100%;
        }
        .auto-style4 {
            width: 319px;
        }
        .auto-style5 {
            width: 620px;
            height: 26px;
        }
        .auto-style6 {
            width: 319px;
            height: 26px;
        }
        .auto-style7 {
            height: 26px;
        }
        .auto-style9 {
            width: 620px;
            height: 49px;
        }
        .auto-style10 {
            width: 319px;
            height: 49px;
        }
        .auto-style11 {
            height: 49px;
        }
        .auto-style13 {
            width: 620px;
        }
    </style>
    <link rel="stylesheet" href="..\estilos.css" />
</head>
<body>
    <form id="form1" runat="server">
        <header>
           <asp:LinkButton class="links" ID="lbInicio" runat="server" PostBackUrl="~/Administrador/Inicio.aspx">CLINICA GRUPO 15</asp:LinkButton>
            <asp:HyperLink class="links" ID="hlListarMedicos" runat="server" NavigateUrl="~/Administrador/ListarMedicos.aspx">Listar Medicos</asp:HyperLink>
            <asp:HyperLink class="links" ID="hlListarPacientes" runat="server" NavigateUrl="~/Administrador/ListarPacientes.aspx">Listar Pacientes</asp:HyperLink>
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
            <h1>Turnos</h1>
            <br />
            <br />
            <asp:GridView CssClass="grid" ID="gvTurnos" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:TemplateField HeaderText="Acciones">
                        <ItemTemplate>
                            <asp:CheckBox ID="cbPresente" runat="server" Text="Asistencia" Checked='<%# Bind("Asistio") %>' />
                            &nbsp;
                            <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("NombrePaciente") + "-" + Eval("DniPaciente_TA") %>' CommandName="comandoTurnos" OnClick="LinkButton2_Click" OnCommand="LinkButton2_Command">Ver Observacion</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Fecha">
                        <ItemTemplate>
                            <asp:Label ID="lblFecha" runat="server" Text='<%# Bind("FechaTurno") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="DNI ">
                        <ItemTemplate>
                            <asp:Label ID="lblDNI" runat="server" Text='<%# Bind("DniPaciente_TA") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Nombre">
                        <ItemTemplate>
                            <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("NombrePaciente") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Especialidad">
                        <ItemTemplate>
                            <asp:Label ID="lblEspecialidad" runat="server" Text='<%# Bind("NombreEspecialidad") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <br />
            <asp:MultiView ID="MultiViewObservacion" runat="server">
                <asp:View ID="View1" runat="server">
                    <table class="auto-style2">
                        <tr>
                            <td class="auto-style13">El Nombre del paciente de esta Observacion es :
                                <asp:Label ID="lblNombre" runat="server"></asp:Label>
                            </td>
                            <td class="auto-style4">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style5">DNI:&nbsp;&nbsp;
                                <asp:Label ID="lblDni" runat="server"></asp:Label>
                            </td>
                            <td class="auto-style6"></td>
                            <td class="auto-style7"></td>
                            <td class="auto-style7"></td>
                        </tr>
                        <tr>
                            <td class="auto-style5">Observacion:&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Label ID="lblObservacion" runat="server"></asp:Label>
                            </td>
                            <td class="auto-style6"></td>
                            <td class="auto-style7"></td>
                            <td class="auto-style7"></td>
                        </tr>
                        <tr>
                            <td class="auto-style9">
                                <asp:Button ID="btnOcultar" runat="server" Height="34px" OnClick="btnCancelar_Click" Text="Ocultar" Width="162px" />
                            </td>
                            <td class="auto-style10"></td>
                            <td class="auto-style11"></td>
                            <td class="auto-style11"></td>
                        </tr>
                        <tr>
                            <td class="auto-style13">&nbsp;</td>
                            <td class="auto-style4">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </asp:View>
            </asp:MultiView>
            <br />
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:HyperLink CssClass="btn secundario" ID="hlVolverInicio" runat="server" NavigateUrl="~/Administrador/Inicio.aspx">Volver a Inicio</asp:HyperLink>
        </div>
    </form>
</body>
</html>
