<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="telaAgendamento.aspx.cs" Inherits="Azuli.Web.Portal.telaAgendamento" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style2
        {
            width: 509px;
        }
        .style3
        {
            font-weight: 700;
        }
        .style4
        {
            width: 15px;
            font-weight: bold;
        }
        .style5
        {
            width: 567px;
        }
        .style7
        {
            color: #006600;
        }
        .menu
        {
        }
        .style12
        {
            width: 966px;
            height: 130px;
        }
        .style13
        {
            width: 536px;
        }
    .style14
    {
        text-decoration: underline;
    }
        .style15
        {
            width: 513px;
            height: 130px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
<br /></br> 
    <div id="dvProprietario" runat="server">
    <br /><br /><br />
    <fieldset class="login">
    
        <legend>Reservas feita em:  <asp:Label ID="lblMesAtual" runat="server" Style="font-weight: 700; color: #0033CC"></asp:Label></legend>
        <table style="height: 192px; width: 669px;">
            <tr>
                <td align="center" class="style15">
                 
                    <asp:FormView ID="formVwChurrasco" runat="server" CellPadding="4"
                        Width="125px" CssClass="btGeral" AllowPaging="True" Height="76px" 
                        EmptyDataText="Você não tem Reservas para Churrasqueira neste mês!!" 
                        onpageindexchanging="formVwChurrasco_PageIndexChanging" 
                        onitemdeleting="formVwChurrasco_ItemDeleting" 
                        DataKeyNames="dataAgendamento">
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderTemplate>
                            Churrasqueira</HeaderTemplate>
                        <ItemTemplate>
                            <table id="tbAgendaMes" runat="server">
                                <tr>
                                    <td>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("dataAgendamento","{0:dd/MM/yyyy}") %>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Image ID="Image1" ImageUrl="~/images/ok.jpg" Width="30px" runat="server" />
                                    </td>
                                </tr>
                                <br></br>
                            </table>
                            <br />
                            <asp:Button ID="btnDel" runat="server" CssClass="botao" CausesValidation="True" CommandName="Delete"
                                Text="Cancelar" />
                        </ItemTemplate>
                        <FooterTemplate>
                        </FooterTemplate>
                        <PagerSettings PageButtonCount="6" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                    </asp:FormView>
                    
                </td>
          
                <td align="center" class="style12">
                    <asp:FormView ID="frvSalaoFesta" runat="server" CellPadding="4" 
                        Width="125px" CssClass="btGeral" AllowPaging="True" Height="76px" 
                        EmptyDataText="Você não tem Reservas para o salão de Festa neste mês!!" 
                        onpageindexchanging="frvSalaoFesta_PageIndexChanging" 
                        onitemdeleted="frvSalaoFesta_ItemDeleted" DataKeyNames="dataAgendamento" 
                        onitemdeleting="frvSalaoFesta_ItemDeleting">
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderTemplate>
                            Salão de Festa</HeaderTemplate>
                        <ItemTemplate>
                            <table id="tbAgendaMes0" runat="server">
                                <tr>
                                    <td>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("dataAgendamento","{0:dd/MM/yyyy}") %>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Image ID="Image1" ImageUrl="~/images/ok.jpg" Width="30px" runat="server" />
                                    </td>
                                </tr>
                                <br></br>
                            </table>
                            <br />
                            <asp:Button ID="btnDel" runat="server" CssClass="botao" CausesValidation="True" CommandName="Delete"                                Text="Cancelar" />
                        </ItemTemplate>
                        <FooterTemplate>
                        </FooterTemplate>
                        <PagerSettings PageButtonCount="6" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                    </asp:FormView>
                </td>
            </tr>
             </table>
        <asp:Label ID="lblMgs" runat="server" 
                     Font-Bold="False" ForeColor="Red"></asp:Label>
    </fieldset> </div>
    <div id="dvOpcao" runat="server">
        <fieldset class="login">
            <legend>Selecione abaixo a reserva disponivel na data escolhida:</legend>
            <table style="width: 643px; height: 152px;">
                <tr>
                    <td class="style5">
                        <div id="dvData" runat="server" style="border-width: thin; border-style: groove;
                            width: 205px;">
                            <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="Data: "></asp:Label>
                            <asp:Label ID="lblData" runat="server" Font-Bold="True"></asp:Label></div>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="style5">
                        <asp:CheckBox ID="chkSalaoFesta" runat="server" Text="Salão de Festas" Font-Bold="True"
                            EnableTheming="True" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style5">
                        <br />
                        <asp:CheckBox ID="chkChurrascaria" runat="server" Text="Área de churrasco" Font-Bold="True" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style5">
                     <center> 
                         <asp:Label ID="lblReserva" runat="server" CssClass="failureNotification"></asp:Label>
                        </center>  
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
            <p>
                <br />
                <asp:Button ID="LoginButton" runat="server" Text="Finalizar Reserva" CssClass="botao"
                    Font-Bold="True" Height="28px" OnClick="LoginButton_Click" 
                    ValidationGroup="finalizaReserva" />
            </p>
        </fieldset>
    </div>
    <div id="dvCalendar" align="left" runat="server">
        <fieldset class="login">
            <legend>Escolha a Data da sua reserva:</legend>
            <asp:Label ID="lblMsgData" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
            
            <table style="width: 886px; height: 308px;">
                <tr>
                    <td  align="left">

                         
                     <asp:UpdatePanel ID="UpdatePanel1" runat="server"> 
                     
                     <ContentTemplate>

                          <asp:Timer ID="UpdateTimer"  Interval="15000"  ontick="UpdateTimer_Tick1" 
                              runat="server" />
                              
                        <asp:Calendar ID="Calendar1" runat="server" BackColor="White" OnSelectionChanged="Calendar1_SelectionChanged"
                            BorderColor="Black" BorderStyle="Solid" CellSpacing="1" Font-Names="Verdana"
                            Font-Size="9pt" ForeColor="Black" Height="236px" NextPrevFormat="ShortMonth"
                            Width="446px" OnDayRender="Calendar1_DayRender">
                            <DayHeaderStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" Height="8pt" />
                            <DayStyle BackColor="#CCCCCC" />
                            <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="White" />
                            <OtherMonthDayStyle ForeColor="#999999" />
                            <SelectedDayStyle ForeColor="White" />
                            <TitleStyle BackColor="#333399" BorderStyle="Solid" Font-Bold="True" Font-Size="12pt"
                                ForeColor="White" Height="12pt" />
                            <TodayDayStyle ForeColor="White" />
                        </asp:Calendar>
                          </ContentTemplate>
                            <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="UpdateTimer" EventName="Tick" />
                            
                            </Triggers>
                        </asp:UpdatePanel>
                    </td>
                    <td class="style4">
                        &nbsp;<br />
                    </td>
                    <td class="style3">
                        <asp:ImageButton ID="imgFesta" runat="server" Height="16px" ImageUrl="~/images/azul.jpg"
                            Width="27px" />
                        <br />
                        <br />
                        <asp:ImageButton ID="imgFesta0" runat="server" Height="16px" ImageUrl="~/images/amarelo.jpg"
                            Width="27px" />
                        <br />
                        <br />
                        <asp:ImageButton ID="imgFesta1" runat="server" Height="16px" ImageUrl="~/images/vermelho.jpg"
                            Width="27px" />
                        <td align="left">
                            <b>Salão de Festa Locado </b>
                            <br />
                            <br />
                            <b>Área de Churraco Locada </b>
                            <br />
                            <br />
                            <b>Salão de Festa e Área de churrasco Locado</b>
                        </td>
                    </td>
                </tr>
            </table>
        </fieldset>
    </div>
    <br />
    <div id="DivConfirma" runat="server">
        <fieldset class="login">
            <legend class="style7">Reserva Efetuada com Sucesso Para o:</legend>
            <table id="tbConfirma" style="width: 880px; height: 380px;" runat="server">
                <tr>
                    <td>
                        &nbsp;&nbsp; <asp:Label ID="lblBocoTitle" runat="server" Font-Bold="True" Text="Bloco:"></asp:Label>
                        &nbsp;<asp:Label ID="lblBlocoConfirma" runat="server" Font-Bold="True"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="lblApTitle" runat="server" Font-Bold="True" Text="Ap:"></asp:Label>
                        <asp:Label ID="lblApConfirma" runat="server" Font-Bold="True"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblDataConfirma" runat="server" Font-Bold="True" Text="Data: "></asp:Label>
            &nbsp;<asp:Label ID="lblConfirmaData" runat="server" Font-Bold="True"></asp:Label>
                    </td>
                </tr>
    </div>
    <tr>
        <td>
        <hr />
            <p style="color:#3A5FCD; font-weight: bold;">
                &nbsp;</p>
            <p style="color:#3A5FCD; font-weight: bold;" class="style14">
       Favor atentar às informações abaixo:
    </p>
    <table style="text-align: justify;">
        <tr>
            <td class="style13">
                <ul style="color:#3A5FCD
">
                    <li>É permitido cancelar o agendamento somente com 2 dias de antencedencias </li>
                </ul>
                
                <ul style="color:#3A5FCD
">
                    <li>Algumas regras</li>
                </ul>
                
                <ul style="color:#3A5FCD
">
                    <li>Algumas regras</li>
                </ul>
                
                <ul style="color:#3A5FCD
">
                    <li>Algumas regras</li>
                </ul>
                
                <ul style="color:#3A5FCD
">
                    <li>Algumas regras</li>
                </ul>
               
              
                <p>
                    &nbsp;</p>
                <p>
                    <asp:ImageButton ID="ImageButton1" runat="server" Height="27px" 
                        ImageUrl="~/images/print.jpg" onclick="ImageButton1_Click1" />
                </p>
                <p>
                    &nbsp;</p>
                <p>
                    <asp:Button ID="btnOKConfirma" runat="server" CssClass="botao" 
                        onclick="btnOKConfirma_Click1" Text="Ok" Width="63px" />
                &nbsp;</p>
            </td>
            <td>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <img alt="" src="images/azuli.jpg" style="height: 146px; width: 161px;" /></td>
        </tr>
    </table>
            </td>
    </tr>
    </table> </fieldset></div>
</asp:Content>
