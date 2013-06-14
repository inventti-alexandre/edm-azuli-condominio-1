<%@ Page Title="" Language="C#" MasterPageFile="~/PageAcessControl.Master" AutoEventWireup="true" CodeBehind="CadastrarVisitante.aspx.cs" Inherits="Azuli.Web.Portal.CadastrarVisitante" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    
     <script type="text/javascript" src="camutils/webcam.js"></script>
    <style type="text/css">
        .style2
        {
            width: 660px;
        }
        .style3
        {
            width: 215px;
        }
        .style4
        {
            width: 409px;
        }
        #silverlightControlHost
        {
            height: 373px;
            width: 346px;
        }
        .style5
        {
            width: 215px;
            height: 85px;
        }
        .style6
        {
            width: 409px;
            height: 25px;
        }
        .style7
        {
            width: 409px;
            height: 85px;
        }
    </style>

     <script type="text/javascript">
         webcam.set_hook('onComplete', 'my_completion_handler');

         function take_snapshot() {
             // Captura a imagem e submete ao servidor
             //  document.getElementById('upload_results').innerHTML = '<h1>Realizando Upload da Foto...</h1>';
             webcam.snap();
         }

         function my_completion_handler(msg) {
             // Extrai a URL da imagem do retorno de Upload.aspx
             if (msg.match(/(http\:\/\/\S+)/)) {
                 var image_url = RegExp.$1;
                 // show JPEG image in page
                 document.getElementById('upload_results').innerHTML =
					    '<img src="' + image_url + '" width="153px" height="112px">';

                 // reset camera for another shot
                 webcam.reset();
             }
             else alert("ASPNET Error: " + msg);
         }
        </script>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<table align="center" style="width: 477px; margin-left: 24px;" >
        <tr>
            <td class="" align="center" dir="ltr">

                    <fieldset class="loginDisplayLegend">
        <legend class="accordionContent">Cadastro e Autorização de Visita:</legend>
    
      <!-- Configura algumas opções -->
	    <script type="text/javascript" language="JavaScript">
	        webcam.set_api_url('CadastrarVisitante.aspx'); //Página de destino do arquivo capturado
	        webcam.set_quality(100); // Qualidade do JPG (1 - 100)
	        webcam.set_shutter_sound(true); // Toca o som de câmera (o arquivo shutter.mp3, que vem com os "utilitários" da câmera, deve estar no diretório raíz do site)
	    </script>

        <table style="width:100%;" cellpadding="0" cellspacing="0">
            <tr>
                <td style="width:320px;height:240px;text-align:center;" valign="top">
                    <script type="text/javascript" language="JavaScript">
                        document.write(webcam.get_html(320, 240));
	                </script>
                    <input type="button" value="Configurar" onclick="webcam.configure();" />
                    <input type="button" value="Tirar foto" onclick="take_snapshot();" />
                    <input type="button" value="Reiniciar" onclick="webcam.reset();" />
                </td>
                <td style="width:300px;height:220px;" valign="top">
	                <!-- Desenha o HTML do Flash que faz a interface com a Webcam na resolução 320x240 -->
                    <div id="upload_results" style="position:absolute;top:205px;right:578px;">
</div>
            
            <div>
 <table align="center" style="width: 477px; margin-left: 24px;" 
                    class="accordionContent">
               <tr>
               <td  align="left" class="style5">
                   <asp:Image ID="Image1" runat="server" Height="112px" Width="153px" 
                       />
                   </td>
                <td align="left" class="style7">
                    <asp:Label ID="Label2" runat="server" CssClass="ContextMenuPanel" 
                        Font-Bold="True" Text="Visitantes / Prestador de Serviços"></asp:Label>
