<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GerenciarClassificadoMorador.aspx.cs" Inherits="Azuli.Web.Portal.GerenciarClassificadoMorador" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
  
     <fieldset class="loginDisplayLegend" >
   <legend class="accordionContent">Editar classificados:</legend><br />
   <center><asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
        CssClass="GridView" Height="50px" Width="447px" 
           onitemcommand="DetailsView1_ItemCommand" DataKeyNames="idClassificado">
        <Fields>
            <asp:TemplateField HeaderText="Id Classificado" Visible="False">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("idClassificado") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("idClassificado") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("idClassificado") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Título">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" width="295px" runat="server" 
                        Text='<%# Bind("assuntoClassificado") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" 
                        Text='<%# Bind("assuntoClassificado") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("assuntoClassificado") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Descrição">
                <EditItemTemplate>
               
                    <asp:TextBox TextMode="MultiLine" ID="TextBox2" Height="90px" Width="295px" runat="server" 
                        Text='<%# Bind("descricaoClassificado") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" 
                        Text='<%# Bind("descricaoClassificado") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" 
                        Text='<%# Bind("descricaoClassificado") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Telefone">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" 
                        Text='<%# Bind("classificadoTelefone1") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" 
                        Text='<%# Bind("classificadoTelefone1") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" 
                        Text='<%# Bind("classificadoTelefone1") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Celular">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" 
                        Text='<%# Bind("classificadoTelefone2") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" 
                        Text='<%# Bind("classificadoTelefone2") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" 
                        Text='<%# Bind("classificadoTelefone2") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="E-mail">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" 
                        Text='<%# Bind("emailClassificadoContato") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" 
                        Text='<%# Bind("emailClassificadoContato") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" 
                        Text='<%# Bind("emailClassificadoContato") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Valor">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" Width="90px" runat="server" 
                        Text='<%# Bind("valorVendaClassificado") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox6" Width="30px" runat="server" 
                        Text='<%# Bind("valorVendaClassificado") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" 
                        Text='<%# Bind("valorVendaClassificado") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Status Classificado">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox7" Width="10px" runat="server" 
                        Text='<%# Bind("statusClassificado") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" 
                        Text='<%# Bind("statusClassificado") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("statusClassificado") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="True" 
                        CommandName="Update" Text="Atualizar" />
                    &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" 
                        CommandName="Cancel" Text="Cancelar" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="False" 
                        CommandName="Edit" Text="Edit" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="IMG1" Visible="False">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox10" runat="server" 
                        Text='<%# Bind("classificadoimg1") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox10" runat="server" 
                        Text='<%# Bind("classificadoimg1") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label10" runat="server" Text='<%# Bind("classificadoimg1") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="IMG2" Visible="False">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox11" runat="server" 
                        Text='<%# Bind("classificadoimg2") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox11" runat="server" 
                        Text='<%# Bind("classificadoimg2") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label11" runat="server" Text='<%# Bind("classificadoimg2") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="IMG3" Visible="False">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox12" runat="server" 
                        Text='<%# Bind("classificadoimg3") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox12" runat="server" 
                        Text='<%# Bind("classificadoimg3") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label12" runat="server" Text='<%# Bind("classificadoimg3") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="IMG4" Visible="False">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox13" runat="server" 
                        Text='<%# Bind("classificadoimg4") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox13" runat="server" 
                        Text='<%# Bind("classificadoimg4") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label13" runat="server" Text='<%# Bind("classificadoimg4") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="classificadoDataVenda" HeaderText="Data Venda" 
                Visible="False" />
        </Fields>
    </asp:DetailsView></center> 
    <br /></fieldset>
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
