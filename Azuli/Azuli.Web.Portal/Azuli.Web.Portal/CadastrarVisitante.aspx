<%@ Page Title="" Language="C#" MasterPageFile="~/PageAcessControl.Master" AutoEventWireup="true" CodeBehind="CadastrarVisitante.aspx.cs" Inherits="Azuli.Web.Portal.CadastrarVisitante" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    
 <script type="text/javascript" src="Silverlight.js"></script>

    <script type="text/javascript">
        function onSilverlightError(sender, args) {
            var appSource = "";
            if (sender != null && sender != 0) {
                appSource = sender.getHost().Source;
            }

            var errorType = args.ErrorType;
            var iErrorCode = args.ErrorCode;

            if (errorType == "ImageError" || errorType == "MediaError") {
                return;
            }

            var errMsg = "Unhandled Error in Silverlight Application " + appSource + "\n";

            errMsg += "Code: " + iErrorCode + "    \n";
            errMsg += "Category: " + errorType + "       \n";
            errMsg += "Message: " + args.ErrorMessage + "     \n";

            if (errorType == "ParserError") {
                errMsg += "File: " + args.xamlFile + "     \n";
                errMsg += "Line: " + args.lineNumber + "     \n";
                errMsg += "Position: " + args.charPosition + "     \n";
            }
            else if (errorType == "RuntimeError") {
                if (args.lineNumber != 0) {
                    errMsg += "Line: " + args.lineNumber + "     \n";
                    errMsg += "Position: " + args.charPosition + "     \n";
                }
                errMsg += "MethodName: " + args.methodName + "     \n";
            }

            throw new Error(errMsg);
        }
    </script>
    
    <style type="text/css">
        .style2
        {
            width: 533px;
        }
        .style3
        {
            width: 138px;
        }
        .style4
        {
            width: 424px;
        }
        #silverlightControlHost
        {
            height: 332px;
            width: 362px;
        }
    </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

  <br /><br /><br />
  
  <div id="dvMsg" align="center"  runat="server"> 
  <fieldset class="loginDisplayLegend">
        <legend class="accordionContent">Alterar sua Senha: Administrador</legend>
  <br />
    <table class="">
        <tr>
            <td class="style2">
    <div id="silverlightControlHost">
        <object data="data:application/x-silverlight-2," 
            type="application/x-silverlight-2" style="height: 336px; width: 101%">
		  <param name="source" value="ClientBin/Azuli.Acess.Control.xap"/>
		  <param name="onError" value="onSilverlightError" />
		  <param name="background" value="white" />
		  <param name="minRuntimeVersion" value="4.0.41108.0" />
		  <param name="autoUpgrade" value="true" />
		  <a href="http://go.microsoft.com/fwlink/?LinkID=149156&v=4.0.41108.0" style="text-decoration:none">
 			  <img src="http://go.microsoft.com/fwlink/?LinkId=161376" alt="Get Microsoft Silverlight" style="border-style:none"/>
		  </a>
	    </object><iframe id="_sl_historyFrame" style="visibility:hidden;height:0px;width:0px;border:0px"></iframe>
                
                  
                  
                </div></td>
            <td>
               <table align="center" style="width: 517px" class="accordionContent">
               <tr>
               <td  align="left" class="style3">
                   <asp:Image ID="imgVisitante" runat="server" 
                       ImageUrl="~/images/novo_morador_visitante.png" />
                   </td>
                <td align="left" class="style4">
                    &nbsp;</td>
               </tr>
               <tr>
               <td  align="left" class="style3">
                   <asp:Label ID="lblTipo" runat="server" Text="Tipo de Visita:" 
                       style="font-weight: 700"></asp:Label>
                   </td>
                <td align="left" class="style4">
                    <asp:DropDownList ID="drpTipoVisita" runat="server" Height="20px" Width="250px">
                        <asp:ListItem>Visitante </asp:ListItem>
                        <asp:ListItem>Prestador de Serviço</asp:ListItem>
                    </asp:DropDownList>
                   </td>
               </tr>
               <tr>
               <td  align="left" class="style3">
                   <asp:Label ID="lblNome" runat="server" Text="Nome:" 
                       style="font-weight: 700"></asp:Label>
                   </td>
                <td align="left" class="style4">
                    <asp:TextBox ID="txtBoxNome" runat="server" Width="257px"></asp:TextBox>
                   </td>
               </tr>
                <tr>
               <td align="left" class="style3">
                   <asp:Label ID="lblRG" runat="server" Text="RG:" style="font-weight: 700"></asp:Label>
                    </td>
                <td align="left" class="style4">
                    <asp:TextBox ID="txtBoxRG" runat="server" Width="262px"></asp:TextBox>
                    </td>
               </tr>
                <tr>
               <td  align="left" class="style3">
                   <asp:Label ID="lblNome1" runat="server" Text="Bloco:" style="font-weight: 700"></asp:Label>
                    </td>
                <td align="left" class="style4">
                    <asp:DropDownList ID="drpBloco" runat="server">
                    </asp:DropDownList>
                    </td>
               </tr>
                <tr>
               <td  align="left" class="style3">
                   <asp:Label ID="lblAp" runat="server" Text="Apartamento:" 
                       style="font-weight: 700"></asp:Label>
                    </td>
                <td align="left" class="style4">
                    <asp:DropDownList ID="drpApartamento" runat="server">
                    </asp:DropDownList>
                    </td>
               </tr>
                <tr>
               <td  align="left" class="style3">
                   <asp:Label ID="lblNome3" runat="server" Text="Descrição da Visista:" 
                       style="font-weight: 700"></asp:Label>
                    </td>
                <td align="left" class="style4">
                    <asp:TextBox ID="txtDescricao" runat="server" Height="59px" 
                        TextMode="MultiLine" Width="338px"></asp:TextBox>
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
                    </asp:DropDownList>
                    </td>
               </tr>
                <tr>
               <td  align="left" class="style3">
                   &nbsp;</td>
                <td align="left" class="style4">
                    <asp:Button ID="btnSalvar" runat="server" Text="Salvar Dados" />
&nbsp;
                    <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" />
                    </td>
               </tr>
               </table>
               
               </td>
           
        </tr>
    </table>

   </fieldset>

   </div>

   </asp:Content>
