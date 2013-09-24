<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="PendenciaAgendamentos.aspx.cs" Inherits="Azuli.Web.Portal.PendenciaAgendamentos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .accordionContent
        {
            width: 982px;
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
        .style11
        {
            height: 45px;
        }
        .style12
        {
            color: #006600;
            font-size: 10pt;
        }
        .style13
        {
            height: 26px;
            width: 95px;
        }
        .style14
        {
            width: 95px;
        }
        .style15
        {
            height: 45px;
            width: 95px;
        }
        .style16
        {
            font-weight: bold;
            font-size: 10pt;
        }
        .style17
        {
            font-weight: bold;
            font-size: 10pt;
            color: #0000FF;
        }
        .style18
        {
            border-botom: 2px solid #999999;
            font-family: Verdana;
            font-size: 10pt;
            color: #666666;
            border-radius: 1em;
            height: 15px;
            width: 982px;
            border-left: 2px solid #999999;
            border-right: 2px solid #999999;
            padding: 5px;
            background-color: #F0F0F0;
            font-weight: bold;
        }
        #DvConfirma
        {
            width: 977px;
        }
        .style19
        {
            border-botom: 2px solid #999999;
            font-family: Verdana;
            font-size: 12pt;
            color: #666666;
            border-radius: 1em;
            height: 15px;
            width: 982px;
            border-left: 2px solid #999999;
            border-right: 2px solid #999999;
            padding: 5px;
            background-color: #F0F0F0;
        }
        .style20
        {
            font-size: 13pt;
            font-weight: bold;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <br /><br /><br />
    <center> <div id="dvPesquisaMorador" align="center" runat="server">
    
      <fieldset class="loginDisplayLegend">
     <legend align="left" class="style18">Confirmação de Pagamento Ou Cancelamento de Reservas:
          </legend>


          <br />
          <asp:Label ID="Label9" runat="server" 
              style="color: #006AB2; font-weight: 700; font-size: 12pt" 
              Text="Data da Reserva: "></asp:Label>
      <asp:Label ID="lblDataReservaEtapa1" runat="server" CssClass="accordionContent" 
          style="font-weight: 700; font-family: Calibri; font-size: 14pt"></asp:Label>
          <br />


          <br />


          <table class="accordionContent">
              <tr>
                  <td class="style7" style="border-style: groove; border-width: thin">
                      <asp:Label ID="Label7" runat="server" CssClass="style16" Text="Bloco:"></asp:Label>
                      <asp:Label ID="lblBloco" runat="server" CssClass="style17"></asp:Label>
                      &nbsp;
                      <asp:Label ID="Label8" runat="server" CssClass="style16" Text="Apartamento:"></asp:Label>
                      <asp:Label ID="lblApto" runat="server" CssClass="style17"></asp:Label>
                  </td>
                  <td align="center" class="style7" 
                      style="border-style: groove; border-width: thin">
                      <asp:Label ID="lblPg" runat="server" CssClass="style16" Text="Pagamento"></asp:Label>
                  </td>
                  <td align="center" class="style7" 
                      style="border-style: groove; border-width: thin">
                      <asp:Label ID="lblCancel" runat="server" CssClass="style16" Text="Cancelamento"></asp:Label>
                  </td>
                  <td align="center" class="style13" 
                      style="border-style: groove; border-width: thin">
                      <asp:Label ID="lblDiasAtraso" runat="server" CssClass="style16" 
                          Text="Dias em Atraso"></asp:Label>
                  </td>
                  <td align="center" class="style7" 
                      style="border-style: groove; border-width: thin">
                      <asp:Label ID="lblValor" runat="server" CssClass="style16" Text="Valor"></asp:Label>
                  </td>
              </tr>
              <tr>
                  <td align="center" 
                      style="border-left-style: groove; border-width: thin; border-bottom-style: groove;">
                      &nbsp;
                      <asp:Label ID="lblChurras" runat="server" CssClass="style16" 
                          Text="Churrasqueira"></asp:Label>
                  </td>
                  <td align="center" 
                      style="border-right-style: groove; border-left-style: groove; border-width: thin; border-bottom-style: groove;">
                      <asp:Button ID="btnConfirmaChurras" runat="server" CssClass="botao" 
                          Text="Confirma Churrasqueira" BackColor="#006600" ForeColor="White" 
                          onclick="btnConfirmaChurras_Click" Height="29px" />
                  </td>
                  <td align="center" style="border-bottom-style: groove; border-width: thin">
                      <asp:Button ID="btnCancelarChurras" runat="server" CssClass="botao" 
                          Text="Cancela Churraqueira" BackColor="#CC3300" ForeColor="White" 
                          onclick="btnCancelarChurras_Click" Height="30px" />
                  </td>
                  <td align="center" 
                      
                      style="border-left-style: groove; border-width: thin; border-bottom-style: groove;" 
                      class="style14">
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
                      <asp:Label ID="lblSalaoFesta" runat="server" CssClass="style16" 
                          Text="São de Festa"></asp:Label>
                  </td>
                  <td align="center" 
                      style="border-right-style: groove; border-left-style: groove; border-width: thin">
                      <asp:Button ID="btnConfirmaSalao" runat="server" CssClass="botao" 
                          Text="Confirma Salão de Festa" BackColor="#006600" ForeColor="White" 
                          onclick="btnConfirmaSalao_Click" Height="26px" />
                  </td>
                  <td align="Center">
                      <asp:Button ID="btnCancelaFesta" runat="server" CssClass="botao" 
                          Text="Cancela Festa" BackColor="#CC0000" ForeColor="White" 
                          onclick="btnCancelaFesta_Click" Height="26px" />
                  </td>
                  <td align="Center" style="border-left-style: groove; border-width: thin" 
                      class="style14">
                      <asp:Label ID="lblDiasAtrasoFesta" runat="server" CssClass="style8" Text="4"></asp:Label>
                  </td>
                  <td align="left" 
                      style="border-right-style: groove; border-left-style: groove">
                      &nbsp;<asp:Label ID="lblValorFesta" runat="server" CssClass="style6" 
                          Text="R$ 40,00"></asp:Label>
                  </td>
              </tr>
              <tr>
                  <td style="border-top-style: groove; border-width: thin" class="style11">
                      </td>
                  <td style="border: thin groove #CCCCCC;" align="center" 
                      class="style11">
                      <asp:Button ID="btnConfirmALL" runat="server" CssClass="botao" Text="Confirma tudo" 
                          BackColor="#006600" ForeColor="White" Height="34px" 
                          style="font-size: 11pt" onclick="btnConfirmALL_Click" />
                  </td>
                  <td style="border: thin groove #CCCCCC;" align="center" 
                      class="style11">
                      <asp:Button ID="btnCancelAll" runat="server" CssClass="botao" Text="Cancela Tudo" 
                          BackColor="#CC0000" ForeColor="White" Height="36px" 
                          style="font-size: 11pt" onclick="btnCancelAll_Click" />
                  </td>
                  <td style="border-style: groove; border-width: thin" class="style15">
                      <asp:Label ID="lblDescDesconto" runat="server" CssClass="style9" Text="Desconto:" 
                          style="font-weight: 700; font-size: 10pt"></asp:Label>
                  </td>
                  <td style="border-style: groove; border-width: thin" align="left" 
                      class="style11">
                      <asp:Label ID="lblDesconto" runat="server" CssClass="style12" 
                          style="font-weight: 700; " Text="R$ 10,00"></asp:Label>
                  </td>
              </tr>
              <tr>
                  <td>
                      &nbsp;</td>
                  <td>
                      &nbsp;</td>
                  <td>
                      &nbsp;</td>
                  <td style="border-style: groove; border-width: thin" class="style14">
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
    
    <fieldset class="loginDisplayAdmin">
   <legend class="style19"> 
       <asp:Label ID="lblStatus" runat="server" Text="Label"></asp:Label>
        </legend>
  <center> <br /> <br />
     <asp:Label ID="lblMsg" runat="server" 
         Text="Label" style="font-family: Calibri; font-size: 17pt"></asp:Label>
      <br />
      <br />
   <br />
      <span class="style20">Reserva para:&nbsp; </span>
      <asp:Label ID="lblDataReserva" runat="server" CssClass="accordionContent" 
          style="font-weight: 700; font-family: Calibri; font-size: 14pt"></asp:Label>
      <br />
      <br />
      <span class="style20">Bloco e Apto:</span>
      <asp:Label ID="lblBlocoApto" runat="server" CssClass="accordionContent" 
          style="font-weight: 700; font-family: Calibri; font-size: 14pt"></asp:Label>
      <br />
      <br />
      <span class="style20">Observação:</span>
      <asp:TextBox ID="txtObs" runat="server" Height="59px" TextMode="MultiLine"></asp:TextBox>
      <br />
    <br />
      <br />
     <asp:Button ID="btnCadastrar" runat="server" CssClass="botao" Text="Sim" 
         Width="70px" Height="35px" onclick="btnCadastrar_Click" />
&nbsp;
     <asp:Button ID="btnCancelar" runat="server" CssClass="botao" 
         Text="Não" Width="70px" Height="35px" onclick="btnCancelar_Click" />
          <br />

     <br /></center></fieldset>
   </div></center>
</asp:Content>
