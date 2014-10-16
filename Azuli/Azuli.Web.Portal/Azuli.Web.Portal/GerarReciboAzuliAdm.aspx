<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="GerarReciboAzuliAdm.aspx.cs" Inherits="Azuli.Web.Portal.GerarReciboAzuliAdm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    

  <br />
    <fieldset  class="" dir="ltr">
  
        <legend class="">Gerar Recibo Mensal - Conta Água Azuli</legend>
        <br />
        <asp:Label ID="lblConsultaAno" runat="server" CssClass="mainbodyTel" 
            Text="Mudar Ano de Consulta:"></asp:Label>
        &nbsp;<asp:DropDownList ID="drpAno" runat="server" CssClass="" Height="26px" 
            Width="123px" AutoPostBack="True" ontextchanged="drpAno_TextChanged" 
           >
        </asp:DropDownList>
        <br />
        <br />
        
         <center>   <asp:Label ID="lblMsg" runat="server" CssClass="failureNotification"></asp:Label></center>
        
        <br />

        <div id="dvPublicacao" runat="server" align="left">
      <table cellpadding="1" 
            style="border: Outset 2px Silver; text-align: center; width: 100%;" 
            class="well" align="left" dir="ltr">
        
       
        <tr>
          <td>
                <b><asp:Label ID="lblMeses" runat="server" Text=" Mês: " CssClass="Text"></asp:Label></b>
            </td>
            <td>
                <asp:LinkButton ID="lbtMonth1" runat="server" CssClass="" 
                    onclick="lbtMonth_Click">1</asp:LinkButton>
            </td>
            <td>
                <asp:LinkButton ID="lbtMonth2" runat="server" CssClass="" 
                    onclick="lbtMonth2_Click">2</asp:LinkButton>
            </td>
            <td>
                <asp:LinkButton ID="lbtMonth3" runat="server" CssClass="" 
                    onclick="lbtMonth3_Click">3</asp:LinkButton>
            </td>
            <td class="style2">
                <asp:LinkButton ID="lbtMonth4" runat="server" CssClass="" 
                    onclick="lbtMonth4_Click" style="font-size: 9pt">4</asp:LinkButton>
            </td>
            <td>
                <asp:LinkButton ID="lbtMonth5" runat="server" CssClass="" 
                    onclick="lbtMonth5_Click">5</asp:LinkButton>
            </td>
            <td>
                <asp:LinkButton ID="lbtMonth6" runat="server" CssClass="" 
                    onclick="lbtMonth6_Click">6</asp:LinkButton>
            </td>
            <td>
                <asp:LinkButton ID="lbtMonth7" runat="server" CssClass="" 
                    onclick="lbtMonth7_Click">7</asp:LinkButton>
            </td>
            <td>
                <asp:LinkButton ID="lbtMonth8" runat="server" CssClass="" 
                    onclick="lbtMonth_Click8">8</asp:LinkButton>
            </td>
            <td>
                <asp:LinkButton ID="lbtMonth9" runat="server" CssClass="" 
                    onclick="lbtMonth_Click9">9</asp:LinkButton>
            </td>
            <td>
                <asp:LinkButton ID="lbtMonth10" runat="server" CssClass="" 
                    onclick="lbtMonth_Click10">10</asp:LinkButton>
            </td>
            <td>
                <asp:LinkButton ID="lbtMonth11" runat="server" CssClass="" 
                    onclick="lbtMonth_Click11">11</asp:LinkButton>
            </td>
            <td>
                <asp:LinkButton ID="lbtMonth12" runat="server" CssClass="" 
                    onclick="lbtMonth_Click12">12</asp:LinkButton>
            </td>
        </tr>

          <tr>
           <td>
                <b><asp:Label ID="lblQuantidadesArquivos" runat="server" Text="Status: " CssClass="Text"></asp:Label></b>
            </td>

            <td>
                <asp:Image ID="img1" runat="server" Height="18px" 
                    ImageUrl="~/images/vermelhoStatus.png" Width="23px" />
                <br />
                <br />
                <asp:ImageButton ID="ImageButton1" runat="server" 
                    ImageUrl="~/images/excel.png" onclick="ImageButton1_Click" Width="23px" />
            </td>
            <td>
                <asp:Image ID="img2" runat="server" Height="18px" 
                    ImageUrl="~/images/vermelhoStatus.png"  Width="23px" />
                    <br />
                <br />
                <asp:ImageButton ID="ImageButton2" ImageUrl="~/images/excel.png" runat="server" 
                    onclick="ImageButton2_Click" Width="23px" />
            </td>
            <td>
                <asp:Image ID="img3" runat="server" Height="18px" 
                    ImageUrl="~/images/vermelhoStatus.png" Width="23px" />
                    <br />
                <br />
                <asp:ImageButton ID="ImageButton3" ImageUrl="~/images/excel.png" runat="server" 
                    onclick="ImageButton3_Click" Width="23px" />
            </td>
            <td class="style2">
                <asp:Image ID="img4" runat="server" Height="18px" 
                    ImageUrl="~/images/vermelhoStatus.png" Width="23px" />
                    <br />
                <br />
                <asp:ImageButton ID="ImageButton4" ImageUrl="~/images/excel.png" runat="server" 
                    onclick="ImageButton4_Click" Width="23px" />
            </td>
            <td>
                <asp:Image ID="img5" runat="server" Height="18px" 
                    ImageUrl="~/images/vermelhoStatus.png" Width="23px" />
                    <br />
                <br />
                <asp:ImageButton ID="ImageButton5" ImageUrl="~/images/excel.png" runat="server" 
                    onclick="ImageButton5_Click" Width="23px" />
            </td>
            <td>
                <asp:Image ID="img6" runat="server" Height="18px" 
                    ImageUrl="~/images/vermelhoStatus.png" Width="23px" />
                    <br />
                <br />
                <asp:ImageButton ID="ImageButton6" ImageUrl="~/images/excel.png" runat="server" 
                    onclick="ImageButton6_Click" Width="23px" />
            </td>
            <td>
                <asp:Image ID="img7" runat="server" Height="18px" 
                    ImageUrl="~/images/vermelhoStatus.png"   Width="23px" />
                    <br />
                <br />
                <asp:ImageButton ID="ImageButton7" ImageUrl="~/images/excel.png" runat="server" 
                    onclick="ImageButton7_Click" Width="23px" />
            </td>
            <td>
                <asp:Image ID="img8" runat="server" Height="18px" 
                    ImageUrl="~/images/vermelhoStatus.png" Width="23px" />
                    <br />
                <br />
                <asp:ImageButton ID="ImageButton8" ImageUrl="~/images/excel.png" runat="server" 
                    onclick="ImageButton8_Click" Width="23px" />
            </td>
            <td>
                <asp:Image ID="img9" runat="server" Height="18px" 
                    ImageUrl="~/images/vermelhoStatus.png" Width="23px" />
                    <br />
                <br />
                <asp:ImageButton ID="ImageButton9" ImageUrl="~/images/excel.png" runat="server" 
                    onclick="ImageButton9_Click" Width="23px" />
            </td>
            <td>
                <asp:Image ID="img10" runat="server" Height="18px" 
                    ImageUrl="~/images/vermelhoStatus.png" Width="23px" />
                    <br />
                <br />
                <asp:ImageButton ID="ImageButton10" ImageUrl="~/images/excel.png" 
                    runat="server" onclick="ImageButton10_Click"  Width="23px"/>
            </td>
            <td>
                <asp:Image ID="img11" runat="server" Height="18px" 
                    ImageUrl="~/images/vermelhoStatus.png" Width="23px" />
                    <br />
                <br />
                <asp:ImageButton ID="ImageButton11"  ImageUrl="~/images/excel.png" 
                    runat="server" onclick="ImageButton11_Click" Width="23px" />

            </td>
            <td>
                <asp:Image ID="img12" runat="server" Height="18px" 
                    ImageUrl="~/images/vermelhoStatus.png" Width="23px" />
                    <br />
                <br />
                <asp:ImageButton ID="ImageButton12" ImageUrl="~/images/excel.png" 
                    runat="server" onclick="ImageButton12_Click" Width="23px" />
            </td>
        </tr>
        </table>
      
        
        

        <br />
  
        </div>
  
        <legend class="well-small">Detalhe do Consumo - Referência: <asp:Label ID="lblReferencia" runat="server"></asp:Label></legend>
        <br />
         <center style="margin-left: 40px">   
             <asp:GridView  ID="grdDetalheConsumo" runat="server" AutoGenerateColumns="False" 
                Height="68px" Width="761px" Font-Italic="False" 
                 Font-Names="Times New Roman" EnableTheming="True" Font-Bold="True" 
                 onrowdatabound="grdDetalheConsumo_RowDataBound" 
                 DataKeyNames="excedenteValorDevido" ShowFooter="True">
                 <AlternatingRowStyle BorderStyle="None" Wrap="True" />
                <Columns>
                    <asp:TemplateField HeaderText="Registro">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("registro ") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("registro ") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle BackColor="#F2DCDB" HorizontalAlign="Center" Width="15px" 
                            Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Apto">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Eval("apartamento") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("apartamento") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle BackColor="#F2DCDB" HorizontalAlign="Center" Width="70px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Histórico de consumo 6 últimos meses (média) [m³]">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox9" runat="server" Text='<%# Eval("historicoMes1") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label9" runat="server" Text='<%# Eval("historicoMes1") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle BackColor="#F2F2F2" />
                        <ItemStyle HorizontalAlign="Center" Width="130px" BackColor="#F2F2F2" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Leitura Anterior">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" 
                                Text='<%# Eval("leituraAnteriorM3 ") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" 
                                Text='<%# Eval("leituraAnteriorM3") %>'></asp:Label>
                        </ItemTemplate>
                         <ItemStyle HorizontalAlign="Center" BackColor="White" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Leitura Atual">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" 
                                Text='<%# Eval("leituraAtualM3") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("leituraAtualM3") %>'></asp:Label>
                        </ItemTemplate>
                         <ItemStyle HorizontalAlign="Center" BackColor="White" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Consumo 30d [M³]">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Eval("consumoMesM3") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("consumoMesM3") %>'></asp:Label>
                        </ItemTemplate>
                         <ItemStyle HorizontalAlign="Center" Width="25px" BackColor="White" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Excedente">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" 
                                Text='<%# Eval("excedenteValorDevido") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" 
                                Text='<%# Eval("excedenteValorDevido") %>'></asp:Label>
                        </ItemTemplate>
                         <ItemStyle HorizontalAlign="Center"  Width="60px"/>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="À pagar">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox7" runat="server" 
                                Text='<%# Eval("valorPagarValorDevido") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" 
                                Text='<%# Eval("valorPagarValorDevido","{0:C2}") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center"  Width="60px"/>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Obs.">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox8" runat="server" Text='<%# Eval("status") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label8" runat="server" Text='<%# Eval("status") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="60px" />
                    </asp:TemplateField>
                </Columns>


                 <FooterStyle BackColor="#F2F2F2" />


                 <HeaderStyle BackColor="#F2F2F2" Font-Bold="True" Font-Size="Small" 
                     ForeColor="Black" />
                 <RowStyle BackColor="White" ForeColor="Black" />
                 <SelectedRowStyle ForeColor="Black" />


            </asp:GridView></div></center>
        </fieldset>  

</asp:Content>
