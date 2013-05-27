<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="liberaAcessoAdmin.aspx.cs" Inherits="Azuli.Web.Portal.liberaAcessoAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <br /><br />
    <div id="dvManager" align="center" runat="server">
       <fieldset class="loginDisplayLegend">
   <legend class="accordionContent">Liberação de Acessos:</legend>
   <br /><br />
  <center>
       <asp:GridView ID="grdGerenciamentoMoradores" runat="server" AllowPaging="True" 
           AllowSorting="True" AutoGenerateColumns="False" CssClass="GridView" DataKeyNames="PROPRIETARIO_BLOCO,PROPRIETARIO_AP"
          EmptyDataText="Não existem acessos a ser liberados!" 
           DataSourceID="SqlDataSourceGerenciamentoUser" 
           onrowcommand="grdGerenciamentoMoradores_RowCommand">
           <Columns>
               <asp:BoundField DataField="NOME_PROPRIETARIO1" HeaderText="Condomino 01" 
                   SortExpression="NOME_PROPRIETARIO1" />
               <asp:BoundField DataField="PROPRIETARIO_BLOCO" HeaderText="Bloco" 
                   ReadOnly="True" SortExpression="PROPRIETARIO_BLOCO" />
               <asp:BoundField DataField="PROPRIETARIO_AP" HeaderText="Apartamento" 
                   ReadOnly="True" SortExpression="PROPRIETARIO_AP" />
               <asp:BoundField DataField="email" HeaderText="E-mail" SortExpression="email" />
               <asp:ButtonField ButtonType="Button" Text="Liberar" />
           </Columns>
       </asp:GridView></center></fieldset></div> 
       <asp:SqlDataSource ID="SqlDataSourceGerenciamentoUser" runat="server" 
           ConnectionString="<%$ ConnectionStrings:azulli %>" 
           DeleteCommand="DELETE FROM [PROPRIETARIO] WHERE [PROPRIETARIO_BLOCO] = @PROPRIETARIO_BLOCO AND [PROPRIETARIO_AP] = @PROPRIETARIO_AP" 
           InsertCommand="INSERT INTO [PROPRIETARIO] ([NOME_PROPRIETARIO1], [NOME_PROPRIETARIO2], [PROPRIETARIO_BLOCO], [PROPRIETARIO_AP], [email], [STATUS]) VALUES (@NOME_PROPRIETARIO1, @NOME_PROPRIETARIO2, @PROPRIETARIO_BLOCO, @PROPRIETARIO_AP, @email, @STATUS)" 
           SelectCommand="SELECT [NOME_PROPRIETARIO1], [NOME_PROPRIETARIO2], [PROPRIETARIO_BLOCO], [PROPRIETARIO_AP], [email], [STATUS] FROM [PROPRIETARIO] WHERE [STATUS] = 0 AND [PERMISAO_PROPRIETARIO] = 99 ORDER BY [DataCadastro] DESC" 
           
           
         UpdateCommand="UPDATE [PROPRIETARIO] SET [NOME_PROPRIETARIO1] = @NOME_PROPRIETARIO1, [NOME_PROPRIETARIO2] = @NOME_PROPRIETARIO2, [email] = @email, [STATUS] = @STATUS WHERE [PROPRIETARIO_BLOCO] = @PROPRIETARIO_BLOCO AND [PROPRIETARIO_AP] = @PROPRIETARIO_AP">
           <DeleteParameters>
               <asp:Parameter Name="PROPRIETARIO_BLOCO" Type="Int32" />
               <asp:Parameter Name="PROPRIETARIO_AP" Type="Int32" />
           </DeleteParameters>
           <InsertParameters>
               <asp:Parameter Name="NOME_PROPRIETARIO1" Type="String" />
               <asp:Parameter Name="NOME_PROPRIETARIO2" Type="String" />
               <asp:Parameter Name="PROPRIETARIO_BLOCO" Type="Int32" />
               <asp:Parameter Name="PROPRIETARIO_AP" Type="Int32" />
               <asp:Parameter Name="email" Type="String" />
               <asp:Parameter Name="STATUS" Type="Boolean" />
           </InsertParameters>
           <UpdateParameters>
               <asp:Parameter Name="NOME_PROPRIETARIO1" Type="String" />
               <asp:Parameter Name="NOME_PROPRIETARIO2" Type="String" />
               <asp:Parameter Name="email" Type="String" />
               <asp:Parameter Name="STATUS" Type="Boolean" />
               <asp:Parameter Name="PROPRIETARIO_BLOCO" Type="Int32" />
               <asp:Parameter Name="PROPRIETARIO_AP" Type="Int32" />
           </UpdateParameters>
       </asp:SqlDataSource>
</asp:Content>
