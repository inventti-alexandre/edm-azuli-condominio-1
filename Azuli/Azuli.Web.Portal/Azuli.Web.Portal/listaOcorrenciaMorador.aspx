<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="listaOcorrenciaMorador.aspx.cs" Inherits="Azuli.Web.Portal.listaOcorrenciaMorador" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .newStyle1
        {
            color: #0000FF;
        }
    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br /> <br /><br /><br />
    <fieldset>
        <legend title="Abrir Ocorrência">Minhas Ocorrência </legend>
        

    <div  id="dvOcorrencia" runat="server">
    <div  id="dvOconteudo" runat="server">
        <div class="AlternatingRowStyle" id="dvCabecalho" style="position:relative; " 
            runat="server">
            
            	Ocorrência
                <asp:Label ID="lblOcorrencia" runat="server"></asp:Label></div>
                <div style=" position:absolute; right:0px; top:5px; width:50px; font-size:14px"></div>
                
            <br>
                        
          <table width="100%" border="0" cellspacing="0" cellpadding="10" >
            <tr>
                <td width='100' valign="top" style="font-size:14px;">ASSUNTO:</td>
                <td valign="top" style="font-size:14px;"><strong>
                    <asp:Label ID="lblAssunto" runat="server" Text="Label"></asp:Label>
                    </strong></td>
            </tr>
           
            <tr>
                <td valign="top" style="font-size:14px;">Data Abertura:</td>
                <td valign="top" style="font-size:14px;">
                    <asp:Label ID="lblDataAbertura" runat="server"></asp:Label>
                </td>
            </tr>
            </table>
            
			            
			<div class="AlternatingRowStyle" id="dvMorador" style="position:relative; " 
            runat="server">
            	<span class="icon-article"></span>
                <h3>&nbsp;<asp:Label ID="lblMorador" runat="server"></asp:Label>
                </h3>
			</div>
            
			<div style="border:1px solid #CCC; padding:20px; margin-bottom:20px;">
            
                <asp:Label ID="lblMensagem" runat="server" Text="lblMensagem"></asp:Label>
                                
            </div>

                        
		

                  


    
       <div class="AlternatingRowStyle" id="DivRespostaAutomatica" style="position:relative; " 
            runat="server">
                <h3>Atendimento Azuli Sindico </h3>
			</div>
            
			<div style="border:1px solid #CCC; padding:20px; margin-bottom:20px;">
            
            	Prezado Morador<br><br> Seu assunto foi recebido, e em breve retornarei. Obrigado por entrar em contato.
		<br><br>Att<br>Flávio</div>

                  

                  </div></div>
                  <div class="AlternatingRowStyle" id="DivRespostaSindico" style="position:relative; " 
            runat="server">
                <h3>Atendimento Azuli Sindico </h3>
			</div>
            
			<div runat="server"  id="DivRespostaSindico1" style="border:1px solid #CCC; padding:20px; margin-bottom:20px;">
            
            	Prezado <asp:Label ID="lblMoradorResposta" runat="server" Text=""></asp:Label><br><br> 
                <asp:Label ID="lblResposta" runat="server" Text=""></asp:Label>
		<br><br>Att<br>Flávio</div>



            </fieldset>
    
</asp:Content>
