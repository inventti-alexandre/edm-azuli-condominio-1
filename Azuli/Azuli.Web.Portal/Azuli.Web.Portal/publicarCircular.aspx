<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="publicarCircular.aspx.cs" Inherits="Azuli.Web.Portal.circular" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .register
        {}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    
    <fieldset class="login">
        <legend align="left" class="AlternatingRowStyle">Publicações de Circulares: </legend>
        <br />
        
        <table class="loginDisplay" align="center">
            <tr>
                <td>
                    <asp:Label ID="lblDesc" runat="server" Text="Assunto:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtAssunto" runat="server" 
                        CssClass="register" Height="20px" Width="269px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblMesDEsc" runat="server" Text="Mês de publicação:"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="drpMes" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblAnoDesc" runat="server" Text="Ano da Publicação:"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="drpAno" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td><br />
                    <asp:Label ID="lblArquivo" runat="server" Text="Arquivo a ser publicado:"></asp:Label>
                </td>
                <td>
                    <asp:FileUpload ID="fileWord" runat="server" 
                        CssClass="AlternatingRowStyle" Height="23px" Width="341px" />
                </td>
            </tr>
          
            <tr>
                <td colspan="2" align="center">
                 </td>
                <td>
                    &nbsp;</td>
            </tr>
              <tr>
                <td colspan="2" align="center">
                   <asp:Label ID="lblMsg" runat="server" ForeColor="#006600"></asp:Label></td>
                <td>
                    &nbsp;</td>
            </tr>
               <tr>
                <td colspan="2" align="center">
                 </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:Button ID="btnPublicar" runat="server" CssClass="AlternatingRowStyle" 
                        Text="Publicar" onclick="btnPublicar_Click" />
                </td>
            </tr>
        </table>
        
        
        </fieldset>
</asp:Content>
