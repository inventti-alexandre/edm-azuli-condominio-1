<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="detalheMensagemMorador.aspx.cs" Inherits="Azuli.Web.Portal.detalheMensagemMorador" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            color: #FFFFFF;
        }
        .style2
        {
            text-align: right;
        }
        .style3
        {
            width: 400px;
        }
        .style4
        {
            width: 183px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <br />
<fieldset class="loginDisplayLegend">
        <legend class="accordionContent">Caixa de Entrada - Mensagem</legend>
          <br />
          <asp:Label ID="lblConsultaAno" runat="server" CssClass="footer" 
            Text="Status:  "></asp:Label>
            &nbsp;&nbsp;
            <asp:DropDownList ID="drpStatusMsg" runat="server" CssClass="FooterStyle" Height="26px" 
            Width="189px" AutoPostBack="True" 
            onselectedindexchanged="drpStatusMsg_SelectedIndexChanged" > 
         
                <asp:ListItem Value="1" Selected="True">Mensagem Não Lidas</asp:ListItem>
                <asp:ListItem Value="0">Mensagem Lidas</asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
        <table style="width:100%;">
            <tr>
                <td colspan="3" style="text-align: center">
                    Filtro de Pesquisas&nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Assunto</td>
                <td class="style3">
                    Mensagem</td>
                <td class="style4">
                    Data</td>
            </tr>
            <tr>
                <td class="style2">
                    <input id="TxtPsqAssunto" type="text" /></td>
                <td class="style3">
                    <input id="TxtPsqMsg" type="text" /></td>
                <td class="style4">
                    <input id="TxtPsqData" type="text" /></td>
            </tr>
            <tr>
                <td class="style2" colspan="3">
                    <asp:Button ID="BtnPesquisar" runat="server" onclick="BtnPesquisar_Click" 
                        Text="Pesquisar" />
                </td>
            </tr>
        </table>
        <br />

         <div id="dvNaoLida" runat="server">
             <br /> 
<center>
        
            <asp:GridView ID="grdMsg" runat="server" AutoGenerateColumns="False" 
                Height="16px" Width="722px" DataKeyNames="codigoMsg"
                CssClass="GridView" EmptyDataText="Todas mensagem já foram lidas!!" 
                onrowcommand="grdMsg_RowCommand">
                <Columns>
                    <asp:BoundField DataField="codigoMsg" HeaderText="Código Mensagem" 
                        Visible="false" />
                    <asp:BoundField HeaderText="De" DataField="deMsg" />
                    <asp:BoundField DataField="assunto" HeaderText="Assunto" />
                    <asp:TemplateField HeaderText="Data de Envio">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("data_inicio") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("data_inicio", "{0:dddd}") + " / " + Eval("data_inicio","{0:dd/MM/yyyy}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:ButtonField ButtonType="Image" ImageUrl="~/images/ico_search.gif" 
                        Text="Button" DataTextField="data_inicio" />
                </Columns>
            </asp:GridView>
           
            </div>
       
       <div id="divGeralMsg" runat="server" class="">
       
          <div  id="DivlerMsg" style="position:relative; " 
            runat="server">
                <h3 class="AlternatingRowStyle">
                    <asp:Label ID="lblDe" runat="server" Text=""></asp:Label> &nbsp; Assunto:&nbsp;&nbsp; <asp:Label ID="lblAssunto" runat="server" Text=""></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Data:&nbsp;
                    <asp:Label ID="lblData" runat="server" Text=""></asp:Label>  </h3>
			</div>
            
			<div style="border:1px solid #CCC; padding:20px; margin-bottom:20px;">
            
            <br />
                <b><asp:Label ID="lblMsg" runat="server" style="font-weight: 700"></asp:Label></b>
		</div>
       
        </div>     


       </fieldset>
    <center><asp:Button  ID="btnOk" runat="server" Text="Ok" Width="58px" 
            CssClass="btGeral" onclick="btnOk_Click" /></center> 
            
            </asp:Content>