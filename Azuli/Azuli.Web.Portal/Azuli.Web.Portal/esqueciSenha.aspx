<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="esqueciSenha.aspx.cs" Inherits="Azuli.Web.Portal.resetSenha" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 302px;
        }
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <br /><br /> <br /> <br /><br />
  <center> <h2><b>ESQUECI A SENHA</b></h2></center><br />
  <center><div id="dvProprietario" runat="server" >
   
        
        <table class="btGeral" dir="ltr" frame="border" style="width: 432px" >
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Informe seu e-mail:"></asp:Label>
                </td>
                <td class="style1">
                    <asp:TextBox ID="txtEm" runat="server" Height="21px" Width="274px" 
                        style="margin-left: 0px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEsqueciSenha" runat="server" CssClass="failureNotification" ErrorMessage="*" ValidationGroup="esqueciSenha" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td class="style1">
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnEsqueciSenha" runat="server" CssClass="botao" Text="Solicitar Senha" 
                        Width="110px" onclick="btnEsqueciSenha_Click" 
                        ValidationGroup="esqueciSenha" />
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td class="style1">
                    &nbsp;</td>
            </tr>
        </table>
    </div></center>
    
   <center>
       <br />
       <br />
       <asp:Label ID="lblMsg" runat="server" CssClass="failureNotification"></asp:Label></center> 
     
</asp:Content>
