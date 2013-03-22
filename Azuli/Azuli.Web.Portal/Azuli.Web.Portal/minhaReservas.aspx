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
    <br /><br />  <br /><br /><br />
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
                    <asp:Label ID="lbSalao" runat="server" Font-Bold="True" Text="Área :"></asp:Label>
                    <asp:DropDownList ID="drpSalao" runat="server" CssClass="btGeral" Font-Bold="True"
                        Height="19px" Width="127px" AutoPostBack="True" OnSelectedIndexChanged="drpSalao_SelectedIndexChanged">
                        <asp:ListItem Value="1">todas</asp:ListItem>
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
            <asp:Label ID="lblAreaFesta" runat="server" Text="Área de Festa " 
                CssClass="btGeral"></asp:Label> <br />
&nbsp;<asp:GridView ID="grdAgendaMorador" runat="server" EmptyDataText="Você não tem reserva para o salão de festa nesta data"
                AutoGenerateColumns="False" Font-Bold="False" 
                onrowcommand="grdAgendaMorador_RowCommand" 
                DataKeyNames="dataAgendamento" 
                onrowdeleting="grdAgendaMorador_RowDeleting" 
                onrowdatabound="grdAgendaMorador_RowDataBound" CssClass="GridView" >
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
                    <asp:CommandField ShowDeleteButton="True" ButtonType="Image" DeleteImageUrl="~/images/delete.png" />
                </Columns>
                <EmptyDataRowStyle Font-Bold="True" ForeColor="#CC3300" />
            </asp:GridView>
            <br />
            &nbsp;
            <br />
        </div>
    </center>
    <center>
        <div id="dvChurrasco" runat="server">
        <asp:Label ID="Label3" runat="server" Text="Área de Churrasqueira " 
                CssClass="btGeral"></asp:Label><br />
            &nbsp;<asp:GridView ID="grdChurras" runat="server" AutoGenerateColumns="False"
                EmptyDataText="Você não tem reserva de churrasqueira para esta data" 
                onrowcommand="grdChurras_RowCommand" 
                onrowdeleting="grdChurras_RowDeleting" DataKeyNames="dataAgendamento" 
                CssClass="GridView">
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
                    <asp:CommandField ShowDeleteButton="True" ButtonType="Image" DeleteImageUrl="~/images/delete.png" />
                </Columns>
                <EmptyDataRowStyle Font-Bold="True" ForeColor="#CC3300" />
            </asp:GridView>
            <br />
            <br />
        </div>
        <asp:Label ID="lblMsg" runat="server" Font-Bold="True" ForeColor="#CC0000"></asp:Label>
    </center>
</asp:Content>
