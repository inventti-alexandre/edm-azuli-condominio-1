<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="detalheOcorrencia.aspx.cs" Inherits="Azuli.Web.Portal.detalheOcorrencia" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br /><br /> <br /><br />
    <asp:Label ID="lblMeses" runat="server" CssClass="AlternatingRowStyle" 
        Text="Ocorrência no mês de:" Font-Bold="True" Font-Size="Medium"></asp:Label>
&nbsp;<asp:DropDownList ID="drpMeses" runat="server" Height="30px" Width="243px" 
                CssClass="menu" AutoPostBack="True" 
                onselectedindexchanged="drpMeses_SelectedIndexChanged">
    </asp:DropDownList>
            <br />
            <br />
 <fieldset>

   
    <legend title="Abrir Ocorrência"> Abrir Ocorrência </legend>
    <asp:GridView ID="grdOcorrencias" runat="server" 
                CssClass="GridView" Width="809px" AutoGenerateColumns="False" 
         onrowcommand="grdOcorrencias_RowCommand" DataKeyNames="codigoOcorrencia" 
         EmptyDataText="Não existem ocorrência aberta neste mês !!"> 
        <Columns>
            <asp:BoundField DataField="codigoOcorrencia" HeaderText="Ocorrência" />
            <asp:BoundField DataField="dataOcorrencia" HeaderText="Data" />
            <asp:BoundField DataField="descricaoOcorrencia" HeaderText="Assunto" />
            <asp:BoundField DataField="statusOcorrencia" HeaderText="Status" />
            <asp:ButtonField ButtonType="Image" ImageUrl="~/images/ico_search.gif" 
                Text="Button" />
        </Columns>
    </asp:GridView>
    </fieldset>
  
</asp:Content>
