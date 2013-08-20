<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SegundaViaContaAguaAzuli.aspx.cs" Inherits="Azuli.Web.Portal.SegundaViaContaAguaAzuli" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
  
    <style type="text/css">
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
    .style6
    {
        width: 440px;
        height: 19px;
    }
    .style8
    {
        width: 4px;
        height: 38px;
    }
    .style11
    {
        width: 215px;
        height: 36px;
    }
    .style12
    {
        font-weight: bold;
        width: 215px;
        height: 36px;
    }
    .style13
    {
        width: 4px;
        height: 36px;
    }
    .style15
    {
    }
    </style>
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="dvAvancada" align="center" runat="server">
        <fieldset class="loginDisplayLegend">
            <legend class="accordionContent">Deseja pesquisar por: </legend>
            <br />
            <table align="center" class="style6">
                <tr>
                    <td align="center" class="style11">
                        <asp:Button ID="btnBlocoAp" runat="server"  Text="Meu Bloco e Apartamento"
                            CssClass="btGeral" ValidationGroup="avancada" Font-Bold="True" 
                            Width="210px" onclick="btnBlocoAp_Click" />
                    </td>
                    <td class="style12" align="center">
                        <asp:Button ID="btnLimpar" runat="server" Text="Pesquisar por Data:"
                            CssClass="btGeral" Font-Bold="True" />
                    </td>
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
                      <tr>
                          <td>
                              &nbsp;</td>
                      </tr>
        </table>
            </fieldset>
        </div>
        
  
</asp:Content>
