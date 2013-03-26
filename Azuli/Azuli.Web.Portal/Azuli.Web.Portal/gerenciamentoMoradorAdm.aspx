<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="gerenciamentoMoradorAdm.aspx.cs" Inherits="Azuli.Web.Portal.gerenciamentoMoradorAdm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
 <br /><br /> 
 
 <fieldset>  
   <legend class="AlternatingRowStyle">Cadastrar Moradores</legend>
   <center> 
   <br />


 <table >
     
         <tr>
            <td>
                <asp:Label ID="lblcond01" runat="server" CssClass="Field" 
                   >Condomino 01</asp:Label>
            </td>
            <td colspan="2">
                <asp:TextBox ID="txtCond01" runat="server" CssClass="ObjectLarge" MaxLength="100" 
                    Height="21px" Width="273px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCond01" 
                   ValidationGroup="InputValidationGroup">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblCondomino02" runat="server" CssClass="Field" 
                   >Condomino 02</asp:Label>
            </td>
            <td colspan="2">
                <asp:TextBox ID="txtCond02" runat="server" CssClass="ObjectLarge" MaxLength="100" 
                    Height="21px" Width="273px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtCond02" 
                   ValidationGroup="InputValidationGroup">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblBloco" runat="server" CssClass="Field" 
                   >Bloco:</asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtBloco" runat="server" Height="19px" Width="87px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvName0" runat="server" ControlToValidate="txtBloco" 
                   ValidationGroup="InputValidationGroup">*</asp:RequiredFieldValidator>
               
            </td>
            <td>
                <asp:Label ID="lblAP" runat="server" CssClass="Field" 
                   >Apartamento:</asp:Label>
            &nbsp;
                <asp:TextBox ID="txtAP" runat="server" Height="18px" Width="70px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvName1" runat="server" ControlToValidate="txtAP" 
                   ValidationGroup="InputValidationGroup">*</asp:RequiredFieldValidator>
               
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblEmail" runat="server" CssClass="Field" 
                    meta:resourcekey="lblActivity">E-mail</asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server" MaxLength="200"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEmail" 
                   ValidationGroup="InputValidationGroup">*</asp:RequiredFieldValidator>
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <asp:ImageButton ID="ibtAddSave" runat="server" ImageUrl="~/images/add.png" 
        ValidationGroup="InputValidationGroup" onclick="ibtAddSave_Click" />
    &nbsp;&nbsp;&nbsp;
    <asp:ImageButton ID="ibtCancel" runat="server" ImageUrl="~/Images/cancel.png" 
           onclick="ibtCancel_Click"  />
    &nbsp;&nbsp;&nbsp;
    <asp:ImageButton ID="ibtSearch" runat="server" ImageUrl="~/images/search.png" 
           onclick="ibtSearch_Click"  />
       <br />
       <br />
       <asp:Label ID="lblMsg" runat="server" Font-Bold="True"></asp:Label>
       <center><hr />
   <legend class="AlternatingRowStyle">Gerenciamento de Moradores</legend>
   <br />
  
       <asp:GridView ID="grdGerenciamentoMoradores" runat="server" AllowPaging="True" 
           AllowSorting="True" AutoGenerateColumns="False" CssClass="GridView" 
           DataKeyNames="PROPRIETARIO_BLOCO,PROPRIETARIO_AP" 
           DataSourceID="SqlDataSourceGerenciamentoUser" Height="86px" Width="852px">
           <Columns>
               <asp:BoundField DataField="NOME_PROPRIETARIO1" HeaderText="Condomino 01" 
                   SortExpression="NOME_PROPRIETARIO1" />
               <asp:BoundField DataField="NOME_PROPRIETARIO2" HeaderText="Condomino 02" 
                   SortExpression="NOME_PROPRIETARIO2" />
               <asp:BoundField DataField="PROPRIETARIO_BLOCO" HeaderText="Bloco" 
                   ReadOnly="True" SortExpression="PROPRIETARIO_BLOCO" />
               <asp:BoundField DataField="PROPRIETARIO_AP" HeaderText="Apartamento" 
                   ReadOnly="True" SortExpression="PROPRIETARIO_AP" />
               <asp:BoundField DataField="email" HeaderText="E-mail" SortExpression="email" />
               <asp:CheckBoxField DataField="STATUS" HeaderText="ATIVO" 
                   SortExpression="STATUS" />
               <asp:CommandField ButtonType="Image" CancelImageUrl="~/images/cancel.png" 
                   DeleteImageUrl="~/images/delete.png" EditImageUrl="~/images/edit.png" ShowEditButton="True" 
                   UpdateImageUrl="~/images/save.png" />
           </Columns>
       </asp:GridView>
       <asp:SqlDataSource ID="SqlDataSourceGerenciamentoUser" runat="server" 
           ConnectionString="<%$ ConnectionStrings:azulli %>" 
           DeleteCommand="DELETE FROM [PROPRIETARIO] WHERE [PROPRIETARIO_BLOCO] = @PROPRIETARIO_BLOCO AND [PROPRIETARIO_AP] = @PROPRIETARIO_AP" 
           InsertCommand="INSERT INTO [PROPRIETARIO] ([NOME_PROPRIETARIO1], [NOME_PROPRIETARIO2], [PROPRIETARIO_BLOCO], [PROPRIETARIO_AP], [email], [STATUS]) VALUES (@NOME_PROPRIETARIO1, @NOME_PROPRIETARIO2, @PROPRIETARIO_BLOCO, @PROPRIETARIO_AP, @email, @STATUS)" 
           SelectCommand="SELECT [NOME_PROPRIETARIO1], [NOME_PROPRIETARIO2], [PROPRIETARIO_BLOCO], [PROPRIETARIO_AP], [email], [STATUS] FROM [PROPRIETARIO] ORDER BY [DataCadastro] DESC" 
           
           
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
     </center>
   </fieldset>  
</asp:Content>
