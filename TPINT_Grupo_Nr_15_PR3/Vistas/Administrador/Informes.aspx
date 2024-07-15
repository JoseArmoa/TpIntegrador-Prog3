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
        .auto-style18 {
            width: 255px;
        }
        .auto-style19 {
            width: 312px;
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
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="VAusentes" runat="server" OnActivate="VAusentes_Activate">
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style2" colspan="4"><h1>Cantidad de Asistencias</h1></td>
                    </tr>
                    <tr>
                        <td class="auto-style9">Desde:
                            <asp:TextBox ID="txtInicio" runat="server" TextMode="Date"></asp:TextBox>
                        </td>
                        <td class="auto-style19">Hasta:
                            <asp:TextBox ID="txtFinal" runat="server" TextMode="Date"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Button CssClass="btn" ID="btnVer" runat="server" Text="Ver" OnClick="btnVer_Click" />
                            <asp:CompareValidator ID="cvFechas" runat="server" ControlToCompare="txtInicio" ControlToValidate="txtFinal" ErrorMessage="Rango de fecha incorrecto" Operator="GreaterThan">*</asp:CompareValidator>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style9">&nbsp;</td>
                        <td class="auto-style19">
                            <asp:Label ID="lblInforme1" runat="server"></asp:Label>
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style9">&nbsp;</td>
                        <td class="auto-style19">
                            <asp:Label ID="lblInforme2" runat="server"></asp:Label>
                        </td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style9">&nbsp;</td>
                        <td class="auto-style19">
                            &nbsp;</td>
                        <td>
                            <asp:Chart ID="Chart1" runat="server" Visible="False">
                                <series>
                                    <asp:Series ChartArea="ChartArea1" ChartType="Pie" Name="Series1">
                                    </asp:Series>
                                </series>
                                <chartareas>
                                    <asp:ChartArea Name="ChartArea1">
                                    </asp:ChartArea>
                                </chartareas>
                            </asp:Chart>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style9">&nbsp;</td>
                        <td class="auto-style19">&nbsp;</td>
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
