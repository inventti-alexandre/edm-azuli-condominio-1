<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GerenciarClassificadoMorador.aspx.cs" Inherits="Azuli.Web.Portal.GerenciarClassificadoMorador" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <br />
<br />
<br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" DataKeyNames="Classificado_id" 
        DataSourceID="SqlDataSourceEditClassificado">
        <Columns>
            <asp:BoundField DataField="Classificado_assunto" HeaderText="Assunto" 
                SortExpression="Classificado_assunto" />
            <asp:BoundField DataField="Classificado_Descricao" HeaderText="Descrição" 
                SortExpression="Classificado_Descricao" />
            <asp:BoundField DataField="Classificado_id" HeaderText="Classificado_id" 
                InsertVisible="False" ReadOnly="True" SortExpression="Classificado_id" 
                Visible="False" />
            <asp:BoundField DataField="Classificado_Bloco" HeaderText="Bloco" 
                SortExpression="Classificado_Bloco" />
            <asp:BoundField DataField="Classificado_AP" HeaderText="Apartamento" 
                SortExpression="Classificado_AP" />
            <asp:BoundField DataField="Classificado_Status" HeaderText="Status" 
                SortExpression="Classificado_Status" />
            <asp:BoundField DataField="Classificado_email_contato" HeaderText="Email" 
                SortExpression="Classificado_email_contato" />
            <asp:BoundField DataField="Classificado_Tel1" HeaderText="Telefone" 
                SortExpression="Classificado_Tel1" />
            <asp:DynamicField DataField="Classificado_Tel2" HeaderText="Celular" />
            <asp:BoundField DataField="Classificado_Valor" HeaderText="Preço" 
                SortExpression="Classificado_Valor" />
            <asp:BoundField DataField="Classificado_Contato" HeaderText="Contato" 
                SortExpression="Classificado_Contato" />
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceEditClassificado" runat="server" 
        ConflictDetection="CompareAllValues" 
        ConnectionString="<%$ ConnectionStrings:azulli %>" 
        DeleteCommand="DELETE FROM [Classificados] WHERE [Classificado_id] = @original_Classificado_id AND (([Classificado_Grupo] = @original_Classificado_Grupo) OR ([Classificado_Grupo] IS NULL AND @original_Classificado_Grupo IS NULL)) AND (([Classificado_Data] = @original_Classificado_Data) OR ([Classificado_Data] IS NULL AND @original_Classificado_Data IS NULL)) AND (([Classificado_Bloco] = @original_Classificado_Bloco) OR ([Classificado_Bloco] IS NULL AND @original_Classificado_Bloco IS NULL)) AND (([Classificado_AP] = @original_Classificado_AP) OR ([Classificado_AP] IS NULL AND @original_Classificado_AP IS NULL)) AND (([Classificado_Descricao] = @original_Classificado_Descricao) OR ([Classificado_Descricao] IS NULL AND @original_Classificado_Descricao IS NULL)) AND (([Classificado_Status] = @original_Classificado_Status) OR ([Classificado_Status] IS NULL AND @original_Classificado_Status IS NULL)) AND (([Classificado_Validade] = @original_Classificado_Validade) OR ([Classificado_Validade] IS NULL AND @original_Classificado_Validade IS NULL)) AND (([Classificado_Img1] = @original_Classificado_Img1) OR ([Classificado_Img1] IS NULL AND @original_Classificado_Img1 IS NULL)) AND (([Classificado_Img2] = @original_Classificado_Img2) OR ([Classificado_Img2] IS NULL AND @original_Classificado_Img2 IS NULL)) AND (([Classificado_Img3] = @original_Classificado_Img3) OR ([Classificado_Img3] IS NULL AND @original_Classificado_Img3 IS NULL)) AND (([Classificado_Img4] = @original_Classificado_Img4) OR ([Classificado_Img4] IS NULL AND @original_Classificado_Img4 IS NULL)) AND (([Classificado_email_contato] = @original_Classificado_email_contato) OR ([Classificado_email_contato] IS NULL AND @original_Classificado_email_contato IS NULL)) AND (([Classificado_Tel1] = @original_Classificado_Tel1) OR ([Classificado_Tel1] IS NULL AND @original_Classificado_Tel1 IS NULL)) AND (([Classificado_Tel2] = @original_Classificado_Tel2) OR ([Classificado_Tel2] IS NULL AND @original_Classificado_Tel2 IS NULL)) AND (([Classificado_Data_Venda] = @original_Classificado_Data_Venda) OR ([Classificado_Data_Venda] IS NULL AND @original_Classificado_Data_Venda IS NULL)) AND (([Classificado_Valor] = @original_Classificado_Valor) OR ([Classificado_Valor] IS NULL AND @original_Classificado_Valor IS NULL)) AND (([Classificado_Contato] = @original_Classificado_Contato) OR ([Classificado_Contato] IS NULL AND @original_Classificado_Contato IS NULL)) AND (([Classificado_assunto] = @original_Classificado_assunto) OR ([Classificado_assunto] IS NULL AND @original_Classificado_assunto IS NULL))" 
        InsertCommand="INSERT INTO [Classificados] ([Classificado_Grupo], [Classificado_Data], [Classificado_Bloco], [Classificado_AP], [Classificado_Descricao], [Classificado_Status], [Classificado_Validade], [Classificado_Img1], [Classificado_Img2], [Classificado_Img3], [Classificado_Img4], [Classificado_email_contato], [Classificado_Tel1], [Classificado_Tel2], [Classificado_Data_Venda], [Classificado_Valor], [Classificado_Contato], [Classificado_assunto]) VALUES (@Classificado_Grupo, @Classificado_Data, @Classificado_Bloco, @Classificado_AP, @Classificado_Descricao, @Classificado_Status, @Classificado_Validade, @Classificado_Img1, @Classificado_Img2, @Classificado_Img3, @Classificado_Img4, @Classificado_email_contato, @Classificado_Tel1, @Classificado_Tel2, @Classificado_Data_Venda, @Classificado_Valor, @Classificado_Contato, @Classificado_assunto)" 
        OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT * FROM [Classificados] WHERE ([Classificado_id] = @Classificado_id)" 
        UpdateCommand="UPDATE [Classificados] SET [Classificado_Grupo] = @Classificado_Grupo, [Classificado_Data] = @Classificado_Data, [Classificado_Bloco] = @Classificado_Bloco, [Classificado_AP] = @Classificado_AP, [Classificado_Descricao] = @Classificado_Descricao, [Classificado_Status] = @Classificado_Status, [Classificado_Validade] = @Classificado_Validade, [Classificado_Img1] = @Classificado_Img1, [Classificado_Img2] = @Classificado_Img2, [Classificado_Img3] = @Classificado_Img3, [Classificado_Img4] = @Classificado_Img4, [Classificado_email_contato] = @Classificado_email_contato, [Classificado_Tel1] = @Classificado_Tel1, [Classificado_Tel2] = @Classificado_Tel2, [Classificado_Data_Venda] = @Classificado_Data_Venda, [Classificado_Valor] = @Classificado_Valor, [Classificado_Contato] = @Classificado_Contato, [Classificado_assunto] = @Classificado_assunto WHERE [Classificado_id] = @original_Classificado_id AND (([Classificado_Grupo] = @original_Classificado_Grupo) OR ([Classificado_Grupo] IS NULL AND @original_Classificado_Grupo IS NULL)) AND (([Classificado_Data] = @original_Classificado_Data) OR ([Classificado_Data] IS NULL AND @original_Classificado_Data IS NULL)) AND (([Classificado_Bloco] = @original_Classificado_Bloco) OR ([Classificado_Bloco] IS NULL AND @original_Classificado_Bloco IS NULL)) AND (([Classificado_AP] = @original_Classificado_AP) OR ([Classificado_AP] IS NULL AND @original_Classificado_AP IS NULL)) AND (([Classificado_Descricao] = @original_Classificado_Descricao) OR ([Classificado_Descricao] IS NULL AND @original_Classificado_Descricao IS NULL)) AND (([Classificado_Status] = @original_Classificado_Status) OR ([Classificado_Status] IS NULL AND @original_Classificado_Status IS NULL)) AND (([Classificado_Validade] = @original_Classificado_Validade) OR ([Classificado_Validade] IS NULL AND @original_Classificado_Validade IS NULL)) AND (([Classificado_Img1] = @original_Classificado_Img1) OR ([Classificado_Img1] IS NULL AND @original_Classificado_Img1 IS NULL)) AND (([Classificado_Img2] = @original_Classificado_Img2) OR ([Classificado_Img2] IS NULL AND @original_Classificado_Img2 IS NULL)) AND (([Classificado_Img3] = @original_Classificado_Img3) OR ([Classificado_Img3] IS NULL AND @original_Classificado_Img3 IS NULL)) AND (([Classificado_Img4] = @original_Classificado_Img4) OR ([Classificado_Img4] IS NULL AND @original_Classificado_Img4 IS NULL)) AND (([Classificado_email_contato] = @original_Classificado_email_contato) OR ([Classificado_email_contato] IS NULL AND @original_Classificado_email_contato IS NULL)) AND (([Classificado_Tel1] = @original_Classificado_Tel1) OR ([Classificado_Tel1] IS NULL AND @original_Classificado_Tel1 IS NULL)) AND (([Classificado_Tel2] = @original_Classificado_Tel2) OR ([Classificado_Tel2] IS NULL AND @original_Classificado_Tel2 IS NULL)) AND (([Classificado_Data_Venda] = @original_Classificado_Data_Venda) OR ([Classificado_Data_Venda] IS NULL AND @original_Classificado_Data_Venda IS NULL)) AND (([Classificado_Valor] = @original_Classificado_Valor) OR ([Classificado_Valor] IS NULL AND @original_Classificado_Valor IS NULL)) AND (([Classificado_Contato] = @original_Classificado_Contato) OR ([Classificado_Contato] IS NULL AND @original_Classificado_Contato IS NULL)) AND (([Classificado_assunto] = @original_Classificado_assunto) OR ([Classificado_assunto] IS NULL AND @original_Classificado_assunto IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_Classificado_id" Type="Decimal" />
            <asp:Parameter Name="original_Classificado_Grupo" Type="Int32" />
            <asp:Parameter Name="original_Classificado_Data" Type="DateTime" />
            <asp:Parameter Name="original_Classificado_Bloco" Type="Int32" />
            <asp:Parameter Name="original_Classificado_AP" Type="Int32" />
            <asp:Parameter Name="original_Classificado_Descricao" Type="String" />
            <asp:Parameter Name="original_Classificado_Status" Type="String" />
            <asp:Parameter Name="original_Classificado_Validade" Type="DateTime" />
            <asp:Parameter Name="original_Classificado_Img1" Type="String" />
            <asp:Parameter Name="original_Classificado_Img2" Type="String" />
            <asp:Parameter Name="original_Classificado_Img3" Type="String" />
            <asp:Parameter Name="original_Classificado_Img4" Type="String" />
            <asp:Parameter Name="original_Classificado_email_contato" Type="String" />
            <asp:Parameter Name="original_Classificado_Tel1" Type="String" />
            <asp:Parameter Name="original_Classificado_Tel2" Type="String" />
            <asp:Parameter Name="original_Classificado_Data_Venda" Type="DateTime" />
            <asp:Parameter Name="original_Classificado_Valor" Type="Decimal" />
            <asp:Parameter Name="original_Classificado_Contato" Type="String" />
            <asp:Parameter Name="original_Classificado_assunto" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Classificado_Grupo" Type="Int32" />
            <asp:Parameter Name="Classificado_Data" Type="DateTime" />
            <asp:Parameter Name="Classificado_Bloco" Type="Int32" />
            <asp:Parameter Name="Classificado_AP" Type="Int32" />
            <asp:Parameter Name="Classificado_Descricao" Type="String" />
            <asp:Parameter Name="Classificado_Status" Type="String" />
            <asp:Parameter Name="Classificado_Validade" Type="DateTime" />
            <asp:Parameter Name="Classificado_Img1" Type="String" />
            <asp:Parameter Name="Classificado_Img2" Type="String" />
            <asp:Parameter Name="Classificado_Img3" Type="String" />
            <asp:Parameter Name="Classificado_Img4" Type="String" />
            <asp:Parameter Name="Classificado_email_contato" Type="String" />
            <asp:Parameter Name="Classificado_Tel1" Type="String" />
            <asp:Parameter Name="Classificado_Tel2" Type="String" />
            <asp:Parameter Name="Classificado_Data_Venda" Type="DateTime" />
            <asp:Parameter Name="Classificado_Valor" Type="Decimal" />
            <asp:Parameter Name="Classificado_Contato" Type="String" />
            <asp:Parameter Name="Classificado_assunto" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="Classificado_id" 
                QueryStringField="codigo" Type="Decimal" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Classificado_Grupo" Type="Int32" />
            <asp:Parameter Name="Classificado_Data" Type="DateTime" />
            <asp:Parameter Name="Classificado_Bloco" Type="Int32" />
            <asp:Parameter Name="Classificado_AP" Type="Int32" />
            <asp:Parameter Name="Classificado_Descricao" Type="String" />
            <asp:Parameter Name="Classificado_Status" Type="String" />
            <asp:Parameter Name="Classificado_Validade" Type="DateTime" />
            <asp:Parameter Name="Classificado_Img1" Type="String" />
            <asp:Parameter Name="Classificado_Img2" Type="String" />
            <asp:Parameter Name="Classificado_Img3" Type="String" />
            <asp:Parameter Name="Classificado_Img4" Type="String" />
            <asp:Parameter Name="Classificado_email_contato" Type="String" />
            <asp:Parameter Name="Classificado_Tel1" Type="String" />
            <asp:Parameter Name="Classificado_Tel2" Type="String" />
            <asp:Parameter Name="Classificado_Data_Venda" Type="DateTime" />
            <asp:Parameter Name="Classificado_Valor" Type="Decimal" />
            <asp:Parameter Name="Classificado_Contato" Type="String" />
            <asp:Parameter Name="Classificado_assunto" Type="String" />
            <asp:Parameter Name="original_Classificado_id" Type="Decimal" />
            <asp:Parameter Name="original_Classificado_Grupo" Type="Int32" />
            <asp:Parameter Name="original_Classificado_Data" Type="DateTime" />
            <asp:Parameter Name="original_Classificado_Bloco" Type="Int32" />
            <asp:Parameter Name="original_Classificado_AP" Type="Int32" />
            <asp:Parameter Name="original_Classificado_Descricao" Type="String" />
            <asp:Parameter Name="original_Classificado_Status" Type="String" />
            <asp:Parameter Name="original_Classificado_Validade" Type="DateTime" />
            <asp:Parameter Name="original_Classificado_Img1" Type="String" />
            <asp:Parameter Name="original_Classificado_Img2" Type="String" />
            <asp:Parameter Name="original_Classificado_Img3" Type="String" />
            <asp:Parameter Name="original_Classificado_Img4" Type="String" />
            <asp:Parameter Name="original_Classificado_email_contato" Type="String" />
            <asp:Parameter Name="original_Classificado_Tel1" Type="String" />
            <asp:Parameter Name="original_Classificado_Tel2" Type="String" />
            <asp:Parameter Name="original_Classificado_Data_Venda" Type="DateTime" />
            <asp:Parameter Name="original_Classificado_Valor" Type="Decimal" />
            <asp:Parameter Name="original_Classificado_Contato" Type="String" />
            <asp:Parameter Name="original_Classificado_assunto" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
