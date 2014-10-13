<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="GerarReciboAzuliAdm.aspx.cs" Inherits="Azuli.Web.Portal.GerarReciboAzuliAdm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

  <br />
    <fieldset  class="style1" dir="ltr">
  
        <legend class="accordionContent">Gerar Recibo Mensal - Conta Água Azuli</legend>
        <br />
        <asp:Label ID="lblConsultaAno" runat="server" CssClass="mainbodyTel" 
            Text="Mudar Ano de Consulta:"></asp:Label>
        &nbsp;<asp:DropDownList ID="drpAno" runat="server" CssClass="FooterStyle" Height="26px" 
            Width="123px" AutoPostBack="True" ontextchanged="drpAno_TextChanged" 
           >
        </asp:DropDownList>
        <br />
        <br />
        
         <center>   <asp:Label ID="lblMsg" runat="server" CssClass="failureNotification"></asp:Label></center>
        
        <br />

        <div id="dvPublicacao" runat="server" align="left">
      <table cellpadding="1" 
            style="background-color: White; border: Outset 2px Silver; text-align: center; width: 100%;" 
            class="btGeral" align="left" dir="ltr">
        
       
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
                    ImageUrl="~/images/excel.png" onclick="ImageButton1_Click" />
            </td>
            <td>
                <asp:Image ID="img2" runat="server" Height="18px" 
                    ImageUrl="~/images/vermelhoStatus.png"  Width="23px" />
                    <br />
                <br />
                <asp:ImageButton ID="ImageButton2" ImageUrl="~/images/excel.png" runat="server" 
                    onclick="ImageButton2_Click" />
            </td>
            <td>
                <asp:Image ID="img3" runat="server" Height="18px" 
                    ImageUrl="~/images/vermelhoStatus.png" Width="23px" />
                    <br />
                <br />
                <asp:ImageButton ID="ImageButton3" ImageUrl="~/images/excel.png" runat="server" 
                    onclick="ImageButton3_Click" style="width: 16px" />
            </td>
            <td class="style2">
                <asp:Image ID="img4" runat="server" Height="18px" 
                    ImageUrl="~/images/vermelhoStatus.png" Width="23px" />
                    <br />
                <br />
                <asp:ImageButton ID="ImageButton4" ImageUrl="~/images/excel.png" runat="server" 
                    onclick="ImageButton4_Click" />
            </td>
            <td>
                <asp:Image ID="img5" runat="server" Height="18px" 
                    ImageUrl="~/images/vermelhoStatus.png" Width="23px" />
                    <br />
                <br />
                <asp:ImageButton ID="ImageButton5" ImageUrl="~/images/excel.png" runat="server" 
                    onclick="ImageButton5_Click" />
            </td>
            <td>
                <asp:Image ID="img6" runat="server" Height="18px" 
                    ImageUrl="~/images/vermelhoStatus.png" Width="23px" />
                    <br />
                <br />
                <asp:ImageButton ID="ImageButton6" ImageUrl="~/images/excel.png" runat="server" 
                    onclick="ImageButton6_Click" />
            </td>
            <td>
                <asp:Image ID="img7" runat="server" Height="18px" 
                    ImageUrl="~/images/vermelhoStatus.png"   Width="23px" />
                    <br />
                <br />
                <asp:ImageButton ID="ImageButton7" ImageUrl="~/images/excel.png" runat="server" 
                    onclick="ImageButton7_Click" style="height: 16px" />
            </td>
            <td>
                <asp:Image ID="img8" runat="server" Height="18px" 
                    ImageUrl="~/images/vermelhoStatus.png" Width="23px" />
                    <br />
                <br />
                <asp:ImageButton ID="ImageButton8" ImageUrl="~/images/excel.png" runat="server" 
                    onclick="ImageButton8_Click" />
            </td>
            <td>
                <asp:Image ID="img9" runat="server" Height="18px" 
                    ImageUrl="~/images/vermelhoStatus.png" Width="23px" />
                    <br />
                <br />
                <asp:ImageButton ID="ImageButton9" ImageUrl="~/images/excel.png" runat="server" 
                    onclick="ImageButton9_Click" />
            </td>
            <td>
                <asp:Image ID="img10" runat="server" Height="18px" 
                    ImageUrl="~/images/vermelhoStatus.png" Width="23px" />
                    <br />
                <br />
                <asp:ImageButton ID="ImageButton10" ImageUrl="~/images/excel.png" 
                    runat="server" onclick="ImageButton10_Click" />
            </td>
            <td>
                <asp:Image ID="img11" runat="server" Height="18px" 
                    ImageUrl="~/images/vermelhoStatus.png" Width="23px" />
                    <br />
                <br />
                <asp:ImageButton ID="ImageButton11"  ImageUrl="~/images/excel.png" 
                    runat="server" onclick="ImageButton11_Click" />

            </td>
            <td>
                <asp:Image ID="img12" runat="server" Height="18px" 
                    ImageUrl="~/images/vermelhoStatus.png" Width="23px" />
                    <br />
                <br />
                <asp:ImageButton ID="ImageButton12" ImageUrl="~/images/excel.png" 
                    runat="server" onclick="ImageButton12_Click" />
            </td>
        </tr>
        </table>
        </div>
        
        </fieldset>

</asp:Content>
