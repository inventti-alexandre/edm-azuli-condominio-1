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
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <br /><br />

  

  <fieldset class="loginDisplayLegend">
        <legend class="accordionContent">Cadastro e Autorização de Visita:</legend>

    <table align="center" style="width: 477px; margin-left: 24px;" >
        <tr>
            <td class="" align="center" dir="ltr">
    <div id="silverlightControlHost">
        <object data="data:application/x-silverlight-2," 
            type="application/x-silverlight-2" 
            style="height: 376px; width: 104%; margin-top: 0px;">
		  <param name="source" value="ClientBin/Azuli.Acess.Control.xap"/>
		  <param name="onError" value="onSilverlightError" />
		  <param name="background" value="white" />
		  <param name="minRuntimeVersion" value="4.0.41108.0" />
		  <param name="autoUpgrade" value="true" />
		  <a href="http://go.microsoft.com/fwlink/?LinkID=149156&v=4.0.41108.0" style="text-decoration:none">
 			  <img src="http://go.microsoft.com/fwlink/?LinkId=161376" alt="Get Microsoft Silverlight" style="border-style:none"/>
		  </a>
	    </object><iframe id="_sl_historyFrame" style="visibility:hidden;height:0px;width:0px;border:0px"></iframe>
                
                  
                  <br />
                
                  
                  <br /><br />
                <br />
        <br />
                
                  
                  
                </div></td>
            <td>
 <table align="center" style="width: 477px; margin-left: 24px;" 
                    class="accordionContent">
               <tr>
               <td  align="left" class="style5">
                   <asp:Image ID="Image1" runat="server" Height="112px" Width="153px" />
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
               </table>
               
           </td>
        </tr>
       
    </table>
      <asp:SqlDataSource ID="SqlDataSourceAP" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:azulli %>" 
                                    SelectCommand="LISTA_APARTAMENTO" SelectCommandType="StoredProcedure">
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="SqlDataSourceBloco" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:azulli %>" SelectCommand="LISTA_BLOCO" 
                                    SelectCommandType="StoredProcedure"></asp:SqlDataSource>

   </fieldset>

   

   </asp:Content>
