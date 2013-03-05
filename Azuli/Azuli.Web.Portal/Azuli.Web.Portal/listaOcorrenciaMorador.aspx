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

            <asp:HyperLink ID="hpProximo" runat="server">Próximo</asp:HyperLink>
            <asp:HyperLink ID="hpAnterior" runat="server">Anterior</asp:HyperLink>

         <asp:Label ID="lblMeses" runat="server" CssClass="AlternatingRowStyle" 
        Text="Ocorrência no mês de:" Font-Bold="True" Font-Size="Medium"></asp:Label>
&nbsp;<asp:DropDownList ID="drpMeses" runat="server" Height="30px" Width="243px" 
                CssClass="menu" AutoPostBack="True" 
                onselectedindexchanged="drpMeses_SelectedIndexChanged">
    </asp:DropDownList>
            <br />
            <br />
            <asp:DataList ID="DataList1" runat="server"
                EnableViewState="False" Style="margin-right: 1px" Width="508px" 
                RepeatLayout="Flow" >
                <HeaderTemplate>
                  <asp:Label ID="lblSemregistro" runat="server" Text="Ocorrências Abertas" Visible='<%#(DataList1.Items.Count > 0) %>'></asp:Label>
                </HeaderTemplate>
                <ItemTemplate>
                    OCORRENCIA:
                    
                    <asp:Label ID="OCORRENCIALabel" runat="server" 
                        Text= '<%# Eval("oOcorrencia.codigoOcorencia") %>' />
                    <br />
                    DATA_OCORRENCIA:
                    <asp:Label ID="DATA_OCORRENCIALabel" runat="server" 
                        Text='<%# Eval("dataOcorrencia") %>'/>
                    <br />
                    STATUS:
                    <asp:Label ID="STATUSLabel" runat="server" 
                        Text='<%# Eval("statusOcorrencia") %>'/>
                    <br />
                    DESCRICAO:
                    <asp:Label ID="DESCRICAOLabel" runat="server" Text='<%# Eval("ocorrenciaLancamento") %>'/>
                    <br />
                    DATA_FINALIZACAO:
                    <asp:Label ID="DATA_FINALIZACAOLabel" runat="server" 
                        Text='<%# Eval("dataFinalizacao") %>'/>
                    <br />
                    DescricaoOcorrencia:
                    <asp:Label ID="DescricaoOcorrenciaLabel" runat="server" 
                        Text='<%# Eval("descricaoOcorrencia") %>'/>
                    <br />
                   
                    imagem:
                    <asp:Label ID="imagemLabel" runat="server" Text='<%# Eval("imagemEvidencia") %>'/>
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
            </fieldset>
    </center>
</asp:Content>
