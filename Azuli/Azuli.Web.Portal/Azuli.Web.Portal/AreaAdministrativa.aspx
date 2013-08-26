<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="AreaAdministrativa.aspx.cs" Inherits="Azuli.Web.Portal.AreaAdministrativa" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
   
    <style type="text/css">
        .style3
        {
            height: 28px;
            width: 243px;
        }
        .style4
        {
            font-size: 12pt;
            font-weight: 700;
        }
        .style5
        {
            font-size: 12pt;
        }
        .style6
        {
            font-size: 12pt;
            font-weight: bold;
        }
        .style7
        {
            font-size: 12pt;
            font-family: Calibri;
        }
        .style8
        {
            background-color: #F0F0F0;
            border-left: 2px solid #999999;
            border-right: 2px solid #999999;
            border-botom: 2px solid #999999;
            padding: 5px 5px 5px 5px;
            font-family: Calibri;
            font-size: 8pt;
            color: #666666;
            border-radius: 1em;
            height: 15px;
        }
        .style9
        {
            background-color: #F0F0F0;
            border-left: 2px solid #999999;
            border-right: 2px solid #999999;
            border-botom: 2px solid #999999;
            padding: 5px 5px 5px 5px;
            font-family: Verdana;
            font-size: 13pt;
            color: #666666;
            height: 15px;
             border-radius: 1em;
        }
        .style10
        {
            background-color: #F0F0F0;
            border-left: 2px solid #999999;
            border-right: 2px solid #999999;
            border-botom: 2px solid #999999;
            padding: 5px 5px 5px 5px;
            font-family: Verdana;
            font-size: 11pt;
            color: #666666;
            height: 15px;
            border-radius: 1em;
        }
        .style11
        {
            font-weight: bold;
        }
        .style13
        {
            font-size: 12pt;
            width: 329px;
        }
        .style14
        {
            width: 19px;
            height: 18px;
        }
        .style15
        {
            width: 23px;
            height: 17px;
        }
        .style16
        {
            font-weight: bold;
            font-family: Calibri;
            font-size: 14pt;
            color: #006600;
        }
        .accordionContent
        {
            font-size: 10pt;
        }
    </style>
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <br /><br /><br />
    
     &nbsp;
    
     <asp:Label ID="Label8" runat="server" 
        style="font-weight: 700; font-family: Calibri; font-size: 13pt; color: #006600" 
        Text="Data de Reserva Disponível: "></asp:Label>
    :&nbsp;
    &nbsp;
    <asp:Label ID="lblDataReserva" runat="server" 
        style="font-weight: 700; font-family: Calibri; font-size: 14pt" 
        CssClass="accordionContent"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <img alt="" src="images/reserva.jpg" style="height: 17px; width: 22px" /><asp:LinkButton 
        ID="lnkBack" runat="server" CssClass="accordionContent" onclick="lnkBack_Click">Voltar para o calendário</asp:LinkButton>
&nbsp; <hr />
    
     <div id="dvPesquisaMorador" align="center" runat="server">
    
      <fieldset class="loginDisplayLegend">
     <legend align="left" class="style10">Agendamento para Moradores: </legend>
   
     
            <center>
             <table  style="height: 83px; width: 546px;" class="accordionContent">
                        <tr>
                            <td class="style3">
                                <asp:Label ID="lblSelecioneBloco" runat="server" Font-Bold="True" 
                                    Text="Selecione o Bloco:" style="font-size: 12pt"></asp:Label>
                            </td>
                            <td class="style13" align="left">
                                <asp:DropDownList ID="drpBloco" runat="server" Height="20px" Width="46px" 
                                    CssClass="style4">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                             <asp:ListItem>6</asp:ListItem>
                        </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="style3">
                                <asp:Label ID="lblApart" runat="server" Font-Bold="True" 
                                    Text="Digite o Apartamento:" style="font-size: 12pt"></asp:Label>
                            </td>
                            <td class="style13" align="left">
                                <asp:TextBox ID="txtAp" runat="server" 
                                    onKeyPress="return Decimal(this,event);"  Width="58px" CssClass="style4"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvPesquisaAP" runat="server" 
                                    ControlToValidate="txtAp" ErrorMessage="Favor preencher o Apartamento!" 
                                    ValidationGroup="pesquisaAP" 
                                    style="font-family: Calibri; font-size: 11pt; color: #FF3300; font-weight: 700"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style3">
                                &nbsp;</td>
                            <td class="style13" align="left">
                                <asp:Button ID="btnOk" runat="server" CssClass="botao" Text="Pesquisar" 
                                    Width="75px" onclick="btnOk_Click" ValidationGroup="pesquisaAP" />
&nbsp;</td>
                        </tr>
               
        </table></center>
  </fieldset> </div> 
  
 <center> <asp:Label ID="lblMsgCadastro" runat="server" CssClass="failureNotification" 
         ForeColor="#0066FF"></asp:Label></center>

 
    <div id="dvNewUser" align="center" runat="server">
    <fieldset class="loginDisplayLegend">
      <legend align="left" class="style10">Novo Cadastro de Morador</legend>
   
  <center> <br /> <br />
     <asp:Label ID="lblMsg" runat="server" 
         Text="Label" style="font-family: Calibri; font-size: 17pt"></asp:Label>
   <br /><br />
     <asp:Button ID="btnCadastrar" runat="server" CssClass="botao" Text="Sim" 
         Width="70px" onclick="btnCadastrar_Click" />
