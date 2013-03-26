<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="detalheMensagemMorador.aspx.cs" Inherits="Azuli.Web.Portal.detalheMensagemMorador" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            color: #FFFFFF;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <br /><br /> <br /><br /><br /><br />
<fieldset class="login">
        <legend class="">Caixa de Entrada - Mensagem</legend>
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

         <div id="dvNaoLida" runat="server">
             <br /> 
<center>
        
            <asp:GridView ID="grdMsg" runat="server" AutoGenerateColumns="False" 
                Height="16px" Width="722px" DataKeyNames="codigoMsg"
                CssClass="GridView" EmptyDataText="Todas mensagem já foram lidas!!" 
                onrowcommand="grdMsg_RowCommand">
                <Columns>
                    <asp:BoundField DataField="codigoMsg" HeaderText="Código Mensagem" 
                        Visible="true" />
                    <asp:BoundField HeaderText="De" DataField="deMsg" />
                    <asp:BoundField DataField="assunto" HeaderText="Assunto" />
                    <asp:BoundField DataField="data_inicio" HeaderText="Data de Envio" />
                    <asp:ButtonField ButtonType="Image" ImageUrl="~/images/ico_search.gif" 
                        Text="Button" DataTextField="data_inicio" />
                </Columns>
            </asp:GridView>
            </div>
       
       <div id="divGeralMsg" runat="server" class="bold">
       
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
