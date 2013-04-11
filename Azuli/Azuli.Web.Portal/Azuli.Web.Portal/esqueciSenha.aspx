<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="esqueciSenha.aspx.cs" Inherits="Azuli.Web.Portal.esqueciSenha" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head id="Head1" runat="server">
    <title></title>
    <link href="~/Styles/Site.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/ScriptAzuli.js" type="text/javascript"></script>
 
</head>
<body>
    <form id="Form1" runat="server">
    <div class="page">
        <div class="header">
            <div class="title">
                <div class="title">
                
                <img src="images/banner.jpg" style="height: 86px; width: 960px" />
           
            </div>
             
            </div>

              </div>
        <div class="main">
       <p></p>
            <asp:Button ID="btnHome" runat="server" CssClass="botao" 
                        Text="Home" onclick="btnHome_Click" Height="27px" Width="67px" /></p>
    <br /><br /> <br /> <br /><br />
  <center> <h2><b>ESQUECI A SENHA</b></h2></center><br />
  <center>
   
        
        <table class="btGeral" dir="ltr" frame="border" style="width: 432px" >
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Informe seu e-mail:"></asp:Label>
                </td>
                <td class="style1">
                    <asp:TextBox ID="txtEm" runat="server" Height="21px" Width="274px" 
                        style="margin-left: 0px" ValidationGroup="esqueciSenha"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEsqueciSenha" runat="server" 
                        CssClass="failureNotification" ErrorMessage="*" ValidationGroup="esqueciSenha" 
                        ControlToValidate="txtEm"></asp:RequiredFieldValidator>
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
                    <asp:Button ID="btnEsqueci" runat="server" CssClass="botao" 
                        Text="Solicitar Senha" onclick="btnEsqueci_Click" />
                </td>
            </tr>
            <tr>
                <td>
               
                    &nbsp;</td>
                <td class="style1">
                    &nbsp;</td>
            </tr>
        </table>
</center>
    
   <center>
       <br />
       <br />
       <asp:Label ID="lblMsg" runat="server" CssClass="failureNotification"></asp:Label></center> 
     
                 
    </div>
     
                  <br />
      
        </div>
 
  <div class="footer">
   
      © FernandesVilela Soluções de TI. INC 2013. Todos os direitos reservados 
           <a href="mailto:edmls@ig.com.br">
               <img src="images/correio.jpg" style="height: 17px; width: 29px" /></a> 

    </div>
    </form>
</body>
</html>







