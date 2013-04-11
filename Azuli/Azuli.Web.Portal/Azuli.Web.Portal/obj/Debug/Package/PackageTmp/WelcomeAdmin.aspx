<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="WelcomeAdmin.aspx.cs" Inherits="Azuli.Web.Portal.WelcomeAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 174%;
        }
        .style2
        {
            width: 155px;
        }
        .style3
        {
            width: 268435440px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <table  >
            <tr>
                <td>
                    <img src="images/azuli.jpg" style="height: 70px; width: 100px;"  />         
                </td>
                <td colspan="3" dir="ltr" align="left" class="style3">
             <h1> Senhor(ª) <asp:Label ID="lblAdmin" 
                        runat="server" ForeColor="Blue"></asp:Label></h1> <br /> Seja bem vindo ao módulo Administrativo.
                    <br />
</td><td>
                    &nbsp;</td>
            </tr>
       </table>  
       </td>
       <P>
                    <table class="AlternatingRowStyle" dir="ltr">
                        <tr>
                            <td colspan="3" align="center">
                                <asp:Label ID="lblPendente" runat="server" Text="Pendências" 
                                    CssClass="MasterMenu"></asp:Label>   </td>
                        </tr>
                        <tr>
                            <td class="style2">
                                <asp:Label ID="Label1" runat="server" Text="Liberação de Morador"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblLiberarMorador" runat="server" Text="0"></asp:Label>
                            </td>
                            <td>
                                <asp:LinkButton ID="lnkLiberaMorador" runat="server">Ver</asp:LinkButton>
                            </td>
                        </tr>
                        <tr>
                            <td class="style2">
                                <asp:Label ID="lblReservaDesc" runat="server" Text="Liberação de Reserva"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblLiberarReserva" runat="server" Text="0"></asp:Label>
                            </td>
                            <td>
                                <asp:LinkButton ID="linkLiberaReserva" runat="server">Ver</asp:LinkButton>
                            </td>
                        </tr>
                        <tr>
                            <td class="style2">
                                <asp:Label ID="lblMsgRecDesc" runat="server" Text="Mensagem Recebida"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblMsgRecebida" runat="server" Text="0"></asp:Label>
                            </td>
                            <td>
                                <asp:LinkButton ID="lnkMsgRecebida" runat="server">Ver</asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                
            Área administrativa, para gerenciamento do Spazio Azuli
       </P>
       
       <p>
            Principais Funcionalidades:
       </p>
       
            <li style="color: #FF0000">Reservas de Salão de Festa e Churrasqueira</li>
    
            <li style="color: #FF0000">Envio de mensagem aos Moradores</li>

            <li style="color: #FF0000">Cancelamento de reservas (Caso o não pagamento)</li>
  
            <li style="color: #FF0000">Livro de ocorrência</li>
 
            <li style="color: #FF0000">Envio de Mensagem para moradores ou todos</li>
            <li style="color: #FF0000">Publicações de Circulares e Balancete</li>
         
       
        <br /> <br /> <br />
        <p>
            A Solução permite gerenciar, de modo on-line, todas as funcionalidades, em um ambiente seguro e robusto.
        </p>
                <p>
                    &nbsp;</p>

</asp:Content>
