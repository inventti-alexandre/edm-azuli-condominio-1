<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="PendenciaAgendamentos.aspx.cs" Inherits="Azuli.Web.Portal.PendenciaAgendamentos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style4
        {
            font-weight: bold;
            font-size: 12pt;
        }
        .accordionContent
        {
            width: 805px;
        }
        .style5
        {
            font-weight: bold;
            font-size: medium;
        }
        .style6
        {
            font-size: 10pt;
            font-weight: 700;
        }
        .style7
        {
            height: 26px;
        }
        .style8
        {
            font-weight: bold;
            font-size: medium;
            color: #FF0000;
        }
        .style9
        {
            color: #006600;
        }
        .style10
        {
            width: 239px;
        }
        .style12
        {
            width: 48px;
            height: 41px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <br /><br /><br />
    <center> <div id="dvPesquisaMorador" align="center" runat="server">
    
      <fieldset class="loginDisplayLegend">
     <legend align="left" class="style10">Confirmação de Pagamento Ou Cancelamento de Reservas</legend>




          <table class="accordionContent">
              <tr>
                  <td class="style7" style="border-style: groove; border-width: thin">
                      <asp:Label ID="Label7" runat="server" CssClass="style5" Text="Bloco:"></asp:Label>
&nbsp;<asp:Label ID="Label1" runat="server" CssClass="style5" Text="6"></asp:Label>
&nbsp;-
                      <asp:Label ID="Label8" runat="server" CssClass="style5" Text="Apartamento:"></asp:Label>
                  &nbsp;
                      <asp:Label ID="Label2" runat="server" CssClass="style5" Text="301"></asp:Label>
                  </td>
                  <td align="center" class="style7" 
                      style="border-style: groove; border-width: thin">
                      <asp:Label ID="Label5" runat="server" CssClass="style5" Text="Pagamento"></asp:Label>
                  </td>
                  <td align="center" class="style7" 
                      style="border-style: groove; border-width: thin">
                      <asp:Label ID="Label6" runat="server" CssClass="style5" Text="Cancelamento"></asp:Label>
                  </td>
                  <td align="center" class="style7" 
                      style="border-style: groove; border-width: thin">
                      <asp:Label ID="Label12" runat="server" CssClass="style5" Text="Dias em Atraso"></asp:Label>
                  </td>
                  <td align="center" class="style7" 
                      style="border-style: groove; border-width: thin">
                      <asp:Label ID="Label9" runat="server" CssClass="style5" Text="Valor"></asp:Label>
                  </td>
              </tr>
              <tr>
                  <td align="center" 
                      style="border-left-style: groove; border-width: thin; border-bottom-style: groove;">
                      <img alt="" class="style12" src="images/churrasco.jpg" />&nbsp;
                      <asp:Label ID="lblChurras" runat="server" CssClass="style4" 
                          Text="Churrasqueira"></asp:Label>
                  </td>
                  <td align="center" 
                      style="border-right-style: groove; border-left-style: groove; border-width: thin; border-bottom-style: groove;">
                      <asp:ImageButton ID="btnConfirmaChurras" runat="server" Height="36px" 
                          ImageUrl="~/images/confirma.jpg" Width="66px" />
                  </td>
                  <td align="center" style="border-bottom-style: groove; border-width: thin">
                      <asp:ImageButton ID="btnCancelaFesta" runat="server" Height="39px" 
                          ImageUrl="~/images/cancelar.jpg" Width="100px" />
                  </td>
                  <td align="center" 
                      style="border-left-style: groove; border-width: thin; border-bottom-style: groove;">
                      <asp:Label ID="lblDiasAtrasoChurras" runat="server" CssClass="style8" Text="8"></asp:Label>
                  </td>
                  <td align="center" 
                      style="border-right-style: groove; border-left-style: groove">
                      <asp:Label ID="lblValorChurras" runat="server" CssClass="style6" 
                          Text="R$ 30,00"></asp:Label>
                  </td>
              </tr>
              <tr>
                  <td style="border-width: thin; border-left-style: groove;" align="center">
                      <img alt="" class="style12" src="images/festa.jpg" />&nbsp;
                      <asp:Label ID="lblSalaoFesta" runat="server" CssClass="style4" 
                          Text="São de Festa"></asp:Label>
                  </td>
                  <td align="center" 
                      style="border-right-style: groove; border-left-style: groove; border-width: thin">
                      <asp:ImageButton ID="btnConfirmaFesta" runat="server" Height="34px" 
                          ImageUrl="~/images/confirma.jpg" Width="66px" />
                  </td>
                  <td align="Center">
                      <asp:ImageButton ID="btnCancelaChurra" runat="server" Height="39px" 
                          ImageUrl="~/images/cancelar.jpg" Width="100px" />
                  </td>
                  <td align="Center" style="border-left-style: groove; border-width: thin">
                      <asp:Label ID="lblDiasAtrasoFesta" runat="server" CssClass="style8" Text="4"></asp:Label>
                  </td>
                  <td align="center" 
                      style="border-right-style: groove; border-left-style: groove">
                      &nbsp;<asp:Label ID="lblValorFesta" runat="server" CssClass="style6" 
                          Text="R$ 40,00"></asp:Label>
                  </td>
              </tr>
              <tr>
                  <td style="border-top-style: groove; border-width: thin">
                      &nbsp;</td>
                  <td style="border-top-style: groove; border-width: thin">
                      &nbsp;</td>
                  <td style="border-top-style: groove; border-width: thin">
                      &nbsp;</td>
                  <td style="border-style: groove; border-width: thin">
                      <asp:Label ID="Label15" runat="server" CssClass="style9" Text="Desconto:" 
                          style="font-weight: 700; font-size: 10pt"></asp:Label>
                  </td>
                  <td style="border-style: groove; border-width: thin">
                      <asp:Label ID="lblDesconto" runat="server" CssClass="style9" 
                          style="font-weight: 700; font-size: 10pt" Text="R$ 10,00"></asp:Label>
                  </td>
              </tr>
              <tr>
                  <td>
                      &nbsp;</td>
                  <td>
                      &nbsp;</td>
                  <td>
                      &nbsp;</td>
                  <td style="border-style: groove; border-width: thin">
                      <asp:Label ID="Label17" runat="server" CssClass="style5" Text="Total:"></asp:Label>
                  </td>
                  <td style="border-style: groove; border-width: thin">
                      <asp:Label ID="lblTotal" runat="server" CssClass="style6" Text="R$ 60,00"></asp:Label>
                  </td>
              </tr>
          </table>




   </fieldset>
   </div></center>
</asp:Content>
