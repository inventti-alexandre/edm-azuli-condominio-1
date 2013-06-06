<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ReservaDetalhadaMoradores.aspx.cs" Inherits="Azuli.Web.Portal.ReservaDetalhadaMoradores" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

   <br /><br /> <br /><br />
   
    <fieldset class="login" runat="server"> 
        <legend class="accordionContent">Reserva do Mês Geral: </legend>
      <div id="dvReservaMes" runat="server" align="left">
      
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
        </table></div>
    </fieldset>
   
   
    <div id="dvFesta" runat="server">

     <fieldset class="login">
        <legend class="accordionContent">São de Festas -  <asp:Label ID="lblMesAnoFesta" runat="server" CssClass="FooterStyle"></asp:Label></legend> 
           <center><br />
     
          
&nbsp;<asp:GridView ID="grdAgendaMorador" runat="server" EmptyDataText="Não existem reserva de Salão de Festa para este Mês" 
                AutoGenerateColumns="False" Font-Bold="False" 
                onrowcommand="grdAgendaMorador_RowCommand" 
                DataKeyNames="dataAgendamento" 
                onrowdeleting="grdAgendaMorador_RowDeleting" 
                onrowdatabound="grdAgendaMorador_RowDataBound" CssClass="GridView" >
                <Columns>
                    <asp:TemplateField HeaderText="Data de Agendamento">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("dataAgendamento") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" 
                                Text='<%# Eval("dataAgendamento", "{0:dddd}") + " - " + Eval("dataAgendamento","{0:dd/MM/yyyy}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
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
                </Columns>
                <EmptyDataRowStyle Font-Bold="True" ForeColor="#CC3300" />
            </asp:GridView>
            <br />
               <asp:ImageButton ID="imgBtExcelFesta" runat="server" 
                   ImageUrl="~/images/excel.png" onclick="imgBtExcelFesta_Click" Width="21px" />
            &nbsp;
            <br />
       </center></fieldset> </div>
    
       <div id="dvChurrasco" runat="server">
    <fieldset class="login">
        <legend class="accordionContent">Área de Churrasco - <asp:Label ID="lbMesAnoChurras" runat="server" CssClass="FooterStyle"></asp:Label></legend>
    <center>
    <br />
     
       
           <asp:GridView ID="grdChurras" runat="server" AutoGenerateColumns="False"
                EmptyDataText="Não existem reserva de churrasqueira para este Mês" 
                onrowcommand="grdChurras_RowCommand" 
                onrowdeleting="grdChurras_RowDeleting" DataKeyNames="dataAgendamento" 
                CssClass="GridView">
                <Columns>
                    <asp:TemplateField HeaderText="Data de Agendamento">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("dataAgendamento") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" 
                                Text='<%# Eval("dataAgendamento", "{0:dddd}") + " - " + Eval("dataAgendamento","{0:dd/MM/yyyy}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
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
                </Columns>
                <EmptyDataRowStyle Font-Bold="True" ForeColor="#CC3300" />
            </asp:GridView>
            <br />
            <asp:ImageButton ID="imgBtExcelChurras" runat="server" 
            ImageUrl="~/images/excel.png" onclick="imgBtExcelChurras_Click" Width="21px" />
    </center></fieldset>  </div>
</asp:Content>
