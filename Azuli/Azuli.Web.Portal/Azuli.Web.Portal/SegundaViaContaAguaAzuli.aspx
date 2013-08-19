<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SegundaViaContaAguaAzuli.aspx.cs" Inherits="Azuli.Web.Portal.SegundaViaContaAguaAzuli" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
  
    <style type="text/css">
        .style3
        {
            font-weight: bold;
            width: 212px;
        }
        .style4
        {
            background-color: #F0F0F0;
            border-left: 2px solid #999999;
            border-right: 2px solid #999999;
            padding: 5px 5px 5px 5px;
            font-family: Verdana;
            font-size: 8pt;
            color: #666666;
            height: 15px;
            font-weight: bold;
        }
        .style5
        {
            width: 186px;
        }
    </style>
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="dvAvancada" align="center" runat="server">
        <fieldset class="loginDisplayLegend">
            <legend class="accordionContent">Deseja pesquisar por: </legend>
            <br />
            <table align="center">
                <tr>
                    <td align="center">
                        <asp:Button ID="btnBlocoAp" runat="server"  Text="Meu Bloco e Apartamento"
                            CssClass="btGeral" ValidationGroup="avancada" Font-Bold="True" 
                            Width="210px" onclick="btnBlocoAp_Click" />
                    </td>
                    <td class="style3" align="center">
                        <asp:Button ID="btnLimpar" runat="server" Text="Pesquisar por Data:"
                            CssClass="btGeral" Font-Bold="True" />
                    </td>
                    <td class="style7" align="center">
                        &nbsp;</td>
                </tr>
                </table>
        </fieldset>
    </div>

   
  <div id="dvPesquisaByData" align="center" runat="server">
       <fieldset class="loginDisplayLegend">
            <legend class="style4">
                Deseja ver 2ª via por:</legend>
                  <table style="width: 565px">
            <tr>
                <td class="style5" >
                    <asp:Label ID="lblMes" runat="server" Font-Bold="True" Text="Mês:"></asp:Label>
                    &nbsp;<asp:DropDownList ID="drpMeses" runat="server" CssClass="btGeral" Font-Bold="True"
                        Height="16px" Width="101px" AutoPostBack="True"> 
                        
                    </asp:DropDownList>
                </td>
                <td  >
                    <asp:Label ID="lblAno" runat="server" Font-Bold="True" Text="Ano:"></asp:Label>
                    &nbsp;&nbsp;
                    <asp:DropDownList ID="drpAno" runat="server" CssClass="btGeral" Font-Bold="True"
                        Height="16px" Width="111px" AutoPostBack="True" >
                       
                    </asp:DropDownList>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
            </tr>
        </table>
            </fieldset>
        </div>
        
  
</asp:Content>
