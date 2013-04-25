<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true"
    CodeBehind="WelcomeAdmin.aspx.cs" Inherits="Azuli.Web.Portal.WelcomeAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style2
        {
            width: 155px;
        }
        .style4
        {
            width: 49px;
        }
        .style5
        {
            width: 184px;
            height: 28px;
        }
        .style6
        {
            width: 49px;
            height: 28px;
        }
        .style7
        {
            height: 28px;
        }
        .controleCalendario
        {
        }
        .style8
        {
            width: 731px;
        }
        .style9
        {
            width: 293px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <div id="dvLegend" runat="server" style="position: absolute; top: 264px; left: 416px;
        height: 76px; width: 209px;">
        <table runat="server" align="center" style="width: 238px">
            <tr>
                <td align="justify">
                    <asp:ImageButton ID="imgFesta" runat="server" Height="8px" ImageUrl="~/images/azul.jpg"
                        Width="8px" />
                <span class="style8">&nbsp;Salão de Festa Locado&nbsp;
                        </span>
                </td>
            </tr>
            <tr>
                <td align="justify">
                  
                    <asp:ImageButton ID="ImageButton2" runat="server" Height="8px" ImageUrl="~/images/amarelo.jpg"
                        Width="8px" />
                   <span class="style8">&nbsp;Área de Churrasco Locada&nbsp;</span>
                </td>
            </tr>
            <tr>
                <td align="justify">
                   
                    <asp:ImageButton ID="imgFesta1" runat="server" Height="8px" ImageUrl="~/images/vermelho.jpg"
                        Width="8px" />
                  <span class="style8"> &nbsp; Festa e Churrasqueira reservada</span>
                </td>
            </tr>
        </table>
    </div>
    <table style="width: 889px">
        <tr>
            <td dir="ltr" align="left" class="style9">
                <fieldset>
                    <legend class="accordionContentAdmin">Agenda</legend>
                    <asp:Calendar ID="Calendar1" runat="server" BackColor="White" Font-Names="Verdana"
                        Font-Size="8pt" ForeColor="Black" Height="200px" Width="220px" BorderWidth="1px"
                        OnDayRender="Calendar1_DayRender" ShowGridLines="True">
                        <DayHeaderStyle Font-Bold="True" Height="1px" BackColor="#CCCCCC" />
                        <NextPrevStyle Font-Bold="True" Font-Size="9pt" ForeColor="#666666" />
                        <OtherMonthDayStyle ForeColor="#CC9966" />
                        <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                        <SelectorStyle BackColor="#FFCC66" />
                        <TitleStyle BackColor="#E0E0E0" Font-Bold="True" Font-Size="9pt" ForeColor="Black" />
                        <TodayDayStyle ForeColor="#009900" />
                    </asp:Calendar>
                </fieldset></td>
            <td align="center">
                &nbsp;</td>
        </tr>
    </table>
    <div id="dvPainelAdministrativo" align="center" runat="server">
        <fieldset class="loginDisplayLegend">
            <legend class="accordionContent">Painel de Tarefas </legend>
            <center>
                <table style="border: thin groove #0092D2; border-spacing: 15px 15px; width: 450px;">
                    <tr>
                        <td colspan="3" align="center">
                            <asp:Label ID="lblPendente" runat="server" Text="Pendências" CssClass="accordionContent"
                                Font-Bold="True"></asp:Label>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td class="style5" align="left">
                            <asp:Image ID="Image1" runat="server" Height="30px" ImageUrl="~/images/clientes.jpg"
                                Width="35px" />
                            &nbsp;
                            <asp:Label ID="Label1" runat="server" Text="Liberação de Morador" Style="font-weight: 700"></asp:Label>
                        </td>
                        <td class="style6">
                            <br />
                            <asp:Label ID="lblLiberarMorador" runat="server" Text="0"></asp:Label>
                        </td>
                        <td class="style7">
                            <br />
                            <asp:ImageButton ID="imgLiberarMorador" CssClass="Border" runat="server" ImageUrl="~/images/cliqueAqui.jpg" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style5" align="left">
                            <asp:Image ID="Image2" runat="server" Height="30px" ImageUrl="~/images/reserva.jpg"
                                Width="35px" />
                            &nbsp;
                            <asp:Label ID="lblReservaDesc" runat="server" Text="Liberação de Reserva" Style="font-weight: 700"></asp:Label>
                        </td>
                        <td class="style4">
                            <br />
                            <asp:Label ID="lblLiberarReserva" runat="server" Text="0"></asp:Label>
                        </td>
                        <td>
                            <br />
                            <asp:ImageButton ID="imgLiberarReserva" CssClass="Border" runat="server" ImageUrl="~/images/cliqueAqui.jpg" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style5" align="left">
                            <asp:Image ID="Image3" runat="server" Height="30px" ImageUrl="~/images/mensagem.jpg"
                                Width="35px" />
                            &nbsp;
                            <asp:Label ID="lblMsgRecDesc" runat="server" Text="Mensagem Recebida" Style="font-weight: 700"></asp:Label>
                        </td>
                        <td class="style4">
                            <br />
                            <asp:Label ID="lblMsgRecebida" runat="server" Text="0"></asp:Label>
                        </td>
                        <td>
                            <br />
                            <asp:ImageButton ID="imgMsgRecebida" CssClass="Border" runat="server" ImageUrl="~/images/cliqueAqui.jpg" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style5" align="left">
                            <asp:Image ID="Image4" runat="server" Height="30px" ImageUrl="~/images/ocoor.jpg"
                                Width="35px" />
                            &nbsp;
                            <asp:Label ID="Label2" runat="server" Text="Ocorrência Abertas" Style="font-weight: 700"></asp:Label>
                        </td>
                        <td class="style4">
                            <br />
                            <asp:Label ID="Label3" runat="server" Text="0"></asp:Label>
                        </td>
                        <td>
                            <br />
                            <asp:ImageButton ID="ImageButton1" CssClass="Border" runat="server" ImageUrl="~/images/cliqueAqui.jpg" />
                        </td>
                    </tr>
                </table>
            </center>
        </fieldset>
    </div>
</asp:Content>
