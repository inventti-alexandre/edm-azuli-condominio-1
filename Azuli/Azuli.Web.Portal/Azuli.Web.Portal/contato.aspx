<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="contato.aspx.cs" Inherits="Azuli.Web.Portal.contato" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <br />
<fieldset>
   
    <legend title="Abrir Ocorrência" class="accordionContent"> Deixe aqui seu comentário, opinião e sugestão:</legend><br />
   
      
       <br />
   <center>
  <div id="dvCadastro" runat="server" align="center" > 
   
      <table 
          class="MasterMenu">
            <tr>
                <td class="" align="center">
                    <table class="style1" border='0'>
                        <tr>
                            <td class="">
                                <asp:Label ID="lblOcorrencia" runat="server" style="font-weight: 700" 
                                    Text="Seus dados:"></asp:Label>
                            </td>
                            <td class="" align="left">
                                <asp:Label ID="lblBloco" runat="server" CssClass="style5" Text="Bloco:"></asp:Label>
&nbsp;<asp:Label ID="lblDescBloco" runat="server" CssClass="style5"></asp:Label>
&nbsp;-
                                <asp:Label ID="lblAp" runat="server" CssClass="style6" style="font-weight: 700" 
                                    Text="Apartamento:"></asp:Label>
&nbsp;<asp:Label ID="lblDescApartamento" runat="server" CssClass="style5"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="">
                                <asp:Label ID="lblAssunto" runat="server" Font-Bold="True" Text="Assunto:"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="drpListSubject" runat="server" Height="29px" Width="609px" 
                                    CssClass="btGeral"> 
                                
                                    <asp:ListItem Value="-1">Selecionar assunto ..</asp:ListItem>
                                    <asp:ListItem Value="1">Sugestões</asp:ListItem>
                                    <asp:ListItem Value="3">Reportar Problemas</asp:ListItem>
                                    <asp:ListItem Value="4">Comentários</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="style14">
                                <asp:Label ID="lblDescricao" runat="server" Font-Bold="True" 
                                    Text="Descrição"></asp:Label>
                            </td>
                            <td class="style14">
                                 <asp:TextBox ID="txtDescription" runat="server" Height="88px" TextMode="MultiLine" 
                                     Width="602px" ValidationGroup="validaDescricao"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="">
                                &nbsp;</td>
                            <td class="">
                                &nbsp;</td>
                            
                        </tr>
                        </table>
                    <br />
                    
                    <asp:Button ID="btnCadastro" runat="server" CssClass="botao" Text="Ok" 
                        Width="150px"  
                        ValidationGroup="validaDescricao" onclick="btnCadastro_Click" />
&nbsp;&nbsp;&nbsp;&nbsp; 
                    <asp:Button ID="btnLimpar" runat="server" CssClass="botao" 
                        Text="Limpar Campos" ValidationGroup="validaDescricao" />
                </td>
            </tr>
        </table>
                                 <br />
                                 <asp:RequiredFieldValidator ID="rfvDescription" runat="server" 
                                     ControlToValidate="txtDescription" ErrorMessage="Favor descrever seu comentário!" 
                                     Font-Bold="True" ForeColor="Red" 
          ValidationGroup="validaDescricao"></asp:RequiredFieldValidator>
      <br />
      <center>
          <br />
          <asp:Label ID="lblMsg" runat="server" Font-Bold="True" ForeColor="#006600"></asp:Label></center>
      <br />
      <br /> </div>
     </center><br />
   
 </fieldset>&nbsp;&nbsp; 
 
 <center><a href="http://groups.yahoo.com/group/azuli_sjc/join">
  <img src="http://us.i1.yimg.com/us.yimg.com/i/yg/img/i/br/ui/join.gif"
       style="border-style: none; border-color: inherit; border-width: 0px; height: 34px; width: 79px;"
       alt="Clique aqui para cadastrar-se azuli_sjc"/>
  <p>Clique aqui e cadastra-se no Grupo azuli_sjc</p>
</a>
</center>
    
</asp:Content>
