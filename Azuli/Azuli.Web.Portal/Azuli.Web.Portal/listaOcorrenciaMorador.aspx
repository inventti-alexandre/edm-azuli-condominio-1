<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="listaOcorrenciaMorador.aspx.cs" Inherits="Azuli.Web.Portal.listaOcorrenciaMorador" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .newStyle1
        {
            color: #0000FF;
        }
        .style1
        {
            font-weight: bold;
        }
        #dvOconteudo
        {
            width: 909px;
        }
    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <br />
   
    <fieldset>
        <legend title="Abrir Ocorrência" class="accordionContent">Minhas Ocorrência </legend>
        
        <br />
    <div  id="dvOcorrencia" runat="server" style="background-color: #EAEAEA">
    <div  id="dvOconteudo" runat="server">
        
            
            	<b>Ocorrência&nbsp;&nbsp;</b><asp:Label ID="lblOcorrencia" runat="server" Font-Bold="True" CssClass="style1"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:LinkButton ID="lnkVoltar" runat="server" CssClass="accordionContent" 
                    Height="16px" onclick="lnkVoltar_Click" Width="40px">Voltar</asp:LinkButton>
        </div>
              <hr style="border: 1px inset #A6A6A6; background-color: #FFFFFF;" />
                
          
          
             
          <table width="100%" border="0" cellspacing="0" cellpadding="10" >
            <tr>
                <td width='100' valign="top" style="font-size:14px;">ASSUNTO:</td>
                <td valign="top" style="font-size:14px;"><strong>
                    <asp:Label ID="lblAssunto" runat="server" Text="Label" Font-Bold="False"></asp:Label>
                    </strong></td>
            </tr>
           
            <tr>
                <td valign="top" style="font-size:14px;">Data Abertura:</td>
                <td valign="top" style="font-size:14px;">
                    <asp:Label ID="lblDataAbertura" runat="server" Font-Bold="False"></asp:Label>
                </td>
            </tr>
            </table>
           
            <div class="" id="dvCabecalho" style="position:relative; " 
            runat="server">
			            
			<div class="AlternatingRowStyle" id="dvMorador" style="position:relative; " 
            runat="server">
            	<span class="icon-article"></span>
                <h3>&nbsp;<asp:Label ID="lblMorador" runat="server"></asp:Label>
                &nbsp;-&nbsp;&nbsp;&nbsp; Bloco:&nbsp; <asp:Label ID="lblBlocoMsg" runat="server"></asp:Label>
                &nbsp;&nbsp; - Apartamento: <asp:Label ID="lblApartamento" runat="server"></asp:Label>
                </h3>
			</div><br />
            
			<div style="border:1px solid #CCC; padding:20px; margin-bottom:20px; background-color: #EAEAEA;">
            
                <asp:Label ID="lblMensagem" runat="server" Text="lblMensagem"></asp:Label>
                <br /><br />
              
                     <asp:ImageButton ID="ImageButton1"  
                    runat="server" Height="65px" Width="74px" /> <br />

                     <asp:LinkButton ID="lnkDonwloadEvidencia" runat="server"  onclick="lnkDonwloadEvidencia_Click">  
                    
                   
                   Baixar Imagem </asp:LinkButton>
            </div>

                        
		

                  


    
       <div class="AlternatingRowStyle" id="DivRespostaAutomatica" style="position:relative; " 
            runat="server">
                <h3>Atendimento Administrador do Condomínio</h3>
			</div>
            
			<div style="border:1px solid #CCC; padding:20px; margin-bottom:20px;">
            
            	Prezado Morador<br><br> Seu assunto foi recebido, e em breve retornarei. Obrigado por entrar em contato.
		<br><br>Att<br>Administrador</div>

                  

                  </div></div>
                  <div class="AlternatingRowStyle" id="DivRespostaSindico" style="position:relative; " 
            runat="server">
                <h3>Administrador do Condomínio</h3>
			</div>
            
			<div style="border:1px solid #CCC; padding:20px; margin-bottom:20px;" runat="server"  id="DivRespostaSindico1">
            
            	Prezado <asp:Label ID="lblMoradorResposta" runat="server" Text=""></asp:Label><br><br> 
                <asp:Label ID="lblResposta" runat="server" Text=""></asp:Label>
		<br><br>Att<br>Administrador</div>



            </fieldset>
    
</asp:Content>
