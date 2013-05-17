<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="DetalheClassificado.aspx.cs" Inherits="Azuli.Web.Portal.DetalheClassificado" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style2
        {
            width: 100%;
        }
        .style3
        {
            height: 21px;
        }
        .style5
        {
            font-weight: bold;
        }
    </style>
    <script src="Scripts/jquery-1.4.1.js" type="text/javascript"></script>
    <script type="text/javascript">
//<![CDATA[
        $(document).ready(function () {
            $('<div id="mascara"></div>')
		.css({
		    opacity: 0.8,
		    width: $(document).width(),
		    height: $(document).height()
		})
		.appendTo('body').hide();
            $('.foto').click(function (event) {
                event.preventDefault();
                $('#mascara').fadeIn(1000);
                $('<img class="foto-ampliada" />')
			.attr('src', $(this).attr('src'))
			.css({
			    left: ($(document).width() / 2 - 250),
			    top: ($(document).height() / 2 - 186)
			}).appendTo('body').click(function () {
			    $(this).fadeOut(1000);
			    $('#mascara').fadeOut(1500);
			});
            });
        });
   // ]]>
    </script>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <div id="imgAnuncio" style="position:absolute; top: 139px; left: 481px;">
    
    <asp:Image ID="imgGrupo" runat="server" Height="44px" Width="155px" />
    </div>
    <div id="dvAnunciar" runat="server" align="center">

        <fieldset class="loginDisplayLegend">
            <legend class="controleCalendario">Detalhe do Classificado&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                
            </legend>
            <table class="accordionContent" style="width: 798px">
                <tr>
                    <td>
                        <asp:Label ID="lblAssunto" runat="server" 
                            style="font-weight: 700; font-size: small; color: #0000FF;"></asp:Label>
                    </td>
                    <td align="left" class="btGeral">
                        &nbsp;
                        <asp:Label ID="lblValor" runat="server" 
                            style="font-weight: 700; font-size: medium;"></asp:Label>
                    </td>
                </tr>
                
            </table>
      
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
      
    
    <div id="dvImagens" 
        style="position:absolute; top: 279px; left: 241px; width: 548px;" 
        runat="server">
    
    
    
    
        <table class="style2">
            <tr>
                <td>
                    <asp:ImageButton ID="ImageButton4" CssClass="foto left" runat="server" Height="70px" Width="70px" />
                </td>
                <td>
                    <asp:ImageButton ID="ImageButton3" CssClass="foto left" runat="server" Height="70px" Width="70px" />
                </td>
                <td>
                    <asp:ImageButton ID="ImageButton2" CssClass="foto left" runat="server" Height="70px" Width="70px" />
                </td>
                <td>
                    <asp:ImageButton ID="ImageButton1" CssClass="foto left" runat="server" Height="70px" Width="70px" />
                </td>
            </tr>
        </table>
    
    
    
    
    </div>

    <div id="dvDescricacao" 
        
                style="position:absolute; top: 391px; left: 236px; width: 569px;" > 
               
    
    
        <table class="ContextMenuPanel">
            <tr>
                <td colspan="2">
                    <asp:Label ID="lblDescricao" runat="server" style="font-weight: 700"></asp:Label>
                    <br />
                    <br />
                    <br />
                    <hr />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    Apartamento:
                   <asp:Label ID="lblApartamento" runat="server" CssClass="style5"></asp:Label></td>
                <td>
                    Bloco:
                    <asp:Label ID="lblBloco" runat="server" CssClass="style5"></asp:Label></td>
            </tr>
            <tr>
                <td class="style3">
                    Telefone:
                    <asp:Label ID="lblTel" runat="server" CssClass="style5"></asp:Label></td>
                <td class="style3">
                    Celular:
                    <asp:Label ID="lblCel" runat="server" CssClass="style5"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    E-mail: <asp:Label ID="lblEmail" runat="server" CssClass="style5"></asp:Label></td>
                <td>
                    Data:
                    <asp:Label ID="lblData" runat="server" CssClass="style5"></asp:Label></td>
            </tr>
        </table>
    
    
    </div>
           
            <br />
            <br />
            <br />
           
  <center>  <asp:Button ID="Button1" runat="server" Text="Voltar" 
        CssClass="btGeral" onclick="Button1_Click" Width="86px" /> </center>
      </fieldset>
    </div>
    <div id="dvVeiculo" style="position: absolute; top: 151px; left: 398px; color: #0033CC;
        height: 23px; width: 205px; font-weight: 700;">
        <asp:Label ID="lblGrupo" runat="server"></asp:Label>
    </div>
</asp:Content>
