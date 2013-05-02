<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DetalheClassificado.aspx.cs" Inherits="Azuli.Web.Portal.DetalheClassificado" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style2
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <br /><br />

<div  id="dvAnunciar"  runat="server" align="center" >
       
   <fieldset class="loginDisplayLegend">
         <legend class="accordionContent" align="left"> Cadastrar Anúncio - Bloco:
                    <asp:Label ID="lblDescBloco" runat="server" Text=""></asp:Label>
                    - Apartamento:
                    <asp:Label ID="lblDescApartamento" runat="server" Text=""></asp:Label></legend>
            
            
            
            <br />
         <table class="style2">
             <tr>
                 <td>
                     <asp:Label ID="Label1" runat="server" Text="Descrição: "></asp:Label>
                 </td>
                 <td>
                     <asp:TextBox ID="txtDescricao" runat="server" Height="63px" 
                         TextMode="MultiLine" Width="703px"></asp:TextBox>
                 </td>
             </tr>
             <tr>
                 <td>
                     <asp:Label ID="Label2" runat="server" Text="Imagem 1"></asp:Label>
                 </td>
                 <td>
                     <asp:FileUpload ID="FileUpload1" runat="server" />
                 </td>
             </tr>
             <tr>
                 <td>
                     <asp:Label ID="Label3" runat="server" Text="Imagem 2"></asp:Label>
                 </td>
                 <td>
                     <asp:FileUpload ID="FileUpload2" runat="server" />
                 </td>
             </tr>
             <tr>
                 <td>
                     <asp:Label ID="Label4" runat="server" Text="Imagem 3"></asp:Label>
                 </td>
                 <td>
                     <asp:FileUpload ID="FileUpload3" runat="server" />
                 </td>
             </tr>
             <tr>
                 <td>
                     <asp:Label ID="Label5" runat="server" Text="Imagem 4"></asp:Label>
                 </td>
                 <td>
                     <asp:FileUpload ID="FileUpload4" runat="server" />
                 </td>
             </tr>
             <tr>
                 <td>
                     <asp:Label ID="Label6" runat="server" Text="E-mail contato"></asp:Label>
                 </td>
                 <td>
                     <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                 </td>
             </tr>
             <tr>
                 <td>
                     <asp:Label ID="Label7" runat="server" Text="Tefone:"></asp:Label>
                 </td>
                 <td>
                     <asp:TextBox ID="txtTel" runat="server"></asp:TextBox>
                 </td>
             </tr>
             <tr>
                 <td>
                     <asp:Label ID="Label8" runat="server" Text="Celular"></asp:Label>
                 </td>
                 <td>
                     <asp:TextBox ID="txtCel" runat="server"></asp:TextBox>
                 </td>
             </tr>
             <tr>
                 <td>
                     <asp:Label ID="Label9" runat="server" Text="Valor"></asp:Label>
                 </td>
                 <td>
                     <asp:TextBox ID="txtValor" runat="server"></asp:TextBox>
                 </td>
             </tr>
             <tr>
                 <td>
                     &nbsp;</td>
                 <td>
                     &nbsp;</td>
             </tr>
         </table>
            
            
            
            <br />
         
      
   </fieldset>   </div>



</asp:Content>
