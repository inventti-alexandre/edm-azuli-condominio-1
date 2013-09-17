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
            font-size: 14pt;
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
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <br /><br /><br />
    <center> <div id="dvPesquisaMorador" align="center" runat="server">
    
      <fieldset class="loginDisplayLegend">
     <legend align="left" class="accordionContent">Confirmação de Pagamento Ou Cancelamento de Reservas</legend>




          <table class="accordionContent">
              <tr>
                  <td class="style7" style="border-style: groove; border-width: thin">
                      <asp:Label ID="Label7" runat="server" CssClass="style5" Text="Bloco:"></asp:Label>
&nbsp;<asp:Label ID="lblBloco" runat="server" CssClass="style5"></asp:Label>
&nbsp;-
                      <asp:Label ID="Label8" runat="server" CssClass="style5" Text="Apartamento:"></asp:Label>
                  &nbsp;
                      <asp:Label ID="lblApto" runat="server" CssClass="style5"></asp:Label>
                  </td>
                  <td align="center" class="style7" 
                      style="border-style: groove; border-width: thin">
                      <asp:Label ID="lblPg" runat="server" CssClass="style5" Text="Pagamento"></asp:Label>
                  </td>
                  <td align="center" class="style7" 
                      style="border-style: groove; border-width: thin">
                      <asp:Label ID="lblCancel" runat="server" CssClass="style5" Text="Cancelamento"></asp:Label>
                  </td>
                  <td align="center" class="style7" 
                      style="border-style: groove; border-width: thin">
                      <asp:Label ID="lblDiasAtraso" runat="server" CssClass="style5" 
                          Text="Dias em Atraso"></asp:Label>
                  </td>
                  <td align="center" class="style7" 
                      style="border-style: groove; border-width: thin">
                      <asp:Label ID="lblValor" runat="server" CssClass="style5" Text="Valor"></asp:Label>
                  </td>
              </tr>
              <tr>
                  <td align="center" 
                      style="border-left-style: groove; border-width: thin; border-bottom-style: groove;">
                      &nbsp;
                      <asp:Label ID="lblChurras" runat="server" CssClass="style4" 
                          Text="Churrasqueira"></asp:Label>
                  </td>
                  <td align="center" 
                      style="border-right-style: groove; border-left-style: groove; border-width: thin; border-bottom-style: groove;">
                      <asp:ImageButton ID="btnConfirmaChurras" runat="server" Height="36px" 
                          ImageUrl="~/images/confirma.jpg" Width="66px" />
                  </td>
                  <td align="center" style="border-bottom-style: groove; border-width: thin">
                      <asp:ImageButton ID="btnCancelaChurras" runat="server" Height="39px" 
                          ImageUrl="~/images/cancelar.jpg" Width="100px" />
                  </td>
                  <td align="center" 
                      style="border-left-style: groove; border-width: thin; border-bottom-style: groove;">
                      <asp:Label ID="lblDiasAtrasoChurras" runat="server" CssClass="style8" Text="8"></asp:Label>
                  </td>
                  <td align="left" 
                      
                      style="border-right-style: groove; border-left-style: groove; border-bottom-style: groove;">
                      <asp:Label ID="lblValorChurras" runat="server" CssClass="style6" 
                          Text="R$ 30,00"></asp:Label>
                  </td>
              </tr>
              <tr>
                  <td style="border-width: thin; border-left-style: groove;" align="center">
                      &nbsp;
                      <asp:Label ID="lblSalaoFesta" runat="server" CssClass="style4" 
                          Text="São de Festa"></asp:Label>
                  </td>
                  <td align="center" 
                      style="border-right-style: groove; border-left-style: groove; border-width: thin">
                      <asp:ImageButton ID="btnConfirmaFesta" runat="server" Height="34px" 
                          ImageUrl="~/images/confirma.jpg" Width="66px" />
                  </td>
                  <td align="Center">
                      <asp:ImageButton ID="btnCancelaFestas" runat="server" Height="39px" 
                          ImageUrl="~/images/cancelar.jpg" Width="100px" />
                  </td>
                  <td align="Center" style="border-left-style: groove; border-width: thin">
                      <asp:Label ID="lblDiasAtrasoFesta" runat="server" CssClass="style8" Text="4"></asp:Label>
                  </td>
                  <td align="left" 
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
                      <asp:Label ID="lblDescDesconto" runat="server" CssClass="style9" Text="Desconto:" 
                          style="font-weight: 700; font-size: 10pt"></asp:Label>
                  </td>
                  <td style="border-style: groove; border-width: thin" align="left">
                      <asp:Label ID="lblDesconto" runat="server" CssClass="style9" 
                          style="font-weight: 700; font-size: 14pt" Text="R$ 10,00"></asp:Label>
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
                      <asp:Label ID="lblDestotal" runat="server" CssClass="style5" Text="Total:"></asp:Label>
                  </td>
                  <td style="border-style: groove; border-width: thin" align="left">
                      <asp:Label ID="lblTotal" runat="server" CssClass="style6" Text="R$ 60,00"></asp:Label>
                  </td>
              </tr>
          </table>




   </fieldset>
   </div></center>



    <center> <div id="DvConfirma" align="center" runat="server">
    
    <fieldset class="loginDisplayLegend">
      <legend align="left" class="style10">Novo Cadastro de Morador</legend>
   
  <center> <br /> <br />
     <asp:Label ID="lblMsg" runat="server" 
         Text="Label" style="font-family: Calibri; font-size: 17pt"></asp:Label>
   <br /><br />
     <asp:Button ID="btnCadastrar" runat="server" CssClass="botao" Text="Sim" 
         Width="70px" />
&nbsp;
     <asp:Button ID="btnCancelar" runat="server" CssClass="botao" 
         Text="Não" Width="50px" />
          <br />

     <br /></center></fieldset>
   </div></center>
</asp:Content>