</td>
               </tr>
               <tr>
               <td  align="left" class="style3">
                   <asp:Label ID="lblTipo" runat="server" Text="Tipo de Visita:" 
                       style="font-weight: 700"></asp:Label>
                   </td>
                <td align="left" class="style4">
                    <asp:RadioButtonList ID="rblTipoVisita" runat="server" 
                        RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True" Value="V">Visitante</asp:ListItem>
                        <asp:ListItem Value="P">Prestador de Serviço</asp:ListItem>
                    </asp:RadioButtonList>
                   </td>
               </tr>
               <tr>
               <td  align="left" class="style3">
                   <asp:Label ID="lblRG" runat="server" Text="RG:" style="font-weight: 700"></asp:Label>
                   </td>
                <td align="left" class="style4">
                    <asp:TextBox ID="txtBoxRG" runat="server" Width="151px"></asp:TextBox>
                   </td>
               </tr>
                <tr>
               <td align="left" class="style3">
                   <asp:Label ID="lblNome" runat="server" Text="Nome:" 
                       style="font-weight: 700"></asp:Label>
                    </td>
                <td align="left" class="style4">
                    <asp:TextBox ID="txtBoxNome" runat="server" Width="257px"></asp:TextBox>
                    </td>
               </tr>
                <tr>
               <td  align="left" class="style3">
                   <asp:Label ID="lblNome1" runat="server" Text="Bloco:" style="font-weight: 700"></asp:Label>
                    </td>
                <td align="left" class="style4">
                    &nbsp;<asp:DropDownList ID="drpBloco" runat="server" DataSourceID="SqlDataSourceBloco" 
                                    DataTextField="BLOCO" DataValueField="BLOCO" Height="20px" 
                                    CssClass="AlternatingRowStyle" Width="58px"  AppendDataBoundItems="True" 
                                    AutoPostBack="True" 
                        onselectedindexchanged="drpBloco_SelectedIndexChanged" Font-Bold="True">
                                      
                                </asp:DropDownList>

                   <asp:Label ID="lblAp" runat="server" Text="Apartamento:" 
                       style="font-weight: 700"></asp:Label>
                  <asp:DropDownList ID="drpMsg" runat="server" DataSourceID="SqlDataSourceAP" 
                                    DataTextField="APARTAMENTO" DataValueField="APARTAMENTO" Height="20px" 
                                    CssClass="AlternatingRowStyle" Width="60px"  AppendDataBoundItems="True" 
                                    AutoPostBack="True" 
                        onselectedindexchanged="drpMsg_SelectedIndexChanged" Font-Bold="True">
                                     
                                </asp:DropDownList>
                    </td>
                     
               </tr>
                <tr>
               <td  align="left" class="style3">
                   <asp:Label ID="lblNome2" runat="server" Text="Morador:" 
                       style="font-weight: 700"></asp:Label>
                    </td>
                <td align="justify" class="style4">
                    <br />
                    <asp:Label ID="lblMorador" runat="server" Font-Bold="True" ForeColor="Blue"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnconsultar" runat="server" Font-Bold="True" ForeColor="Blue" 
                        Text=" Consultar Info" Width="104px" Height="25px" />
                    <br />
                    </td>
                     
               </tr>
                <tr>
               <td  align="left" class="style3">
                   <asp:Label ID="Label1" runat="server" style="font-weight: 700" 
                       Text="Autorizado por"></asp:Label>
                    </td>
                <td align="left" class="style6">
                    <asp:TextBox ID="txtAutorizadoPor" runat="server" Width="236px"></asp:TextBox>
                    </td>
               </tr>
                <tr>
               <td  align="left" class="style3">
                   <asp:Label ID="lblObs" runat="server" Text="Descrição da Visita:" 
                       style="font-weight: 700"></asp:Label>
                    </td>
                <td align="left" class="style4">
                    <asp:TextBox ID="txtDescricao" runat="server" Height="35px" 
                        TextMode="MultiLine" Width="298px"></asp:TextBox>
                    </td>
               </tr>
                <tr>
               <td  align="left" class="style3">
                   <asp:Label ID="lblCarro" runat="server" Font-Bold="True" Text="Placa do Carro"></asp:Label>
                    </td>
                <td align="left" class="style4">
                    <asp:TextBox ID="txtPlaca" runat="server"></asp:TextBox>
                    </td>
               </tr>
                <tr>
               <td  align="left" class="style3">
                   <asp:Label ID="lblModelo" runat="server" Font-Bold="True" Text="Modelo:"></asp:Label>
                    </td>
                <td align="left" class="style4">
                    <asp:TextBox ID="txtModelo" runat="server"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;
                   <asp:Label ID="lblCor" runat="server" Font-Bold="True" Text="Cor:"></asp:Label>
                    &nbsp;<asp:DropDownList ID="drpCor" runat="server">
                        <asp:ListItem>Branco</asp:ListItem>
                        <asp:ListItem>Preto</asp:ListItem>
                        <asp:ListItem>Prata</asp:ListItem>
                        <asp:ListItem>Cinza</asp:ListItem>
                        <asp:ListItem>Marrom</asp:ListItem>
                        <asp:ListItem>Verde</asp:ListItem>
                        <asp:ListItem>Azul</asp:ListItem>
                        <asp:ListItem>Amarelo</asp:ListItem>
                        <asp:ListItem>Laranja</asp:ListItem>
                    </asp:DropDownList>
                    </td>
               </tr>
                <tr>
               <td  align="left" class="style3">
                   &nbsp;</td>
                <td align="left" class="style4">
                    <asp:Button ID="btnSalvar" runat="server" Text="Salvar Dados" 
                        onclick="btnSalvar_Click" />
                         
&nbsp;
                    <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" />
                    </td>
               </tr>
                   <asp:SqlDataSource ID="SqlDataSourceAP" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:azulli %>" 
                                    SelectCommand="LISTA_APARTAMENTO" SelectCommandType="StoredProcedure">
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="SqlDataSourceBloco" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:azulli %>" SelectCommand="LISTA_BLOCO" 
                                    SelectCommandType="StoredProcedure"></asp:SqlDataSource>
               </table></div>
               
           </td>
        </tr>
       
    </table>
    
          </fieldset>

    
                    
                </td>
            </tr>
        </table>
     
	<br /><br />

  

  
  

   

   </asp:Content>
