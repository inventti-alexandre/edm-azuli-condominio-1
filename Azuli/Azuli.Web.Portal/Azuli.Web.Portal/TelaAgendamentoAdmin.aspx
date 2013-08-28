<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true"
    CodeBehind="TelaAgendamentoAdmin.aspx.cs" Inherits="Azuli.Web.Portal.TelaAgendamentoAdmin"
    EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style2
        {
            background-color: #ADD8E6;
            font-style: normal;
        }
                 
        .style3
        {
            width: 22px;
            height: 14px;
            font-size: 13pt;
        }
                 
        .style4
        {
            font-size: 13pt;
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
   
   <br /><br />
    <br />
    <div id="dvProprietario" align="center" runat="server" class="GridViewPager">
        <fieldset class="loginDisplayLegend">
           <legend class="accordionContent"> RESERVANDO PARA:</legend>
                   
             <table style="font-size: small">
            <tr>
            <td>
                 Morador:</td>
                 <td>
                <asp:Label ID="lblProprietarioDesc" runat="server" CssClass="bold"></asp:Label><br /></td>
             <td>
                Bloco:</td>
               <td><asp:Label ID="lblBlocoDesc" runat="server" CssClass="bold"></asp:Label></td> 
                
              <td>  Apartamento:</td>
               <td> <asp:Label ID="lblApartDesc" runat="server" CssClass="bold"></asp:Label></td>
                </tr>
                
          </table>
            <br />
            <table style="width: 541px; height: 171px;" class="accordionContent">
                    <tr>
                        <td class="">
                            
                                <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="Data da Reserva: " 
                                    CssClass="style4"></asp:Label>
                                <asp:Label ID="lblData" runat="server" Font-Bold="True" style="color: #0000FF" 
                                    CssClass="style4"></asp:Label>
                            &nbsp;
                                <br />
                        </td>
                    </tr>
                    <tr>
                        <td dir="ltr">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td dir="ltr">
                            <asp:CheckBox ID="chkSalaoFesta" runat="server" Text=" Salão de Festas" Font-Bold="True"
                                EnableTheming="True" CssClass="style4" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style5">
                            <asp:CheckBox ID="chkChurrascaria" runat="server" Text=" Área de churrasco" 
                                Font-Bold="True" CssClass="style4" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style5">
                            <asp:CheckBox ID="chkPG" runat="server" Font-Bold="True" Text=" Pago" 
                                CssClass="style4" AutoPostBack="True" 
                                oncheckedchanged="chkPG_CheckedChanged" />
&nbsp;<img alt="" class="style3" src="images/real.jpg" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="lblDataPG" runat="server" 
                                style="font-weight: 700; color: #009933"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style5" align="center">
                            <center>
                                <asp:Label ID="lblReserva" runat="server" CssClass="failureNotification"></asp:Label></center>
                        </td>
                    </tr>
                       <tr>
                        <td align="left">
                            
                    <asp:Button ID="LoginButton" runat="server" Text="Reservar" CssClass="botao"
                        Font-Bold="True" Height="28px" OnClick="LoginButton_Click" Width="128px" />
                    
            
                        &nbsp;<asp:Button ID="btnCancelaReserva" runat="server" Text="Cancelar" CssClass="botao"
                        Font-Bold="True" Height="28px" OnClick="btnCancelaReserva_Click" Width="128px" />
                    
            
                        </td>
                    </tr>
                   
                </table>
              
        </fieldset>
    </div>
 
    <div id="DivConfirma" runat="server">
        <fieldset class="loginDisplayLegend">
            <legend class="accordionContent">Reserva Efetuada com Sucesso Para o:</legend>
            <table id="tbConfirma" style="width: 884px" runat="server">
                <tr>
                    <td>
                        &nbsp;&nbsp;
                        <asp:Label ID="lblBocoTitle" runat="server" Font-Bold="True" Text="Bloco:"></asp:Label>
                        &nbsp;<asp:Label ID="lblBlocoConfirma" runat="server" Font-Bold="True"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="lblApTitle" runat="server" Font-Bold="True" Text="Ap:"></asp:Label>
                        <asp:Label ID="lblApConfirma" runat="server" Font-Bold="True"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="lblDataConfirma" runat="server" Font-Bold="True" Text="Data: "></asp:Label>
                        &nbsp;<asp:Label ID="lblConfirmaData" runat="server" Font-Bold="True"></asp:Label>
                    </td>
                </tr> </table>
   
    <hr />
    <p style="color: #3A5FCD; font-weight: bold;">
        &nbsp;</p>
    <p style="color: #3A5FCD; font-weight: bold;" class="style14">
        Favor atentar às informações abaixo:
    </p>
    <table style="text-align: justify;">
        <tr>
            <td class="style13">
                <ul style="color: #3A5FCD">
                    <li>É permitido cancelar o agendamento somente com 2 dias de antencedencias </li>
                </ul>
                <ul style="color: #3A5FCD">
                    <li>Algumas regras</li>
                </ul>
                <ul style="color: #3A5FCD">
                    <li>Algumas regras</li>
                </ul>
                <ul style="color: #3A5FCD">
                    <li>Algumas regras</li>
                </ul>
                <ul style="color: #3A5FCD">
                    <li>Algumas regras</li>
                </ul>
                <p>
                    &nbsp;</p>
                <p>
                    <asp:ImageButton ID="ImageButton1" runat="server" Height="27px" ImageUrl="~/images/print.jpg"
                        OnClick="ImageButton1_Click1" />
                </p>
                <p>
                    &nbsp;</p>
                <p>
                    <asp:Button ID="btnOKConfirma" runat="server" CssClass="botao" OnClick="btnOKConfirma_Click1"
                        Text="Ok" Width="63px" />
                    &nbsp;</p>
            </td>
            <td>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <img alt="" src="images/azuli.jpg" style="height: 146px; width: 161px;" />
            </td>
        </tr>
    </table>
  </fieldset> </div> 
</asp:Content>
