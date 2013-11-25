<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="integracaoWeb.aspx.cs" Inherits="Azuli.Web.Portal.integracaoWeb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style4
        {
            width: 331px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <fieldset>
<legend class="accordionContent">Integração WEB - Recibo - Control Water</legend>

 <center><p>
        <table class="accordionContent">
            <tr>
                <td class="style4">
        <asp:FileUpload ID="fupProject" runat="server" CssClass="btGeral" Width="357px" />
                </td>
                <td>
        <asp:Button ID="btnCheck" runat="server" 
            onclick="btnCheck_Click" CssClass="btGeral" Text="Checar Arquivo" />
                </td>
            </tr>
        </table></center>
        <br />
    <p align="center">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   
        <asp:CustomValidator ID="cvErrorMessage" runat="server" Display="None" 
            ForeColor="Red" style="font-weight: 700"></asp:CustomValidator>
           
    </p>
        <div style="height:285px; width:1012px; overflow:auto" id="divtabela" 
            align="center" class="accordionContent" runat="server">
      
    &nbsp;<asp:GridView ID="grdImport" runat="server" Font-Size="Smaller" 
            CssClass="gridviewImport" GridLines="Vertical" ShowHeader="False">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            
        </asp:GridView> 
   </div>
   <br />
        <p align="left">
            <asp:Label 
            ID="lblDescTotalRead" runat="server" Text="Total de Recibos Lidos: " 
                CssClass="accordionContent" ></asp:Label> <asp:Label ID="lblTotalRead" runat="server" Text="0"   style="font-weight: 700; font-size: medium" CssClass="accordionContent"></asp:Label>
            
           
        </p>
        <p align="center">
        <asp:Button ID="cmdSave" runat="server" Text="Fazer Integração" 
            onclick="cmdSave_Click" Enabled="False" CssClass="btGeral" Width="167px" 
                Height="33px"/> 
        </p>
    <p align="center">
        <asp:Label ID="lblSaved" runat="server" meta:resourcekey="lblSaved" Text="Dados armazenados com sucesso" 
            Visible="False" Font-Bold="True" ForeColor="#006600"></asp:Label>
    </p>
        </fieldset>

</asp:Content>
