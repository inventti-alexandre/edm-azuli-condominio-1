<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="ConfigurarValorReserva.aspx.cs" Inherits="Azuli.Web.Portal.ConfigurarValorReserva" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style3
        {
            background-color: #F0F0F0;
            border-left: 2px solid #999999;
            border-right: 2px solid #999999;
            border-botom: 2px solid #999999;
            padding: 5px 5px 5px 5px;
            font-family: Verdana;
            font-size: 10pt;
            color: #666666;
            border-radius: 1em;
            height: 15px;
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
  
<fieldset class="loginDisplayLegend">
        <legend class="style3">Cadastrar Área e Valor:</legend>

  <center><div id="dvProprietario" runat="server" >
   
        <br />
        <table class="accordionContent" dir="ltr" frame="border" style="width: 375px" >
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" 
                        Text="Área Comum" style="font-weight: 700; font-size: 10pt"></asp:Label>
                </td>
                <td class="left">
                    <asp:TextBox ID="txtArea" runat="server" Height="21px" 
                        Width="147px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvNovaSenha" runat="server" 
                        CssClass="failureNotification" ErrorMessage="*" 
                        ValidationGroup="alteraSenha" ControlToValidate="txtArea"></asp:RequiredFieldValidator>
                </td>
                <td class="left">
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Valor: " 
                        style="font-weight: 700; font-size: 10pt"></asp:Label>
                </td>
                <td class="left">
                    <asp:TextBox ID="txtValor" runat="server" Height="21px" Width="56px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvRepitaNovaSenha" runat="server" 
                        CssClass="failureNotification" ErrorMessage="*" 
                        ValidationGroup="alteraSenha" ControlToValidate="txtValor"></asp:RequiredFieldValidator>
                </td>
                <td class="left">
                    &nbsp;</td>
            </tr>
          
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnAlteraSenha" runat="server" CssClass="botao" Text="Cadastrar" 
                        Width="105px" 
                        ValidationGroup="alteraSenha" />
                </td>  </tr>
              
        </table>
    </div></center><br /><center><asp:Label ID="lblMensagem" runat="server" CssClass="failureNotification"></asp:Label>
            <br />
            <br />
             <asp:ObjectDataSource ID="ObjectDataSourceLista" runat="server" 
               
                SelectMethod="oListaValorReserva" 
                UpdateMethod="alteraConfiguracaArea"
                TypeName="Azuli.Web.Business.ConfiguracaoReservaBLL">
               <UpdateParameters>
               <asp:Parameter Name="id_valor" Type="Int32" />
               <asp:Parameter Name="area" Type="String" />
               <asp:Parameter Name="valor" Type="Double" />
               
               </UpdateParameters>
                </asp:ObjectDataSource>
            <asp:GridView ID="grdConfigArea" runat="server" 
                AutoGenerateColumns="False" CssClass="gridl" 
                DataSourceID="ObjectDataSourceLista" DataKeyNames="id_valor,area,valor">
                <Columns>
                    <asp:TemplateField HeaderText="id_valor" SortExpression="id_valor" 
                        Visible="False">
                        <EditItemTemplate>
                            <asp:TextBox ID="id_valor" runat="server" Text='<%# Bind("id_valor") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("id_valor") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Área" SortExpression="area">
                        <EditItemTemplate>
                            <asp:TextBox ID="area" runat="server" Text='<%# Bind("area") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("area") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Valor" SortExpression="valor">
                        <EditItemTemplate>
                            <asp:TextBox ID="valor" runat="server" Text='<%# Bind("valor", "{0:N2}") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="valor" runat="server" Text=' <%# "R$ " + Eval("valor", "{0:N2}") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Font-Bold="True" ForeColor="#006600" />
                    </asp:TemplateField>
                    <asp:CommandField EditText="Alterar" ShowEditButton="True" ButtonType="Button" 
                        CancelImageUrl="~/images/cancelar.jpg" CancelText="Cancelar" 
                        EditImageUrl="~/images/edit.png" UpdateImageUrl="~/images/save.png" 
                        UpdateText="Salvar" >
                    <ControlStyle BackColor="#0099CC" Font-Bold="True" ForeColor="White" />
                    <ItemStyle HorizontalAlign="Center" Width="180px" Font-Bold="True" 
                        ForeColor="White" />
                    </asp:CommandField>
                </Columns>
            </asp:GridView>
           

        </center> </fieldset>
</asp:Content>

