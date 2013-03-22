<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="WelcomeAdmin.aspx.cs" Inherits="Azuli.Web.Portal.WelcomeAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 290px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <table >
            <tr>
                <td>
                    <img src="images/azuli.jpg" style="height: 90px; width: 134px;"  />         
                </td>
                <td colspan="3" dir="ltr" align="left">
             <h1> Senhor(ª) <asp:Label ID="lblAdmin" 
                        runat="server" ForeColor="Blue"></asp:Label></h1> <br /> Seja bem vindo ao módulo Administrativo: 
                
                </td>
            </tr>
       </table>  
       
       <P>
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
