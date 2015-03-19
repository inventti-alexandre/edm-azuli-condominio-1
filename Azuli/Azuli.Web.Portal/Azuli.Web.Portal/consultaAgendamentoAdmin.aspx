<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true"
    CodeBehind="consultaAgendamentoAdmin.aspx.cs" EnableEventValidation ="false" Inherits="Azuli.Web.Portal.consultaAgendamentoAdmin" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

  
   
    <fieldset id="Fieldset1" class="login" runat="server"> 
        <legend class="accordionContent">Reserva do Mês Geral: </legend>
      <div id="dvReservaMes" runat="server" align="left">
      
        <table class="accordionContent">
            <tr>
                <td class="style3">
                    <asp:Label ID="lblMes" runat="server" Font-Bold="True" Text="Mês:"></asp:Label>
                    &nbsp;<asp:DropDownList ID="drpMeses" runat="server" CssClass="dropdown" Font-Bold="True"
                        Height="16px" Width="101px" AutoPostBack="True" 
                        onselectedindexchanged="drpMeses_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
                <td class="style3">
                    <asp:Label ID="lblAno" runat="server" Font-Bold="True" Text="Ano:"></asp:Label>
                    <asp:DropDownList ID="drpAno" runat="server" CssClass="dropdown" Font-Bold="True"
                        Height="16px" Width="101px" AutoPostBack="True" 
                        onselectedindexchanged="drpAno_SelectedIndexChanged">
                    </asp:DropDownList>
                   
                </td>
                <td>
                    <asp:Label ID="lbSalao" runat="server" Font-Bold="True" Text="Área :"></asp:Label>
                    <asp:DropDownList ID="drpSalao" runat="server" CssClass="dropdown" Font-Bold="True"
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
        <legend class="accordionContent">Salão de Festas</legend> 
           <center><br />
     
          
&nbsp;<br />
               <asp:GridView ID="grdReservaProgramadaFesta" runat="server" 
                   AutoGenerateColumns="False" CssClass="gridl" 
                   EmptyDataText="Não existe reservas futuras para o Salão de festa" 
                   Font-Bold="False" Font-Size="Small" 
                   onrowcreated="grdReservaProgramadaFesta_RowCreated" 
                   onrowdatabound="grdReservaProgramadaFesta_RowDataBound" DataKeyNames="valorReserva" ShowFooter="True">
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
                               <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("dataAgendamento") %>'></asp:TextBox>
                           </EditItemTemplate>
                           <ItemTemplate>
                               <asp:Label ID="Label4" runat="server" 
                                   Text='<%# Eval("dataAgendamento", "{0:ddd}") + "-" + Eval("dataAgendamento","{0:dd/MM/yy}") %>'></asp:Label>
                           </ItemTemplate>
                           <HeaderStyle Width="120px" />
                           <ItemStyle ForeColor="#006600" HorizontalAlign="Left" Font-Bold="True" />
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
                       <asp:TemplateField HeaderText="Data de PG" Visible="False">
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
                       <asp:TemplateField HeaderText="PG feito em (Dias)" Visible="False">
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
 <asp:TemplateField HeaderText="Obs.:">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("observacao") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label12" runat="server" Text='<%# Bind("observacao") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Valor">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("valorReserva") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label13" runat="server" Text='<%# Bind("valorReserva","{0:N2}") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                   </Columns>
               </asp:GridView>
               <br />
            <br />
            <asp:Label ID="ltValorSalaoFesta" runat="server" CssClass="accordionContent"></asp:Label>
               <asp:ImageButton ID="imgBtExcelFesta" runat="server" 
                   ImageUrl="~/images/excel.png" onclick="imgBtExcelFesta_Click" Width="21px" />
            &nbsp;
            <br />
       </center></fieldset> </div>
    
       <div id="dvChurrasco" runat="server">
    <fieldset class="login">
        <legend class="accordionContent">Área de Churrasco<asp:Label ID="lbMesAnoChurras" runat="server" CssClass="FooterStyle"></asp:Label></legend>
    <center>
    <br />
     
       
            <br />
        <asp:GridView ID="grdReservaProgramadaChurras" runat="server" 
            AutoGenerateColumns="False" CssClass="gridl" 
            EmptyDataText="Não existe reservas futuras para churrasqueira" Font-Bold="True" 
            Font-Size="Small" onrowcreated="grdReservaProgramadaChurras_RowCreated">
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
                        <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("dataAgendamento") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" 
                            Text='<%# Eval("dataAgendamento", "{0:ddd}") + "-" + Eval("dataAgendamento","{0:dd/MM/yy}") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle ForeColor="#006600" HorizontalAlign="Center" Width="120px" 
                        Font-Bold="True" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Data solicitação da Reserva">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("dataInclusao") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label9" runat="server" 
                            Text='<%# Eval("dataInclusao", "{0:ddd}") + " / " + Eval("dataInclusao","{0:dd/MM/yy}") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle ForeColor="#FF3300" HorizontalAlign="Center" Width="120px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Data de PG" Visible="False">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox10" runat="server" 
                            Text='<%# Eval("dataConfirmacaoPagamento") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label10" runat="server" 
                            Text='<%# Eval("dataConfirmacaoPagamento", "{0:ddd}") + " / " + Eval("dataConfirmacaoPagamento","{0:dd/MM/yy}") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle ForeColor="#006600" HorizontalAlign="Center" Width="120px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="PG foi feito em (Dias)" Visible="False">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox11" runat="server" 
                            Text='<%# Eval("qtdDiasPagamentoChurras") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label11" runat="server" 
                            Text='<%# ((int)Eval("qtdDiasPagamentoChurras") <= 0) ? "Pago no mesmo dia!" : Eval("qtdDiasPagamentoChurras")  %> '>&gt;</asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
              
                <asp:TemplateField HeaderText="Obs.:">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("observacao") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label12" runat="server" Text='<%# Bind("observacao") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                  <asp:TemplateField HeaderText="Valor">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("valorReserva") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label13" runat="server" Text='<%# Bind("valorReserva","{0:N2}") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <br />
            <br />
            <asp:ImageButton ID="imgBtExcelChurras" runat="server" 
            ImageUrl="~/images/excel.png" onclick="imgBtExcelChurras_Click" Width="21px" />
    </center></fieldset>  </div>
</asp:Content>
