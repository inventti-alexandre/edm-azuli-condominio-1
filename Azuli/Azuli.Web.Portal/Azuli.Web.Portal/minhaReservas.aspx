<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="minhaReservas.aspx.cs" Inherits="Azuli.Web.Portal.minhaReservas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style4
        {
            font-weight: bold;
            color: #006ABA;
        }
        .style5
        {
            font-size: 9pt;
        }
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <fieldset class="loginDisplayLegend">
        <legend  class="accordionContent">
            Reserva do Mês Geral: 
        </legend>
        <table class="accordionContent">
            <tr>
                <td align="left" >
                    <asp:Label ID="lblMes" runat="server" Font-Bold="True" Text="Mês:"></asp:Label>
                    &nbsp;<asp:DropDownList ID="drpMeses" runat="server" CssClass="btGeral" Font-Bold="True"
                        Height="16px" Width="101px" AutoPostBack="True" 
                        onselectedindexchanged="drpMeses_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
                <td align="left"  >
                    <asp:Label ID="lblAno" runat="server" Font-Bold="True" Text="Ano:"></asp:Label>
                    &nbsp;&nbsp;
                    <asp:DropDownList ID="drpAno" runat="server" CssClass="btGeral" Font-Bold="True"
                        Height="16px" Width="111px" AutoPostBack="True" 
                        onselectedindexchanged="drpAno_SelectedIndexChanged">
                    </asp:DropDownList>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
                <td align="left">
                    <asp:Label ID="lbSalao" runat="server" Font-Bold="True" Text="Área :"></asp:Label>
                    <asp:DropDownList ID="drpSalao" runat="server" CssClass="btGeral" Font-Bold="True"
                        Height="19px" Width="127px" AutoPostBack="True" OnSelectedIndexChanged="drpSalao_SelectedIndexChanged">
                        <asp:ListItem Value="1">todas</asp:ListItem>
                        <asp:ListItem>Festa</asp:ListItem>
                        <asp:ListItem>Churrasqueira</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
        </table>
    </fieldset>



    <div id="dvFesta" runat="server" align="left" dir="ltr">
        <fieldset class="loginDisplayLegend">
            <legend class="accordionContent">
                <asp:Image ID="Image1" runat="server" Height="16px" 
                    ImageUrl="~/images/festa.jpg" Width="24px" />
&nbsp;<span class="style4">São de Festas -</span> <asp:Label ID="lblMesAnoFesta" runat="server" CssClass="FooterStyle"></asp:Label></legend>
               
            <center>
                <br />
               <asp:GridView ID="grdReservaProgramadaFesta0" runat="server" 
                   AutoGenerateColumns="False" CssClass="gridl" 
                   EmptyDataText="Não existe reservas futuras para o Salão de festa" 
                   Font-Bold="False" Font-Size="Small">
                   <Columns>
                   <asp:TemplateField HeaderText="Bloco">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("ap.bloco") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle BackColor="#3399FF" Font-Bold="True" ForeColor="White" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Apartamento">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label9" runat="server" Text='<%# Bind("ap.apartamento") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle BackColor="#3399FF" Font-Bold="True" ForeColor="White" />
                    </asp:TemplateField>
                       <asp:TemplateField HeaderText="Data da Reserva">
                           <EditItemTemplate>
                               <asp:TextBox ID="TextBox10" runat="server" 
                                   Text='<%# Bind("dataAgendamento") %>'></asp:TextBox>
                           </EditItemTemplate>
                           <ItemTemplate>
                               <asp:Label ID="Label10" runat="server" 
                                   
                                   Text='<%# Eval("dataAgendamento", "{0:ddd}") + "-" + Eval("dataAgendamento","{0:dd/MM/yy}") %>'></asp:Label>
                           </ItemTemplate>
                           <HeaderStyle Width="120px" />
                           <ItemStyle ForeColor="#006600" HorizontalAlign="Left" />
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="Data solicitação da Reserva">
                           <EditItemTemplate>
                               <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("dataInclusao") %>'></asp:TextBox>
                           </EditItemTemplate>
                           <ItemTemplate>
                               <asp:Label ID="Label11" runat="server" 
                                   
                                   Text='<%# Eval("dataInclusao", "{0:ddd}") + "-" + Eval("dataInclusao","{0:dd/MM/yy}") %>'></asp:Label>
                           </ItemTemplate>
                           <ItemStyle Font-Size="Small" ForeColor="Red" />
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="Data de PG">
                           <EditItemTemplate>
                               <asp:TextBox ID="TextBox12" runat="server" 
                                   Text='<%# Eval("dataConfirmacaoPagamento") %>'></asp:TextBox>
                           </EditItemTemplate>
                           <ItemTemplate>
                               <asp:Label ID="Label12" runat="server" 
                                   
                                   Text='<%# Eval("dataConfirmacaoPagamento", "{0:ddd}") + "-" + Eval("dataConfirmacaoPagamento","{0:dd/MM/yy}") %>'></asp:Label>
                           </ItemTemplate>
                           <HeaderStyle Width="120px" />
                           <ItemStyle ForeColor="#006600" />
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="PG feito em (Dias)">
                           <EditItemTemplate>
                               <asp:TextBox ID="TextBox13" runat="server" 
                                   Text='<%# Eval("qtdDiasPagamentoFesta") %>'></asp:TextBox>
                           </EditItemTemplate>
                           <ItemTemplate>
                               <asp:Label ID="Label13" runat="server" 
                                   
                                   Text='<%# ((int)Eval("qtdDiasPagamentoFesta") <= 0) ? "Pago no mesmo dia!" : Eval("qtdDiasPagamentoFesta")  %> '></asp:Label>
                           </ItemTemplate>
                           <ItemStyle HorizontalAlign="Left" />
                       </asp:TemplateField>
                       <asp:BoundField DataField="observacao" HeaderText="Obs.:">
                       <ItemStyle HorizontalAlign="Left" />
                       </asp:BoundField>
                   </Columns>
               </asp:GridView>
            
               </center>
              

        </fieldset>
    </div>


    <div id="dvChurrasco" runat="server">
        <fieldset class="loginDisplayLegend">
            <legend class="accordionContent">
                <asp:Image ID="Image2" runat="server" Height="16px" 
                    ImageUrl="~/images/churrasco.jpg" Width="29px" CssClass="style5" />
