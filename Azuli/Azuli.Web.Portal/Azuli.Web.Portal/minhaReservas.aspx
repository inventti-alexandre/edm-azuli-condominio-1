<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="minhaReservas.aspx.cs" Inherits="Azuli.Web.Portal.minhaReservas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <fieldset class="loginDisplayLegend">
        <legend  class="accordionContent">Reserva do Mês Geral: </legend><br />
        <table style="width: 565px">
            <tr>
                <td >
                    <asp:Label ID="lblMes" runat="server" Font-Bold="True" Text="Mês:"></asp:Label>
                    &nbsp;<asp:DropDownList ID="drpMeses" runat="server" CssClass="btGeral" Font-Bold="True"
                        Height="16px" Width="101px" AutoPostBack="True" 
                        onselectedindexchanged="drpMeses_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
                <td  >
                    <asp:Label ID="lblAno" runat="server" Font-Bold="True" Text="Ano:"></asp:Label>
                    &nbsp;&nbsp;
                    <asp:DropDownList ID="drpAno" runat="server" CssClass="btGeral" Font-Bold="True"
                        Height="16px" Width="111px" AutoPostBack="True" 
                        onselectedindexchanged="drpAno_SelectedIndexChanged">
                    </asp:DropDownList>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
            </tr>
        </table>
    </fieldset>



    <div id="dvFesta" runat="server" align="left" dir="ltr">
        <fieldset class="loginDisplayLegend">
            <legend class="accordionContent">São de Festas - <asp:Label ID="lblMesAnoFesta" runat="server" CssClass="FooterStyle"></asp:Label></legend>
               
            <center>
                <br />
                &nbsp;<br />
                &nbsp;<asp:GridView ID="grdReservaProgramadaFesta" runat="server" 
             CssClass="gridl" AutoGenerateColumns="False" 
              EmptyDataText="Não existe reservas futuras para o Salão de festa" 
              Font-Bold="False" Font-Size="Small">
             <Columns>
                 <asp:TemplateField HeaderText="Data da Reserva">
                     <EditItemTemplate>
                         <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("dataAgendamento") %>'></asp:TextBox>
                     </EditItemTemplate>
                     <ItemTemplate>
                         <asp:Label ID="Label4" runat="server" 
                             Text='<%# Eval("dataAgendamento", "{0:ddd}") + "-" + Eval("dataAgendamento","{0:dd/MM/yy}") %>'></asp:Label>
                     </ItemTemplate>
                     <HeaderStyle Width="120px" />
                     <ItemStyle HorizontalAlign="Left" ForeColor="#006600" />
                 </asp:TemplateField>


                  <asp:TemplateField HeaderText="Data solicitação da Reserva">
                     <EditItemTemplate>
                         <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("dataInclusao") %>'></asp:TextBox>
                     </EditItemTemplate>
                     <ItemTemplate>
                         <asp:Label ID="Label5" runat="server" 
                             Text='<%# Eval("dataInclusao", "{0:ddd}") + "-" + Eval("dataInclusao","{0:dd/MM/yy}") %>'></asp:Label>
                     </ItemTemplate>
                     <ItemStyle Font-Size="Small" ForeColor="Red" />
                 </asp:TemplateField>


                  <asp:TemplateField HeaderText="Data de PG">
                     <EditItemTemplate>
                         <asp:TextBox ID="TextBox6" runat="server" 
                             Text='<%# Eval("dataConfirmacaoPagamento") %>'></asp:TextBox>
                     </EditItemTemplate>
                     <ItemTemplate>
                         <asp:Label ID="Label6" runat="server" 
                             Text='<%# Eval("dataConfirmacaoPagamento", "{0:ddd}") + "-" + Eval("dataConfirmacaoPagamento","{0:dd/MM/yy}") %>'></asp:Label>
                     </ItemTemplate>
                      <HeaderStyle Width="120px" />
                     <ItemStyle ForeColor="#006600" />
                 </asp:TemplateField>

                  <asp:TemplateField HeaderText="PG feito em (Dias)">
                     <EditItemTemplate>
                         <asp:TextBox ID="TextBox7" runat="server" 
                             Text='<%# Eval("qtdDiasPagamentoFesta") %>'></asp:TextBox>
                     </EditItemTemplate>
                     <ItemTemplate>
                         <asp:Label ID="Label7" runat="server" 
                             Text='<%# ((int)Eval("qtdDiasPagamentoFesta") <= 0) ? "Pago no mesmo dia!" : Eval("qtdDiasPagamentoFesta")  %> '></asp:Label>
                     </ItemTemplate>
                     <ItemStyle HorizontalAlign="Left" />
                 </asp:TemplateField>

                


                 <asp:BoundField DataField="observacao" HeaderText="Obs.:" >
                 <ItemStyle HorizontalAlign="Left" />
                 </asp:BoundField>
             </Columns>
         </asp:GridView>
  
            </center>
                <br />
                &nbsp;
                <br />
        </fieldset>
    </div>


    <div id="dvChurrasco" runat="server">
        <fieldset class="loginDisplayLegend">
            <legend class="accordionContent">Área de Churrasco -
                <asp:Label ID="lbMesAnoChurras" runat="server" CssClass="FooterStyle"></asp:Label></legend>
            <center>
                <br />
                &nbsp;<asp:GridView ID="grdReservaProgramadaChurras" runat="server" 
             CssClass="gridl" AutoGenerateColumns="False"  
              EmptyDataText="Não existe reservas futuras para churrasqueira" Font-Bold="True" 
              Font-Size="Small">
              <Columns>
                  <asp:TemplateField HeaderText="Data da Reserva">
                      <EditItemTemplate>
                          <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("dataAgendamento") %>'></asp:TextBox>
                      </EditItemTemplate>
                      <ItemTemplate>
                          <asp:Label ID="Label1" runat="server" Text='<%# Eval("dataAgendamento", "{0:ddd}") + "-" + Eval("dataAgendamento","{0:dd/MM/yy}") %>'></asp:Label>
                      </ItemTemplate>
                      <ItemStyle HorizontalAlign="Center" ForeColor="#006600" Width="120px" />
                  </asp:TemplateField>


                  <asp:TemplateField HeaderText="Data solicitação da Reserva">
                     <EditItemTemplate>
                         <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("dataInclusao") %>'></asp:TextBox>
                     </EditItemTemplate>
                     <ItemTemplate>
                         <asp:Label ID="Label1" runat="server" Text='<%# Eval("dataInclusao", "{0:ddd}") + " / " + Eval("dataInclusao","{0:dd/MM/yy}") %>'></asp:Label>
                     </ItemTemplate>
                     <ItemStyle HorizontalAlign="Center" ForeColor="#FF3300" Width="120px" />
                 </asp:TemplateField>


                  <asp:TemplateField HeaderText="Data de PG">
                     <EditItemTemplate>
                         <asp:TextBox ID="TextBox2" runat="server" Text='<%# Eval("dataConfirmacaoPagamento") %>'></asp:TextBox>
                     </EditItemTemplate>
                     <ItemTemplate>
                         <asp:Label ID="Label2" runat="server" Text='<%# Eval("dataConfirmacaoPagamento", "{0:ddd}") + " / " + Eval("dataConfirmacaoPagamento","{0:dd/MM/yy}") %>'></asp:Label>
                     </ItemTemplate>
                     <ItemStyle HorizontalAlign="Center" ForeColor="#006600" Width="120px" />
                 </asp:TemplateField>

                  <asp:TemplateField HeaderText="PG foi feito em (Dias)">
                     <EditItemTemplate>
                         <asp:TextBox ID="TextBox2" runat="server" Text='<%# Eval("qtdDiasPagamentoChurras") %>'></asp:TextBox>
                     </EditItemTemplate>
                     <ItemTemplate>
                         <asp:Label ID="Label2" runat="server" Text='<%# ((int)Eval("qtdDiasPagamentoChurras") <= 0) ? "Pago no mesmo dia!" : Eval("qtdDiasPagamentoChurras")  %> '>></asp:Label>
                     </ItemTemplate>
                     <ItemStyle HorizontalAlign="Center" />
                 </asp:TemplateField>



                  <asp:TemplateField HeaderText="Obs.:">
                      <EditItemTemplate>
                          <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("observacao") %>'></asp:TextBox>
                      </EditItemTemplate>
                      <ItemTemplate>
                          <asp:Label ID="Label3" runat="server" Text='<%# Bind("observacao") %>'></asp:Label>
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
