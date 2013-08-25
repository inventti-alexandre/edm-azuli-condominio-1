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
        .style8
        {
            width: 731px;
        }
        .style9
        {
            font-size: xx-small;
        }
        .style15
        {
            width: 234px;
        }
        .style16
        {
            width: 182px;
        }
        .style18
        {
            border: 1px solid #999999;
            height: 272px;
            background-color: white;
            font-family: Verdana;
            font-size: 6pt;
            font-weight: normal;
            text-align: left;
            padding: 0px 2px 0px 2px;
            margin: 0px 15px 0px 3px;
            width: 874px;
            border-radius: 1em;
        }
        .style19
        {
            width: 177px;
        }
    </style>
    <script type="text/javascript">
        function ShowInfo(id) {
            var div = document.getElementById(id);
            div.style.display = "block";
        }
        function HideInfo(id) {
            var div = document.getElementById(id);
            div.style.display = "none";
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <fieldset class="loginDisplayLegend">
        <legend class="accordionContent">Gerenciador de Tarefas</legend>
        <div id="Div1" runat="server" align="center">
            <table align="center" style="width: 889px">
                <tr>
                    <td align="center" class="style18">
                        <asp:Label ID="Label4" runat="server" Text="Gerenciamento de Reservas" CssClass="accordionContent"
                            Font-Bold="True"></asp:Label>
                        <br />
                        <br />
                        <br />
                        <asp:Calendar ID="Calendar2" runat="server" BackColor="White" Font-Names="Verdana"
                            Font-Size="8pt" ForeColor="Black" Height="360px" Width="759px" BorderWidth="1px"
                            OnDayRender="Calendar1_DayRender" ShowGridLines="True" 
                            NextPrevFormat="FullMonth">
                            <DayHeaderStyle Font-Bold="True" Height="1px" BackColor="#CCCCCC" />
                            <NextPrevStyle Font-Bold="True" Font-Size="9pt" ForeColor="#666666" />
                            <OtherMonthDayStyle ForeColor="#CC9966" />
                            <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                            <SelectorStyle BackColor="#FFCC66" />
                            <TitleStyle BackColor="#E0E0E0" Font-Bold="True" Font-Size="9pt" ForeColor="Black" />
                            <TodayDayStyle ForeColor="#009900" />
                        </asp:Calendar>
                        <br />
                        <table id="tbLegend" runat="server" align="center" style="width: 868px" 
                            class="accordionContent">
                            <tr class="style9">
                                <td align="justify" class="style16">
                                    <asp:ImageButton ID="imgFesta" runat="server" Height="18px" ImageUrl="~/images/azul.jpg"
                                        Width="16px" />
                                    <span class="style8">&nbsp;<b>Salão de</b> <b>Festa&nbsp; - Reservado</b> </span>
                                </td>
                                <td align="justify" class="style19">
                                    <asp:ImageButton ID="ImageButton2" runat="server" Height="18px" ImageUrl="~/images/amarelo.jpg"
                                        Width="16px" />
                                    <span class="style8">&nbsp;<b>Churrasqueira - Reservada</b></span></td>
                                <td>
                                    <asp:ImageButton ID="imgFesta1" runat="server" Height="18px" ImageUrl="~/images/vermelho.jpg"
                                        Width="16px" />
                                    &nbsp;<strong>Salão</strong> <b>Festa &amp; Churrasqueira - Reservada</b></td>
                            </tr>
                             <tr class="style9">
                                <td align="justify" class="style16">
                                    <asp:ImageButton ID="ImageButton1" runat="server" Height="18px" ImageUrl="~/images/azul.jpg"
                                        Width="16px" />
                                    <span class="style8">&nbsp;<strong>SL</strong> <b>de Festa - Pendente de 
                                    Pagamento</b></span></td>
                                <td align="justify" class="style19">
                                    <asp:ImageButton ID="ImageButton3" runat="server" Height="18px" ImageUrl="~/images/amarelo.jpg"
                                        Width="16px" />
                                    <span class="style8">&nbsp;<b>Churrasco Alugada</b>&nbsp;</span>
                                </td>
                                <td align="justify" class="style15">
                                    <asp:ImageButton ID="ImageButton4" runat="server" Height="18px" ImageUrl="~/images/vermelho.jpg"
                                        Width="16px" />
                                    &nbsp;<b>Festa/Churras Alugada</b>
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