&nbsp;<span class="style4">Área de Churrasco -</span>
                <asp:Label ID="lbMesAnoChurras" runat="server" CssClass="FooterStyle"></asp:Label></legend>
            <center>
                <br />
        <asp:GridView ID="grdReservaProgramadaChurras" runat="server" 
            AutoGenerateColumns="False" CssClass="gridl" 
            EmptyDataText="Não existe reservas futuras para churrasqueira" Font-Bold="True" 
            Font-Size="Small">
            <Columns>

               <asp:TemplateField HeaderText="Bloco">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("ap.bloco") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle BackColor="#3399FF" Font-Bold="True" ForeColor="White" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Apartamento">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("ap.apartamento") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle BackColor="#3399FF" Font-Bold="True" ForeColor="White" />
                    </asp:TemplateField>
                <asp:TemplateField HeaderText="Data da Reserva">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox14" runat="server" 
                            Text='<%# Bind("dataAgendamento") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label14" runat="server" 
                            
                            Text='<%# Eval("dataAgendamento", "{0:ddd}") + "-" + Eval("dataAgendamento","{0:dd/MM/yy}") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle ForeColor="#006600" HorizontalAlign="Center" Width="120px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Data solicitação da Reserva">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox15" runat="server" Text='<%# Bind("dataInclusao") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label15" runat="server" 
                            
                            Text='<%# Eval("dataInclusao", "{0:ddd}") + " / " + Eval("dataInclusao","{0:dd/MM/yy}") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle ForeColor="#FF3300" HorizontalAlign="Center" Width="120px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Data de PG">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox16" runat="server" 
                            Text='<%# Eval("dataConfirmacaoPagamento") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label16" runat="server" 
                            
                            Text='<%# Eval("dataConfirmacaoPagamento", "{0:ddd}") + " / " + Eval("dataConfirmacaoPagamento","{0:dd/MM/yy}") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle ForeColor="#006600" HorizontalAlign="Center" Width="120px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="PG foi feito em (Dias)">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox17" runat="server" 
                            Text='<%# Eval("qtdDiasPagamentoChurras") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label17" runat="server" 
                            
                            Text='<%# ((int)Eval("qtdDiasPagamentoChurras") <= 0) ? "Pago no mesmo dia!" : Eval("qtdDiasPagamentoChurras")  %> '>&gt;</asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Obs.:">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox18" runat="server" Text='<%# Bind("observacao") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label18" runat="server" Text='<%# Bind("observacao") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
                
                </center>
        </fieldset>
    </div>

    <center>
        <br />
    </center>
</asp:Content>
