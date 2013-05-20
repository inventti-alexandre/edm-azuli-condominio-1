<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="cadastrarClassificado.aspx.cs" Inherits="Azuli.Web.Portal.cadastrarClassificado" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
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
 
 <script type="text/javascript">
     function Mascara(objeto) {
         if (objeto.value.length == 0)
             objeto.value = '(' + objeto.value;

         if (objeto.value.length == 3)
             objeto.value = objeto.value + ')';

         if (objeto.value.length == 8)
             objeto.value = objeto.value + '-';
     }

     function Formata(campo, tammax, teclapres, decimal) {
         var tecla = teclapres.keyCode;
         vr = Limpar(campo.value, "0123456789");
         tam = vr.length;
         dec = decimal

         if (tam < tammax && tecla != 8) {
             tam = vr.length + 1;
         }
         if (tecla == 8) {
             tam = tam - 1;
         }
         if (tecla == 8 || tecla >= 48 && tecla <= 57 || tecla >= 96 && tecla <= 105) {
             if (tam <= dec) {
                 campo.value = vr;
             }
             if ((tam > dec) && (tam <= 5)) {
                 campo.value = vr.substr(0, tam - 2) + "," + vr.substr(tam - dec, tam);
             }
             if ((tam >= 6) && (tam <= 8)) {
                 campo.value = vr.substr(0, tam - 5) + "." + vr.substr(tam - 5, 3) + "," + vr.substr(tam - dec, tam);
             }
             if ((tam >= 9) && (tam <= 11)) {
                 campo.value = vr.substr(0, tam - 8) + "." + vr.substr(tam - 8, 3) + "." + vr.substr(tam - 5, 3) + "," + vr.substr(tam - dec, tam);
             }
             if ((tam >= 12) && (tam <= 14)) {
                 campo.value = vr.substr(0, tam - 11) + "." + vr.substr(tam - 11, 3) + "." + vr.substr(tam - 8, 3) + "." + vr.substr(tam - 5, 3) + "," + vr.substr(tam - dec, tam);
             }
             if ((tam >= 15) && (tam <= 17)) {
                 campo.value = vr.substr(0, tam - 14) + "." + vr.substr(tam - 14, 3) + "." + vr.substr(tam - 11, 3) + "." + vr.substr(tam - 8, 3) + "." + vr.substr(tam - 5, 3) + "," + vr.substr(tam - 2, tam);
             }
         }
     }


</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
 
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <br /><br />
      <div id="imgAnuncio" 
        style="position:absolute; top: 183px; left: 182px; color: #0033CC;">
          <asp:Image ID="imgGrupo" runat="server" 
                    Height="44px" Width="156px" />  </div>
<div  id="dvAnunciar"  runat="server" align="center" >
       
   <fieldset class="loginDisplayLegend">
         <legend class="seuAnuncios" align="left"> Cadastrar Anúncio - Bloco:
                    <asp:Label ID="lblDescBloco" runat="server" Text=""></asp:Label>
                    - Ap:
                    <asp:Label ID="lblDescApartamento" runat="server" Text=""></asp:Label></legend>
            
            
            
            <br />
           
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
                     <asp:FileUpload ID="FileUpload1" runat="server" Width="240px" />
                 </td>
             </tr>
             <tr>
                 <td class="style3">
                     <asp:Label ID="Label3" runat="server" Text="Imagem 2" CssClass="style4"></asp:Label>
                 </td>
                 <td>
                     <asp:FileUpload ID="FileUpload2" runat="server" Width="240px" />
                 </td>
             </tr>
             <tr>
                 <td class="style3">
                     <asp:Label ID="Label4" runat="server" Text="Imagem 3" CssClass="style4"></asp:Label>
                 </td>
                 <td>
                     <asp:FileUpload ID="FileUpload3" runat="server" Width="240px" />
                 </td>
             </tr>
             <tr>
                 <td class="style3">
                     <asp:Label ID="Label5" runat="server" Text="Imagem 4" CssClass="style4"></asp:Label>
                 </td>
                 <td>
                     <asp:FileUpload ID="FileUpload4" runat="server" Width="240px" />
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
                     <asp:TextBox ID="txtTel" onkeyPress="Mascara(this);" runat="server"></asp:TextBox>
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
                     <asp:TextBox ID="txtCel" onkeyPress="Mascara(this);" runat="server"></asp:TextBox>
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
        style="position:absolute; top: 433px; left: 651px; width: 345px;" 
        class="">
   <fieldset class="InstructionPhotoDisplay"> 
  <legend class="instruct">Instrução para Foto</legend>
    <li> <p>Tamanho de arquivo permitido é de <span class="style8">100kb</span> por imagem </p></li><li><p>Extensões permitidas são: 
       <span class="style8">.gif, .jpg, .bmp, .png e .ico!</span></p></li>
   </fieldset>

   </div>
</asp:Content>
