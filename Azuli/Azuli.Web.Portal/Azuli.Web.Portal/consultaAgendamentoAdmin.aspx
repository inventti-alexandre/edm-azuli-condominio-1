<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="consultaAgendamentoAdmin.aspx.cs" Inherits="Azuli.Web.Portal.consultaAgendamentoAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <br />
<center>
<fieldset>
        <legend>Consulta de Reservas: </legend>

     <table class="style1">
            <tr>
                <td class="style2">
                    <asp:Label ID="lblMes" runat="server" Font-Bold="True" Text="Mês:"></asp:Label>
                    &nbsp;<asp:DropDownList ID="drpMeses" runat="server" CssClass="btGeral" Font-Bold="True"
                        Height="16px" Width="101px" AutoPostBack="True" 
                        onselectedindexchanged="drpMeses_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
                <td class="style3">
                    <asp:Label ID="lblAno" runat="server" Font-Bold="True" Text="Ano:"></asp:Label>
                    <asp:DropDownList ID="drpAno" runat="server" CssClass="btGeral" Font-Bold="True"
                        Height="16px" Width="101px" AutoPostBack="True" 
                        onselectedindexchanged="drpAno_SelectedIndexChanged"   >
                      
                    </asp:DropDownList>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
                <td>
                    <asp:Label ID="lbSalao" runat="server" Font-Bold="True" Text="Área :"></asp:Label>
                    <asp:DropDownList ID="drpSalao" runat="server" CssClass="btGeral" Font-Bold="True"
                        Height="19px" Width="127px" AutoPostBack="True" 
                        onselectedindexchanged="drpSalao_SelectedIndexChanged" >
                        <asp:ListItem Value="3">todas</asp:ListItem>
                        <asp:ListItem Value="1">Festa</asp:ListItem>
                        <asp:ListItem Value="2">Churrasqueira</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
        </table> <br />


   <div id="dvFesta" runat="server"> 
       
        </div>
       
      <legend>Salão de Festa: </legend>
    <asp:GridView ID="grdFesta" runat="server" CssClass="GridView" 
            AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" 
            Width="822px">
        <Columns>
            <asp:BoundField DataField="dataAgendamento" HeaderText="AGENDAMENTO" 
                SortExpression="dataAgendamento" ReadOnly="True" />
            <asp:TemplateField HeaderText="BLOCO" SortExpression="PROPRIETARIO_BLOCO">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("ap.bloco") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("ap.bloco") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="APARTAMENTO" SortExpression="PROPRIETARIO_AP">
                <EditItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("ap.apartamento") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("ap.apartamento") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CheckBoxField DataField="salaoFesta" HeaderText="SALÃO DE FESTA" 
                SortExpression="salaoFesta" />
            <asp:CommandField ButtonType="Image" CancelImageUrl="~/images/cancel.png" 
                EditImageUrl="~/images/edit.png" ShowEditButton="True" 
                UpdateImageUrl="~/images/save.png" />
        </Columns>
    </asp:GridView>

     </div>

        <asp:SqlDataSource ID="SqlDataSourceConsultaAgenda" runat="server" 
            ConnectionString="<%$ ConnectionStrings:azulli %>" 
            
            
            SelectCommand="SELECT [DATA_AGENDAMENTO], [PROPRIETARIO_BLOCO], [PROPRIETARIO_AP], [SALAO_FESTA] FROM [AGENDA] ORDER BY [DATA_AGENDAMENTO]">
        </asp:SqlDataSource>
            <br />
           
            <div id="divChurrasco" runat="server">
            
            
             </div>
            
            
             <legend>Salão de Churrasco: </legend> 
    <asp:GridView ID="grdChurrasco" runat="server" CssClass="GridView" 
            AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" 
            Width="822px">
        <Columns>
            <asp:BoundField DataField="dataAgendamento" HeaderText="AGENDAMENTO" 
                SortExpression="dataAgendamento" ReadOnly="True" />
             <asp:TemplateField HeaderText="BLOCO" SortExpression="PROPRIETARIO_BLOCO">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("ap.bloco") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("ap.bloco") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="APARTAMENTO" SortExpression="PROPRIETARIO_AP">
                <EditItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("ap.apartamento") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("ap.apartamento") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CheckBoxField DataField="salaoChurrasco" HeaderText="CHURRASQUEIRA" 
                SortExpression="salaoChurrasco" />
            <asp:CommandField ButtonType="Image" CancelImageUrl="~/images/cancel.png" 
                EditImageUrl="~/images/edit.png" ShowEditButton="True" 
                UpdateImageUrl="~/images/save.png" />
        </Columns>
    </asp:GridView>
     
     </div>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:azulli %>" 
            
            SelectCommand="SELECT * FROM [AGENDA] WHERE ([SALAO_FESTA] = @SALAO_FESTA)">
            <SelectParameters>
                <asp:ControlParameter ControlID="drpAno" DefaultValue="0" Name="SALAO_FESTA" 
                    PropertyName="SelectedValue" Type="Boolean" />
            </SelectParameters>
        </asp:SqlDataSource>
          
    </fieldset></center> 
</asp:Content>
