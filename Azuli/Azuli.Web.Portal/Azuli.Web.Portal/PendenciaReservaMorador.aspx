<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="PendenciaReservaMorador.aspx.cs" Inherits="Azuli.Web.Portal.PendenciaReservaMorador" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .gridl
        {
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
      <center><div id="dvPesquisaMorador" align="center" runat="server">
        <fieldset class="loginDisplayLegend">
            <legend align="left" class="accordionContent">Aguardando Pagamento ..... </legend>
          
                <div id="dvAgendamentosFuturos" runat="server">
                    <fieldset>
                        <legend id="lgFesta" class="accordionContent" runat="server">Salão de Festa </legend>
                        <asp:GridView ID="grdReservaProgramadaFesta" runat="server" CssClass="gridl" AutoGenerateColumns="False"
                            EmptyDataText="Não existe
            reservas futuras para o Salão de festa" Font-Bold="False" Font-Size="Small">
                            <Columns>
                                <asp:TemplateField HeaderText="Data da Reserva">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("dataAgendamento") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%#
            Eval("dataAgendamento", "{0:ddd}") + "-" + Eval("dataAgendamento","{0:dd/MM/yy}")
            %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Width="120px" />
                                    <ItemStyle HorizontalAlign="Left" ForeColor="#006600" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Data
            solicitação da Reserva">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("dataInclusao") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("dataInclusao", "{0:ddd}")
            + "-" + Eval("dataInclusao","{0:dd/MM/yy}") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Font-Size="Small" ForeColor="Red" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Dias
            em Atraso">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%#
            Eval("qtdDiasPagamentoFesta") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%#Eval("qtdDiasPagamentoFesta") %> '></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Obs.:">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("observacao") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# ((int)Eval("qtdDiasPagamentoChurras") <= 1) ? "Aguardando Pagamento ...."
            : Eval("qtdDiasPagamentoChurras") %> '></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                              
                              
                            </Columns>
                        </asp:GridView>
                        <br />
                        <hr />
                        <legend id="lgChurras" class="accordionContent" runat="server">C<span class="style33">Churrasqueira</span><br
                            style="color: #0000FF" class="style5" />
                        </legend>
                        <br />
                        <asp:GridView ID="grdReservaProgramadaChurras" runat="server" CssClass="gridl" AutoGenerateColumns="False"
                            EmptyDataText="Não existe
            reservas futuras para churrasqueira" Font-Bold="True" Font-Size="Small">
                            <Columns>
                                <asp:TemplateField HeaderText="Data da Reserva">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("dataAgendamento") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%#
            Eval("dataAgendamento", "{0:ddd}") + "-" + Eval("dataAgendamento","{0:dd/MM/yy}")
            %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" ForeColor="#006600" Width="120px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Data solicitação da Reserva">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("dataInclusao")
            %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("dataInclusao", "{0:ddd}") + " / " + Eval("dataInclusao","{0:dd/MM/yy}")
            %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" ForeColor="#FF3300" Width="320px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Dias em Atraso">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Eval("qtdDiasPagamentoChurras")
            %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%#Eval("qtdDiasPagamentoChurras")%> '>&gt;</asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="140px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Obs.:">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("observacao") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# ((int)Eval("qtdDiasPagamentoChurras") <= 1) ? "Aguardando Pagamento ...."
            : Eval("qtdDiasPagamentoChurras") %> '></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <br />
               
              <center>  <table class="style21">
                    <tr>
                        <td align="right">
                            <asp:ImageButton ID="ImageButton1" runat="server" Height="59px" ImageUrl="~/images/calendario.png"
                                Width="93px" />
                        </td>
                        <td>
                            <asp:HyperLink ID="hplSucess" runat="server" Style="font-weight: 700; font-size: 9pt;
                                color: green;" CssClass="accordionContent" Font-Bold="False" NavigateUrl="~/telaAgendamento.aspx">Voltar para Reservas</asp:HyperLink>
                        </td>
                    </tr>
                </table></center>
         </div> </fieldset> </div>
  
    </center>
</asp:Content>
