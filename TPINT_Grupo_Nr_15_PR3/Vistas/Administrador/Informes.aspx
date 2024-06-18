<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Informes.aspx.cs" Inherits="Vistas.Administrador.Informes" %>

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
            height: 23px;
        }
        .auto-style3 {
            height: 23px;
            width: 176px;
        }
        .auto-style7 {
            width: 176px;
        }
        .auto-style8 {
            height: 23px;
            width: 168px;
        }
        .auto-style9 {
            width: 168px;
        }
        .auto-style12 {
            height: 23px;
            width: 205px;
        }
        .auto-style13 {
            width: 205px;
        }
        .auto-style14 {
            width: 205px;
            text-align: right;
        }
        .auto-style15 {
            height: 23px;
            width: 351px;
        }
        .auto-style16 {
            width: 351px;
        }
        .auto-style17 {
            height: 26px;
        }
        .auto-style18 {
            width: 22%;
            margin-left: 1050px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style18">
                <tr>
                    <td class="auto-style17">
                <asp:Button ID="ButtonbtnVerUsuario" runat="server" Text="Usuario" Height="25px" OnClick="ButtonbtnVerUsuario_Click" />
                        <asp:Panel ID="PanelUsuario" runat="server" Height="56px" Visible ="false">
                            Usuario :
                            <asp:Label ID="lblNombreUsuario" runat="server"></asp:Label>
                            <br />
                            <asp:HyperLink ID="hlCerrarSesion" runat="server" NavigateUrl="~/Login.aspx">Cerrar Sesion</asp:HyperLink>
                        </asp:Panel>
                    </td>
                </tr>
            </table>
        </div>
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="VAusentes" runat="server" OnActivate="VAusentes_Activate">
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style8"><h1>Porcentajes de Asistencia</h1></td>
                        <td class="auto-style3">&nbsp;</td>
                        <td class="auto-style2"></td>
                        <td class="auto-style2"></td>
                    </tr>
                    <tr>
                        <td class="auto-style9">Desde:
                            <asp:TextBox ID="TextBox1" runat="server" TextMode="Date"></asp:TextBox>
                        </td>
                        <td class="auto-style7">Hasta:
                            <asp:TextBox ID="TextBox2" runat="server" TextMode="Date"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Button ID="btnVer" runat="server" Text="Ver" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style9">&nbsp;</td>
                        <td class="auto-style7">&nbsp;</td>
                        <td>
                            <asp:Chart ID="Chart1" runat="server">
                                <series>
                                <asp:Series ChartType="Pie" Name="Series1"></asp:Series>
                                </series>
                                <chartareas>
                                <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                                </chartareas>
                            </asp:Chart>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style9">&nbsp;</td>
                        <td class="auto-style7">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style9">&nbsp;</td>
                        <td class="auto-style7">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
                <div>

                    <asp:LinkButton ID="lbPasarVista" runat="server" OnClick="lbPasarVista_Click">&gt;&gt;</asp:LinkButton>

                </div>
            </asp:View>
            <asp:View ID="VEspecialidades" runat="server" OnActivate="VEspecialidades_Activate">
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style12"><h1>Porcentaje de turnos segun Especialidad</h1></td>
                        <td class="auto-style15"></td>
                        <td class="auto-style2"></td>
                        <td class="auto-style2"></td>
                    </tr>
                    <tr>
                        <td class="auto-style14">Seleccionar Especialidad:</td>
                        <td class="auto-style16">
                            <asp:DropDownList ID="ddlEspecilidades" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                <asp:ListItem>-Selecciona una especialidad--</asp:ListItem>
                                <asp:ListItem>Clinico</asp:ListItem>
                                <asp:ListItem>Cardiologo</asp:ListItem>
                                <asp:ListItem>Neurologo</asp:ListItem>
                                <asp:ListItem>Odontologo</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style13">&nbsp;</td>
                        <td class="auto-style16">
                            <asp:Chart ID="chartEspecialidades" runat="server">
                                <series>
                                <asp:Series ChartType="Pie" Name="Series1"></asp:Series>
                                </series>
                                <chartareas>
                                <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                                </chartareas>
                            </asp:Chart>
                        </td>
                        <td>
                            <asp:Chart ID="Chart3" runat="server" Visible="False" Width="508px">
                                <series>
                                <asp:Series Name="Series1" YValuesPerPoint="6"></asp:Series>
                                </series>
                                <chartareas>
                                <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                                </chartareas>
                            </asp:Chart>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style13">
                            &nbsp;</td>
                        <td class="auto-style16">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
                <div>

                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">&lt;&lt;</asp:LinkButton>
                    <asp:LinkButton ID="lbPasarVista0" runat="server" OnClick="lbPasarVista_Click">&gt;&gt;</asp:LinkButton>

                </div>
            </asp:View>
            <asp:View ID="VHorasTrabajadas" runat="server">
                <table class="auto-style1">
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton1_Click">&lt;&lt;</asp:LinkButton>
                        </td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </asp:View>
        </asp:MultiView>
    </form>
</body>
</html>
