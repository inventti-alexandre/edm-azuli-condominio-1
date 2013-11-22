<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="integracaoWeb.aspx.cs" Inherits="Azuli.Web.Portal.integracaoWeb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style3
        {
            width: 100%;
        }
        .style4
        {
            width: 331px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <fieldset>
<legend class="accordionContent">Integração WEB - Recibo - Control Water</legend>
 <p>
        <table class="style3">
            <tr>
                <td class="style4">
        <asp:FileUpload ID="fupProject" runat="server" CssClass="btGeral" Width="357px" />
                </td>
                <td>
        <asp:Button ID="btnCheck" runat="server" 
            onclick="btnCheck_Click" CssClass="btGeral" Text="Checar Arquivo" />
                </td>
            </tr>
        </table>
        <br />
    </p>
    <p align="center">
    &nbsp;
        <asp:CustomValidator ID="cvErrorMessage" runat="server" Display="None" 
            ForeColor="Red" style="font-weight: 700"></asp:CustomValidator>
           
    </p>
    <p align="left">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label 
            ID="lblDescTotalRead" runat="server" Text="Total de Recibos Lidos: " ></asp:Label>
        &nbsp;<asp:Label ID="lblTotalRead" runat="server" Text="0" 
            style="font-weight: 700; font-size: medium"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;
                   
    </p>
    <div style="height:285px; width:1039px; overflow:auto" id="divtabela" 
            align="center">
      
    &nbsp;<asp:GridView ID="grdImport" runat="server" Font-Size="Smaller" CssClass="gridl">
            
        </asp:GridView>
   </div>
        <p align="center">
        <asp:Button ID="cmdSave" runat="server" Text="Cadastrar Arquivo" 
            onclick="cmdSave_Click" Enabled="False" CssClass="btGeral"/> 
           
        </p>
    <p align="center">
        <asp:Label ID="lblSaved" runat="server" meta:resourcekey="lblSaved" Text="Dados armazenados com sucesso" 
            Visible="False" Font-Bold="True" ForeColor="#006600"></asp:Label>
    </p>
        </fieldset>

</asp:Content>
