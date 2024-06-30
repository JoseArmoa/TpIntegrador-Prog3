<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AsignacionTurnos.aspx.cs" Inherits="Vistas.CargarTurnos" %>

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
            width: 206px;
        }
        .auto-style3 {
            width: 206px;
            height: 102px;
        }
        .auto-style4 {
            height: 102px;
        }
        .auto-style9 {
            width: 206px;
            height: 53px;
        }
        .auto-style10 {
            height: 53px;
        }
        .auto-style11 {
            width: 206px;
            height: 43px;
        }
        .auto-style12 {
            height: 43px;
        }
        .auto-style13 {
            height: 53px;
            width: 260px;
        }
        .auto-style14 {
            height: 43px;
            width: 260px;
        }
        .auto-style15 {
            width: 260px;
        }
        .auto-style16 {
            height: 102px;
            width: 260px;
        }
        .auto-style17 {
            width: 25%;
            margin-left: 596px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style3"><h1>&nbsp;</h1>
                        <h1>Asignacion de Turno</h1></td>
                    <td class="auto-style16"></td>
                    <td class="auto-style4">
                        <table class="auto-style17">
                            <tr>
                                <td>
                <asp:Button ID="ButtonbtnVerUsuario" runat="server" Text="Usuario" Height="25px" OnClick="ButtonbtnVerUsuario_Click" />
                                    <asp:Panel ID="PanelUsuario" runat="server" Width="268px" Visible="false">
                                        Usuario :
                                        <asp:Label ID="lblNombreUsuario" runat="server"></asp:Label>
                                        <br />
                                    </asp:Panel>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">Dni :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </td>
                    <td class="auto-style13">
                        <asp:TextBox ID="txtDni" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style10">
                        <asp:Button ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click" />
&nbsp;
                        <asp:Button ID="btnAgregar" runat="server" PostBackUrl="~/CagarPacientes.aspx" Text="Agregar" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Nombre Paciente :&nbsp; </td>
                    <td class="auto-style15">
                        <asp:Label ID="lblNombrePaciente" runat="server"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
        <table class="auto-style1">
            <tr>
                <td class="auto-style9">Especialidad :
                </td>
                <td class="auto-style10">
                    <asp:DropDownList ID="ddlEspecialidades" runat="server">
                    </asp:DropDownList>
&nbsp;&nbsp; Medico:
                    <asp:DropDownList ID="DropDownList1" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Button ID="btnTurnos" runat="server" OnClick="btnTurnos_Click" Text="Ver Turnos Disponibles" />
                </td>
                <td>
                    <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="Black" DayNameFormat="Shortest" Font-Names="Times New Roman" Font-Size="10pt" ForeColor="Black" Height="220px" NextPrevFormat="FullMonth" OnDayRender="Calendar1_DayRender" OnSelectionChanged="Calendar1_SelectionChanged" TitleFormat="Month" Visible="False" Width="400px">
                        <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" ForeColor="#333333" Height="10pt" />
                        <DayStyle Width="14%" />
                        <NextPrevStyle Font-Size="8pt" ForeColor="White" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <SelectedDayStyle BackColor="#CC3333" ForeColor="White" />
                        <SelectorStyle BackColor="#CCCCCC" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt" ForeColor="#333333" Width="1%" />
                        <TitleStyle BackColor="Black" Font-Bold="True" Font-Size="13pt" ForeColor="White" Height="14pt" />
                        <TodayDayStyle BackColor="#CCCC99" />
                    </asp:Calendar>
                    <br />
                    <br />
                    <asp:DataList ID="DataList1" runat="server" Visible="False">
                        <ItemTemplate>
                            <br />
                            <asp:Label ID="lblHorario" runat="server" Text="Label"></asp:Label>
                            <br />
                            <asp:Button ID="btnSeleccionar" runat="server" CommandName="Seleccionar" Text="Seleccionar" />
                        </ItemTemplate>
                    </asp:DataList>
                </td>
            </tr>
        </table>
        <table class="auto-style1">
            <tr>
                <td class="auto-style9">Fecha:</td>
                <td class="auto-style13">
                    <asp:Label ID="lblFecha" runat="server"></asp:Label>
                </td>
                <td class="auto-style10">
                        Horario:
                        <asp:Label ID="lblHorario" runat="server" Text="Horario"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Medico Asignado:
                        <asp:Label ID="lblMedicoAsignado" runat="server"></asp:Label>
                    </td>
            </tr>
            <tr>
                <td class="auto-style11"></td>
                <td class="auto-style14">
                    <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" />
                </td>
                <td class="auto-style12"></td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style15">&nbsp;</td>
                <td>
                    <asp:HyperLink ID="hlVolverInicio" runat="server" NavigateUrl="~/OpcionesTurno.aspx">Volver a Inicio</asp:HyperLink>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
