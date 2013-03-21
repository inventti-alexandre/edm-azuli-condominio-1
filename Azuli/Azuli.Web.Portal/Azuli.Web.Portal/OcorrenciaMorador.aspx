<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OcorrenciaMorador.aspx.cs" Inherits="Azuli.Web.Portal.OcorrenciaMorador" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            height: 396px;
            margin-top: 0px;
        }
        .style2
        {
            height: 44px;
        }
        .style4
        {
            height: 188px;
        }
        .style5
        {
            font-weight: bold;
            background-color: #FFFFFF;
        }
        .style6
        {
            background-color: #FFFFFF;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <br /><br /><br /><br /><br />
<fieldset>
   
    <legend title="Abrir Ocorrência"> Abrir Ocorrência </legend></center><br />
   <center><asp:Label ID="lblMsg" runat="server" Font-Bold="True" ForeColor="#006600"></asp:Label>
       <br />
   
  <div id="dvCadastro" runat="server" align="center" > 
   
      <table style="border: thin solid #C0C0C0; height: 475px; width: 866px;" 
          class="MasterMenu">
            <tr>
                <td class="btGeral" align="center">
                    <table class="style1" border='0'>
                        <tr>
                            <td class="style2">
                                <asp:Label ID="lblOcorrencia" runat="server" style="font-weight: 700" 
                                    Text="Ocorrência aberta será para:"></asp:Label>
                            </td>
                            <td class="style2" align="left">
                                <asp:Label ID="lblBloco" runat="server" CssClass="style5" Text="Bloco:"></asp:Label>
&nbsp;<asp:Label ID="lblDescBloco" runat="server" CssClass="style5"></asp:Label>
&nbsp;-
                                <asp:Label ID="lblAp" runat="server" CssClass="style6" style="font-weight: 700" 
                                    Text="Apartamento:"></asp:Label>
&nbsp;<asp:Label ID="lblDescApartamento" runat="server" CssClass="style5"></asp:Label>
                            </td>
                            <td class="style2">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style2">
                                <asp:Label ID="lblAssunto" runat="server" Font-Bold="True" Text="Assunto:"></asp:Label>
                            </td>
                            <td class="style2">
                                <asp:DropDownList ID="drpListSubject" runat="server" Height="29px" Width="609px" 
                                    DataSourceID="SqlDataSourceTipoOcorrencia" DataTextField="DescricaoOcorrencia" 
                                    DataValueField="idTipoOcorrencia" CssClass="btGeral" 
                                    AppendDataBoundItems="True">
                                    <asp:ListItem Value="-1">Selecionar assunto ..</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSourceTipoOcorrencia" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:azulli %>" 
                                    SelectCommand="SELECT * FROM [TIPO_OCORRENCIA]"></asp:SqlDataSource>
                            </td>
                            <td class="style2">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style4">
                                <asp:Label ID="lblDescricao" runat="server" Font-Bold="True" 
                                    Text="Descrição da Solicitação:"></asp:Label>
                            </td><br />
                            <td class="style4">
                                 <asp:TextBox ID="txtDescription" runat="server" Height="153px" TextMode="MultiLine" 
                                     Width="602px"></asp:TextBox>
                            </td>
                            <td class="style4">
                                 <asp:RequiredFieldValidator ID="rfvDescription" runat="server" 
                                     ControlToValidate="txtDescription" ErrorMessage="Favor descrever o problema!" 
                                     Font-Bold="True" ForeColor="Red" ValidationGroup="validaDescricao"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style7">
                                <asp:Label ID="lblEmail" runat="server" Font-Bold="True" 
                                    Text="Evidência/Imagem"></asp:Label>
                            </td>
                            <td class="style8">
                                <asp:FileUpload ID="fileImagem" runat="server" Height="24px" Width="387px" 
                                    CssClass="botao" />
                            </td>
                            <td class="style8">
                                &nbsp;</td>
                        </tr>
                        </table>
                    <br />
                    <br />
                    <br />
                    <asp:Button ID="btnOcorrencia" runat="server" CssClass="botao" Text="Gerar ocorrência" 
                        Width="150px"  
                        ValidationGroup="validaDescricao" onclick="btnOcorrencia_Click" />
&nbsp;&nbsp;&nbsp;&nbsp; 
                    <asp:Button ID="btnLimpar" runat="server" CssClass="botao" 
                        Text="Limpar Campos" />
                </td>
            </tr>
        </table>
      <br />
      <br />
      <br />
     </center><br />
    </div>

    </fieldset>
</asp:Content>
