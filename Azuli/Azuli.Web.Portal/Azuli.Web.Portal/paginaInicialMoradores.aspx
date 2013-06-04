<%@ Page Title="Página Inicial Moradores" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="paginaInicialMoradores.aspx.cs" Inherits="Azuli.Web.Portal.paginaInicialMoradores" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            font-family: "Segoe UI";
            font-size: medium;
            color:black;
        }
        .style3
        {
            width: 33px;
            height: 27px;
        }
        .style7
        {
            font-family: "Segoe UI";
            font-weight: normal;
            font-size: small;
            font-variant: normal;
        }
        .style8
        {
            font-weight: normal;
        }
        .style9
        {
            font-weight: bold;
            color: #0066FF;
            font-size: small;
        }
        .GridViewPager
        {
            width: 177px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   
   
    <table style="text-align: justify; height: 101px; width: 941px;">
        <tr>
            <td align="center">
                <img  alt="1" src="images/azuli.jpg" style="width: 96%; height: 119px" />
            </td>
            <td align="center">
                <h1 align="left">
                    &nbsp; Senhor(ª)
                    <asp:Label ID="lblMorador" runat="server" ForeColor="Blue"></asp:Label>&nbsp;<span
                        class="style7">- Você tem
                        <asp:LinkButton ID="lnkBtnMsg" runat="server" Font-Bold="True" Font-Size="Medium"
                            ForeColor="#009900" OnClick="lnkBtnMsg_Click1">0</asp:LinkButton>
                        <span class="style8">&nbsp;mensagens&nbsp;
                            <img alt="" class="style3" src="images/correio.jpg" /></span></span></h1>
                <h1 align="left">
                    <asp:LinkButton ID="lnkDonwload" runat="server" Font-Size="Smaller" OnClick="lnkDonwload_Click">Clique aqui e faça donwload da apresentação das funcionalidades do sistema SGC!</asp:LinkButton>
                </h1>
            </td>
        </tr>
    </table>
    <fieldset>
        <legend class="accordionContent">Seja bem vindo ao Sistema de Gerenciamento de Condominio</legend>
       
        <p>    Através do menu acima, é permitido fazer reservas do salão de festa / Churrasqueira
            e abrir ocorrências, e consultar informações referente ao condominio, como estatuto do condominio e entre mais informações importantes. </p>
        
        
        <li style="color: #000080">
            <asp:LinkButton ID="link1" runat="server" OnClick="link1_Click">Download Regimento Interno do Condominio  Spazio Campo Azuli &nbsp;<img alt=""  src="images/pdf.jpg" style="height: 24px; width: 24px" /></asp:LinkButton></li>
       
       </fieldset>   

        <div id="dvClassificados" style="position:absolute;" runat="server">
      
      
      </div>
       
        <div  id="dvEnquete" style="position:absolute" class="container">
            <div class="headerEnquete">
                <span class="style9">Enquete - Condomínio Azuli</span>
            </div>
            <div class="mainbody">
                <b style="color: #000000">Você julga importante a utilização de um
                <br />
                software de gestão/colaboração no condomínio?</b><br />
                <br />
                <table class="GridViewPager">
                    <asp:RadioButtonList ID="rdlEnquete" runat="server" 
                        DataSourceID="SqlDataSourceRadio" DataTextField="descricaoEnquete" DataValueField="idEnquete">
                        <asp:ListItem Value="1"> Indispensável   </asp:ListItem>
                        <asp:ListItem Value="2"> Muito importante</asp:ListItem>
                        <asp:ListItem Value="3"> Importante</asp:ListItem>
                        <asp:ListItem Value="4"> Pouco Importante</asp:ListItem>
                        <asp:ListItem Value="5"> Dispensável</asp:ListItem>
                       
                    </asp:RadioButtonList>
                    <asp:SqlDataSource ID="SqlDataSourceRadio" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:azulli %>" 
                        SelectCommand="SELECT idEnquete, descricaoEnquete FROM [Enquete]"></asp:SqlDataSource>
                </table>
            </div>
            <div class="FooterEnquete">
                <asp:Button ID="btnVotar" Text="     VOTAR" runat="server" BackColor="#99CCFF" 
                    CssClass="GridViewEdit" Font-Bold="True" ForeColor="Black" Width="82px"  />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:LinkButton ID="lnkResultado" runat="server">Ver Resultado</asp:LinkButton>
            </div>
       
      </div>
   <br /><br /> <br /><br /> <br /><br /> <br /><br /> <br /><br /> <br /><br /> <br /><br />
</asp:Content>
