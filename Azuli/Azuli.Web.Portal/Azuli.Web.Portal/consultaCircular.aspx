<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="consultaCircular.aspx.cs" Inherits="Azuli.Web.Portal.consultaCircular" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<br />
    <br /><br />
    <fieldset  class="login">
        <legend class="AlternatingRowStyle">Consulta de Publicações de Circulares: </legend>
        
        <br />


      <table width="100%" cellpadding="5" 
            style="background-color: White; border: Outset 2px Silver; text-align: center;" 
            class="btGeral">
        
       
        <tr>
          <td>
                <b><asp:Label ID="lblMeses" runat="server" Text="Clique no Mês desejado: " CssClass="Text"></asp:Label></b>
            </td>
            <td>
                <asp:LinkButton ID="lbtMonth1" runat="server" CssClass="Text" onclick="lbtMonth_Click">1</asp:LinkButton>
            </td>
            <td>
                <asp:LinkButton ID="lbtMonth2" runat="server" CssClass="Text" 
                    onclick="lbtMonth2_Click">2</asp:LinkButton>
            </td>
            <td>
                <asp:LinkButton ID="lbtMonth3" runat="server" CssClass="Text" 
                    onclick="lbtMonth3_Click">3</asp:LinkButton>
            </td>
            <td>
                <asp:LinkButton ID="lbtMonth4" runat="server" CssClass="Text" 
                    onclick="lbtMonth4_Click">4</asp:LinkButton>
            </td>
            <td>
                <asp:LinkButton ID="lbtMonth5" runat="server" CssClass="Text" 
                    onclick="lbtMonth5_Click">5</asp:LinkButton>
            </td>
            <td>
                <asp:LinkButton ID="lbtMonth6" runat="server" CssClass="Text" 
                    onclick="lbtMonth6_Click">6</asp:LinkButton>
            </td>
            <td>
                <asp:LinkButton ID="lbtMonth7" runat="server" CssClass="Text" 
                    onclick="lbtMonth7_Click">7</asp:LinkButton>
            </td>
            <td>
                <asp:LinkButton ID="lbtMonth8" runat="server" CssClass="Text" onclick="lbtMonth_Click">8</asp:LinkButton>
            </td>
            <td>
                <asp:LinkButton ID="lbtMonth9" runat="server" CssClass="Text" onclick="lbtMonth_Click">9</asp:LinkButton>
            </td>
            <td>
                <asp:LinkButton ID="lbtMonth10" runat="server" CssClass="Text" onclick="lbtMonth_Click">10</asp:LinkButton>
            </td>
            <td>
                <asp:LinkButton ID="lbtMonth11" runat="server" CssClass="Text" onclick="lbtMonth_Click">11</asp:LinkButton>
            </td>
            <td>
                <asp:LinkButton ID="lbtMonth12" runat="server" CssClass="Text" onclick="lbtMonth_Click">12</asp:LinkButton>
            </td>
        </tr>

          <tr>
           <td>
                <b><asp:Label ID="lblQuantidadesArquivos" runat="server" Text="Qtd de Arquivos Publicados no mês: " CssClass="Text"></asp:Label></b>
            </td>

            <td>
                <b><asp:Label ID="lblPercentage1" runat="server" Text="0" CssClass="Text"></asp:Label></b>
            </td>
            <td>
                <b><asp:Label ID="lblPercentage2" runat="server" Text="0" CssClass="Text"></asp:Label></b>
            </td>
            <td>
                <b><asp:Label ID="lblPercentage3" runat="server" Text="0" CssClass="Text"></asp:Label></b>
            </td>
            <td>
                <b><asp:Label ID="lblPercentage4" runat="server" Text="0" CssClass="Text"></asp:Label></b>
            </td>
            <td>
                <b><asp:Label ID="lblPercentage5" runat="server" Text="0" CssClass="Text"></asp:Label></b>
            </td>
            <td>
                <b><asp:Label ID="lblPercentage6" runat="server" Text="0" CssClass="Text"></asp:Label></b>
            </td>
            <td>
                <b><asp:Label ID="lblPercentage7" runat="server" Text="0" CssClass="Text"></asp:Label></b>
            </td>
            <td>
                <b><asp:Label ID="lblPercentage8" runat="server" Text="0" CssClass="Text"></asp:Label></b>
            </td>
            <td>
                <b><asp:Label ID="lblPercentage9" runat="server" Text="0" CssClass="Text"></asp:Label></b>
            </td>
            <td>
                <b><asp:Label ID="lblPercentage10" runat="server" Text="0" CssClass="Text"></asp:Label></b>
            </td>
            <td>
                <b><asp:Label ID="lblPercentage11" runat="server" Text="0" CssClass="Text"></asp:Label></b>
            </td>
            <td>
                <b><asp:Label ID="lblPercentage12" runat="server" Text="0" CssClass="Text"></asp:Label></b>
            </td>
        </tr>
        </table>
        
        
        </fieldset>

</asp:Content>
