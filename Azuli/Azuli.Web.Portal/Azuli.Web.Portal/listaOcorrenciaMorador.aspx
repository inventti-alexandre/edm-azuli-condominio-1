<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="listaOcorrenciaMorador.aspx.cs" Inherits="Azuli.Web.Portal.listaOcorrenciaMorador" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <fieldset>
        <legend title="Abrir Ocorrência">Abrir Ocorrência </legend>
        <center>

         <asp:Label ID="lblMeses" runat="server" CssClass="AlternatingRowStyle" 
        Text="Ocorrência no mês de:" Font-Bold="True" Font-Size="Medium"></asp:Label>
&nbsp;<asp:DropDownList ID="drpMeses" runat="server" Height="30px" Width="243px" 
                CssClass="menu">
    </asp:DropDownList>
            <br />
            <br />
            <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSourceDataListOcorrencia"
                EnableViewState="False" Style="margin-right: 1px" Width="508px" >
                <HeaderTemplate>
                  <asp:Label ID="lblSemregistro" runat="server" Text="Ocorrências Abertas" Visible='<%#(DataList1.Items.Count > 0) %>'></asp:Label>
                </HeaderTemplate>
                <ItemTemplate>
                    OCORRENCIA:
                    
                    <asp:Label ID="OCORRENCIALabel" runat="server" 
                        Text= '<%# Eval("OCORRENCIA") %>' />
                    <br />
                    DATA_OCORRENCIA:
                    <asp:Label ID="DATA_OCORRENCIALabel" runat="server" 
                        Text='<%# Eval("DATA_OCORRENCIA") %>'/>
                    <br />
                    STATUS:
                    <asp:Label ID="STATUSLabel" runat="server" 
                        Text='<%# Eval("STATUS") %>'/>
                    <br />
                    DESCRICAO:
                    <asp:Label ID="DESCRICAOLabel" runat="server" Text='<%# Eval("DESCRICAO") %>'/>
                    <br />
                    DATA_FINALIZACAO:
                    <asp:Label ID="DATA_FINALIZACAOLabel" runat="server" 
                        Text='<%# Eval("DATA_FINALIZACAO") %>'/>
                    <br />
                    DescricaoOcorrencia:
                    <asp:Label ID="DescricaoOcorrenciaLabel" runat="server" 
                        Text='<%# Eval("DescricaoOcorrencia") %>'/>
                    <br />
                   
                    imagem:
                    <asp:Label ID="imagemLabel" runat="server" Text='<%# Eval("imagem") %>'/>
                    <br />
                    <br />
                </ItemTemplate>
                <SeparatorTemplate>
                    <hr />
                </SeparatorTemplate>
                <FooterTemplate>
                <asp:Label ID="lblSemregistro" runat="server" Text="Você não possui ocorrência cadastrada" Visible='<%#(DataList1.Items.Count == 0) %>'></asp:Label>
                 </FooterTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSourceDataListOcorrencia" runat="server" 
                ConnectionString="<%$ ConnectionStrings:azulli %>" 
                SelectCommand="LISTA_OCORRENCIA_MORADOR" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="BLOCO" DefaultValue="06" SessionField="bloco" Type="Int32" />
                    <asp:SessionParameter Name="AP" DefaultValue="301" SessionField="Ap" Type="Int32" />
                    <asp:ControlParameter ControlID="drpMeses" DefaultValue="-1" Name="MES" 
                        PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
    </fieldset>
    </center>
</asp:Content>
