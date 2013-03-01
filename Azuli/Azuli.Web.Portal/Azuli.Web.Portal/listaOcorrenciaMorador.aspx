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
            <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSourceDataListOcorrencia"
                EnableViewState="False" Style="margin-right: 1px" Width="508px" >
                <HeaderTemplate>
                    <h2 class="passwordEntry" align="center" dir="ltr">
                        Suas Ocorrências</h2>
                </HeaderTemplate>
                <ItemTemplate>
                    <B>OCORRÊNCIA:</B>
                    
                    <asp:Label ID="OCORRENCIALabel" runat="server" 
                        Text= ' <%# Eval("OCORRENCIA") %> ' Font-Bold="True" ForeColor="#4B6C9E" />
                    <br />
                    <B>ASSUNTO SOBRE:</B>
                    <asp:Label ID="DescricaoOcorrenciaLabel" runat="server" 
                        Text='<%# Eval("DescricaoOcorrencia") %>'  Font-Bold="True" ForeColor="#4B6C9E"/>
                    <br />
                    <B>DATA DE ABERTURA:</B>
                    <asp:Label ID="DATA_OCORRENCIALabel" runat="server" 
                        Text='<%# Eval("DATA_OCORRENCIA") %>'  Font-Bold="True" ForeColor="#4B6C9E"/>
                    <br />
                   <B> STATUS:</B>
                    <asp:Label ID="STATUSLabel" runat="server" Text='<%# Eval("STATUS") %>'  Font-Bold="True" ForeColor="#4B6C9E"/>
                    <br />
                   <B> DESCRICÃO DA PROBLEMA:</B>
                    <asp:Label ID="DESCRICAOLabel" runat="server" Text='<%# Eval("DESCRICAO") %>'  Font-Bold="True" ForeColor="#4B6C9E"/>
                    <br />
                   <B> DATA DE TÉRMINO:</B>
                    <asp:Label ID="DATA_FINALIZACAOLabel" runat="server" 
                        Text='<%# Eval("DATA_FINALIZACAO") %>'  Font-Bold="True" ForeColor="#4B6C9E"/>
                    <br />
                   
                   <B> imagem:</B>
                    <asp:Label ID="imagemLabel" runat="server" Text='<%# Eval("imagem") %>'  Font-Bold="True" ForeColor="#4B6C9E"/>
                    <br />
                    <br />
                </ItemTemplate>
                <SeparatorTemplate>
                    <hr />
                </SeparatorTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSourceDataListOcorrencia" runat="server" 
                ConnectionString="<%$ ConnectionStrings:azulli %>" 
                SelectCommand="LISTA_OCORRENCIA_MORADOR" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="BLOCO" DefaultValue="06" SessionField="bloco" Type="Int32" />
                    <asp:SessionParameter Name="AP" DefaultValue="301" SessionField="Ap" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
    </fieldset>
    </center>
</asp:Content>
