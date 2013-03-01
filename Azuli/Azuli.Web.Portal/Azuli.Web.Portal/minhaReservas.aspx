<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="minhaReservas.aspx.cs" Inherits="Azuli.Web.Portal.minhaReservas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 221px;
        }
        .menu
        {
        }
        .style3
        {
            width: 202px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <fieldset class="login">
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
                        onselectedindexchanged="drpAno_SelectedIndexChanged">
                    </asp:DropDownList>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
                <td>
                    <asp:Label ID="lbSalao" runat="server" Font-Bold="True" Text="Salão de:"></asp:Label>
                    <asp:DropDownList ID="drpSalao" runat="server" CssClass="btGeral" Font-Bold="True"
                        Height="19px" Width="127px" AutoPostBack="True" OnSelectedIndexChanged="drpSalao_SelectedIndexChanged">
                        <asp:ListItem Value="0">Selecione</asp:ListItem>
                        <asp:ListItem>Festa</asp:ListItem>
                        <asp:ListItem>Churrasqueira</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
        </table>
    </fieldset>
    <center>

     
        <div id="dvFesta" runat="server">
            
            &nbsp;<br />
&nbsp;<asp:GridView ID="grdAgendaMorador" runat="server" EmptyDataText="Você não tem reserva para o salão de festa nesta data"
                AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None"
                BorderWidth="1px" CellPadding="3" GridLines="Vertical" Font-Bold="False" 
                onrowcommand="grdAgendaMorador_RowCommand" 
                DataKeyNames="dataAgendamento" 
                onrowdeleting="grdAgendaMorador_RowDeleting" 
                onrowdatabound="grdAgendaMorador_RowDataBound" >
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <Columns>
                    <asp:BoundField DataField="dataAgendamento" HeaderText="Data de Agendamento" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:TemplateField HeaderText="Bloco">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("ap.bloco") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Apartamento">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("ap.apartamento") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="salaoFesta" HeaderText="Salão de Festa" />
                    <asp:CommandField ShowDeleteButton="True" ButtonType="Image" DeleteImageUrl="~/images/delete.png" />
                </Columns>
                <EmptyDataRowStyle Font-Bold="True" ForeColor="#CC3300" />
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#0000A9" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#000065" />
            </asp:GridView>
            &nbsp;
        </div>
    </center>
    <center>
        <div id="dvChurrasco" runat="server">
            &nbsp;<asp:GridView ID="grdChurras" runat="server" AutoGenerateColumns="False" BackColor="White"
                BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical"
                EmptyDataText="Você não tem reserva de churrasqueira para esta data" 
                onrowcommand="grdChurras_RowCommand" onrowdeleting="grdChurras_RowDeleting" DataKeyNames="dataAgendamento">
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <Columns>
                    <asp:BoundField DataField="dataAgendamento" HeaderText="Data de Agendamento" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:TemplateField HeaderText="Bloco">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("ap.bloco") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Apartamento">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("ap.apartamento") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="salaoChurrasco" HeaderText="Churrasqueira" />
                    <asp:CommandField ShowDeleteButton="True" ButtonType="Image" DeleteImageUrl="~/images/delete.png" />
                </Columns>
                <EmptyDataRowStyle Font-Bold="True" ForeColor="#CC3300" />
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#0000A9" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#000065" />
            </asp:GridView>
            <br />
            <br />
        </div>
        <asp:Label ID="lblMsg" runat="server" Font-Bold="True" ForeColor="#CC0000"></asp:Label>
    </center>
</asp:Content>
