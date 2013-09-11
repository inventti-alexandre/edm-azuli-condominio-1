<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="PendenciaAgendamentos.aspx.cs" Inherits="Azuli.Web.Portal.PendenciaAgendamentos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style4
        {
            font-weight: bold;
        }
        .accordionContent
        {
            width: 728px;
        }
        .style5
        {
            font-weight: bold;
            font-size: medium;
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
                  <td>
                      <asp:Label ID="Label1" runat="server" CssClass="style5" Text="lblBloco"></asp:Label>
&nbsp;-
                      <asp:Label ID="Label2" runat="server" CssClass="style5" Text="lblApto"></asp:Label>
                  </td>
                  <td>
                      <asp:Label ID="Label5" runat="server" CssClass="style5" Text="Pagamento"></asp:Label>
                  </td>
                  <td>
                      &nbsp;</td>
                  <td>
                      &nbsp;</td>
                  <td>
                      &nbsp;</td>
              </tr>
              <tr>
                  <td>
                      &nbsp;</td>
                  <td>
                      &nbsp;</td>
                  <td>
                      &nbsp;</td>
                  <td>
                      &nbsp;</td>
                  <td>
                      &nbsp;</td>
              </tr>
              <tr>
                  <td>
                      <asp:Label ID="Label3" runat="server" CssClass="style4" 
                          Text="lblAreachurrasqueira"></asp:Label>
                  </td>
                  <td>
                      <asp:ImageButton ID="btnConfirmaChurras" runat="server" Height="36px" 
                          ImageUrl="~/images/confirma.jpg" Width="66px" />
                  </td>
                  <td>
                      <asp:ImageButton ID="btnCancelaFesta" runat="server" Height="39px" 
                          ImageUrl="~/images/cancelar.jpg" Width="100px" />
                  </td>
                  <td>
                      &nbsp;</td>
                  <td>
                      &nbsp;</td>
              </tr>
              <tr>
                  <td>
                      &nbsp;</td>
                  <td>
                      &nbsp;</td>
                  <td>
                      &nbsp;</td>
                  <td>
                      &nbsp;</td>
                  <td>
                      &nbsp;</td>
              </tr>
              <tr>
                  <td style="font-weight: 700">
                      <asp:Label ID="Label4" runat="server" CssClass="style4" Text="lblFesta"></asp:Label>
                  </td>
                  <td>
                      <asp:ImageButton ID="btnConfirmaFesta" runat="server" Height="34px" 
                          ImageUrl="~/images/confirma.jpg" Width="66px" />
                  </td>
                  <td>
                      <asp:ImageButton ID="btnCancelaChurra" runat="server" Height="39px" 
                          ImageUrl="~/images/cancelar.jpg" Width="100px" />
                  </td>
                  <td>
                      &nbsp;</td>
                  <td>
                      &nbsp;</td>
              </tr>
              <tr>
                  <td>
                      &nbsp;</td>
                  <td>
                      &nbsp;</td>
                  <td>
                      &nbsp;</td>
                  <td>
                      &nbsp;</td>
                  <td>
                      &nbsp;</td>
              </tr>
              <tr>
                  <td>
                      &nbsp;</td>
                  <td>
                      &nbsp;</td>
                  <td>
                      &nbsp;</td>
                  <td>
                      &nbsp;</td>
                  <td>
                      &nbsp;</td>
              </tr>
          </table>




   </fieldset>
   </div></center>
</asp:Content>