&nbsp;
     <asp:Button ID="btnCancelar" runat="server" CssClass="botao" 
         onclick="btnCancelar_Click" Text="Não" Width="50px" />
          <br />

     <br /></center></fieldset></div>

        <div id="dvDadosMorador" align="center" runat="server">
     <fieldset class="loginDisplayLegend">
     <legend align="left" class="style10">&nbsp;<img alt="" class="style15" 
             src="images/clientes.jpg" /> Dados do Morador</legend>
  

      <center>  <table style="border: thin solid #C0C0C0; height: auto; width: 409px;" 
              class="accordionContent">
            <tr>
                <td align="center" style="margin-left: 40px">
                    <table class="style1" border='0'>
                        <tr>
                            <td class="style6">
                                <asp:Label ID="lblProprietario" runat="server" Font-Bold="True" Text="Nome:"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblProprietarioDesc" runat="server" CssClass="style16"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style6">
                                <asp:Label ID="lblBloco" runat="server" Font-Bold="True" Text="Bloco:"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:Label ID="lblBlocoDesc" runat="server" Text="6" CssClass="style16"></asp:Label>
                            </td>
                        </tr>
                       
                        <tr>
                            <td class="style6">
                                <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="Apartamento: "></asp:Label>
                            </td>
                            <td align="center">
                                <asp:Label ID="lblApartDesc" runat="server" Text="301" CssClass="style16"></asp:Label>
                            </td>
                        </tr>
                       
                        </table>
                    <br />
                    <br />
                    <asp:Button ID="btnOkPesquisa" runat="server" CssClass="botao" Text="Confirmar" 
                        Width="90px" onclick="btnOkPesquisa_Click" Height="27px" />
&nbsp;&nbsp;&nbsp;&nbsp; 
                    <asp:Button ID="btnCancel0" runat="server" CssClass="botao" 
                        Text="Cancelar" onclick="btnCancel0_Click1"  />
                </td>
            </tr>
        </table></center><br />
   </fieldset> </div>
 
 <center> <div id="dvCadastro"  runat="server" align="center" >
 <fieldset class="loginDisplayLegend"> 
 <legend class="style9">
     <img alt="" class="style14" src="images/novo_morador_visitante.png" /> Cadastrar Moradores</legend>
 
      <table class="accordionContent" align="center">
            <tr>
                <td class="style11" align="center">
                    <table class="style1" border='0'>
                        <tr>
                            <td class="style6">
                                <asp:Label ID="lblPropre1" runat="server" Font-Bold="True" Text="Morador" 
                                    CssClass="style7"></asp:Label>
                            </td>
                            <td class="style9">
                                <asp:TextBox ID="txtMorador1" runat="server" Width="167px" CssClass="style5"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvMorador1" runat="server" 
                                    ControlToValidate="txtMorador1" CssClass="failureNotification" ErrorMessage="*" 
                                    ValidationGroup="cadastraMorador"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style7">
                                <asp:Label ID="lblEmail" runat="server" Font-Bold="True" Text="E-mail" 
                                    CssClass="style7"></asp:Label>
                            </td>
                            <td class="style8">
                            <asp:TextBox ID="txtEmail" runat="server" Width="165px" CssClass="style5" 
                                    AutoPostBack="True" ontextchanged="txtEmail_TextChanged">Não tem no momento</asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style6">
                                <asp:Label ID="Label4" runat="server" Font-Bold="True" Text="Apartamento: " 
                                    CssClass="style7"></asp:Label>
                            </td>
                            <td class="style9">
                                 <asp:TextBox ID="txtApartamento" runat="server" 
                                     onKeyPress="return Decimal(this,event);"  Width="53px" CssClass="style6"></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="rfvAp" runat="server" 
                                     ControlToValidate="txtApartamento" CssClass="failureNotification" 
                                     ErrorMessage="*" ValidationGroup="cadastraMorador"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style6">
                                <asp:Label ID="Label6" runat="server" Font-Bold="True" Text="Bloco:" 
                                    CssClass="style7"></asp:Label>
                            </td>
                            <td class="style9">
                                 <asp:TextBox ID="txtBlocos" runat="server" 
                                     onKeyPress="return Decimal(this,event);"  Width="53px" CssClass="style6" />
                                 <asp:RequiredFieldValidator ID="rfvBloco" runat="server" 
                                     ControlToValidate="txtBlocos" CssClass="failureNotification" ErrorMessage="*" 
                                     ValidationGroup="cadastraMorador"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <br />
                    <br />
                    <asp:Button ID="btnCadastroMorador" runat="server" CssClass="botao" Text="Efetuar Cadastro" 
                        Width="150px" onclick="btnCadastroMorador_Click" 
                        ValidationGroup="cadastraMorador" 
                        style="font-family: Calibri; font-size: 12pt; font-weight: bold" />
&nbsp;&nbsp;&nbsp;&nbsp; 
                    <asp:Button ID="btnCancelarCadastro" runat="server" CssClass="botao" 
                        Text="Cancelar cadastro" onclick="btnCancelarCadastro_Click" 
                        style="font-family: Calibri; font-size: 12pt; font-weight: bold"  />
                </td>
            </tr>
        </table>
      
  </fieldset>   </div></center>


</asp:Content>
