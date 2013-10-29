<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="GerarReciboAzuliAdm.aspx.cs" Inherits="Azuli.Web.Portal.GerarReciboAzuliAdm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

  <br />
   <center> <fieldset class="loginDisplayLegend">
        <legend  class="accordionContent">
            Gerar Recibo Mensal - Conta Água Azuli</legend><br />
    <table class="accordionContent">
            <tr>
                <td align="left" >
                    <asp:Label ID="lblMes" runat="server" Font-Bold="True" Text="Mês:"></asp:Label>
                    &nbsp;<asp:DropDownList ID="drpMeses" runat="server" CssClass="btGeral" Font-Bold="True"
                        Height="16px" Width="101px" AutoPostBack="True">
                    </asp:DropDownList>
                </td>
                <td align="left"  >
                    <asp:Label ID="lblAno" runat="server" Font-Bold="True" Text="Ano:"></asp:Label>
                    &nbsp;&nbsp;
                    <asp:DropDownList ID="drpAno" runat="server" CssClass="btGeral" Font-Bold="True"
                        Height="16px" Width="111px" AutoPostBack="True">
                    </asp:DropDownList>
                    &nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="Button1" runat="server" 
                        CssClass="btGeral" Text="Consultar" onclick="Button1_Click" />
                    &nbsp;&nbsp;
                </td>
            </tr>
        </table>
        </fieldset></center>
</asp:Content>
