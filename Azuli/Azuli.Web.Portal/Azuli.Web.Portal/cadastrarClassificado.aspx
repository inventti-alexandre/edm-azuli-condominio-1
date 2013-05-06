<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="cadastrarClassificado.aspx.cs" Inherits="Azuli.Web.Portal.cadastrarClassificado" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style3
        {
            width: 163px;
        }
    .style4
    {
        font-weight: bold;
    }
        .style5
        {
            width: 163px;
            height: 28px;
        }
        .style6
        {
            height: 28px;
        }
        .style8
        {
            color: #FF0000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <br /><br />

<div  id="dvAnunciar"  runat="server" align="center" >
       
   <fieldset class="loginDisplayLegend">
         <legend class="seuAnuncios" align="left"> Cadastrar Anúncio - Bloco:
                    <asp:Label ID="lblDescBloco" runat="server" Text=""></asp:Label>
                    - Ap:
                    <asp:Label ID="lblDescApartamento" runat="server" Text=""></asp:Label></legend>
            
            
            
            <br /><div id="dvVeiculo" 
             style="position:absolute; top: 221px; left: 289px; color: #0033CC;"><asp:Label ID="lblGrupo" runat="server"></asp:Label></div>
            <legend class="seuAnunciosTst">  <asp:Image ID="imgGrupo" runat="server" 
                    Height="25px" Width="25px" />  
               </legend>
         <table class="form" cellspacing="9px">
             <tr>
                 <td class="style3">
                   
                     <asp:Label ID="Label10" runat="server" Text="Falar com:" CssClass="style4"></asp:Label>
                   
                 </td>
                 <td align="center">
                     <asp:TextBox ID="txtFalarCom" runat="server" 
                         Width="202px"></asp:TextBox>
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:RequiredFieldValidator ID="rfvFalaCom" runat="server" 
                         CssClass="failureNotification" ErrorMessage="*" Font-Bold="True" 
                         ForeColor="Red" ValidationGroup="validaClassificado" 
                         ControlToValidate="txtFalarCom"></asp:RequiredFieldValidator>
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     </td>
             </tr>
             <tr>
                 <td class="style3">
                   
                     <asp:Label ID="Label11" runat="server" Text="Titúlo do Anúncio" 
                         CssClass="style4"></asp:Label>
                   
                 </td>
                 <td align="center">
                     <asp:TextBox ID="txtTitulo" runat="server" 
                         Width="257px"></asp:TextBox>
                     &nbsp;<asp:RequiredFieldValidator ID="rfvTitulo" runat="server" 
                         CssClass="failureNotification" ErrorMessage="*" Font-Bold="True" 
                         ForeColor="Red" ValidationGroup="validaClassificado" 
                         ControlToValidate="txtTitulo"></asp:RequiredFieldValidator>
                     </td>
             </tr>
             <tr>
                 <td class="style3">
                     <asp:Label ID="Label1" runat="server" Text="Descrição: " CssClass="style4"></asp:Label>
                 </td>
                 <td>
                     <asp:TextBox ID="txtDescricao" runat="server" Height="63px" 
                         TextMode="MultiLine" Width="472px"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="rfvDescricao" runat="server" 
                         CssClass="failureNotification" ErrorMessage="*" Font-Bold="True" 
                         ForeColor="Red" ValidationGroup="validaClassificado" 
                         ControlToValidate="txtDescricao"></asp:RequiredFieldValidator>
                 </td>
             </tr>
             <tr>
                 <td class="style3">
                     <asp:Label ID="Label2" runat="server" Text="Imagem 1" CssClass="style4"></asp:Label>
                 </td>
                 <td>
                     <asp:FileUpload ID="FileUpload1" runat="server" />
                 </td>
             </tr>
             <tr>
                 <td class="style3">
                     <asp:Label ID="Label3" runat="server" Text="Imagem 2" CssClass="style4"></asp:Label>
                 </td>
                 <td>
                     <asp:FileUpload ID="FileUpload2" runat="server" />
                 </td>
             </tr>
             <tr>
                 <td class="style3">
                     <asp:Label ID="Label4" runat="server" Text="Imagem 3" CssClass="style4"></asp:Label>
                 </td>
                 <td>
                     <asp:FileUpload ID="FileUpload3" runat="server" />
                 </td>
             </tr>
             <tr>
                 <td class="style3">
                     <asp:Label ID="Label5" runat="server" Text="Imagem 4" CssClass="style4"></asp:Label>
                 </td>
                 <td>
                     <asp:FileUpload ID="FileUpload4" runat="server" />
                 </td>
             </tr>
             <tr>
                 <td class="style3">
                     <asp:Label ID="Label6" runat="server" Text="E-mail contato" CssClass="style4"></asp:Label>
                 </td>
                 <td>
                     <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                 &nbsp;<asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                         ControlToValidate="txtEmail" CssClass="failureNotification" 
                         ErrorMessage="Campo Obrigatório" Font-Bold="True" ForeColor="Red" 
                         ValidationGroup="validaClassificado"></asp:RequiredFieldValidator>
                 </td>
             </tr>
             <tr>
                 <td class="style3">
                     <asp:Label ID="Label7" runat="server" Text="Tefone:" CssClass="style4"></asp:Label>
                 </td>
                 <td>
                     <asp:TextBox ID="txtTel" runat="server"></asp:TextBox>
                 &nbsp;<asp:RequiredFieldValidator ID="rfvTelefone" runat="server" 
                         ControlToValidate="txtTel" CssClass="failureNotification" 
                         ErrorMessage="Campo Obrigatório" Font-Bold="True" ForeColor="Red" 
                         ValidationGroup="validaClassificado"></asp:RequiredFieldValidator>
                 </td>
             </tr>
             <tr>
                 <td class="style3">
                     <asp:Label ID="Label8" runat="server" Text="Celular" CssClass="style4"></asp:Label>
                 </td>
                 <td>
                     <asp:TextBox ID="txtCel" runat="server"></asp:TextBox>
                 &nbsp;<asp:RequiredFieldValidator ID="rfvCelular" runat="server" 
                         ControlToValidate="txtCel" CssClass="failureNotification" 
                         ErrorMessage="Campo Obrigatório" Font-Bold="True" ForeColor="Red" 
                         ValidationGroup="validaClassificado"></asp:RequiredFieldValidator>
                 </td>
             </tr>
             <tr>
                 <td class="style3">
                     <asp:Label ID="Label9" runat="server" Text="Preço (Sem Pontuação)" 
                         CssClass="style4"></asp:Label>
                 </td>
                 <td>
                     <asp:TextBox ID="txtValor" runat="server" Width="61px"></asp:TextBox>
                 &nbsp;<asp:RequiredFieldValidator ID="rfvValor" runat="server" 
                         ControlToValidate="txtValor" CssClass="failureNotification" 
                         ErrorMessage="Campo Obrigatório" Font-Bold="True" ForeColor="Red" 
                         ValidationGroup="validaClassificado"></asp:RequiredFieldValidator>
                 </td>
             </tr>
             <tr>
                 <td class="style5">
                     </td>
                 <td class="style6">
                     <asp:Button ID="btnAnunciar" runat="server" CssClass="btGeral" Height="28px" 
                         onclick="btnAnunciar_Click" Text="Anunciar" Width="80px" 
                         ValidationGroup="validaClassificado" />
                     <asp:Button ID="btnCancelar" runat="server" CssClass="btGeral" Height="28px" 
                         Text="Cancelar" Width="82px" />
                 </td>
             </tr>
         </table>
            
            
            
            <br />
         
      
                   
         
      
   </fieldset>   </div>

   <div id="dvGravou" style="position:absolute; top: 221px; left: 660px; font-weight: 700; font-size: small;" 
    runat="server">  <center><asp:Label ID="lblAnuncio" runat="server" CssClass="main" ForeColor="#009900"></asp:Label></center></div>

   <div id="dvInfo" 
        style="position:absolute; top: 424px; left: 714px; width: 345px;" 
        class="">
   <fieldset class="InstructionPhotoDisplay"> 
  <legend class="instruct">Instrução para Foto</legend>
    <li> <p>Tamanho de arquivo permitido é de <span class="style8">100kb</span> por imagem </p></li><li><p>Extensões permitidas são: 
       <span class="style8">.gif, .jpg, .bmp, .png e .ico!</span></p></li>
   </fieldset>

   </div>
</asp:Content>
