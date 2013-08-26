<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true"
    CodeBehind="WelcomeAdmin.aspx.cs" Inherits="Azuli.Web.Portal.WelcomeAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style2
        {
            width: 155px;
        }
        .controleCalendario
        {
        }
        .style9
        {
            font-size: xx-small;
        }
        .style23
        {
            width: 913px;
        }
        .style28
        {
            width: 421px;
        }
        .style29
        {
            width: 429px;
        }
    </style>
    <script type="text/javascript">
        function ShowInfo(id) {
            var div = document.getElementById(id);
            div.style.display = "block";
        }
        function HideInfo(id) {
            var div = document.getElementById(id);
            div.style.display = "block";
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <fieldset class="loginDisplayLegend">
        <legend class="accordionContent">Gerenciador de Tarefas</legend>
        <div id="Div1" runat="server" align="center">
            <table align="center" style="width: 883px">
                <tr>
                    <td align="center" class="style23">
                       
                 
                        <asp:Calendar ID="Calendar2" runat="server" BackColor="White" Font-Names="Verdana"
                            Font-Size="8pt" ForeColor="Black" Height="338px" Width="824px" BorderWidth="1px"
                            OnDayRender="Calendar1_DayRender" ShowGridLines="True" 
                            NextPrevFormat="FullMonth" onselectionchanged="Calendar2_SelectionChanged">
                            <DayHeaderStyle Font-Bold="True" Height="1px" BackColor="#CCCCCC" />
                            <DayStyle Font-Bold="True" Font-Size="Small" BackColor="#E0E0E0" />
                            <NextPrevStyle Font-Bold="True" Font-Size="9pt" ForeColor="#666666" />
                            <OtherMonthDayStyle ForeColor="#CC9966" />
                            <SelectedDayStyle Font-Bold="True" />
                            <SelectorStyle BackColor="#FFCC66" />
                            <TitleStyle BackColor="#E0E0E0" Font-Bold="True" Font-Size="9pt" ForeColor="Black" />
                            <TodayDayStyle ForeColor="#009900" />
                        </asp:Calendar>
                        <br />
                        <table id="tbLegend" runat="server" align="center" 
                            class="accordionContent">
                            <tr class="style9">
                                <td align="center" class="style29">
                                    <asp:Label ID="lblSlfReservado" runat="server" 
                                        style="font-weight: 700; font-family: Calibri; font-size: 14pt" 
                                        Text="SFR - Salão de Festa  Reservado" ForeColor="Green"></asp:Label>
                                </td>
                                <td align="center" class="style28">
                                    &nbsp;<asp:Label ID="lblChurrasReservada" runat="server" 
                                        style="font-weight: 700; font-family: Calibri; font-size: 14pt" 
                                        Text="CHR -Churrasqueira Reservada" ForeColor="Green"></asp:Label>
                                </td>
                            </tr>
                             <tr class="style9">
                                <td align="center" class="style29">
                                    <span>
                                    <asp:Label ID="lblPendentePg" runat="server" 
                                        style="font-weight: 700; font-family: Calibri; font-size: 14pt; color: #CC0000" 
                                        Text="SFP - Salão de Festa Pendente de PG"></asp:Label>
                                    </span></td>
                                <td align="center" class="style28">
                                    &nbsp;<asp:Label ID="Label4" runat="server" 
                                        style="font-weight: 700; font-family: Calibri; font-size: 14pt; color: #CC0000" 
                                        Text="CHP -Churrasqueira Pendente de PG"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td> </td>
                  <!-- Módulo desativado no momento - Para aceitação Inicial 
                    <td valign="top" class="watermarked">
                        <table>
                            <tr>
                                <td colspan="3" align="center">
                                    <asp:Label ID="lblPendente" runat="server" Text="Tarefas Pendentes" CssClass="accordionContent"
                                        Font-Bold="True"></asp:Label>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td class="style5" align="left">
                                    <asp:Image ID="Image1" runat="server" Height="20px" ImageUrl="~/images/clientes.jpg"
                                        Width="25px" />
                                    &nbsp;
                                    <asp:Label ID="Label1" runat="server" Text="Liberação de Morador" 
                                        Style="font-weight: 700" Font-Size="Small"></asp:Label>
                                </td>
                                <td class="style6">
                                    <br />
                                    <asp:Label ID="lblLiberarMorador" runat="server" Text="0" Font-Bold="True" 
                                        ForeColor="Blue" CssClass="style18"></asp:Label>
                                </td>
                                <td class="style7">
                                    <br />
                                    <asp:ImageButton ID="imgLiberarMorador" CssClass="BorderAdministrador" runat="server"
                                        ImageUrl="~/images/cliqueAqui.jpg" OnClick="imgLiberarMorador_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td class="style5" align="left">
                                    <asp:Image ID="Image2" runat="server" Height="20px" ImageUrl="~/images/reserva.jpg"
                                        Width="25px" />
                                    &nbsp;
                                    <asp:Label ID="lblReservaDesc" runat="server" Text="Liberar Reserva" 
                                        Style="font-weight: 700; font-size: small;"></asp:Label>
                                </td>
                                <td class="style4">
                                    <br />
                                    <asp:Label ID="lblLiberarReserva" runat="server" Text="0" Font-Bold="True" 
                                        ForeColor="Blue" CssClass="style18"></asp:Label>
                                </td>
                                <td>
                                    <br />
                                    <asp:ImageButton ID="imgLiberarReserva" CssClass="BorderAdministrador" runat="server"
                                        ImageUrl="~/images/cliqueAqui.jpg" />
                                </td>
                            </tr>
                            <tr>
                                <td class="style5" align="left">
                                    <asp:Image ID="Image3" runat="server" Height="20px" ImageUrl="~/images/mensagem.jpg"
                                        Width="25px" />
                                    &nbsp;
                                    <asp:Label ID="lblMsgRecDesc" runat="server" Text="Mensagem Recebida" 
                                        Style="font-weight: 700; font-size: small;"></asp:Label>
                                </td>
                                <td class="style4">
                                    <br />
                                    <asp:Label ID="lblMsgRecebida" runat="server" Text="0" Font-Bold="True" 
                                        ForeColor="Blue" CssClass="style18"></asp:Label>
                                </td>
                                <td>
                                    <br />
                                    <asp:ImageButton ID="imgMsgRecebida" CssClass="BorderAdministrador" runat="server"
                                        ImageUrl="~/images/cliqueAqui.jpg" />
                                </td>
                            </tr>
                            <tr>
                                <td class="style5" align="left">
                                    <asp:Image ID="Image4" runat="server" Height="20px" ImageUrl="~/images/ocoor.jpg"
                                        Width="25px" />
                                    &nbsp;
                                    <asp:Label ID="Label2" runat="server" Text="Reclamações Abertas" 
                                        Style="font-weight: 700; font-size: small;"></asp:Label>
                                </td>
                                <td class="style4">
                                    <br />
                                    <asp:Label ID="lblLiberaOcorrencia" runat="server" Text="0" Font-Bold="True" 
                                        ForeColor="Blue" CssClass="style18"></asp:Label>
                                </td>
                                <td>
                                    <br />
                                    <asp:ImageButton ID="imgReclamacai" CssClass="BorderAdministrador" runat="server"
                                        ImageUrl="~/images/cliqueAqui.jpg" OnClick="imgReclamacai_Click" />
                                </td> -->
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </fieldset>
</asp:Content>
