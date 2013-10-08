<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true"
    CodeBehind="consultaAgendamentoAdmin.aspx.cs" EnableEventValidation ="false" Inherits="Azuli.Web.Portal.consultaAgendamentoAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            color: #4884CD;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <center>
        <fieldset class="loginDisplayLegend">
            <legend class="accordionContent"><span class="style1">Consulta de Reservas:</span> 
                 </legend>
            <br />
            <table class="style1">
                <tr>
                    <td class="style3">
                        <asp:Label ID="lblMes" runat="server" Font-Bold="True" Text="Mês:"></asp:Label>
                        &nbsp;<asp:DropDownList ID="drpMeses" runat="server" CssClass="btGeral" Font-Bold="True"
                            Height="16px" Width="101px" AutoPostBack="True" OnSelectedIndexChanged="drpMeses_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                    <td class="style3">
                        <asp:Label ID="lblAno" runat="server" Font-Bold="True" Text="Ano:"></asp:Label>
                        <asp:DropDownList ID="drpAno" runat="server" CssClass="btGeral" Font-Bold="True"
                            Height="16px" Width="101px" AutoPostBack="True" OnSelectedIndexChanged="drpAno_SelectedIndexChanged">
                        </asp:DropDownList>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </td>
                    <td>
                        <asp:Label ID="lbSalao" runat="server" Font-Bold="True" Text="Área :"></asp:Label>
                        <asp:DropDownList ID="drpSalao" runat="server" CssClass="btGeral" Font-Bold="True"
                            Height="19px" Width="127px" AutoPostBack="True" OnSelectedIndexChanged="drpSalao_SelectedIndexChanged">
                            <asp:ListItem Value="3">Todas</asp:ListItem>
                            <asp:ListItem Value="1">Festa</asp:ListItem>
                            <asp:ListItem Value="2">Churrasqueira</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
            </table>
            <br />
        </fieldset>
        <div id="dvFesta" runat="server">
            <fieldset class="loginDisplayLegend">
                <legend class="accordionContent"><span class="style1">Salão de Festa: </span> <asp:Label ID="lblMesAnoFesta" runat="server" style="font-weight: 700"></asp:Label></legend>
                <br />
                <center>
                    <asp:GridView ID="grdFesta" runat="server" CssClass="GridView" AllowPaging="True"
                        AllowSorting="True" AutoGenerateColumns="False" 
                        EmptyDataText="Não existem reserva para o salão de festa nesta data" 
                        PageSize="31">
                        <Columns>
                            <asp:TemplateField HeaderText="AGENDAMENTO" SortExpression="dataAgendamento">
                                <EditItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("dataAgendamento") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("dataAgendamento", "{0:dddd}") + " - " + Eval("dataAgendamento","{0:dd/MM/yyyy}") %>'>></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
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
                        </Columns>
                    </asp:GridView>
                                   <br />
                                   <asp:ImageButton ID="imgBtExcelFesta" runat="server" 
                   ImageUrl="~/images/excel.png" onclick="imgBtExcelFesta_Click" Width="21px" />
            
                </center>
            </fieldset>
            <asp:SqlDataSource ID="SqlDataSourceConsultaAgenda" runat="server" ConnectionString="<%$ ConnectionStrings:azulli %>"
                SelectCommand="SELECT [DATA_AGENDAMENTO], [PROPRIETARIO_BLOCO], [PROPRIETARIO_AP], [SALAO_FESTA] FROM [AGENDA] ORDER BY [DATA_AGENDAMENTO]">
            </asp:SqlDataSource>
            <br />
        </div>

        <div id="divChurrasco" runat="server">
            <fieldset class="loginDisplayLegend">
                <legend class="accordionContent"><span class="style1">Salão de Churrasco: </span>  <asp:Label ID="lbMesAnoChurras" runat="server" style="font-weight: 700"></asp:Label></legend>
                <br />
                <center>
                    <asp:GridView ID="grdChurrasco" runat="server" CssClass="GridView" AllowPaging="True"
                        AllowSorting="True" AutoGenerateColumns="False" 
                        EmptyDataText="Não existem reserva de churrasqueira para esta data" 
                        PageSize="31">
                        <Columns>
                            <asp:TemplateField HeaderText="AGENDAMENTO" SortExpression="dataAgendamento">
                                <EditItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("dataAgendamento") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("dataAgendamento", "{0:dddd}") + " - " + Eval("dataAgendamento","{0:dd/MM/yyyy}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
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
                        </Columns>
                    </asp:GridView>
                                   <br />
                                   <asp:ImageButton ID="imgBtExcelChurras" runat="server" 
                   ImageUrl="~/images/excel.png" onclick="imgBtExcelChurras_Click" Width="21px" />
            
                </center>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:azulli %>"
                    SelectCommand="SELECT * FROM [AGENDA] WHERE ([SALAO_FESTA] = @SALAO_FESTA)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="drpAno" DefaultValue="0" Name="SALAO_FESTA" PropertyName="SelectedValue"
                            Type="Boolean" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </fieldset>
        </div>
    </center>
</asp:Content>
