<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="reportRelatorioGeral.aspx.cs" Inherits="Azuli.Web.Portal.reportRelatorioGeral" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

<style type="text/css">
        .verticalHeader {
            
            padding-top: 50px;
            padding-bottom: 40px;
         

            -webkit-transform: rotate(90deg);
            -moz-transform: rotate(90deg);
            -ms-transform: rotate(-90deg);
            -o-transform: rotate(90deg);
            transform: rotate(-90deg);

            -webkit-transform-origin: 50% 50%;
            -moz-transform-origin: 50% 50%;
            -ms-transform-origin: 50% 50%;
            -o-transform-origin: 50% 50%;
            transform-origin: 50% 50%;

            filter: progid:DXImageTransform.Microsoft.BasicImage(rotation=1);
        }
        
        
        .grid
{
border: solid 22px black !important;
}
.grid td
{
border: solid 22px black;
}
.grid tr
{
border: solid 22px black;
}
    </style>

    <title></title>
    <link href="css/bootstrap-classic.min.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="form-horizontal">

      
       
         <center style="margin-left: 40px">   
             <asp:GridView  ID="grdDetalheConsumo" runat="server" BorderColor="Black" 
                 BorderWidth="2" BorderStyle="Solid"  AutoGenerateColumns="False" 
                Height="0px" Width="761px" Font-Italic="False" 
                 Font-Names="Arial"  Font-Size="11px" EnableTheming="True" Font-Bold="true" 
                 onrowdatabound="grdDetalheConsumo_RowDataBound" 
                 DataKeyNames="excedenteValorDevido" ShowFooter="True" > 
               
                 <AlternatingRowStyle BorderStyle="None" Wrap="True" BorderWidth="2px" />
                <Columns>
                    <asp:TemplateField  HeaderStyle-CssClass="verticalHeader"  HeaderStyle-Height="2px"  HeaderText="Registro">
                    
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("registro ") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("registro ") %>'></asp:Label>
                        </ItemTemplate>

<HeaderStyle CssClass="verticalHeader"></HeaderStyle>

                        <ItemStyle BackColor="#F2DCDB" HorizontalAlign="Center" Width="4px" 
                            Wrap="False" />
                            
                    </asp:TemplateField>
                    
                    <asp:TemplateField  HeaderStyle-Height="2px" HeaderText="Apto">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Eval("apartamento") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("apartamento") %>'></asp:Label>
                        </ItemTemplate>

<HeaderStyle Height="2px"></HeaderStyle>

                        <ItemStyle BackColor="#F2DCDB" HorizontalAlign="Center" Width="70px"  />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-Height="2px" HeaderText="Histórico de consumo 6 últimos meses (média) [m³]">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox9" runat="server" Text='<%# Eval("historicoMes1") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label9" runat="server" Text='<%# Eval("historicoMes1") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle BackColor="#F2F2F2" />
                        <ItemStyle HorizontalAlign="Center" Width="130px"  BackColor="#F2F2F2" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-Height="2px" HeaderText="Leitura Anterior">

                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" 
                                Text='<%# Eval("leituraAnteriorM3 ") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" 
                                Text='<%# Eval("leituraAnteriorM3") %>'></asp:Label>
                        </ItemTemplate>

<HeaderStyle Height="2px"></HeaderStyle>

                         <ItemStyle HorizontalAlign="Center" BackColor="White" Width="20px"  />
                    </asp:TemplateField>
                    <asp:TemplateField  HeaderStyle-Height="2px" HeaderText="Leitura Atual">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" 
                                Text='<%# Eval("leituraAtualM3") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("leituraAtualM3") %>'></asp:Label>
                        </ItemTemplate>

<HeaderStyle Height="2px"></HeaderStyle>

                         <ItemStyle HorizontalAlign="Center" BackColor="White" Width="20px"  />
                    </asp:TemplateField>
                    <asp:TemplateField  HeaderStyle-Height="2px" HeaderText="Consumo 30d [M³]">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Eval("consumoMesM3") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("consumoMesM3") %>'></asp:Label>
                        </ItemTemplate>

<HeaderStyle Height="2px"></HeaderStyle>

                         <ItemStyle HorizontalAlign="Center" Width="25px"   BackColor="White" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-CssClass="verticalHeader" HeaderStyle-Height="2px" HeaderText="Excedente">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" 
                                Text='<%# Eval("excedenteValorDevido") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" 
                                Text='<%# Eval("excedenteValorDevido") %>'></asp:Label>
                        </ItemTemplate>

<HeaderStyle CssClass="verticalHeader"></HeaderStyle>

                         <ItemStyle HorizontalAlign="Center"  Width="60px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-Height="2px" HeaderText="À pagar">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox7" runat="server" 
                                Text='<%# Eval("valorPagarValorDevido") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" 
                                Text='<%# Eval("valorPagarValorDevido","{0:C2}") %>'></asp:Label>
                        </ItemTemplate>

<HeaderStyle Height="2px"></HeaderStyle>

                        <ItemStyle HorizontalAlign="Center"  Width="60px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-Height="2px" HeaderText="Obs:">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox8" runat="server" Text='<%# Eval("status") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label8" runat="server" Text='<%# Eval("status") %>'></asp:Label>
                        </ItemTemplate>

<HeaderStyle Height="2px"></HeaderStyle>

                        <ItemStyle HorizontalAlign="Center" Width="70px"  />
                    </asp:TemplateField>
                </Columns>


                 <EditRowStyle BorderStyle="Solid" BorderWidth="2px" />


                 <FooterStyle BackColor="#F2F2F2" Height="60px" Width="0px" />


                 <HeaderStyle BackColor="#F2F2F2" Font-Bold="False" Font-Size="11px" 
                     ForeColor="Black" Font-Names="Arial" 
                     HorizontalAlign="Center" BorderColor="Black" BorderStyle="Solid" 
                     BorderWidth="2px" Wrap="True" />
                 <RowStyle BackColor="White" ForeColor="Black" BorderColor="Black" 
                     BorderStyle="Solid" BorderWidth="2px" />
                 <SelectedRowStyle ForeColor="Black" />


            </asp:GridView></center>
    
    </div>
    </form>
</body>
</html>
