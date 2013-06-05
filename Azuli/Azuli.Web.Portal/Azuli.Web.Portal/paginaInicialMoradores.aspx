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
            color: #0093D4;
            font-size: small;
        }
        .GridViewPager
        {
            width: 177px;
        }
        .style10
        {
            font-weight: bold;
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

       
        <div  id="dvEnquete" style="position:absolute" class="container" runat="server">
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
                    <br />
                
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label 
                        ID="lblMsg"  runat="server" 
                        CssClass="accordionContent" Font-Bold="True" ForeColor="#0066FF" 
                        Visible="False"></asp:Label>
                    <asp:SqlDataSource ID="SqlDataSourceRadio" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:azulli %>" 
                        SelectCommand="SELECT idEnquete, descricaoEnquete FROM [Enquete]"></asp:SqlDataSource>
                </table>
            </div>
            <div class="FooterEnquete">
                <asp:Button ID="btnVotar" Text="     VOTAR" runat="server" BackColor="#99CCFF" 
                    CssClass="GridViewEdit" Font-Bold="True" ForeColor="Black" Width="82px" 
                    onclick="btnVotar_Click"  />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:LinkButton ID="lnkResultado" OnClick="lnkResultado_Click" runat="server">Ver Resultado</asp:LinkButton>
            </div>
       
      </div>
       <div  id="dvResultado" style="position:absolute" class="container" runat="server">
            <div class="headerEnquete">
                <span class="style9">Enquete - Condomínio Azuli</span>
            </div>
            <div class="mainbody">
                <b style="color: #000000">Você julga importante a utilização de um
                <br />
                software de gestão/colaboração no condomínio?</b><br />
              <div style="margin-top: 8px;">
                                        Muito importante</div>
                                    <div>
                                        <div id="dvMuitoImport" runat="server" style="float: left; background-color: #B9E1F6; width: 0%">
                                            &nbsp;</div>
                                        <div style="float: left; font-size: 11px;">
                                              &nbsp;<asp:Label 
                                                  ID="lblMuitoImportante" runat="server" CssClass="style10">0 voto(s), (0%)</asp:Label>
                                        </div>
                                    </div>
                                    <br>
                                
                                    <div style="margin-top: 8px;">
                                        Indispensável</div>
                                    <div>
                                        <div id="dvIndisp" runat="server" style="float: left; background-color: #B9E1F6; width:0%">
                                            &nbsp;</div>
                                        <div style="float: left; font-size: 11px;">
                                            &nbsp; <asp:Label ID="lblIndispensavel" runat="server" CssClass="style10">0 voto(s), (0%)</asp:Label>
                                        </div>
                                    </div>
                                    <br>
                                
                                    <div style="margin-top: 8px;">
                                        Importante</div>
                                    <div>
                                        <div id="dvImportante" runat="server" style="float: left; background-color: #B9E1F6; width:0%">
                                            &nbsp;</div>
                                        <div style="float: left; font-size: 11px;">
                                             &nbsp;<asp:Label ID="lblImportante" runat="server" CssClass="style10">0 voto(s), (0%)</asp:Label>
                                        </div>
                                    </div>
                                    <br>
                                
                                    <div style="margin-top: 8px;">
                                        Dispensável</div>
                                    <div>
                                        <div id="dvDispen" runat="server" style="float: left; background-color: #B9E1F6; width: 0%">
                                            &nbsp;</div>
                                        <div style="float: left; font-size: 11px;">
                                            &nbsp; <asp:Label ID="lblDispensavel" runat="server" CssClass="style10">0 voto(s), (0%)</asp:Label>
                                        </div>
                                    </div>
                                    <br>
                                
                                    <div style="margin-top: 8px;">
                                        Pouco Importante</div>
                                    <div>
                                        <div id="dvPoucoImpor" runat="server" style="float: left; background-color: #B9E1F6; width: 0%">
                                            &nbsp;</div>
                                        <div style="float: left; font-size: 11px;">
                                             &nbsp;<asp:Label ID="lblPoucoImportante" runat="server" CssClass="style10">0 voto(s), (0%)</asp:Label>
                                        </div>
                                    </div>
                                    <br>
                                
                            <br>
                           
               
            </div>
            <div class="FooterEnquete">
                 <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                <tbody><tr>
                                    <td>
                                        <b>Total:&nbsp;<span><asp:Label ID="lblTotal" runat="server"></asp:Label></span>&nbsp;voto(s)</b>
                                    </td>
                                    <td align="center">
                                        <asp:LinkButton ID="lnkVoltar" runat="server" Font-Bold="True" 
                                            onclick="lnkVoltar_Click1">Voltar</asp:LinkButton>
                                    </td>
                                </tr>
                            </tbody></table>
            </div>
       
      </div>

      
        <div  id="dvClassificado" 
        style="position:absolute; top: 46%; left:52%;" class="container" 
        runat="server">
            <div class="headerEnquete">
                <span class="style9">Classificados Publicados pelos Moradores!</span>
            </div>
            <div class="mainbody">
            <br />
              <center>  
           
            <asp:GridView ID="grdClassificado" runat="server" AutoGenerateColumns="False"  EmptyDataText="Não existem Anúncios para esta consulta"
                CssClass="accordionContent">
                <Columns>
                    <asp:TemplateField HeaderText="Código" Visible="False">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" 
                                Text='<%# Bind("idClassificado") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("idClassificado") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:ImageField DataImageUrlField="classificadoimg1" HeaderText="Foto" 
                        DataImageUrlFormatString="~/ServerFile/Classificados/{0}">
                        <ControlStyle Width="45px" />
                    </asp:ImageField>
                    <asp:TemplateField HeaderText="Descrição">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" 
                                Text='<%# Bind("assuntoClassificado") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" 
                                Text='<%# Bind("assuntoClassificado") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Font-Bold="True" ForeColor="Black" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Preço">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" 
                                Text='<%# Bind("valorVendaClassificado") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" 
                                Text='<%# Bind("valorVendaClassificado","{0:N2}")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Data">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" 
                                Text='<%# Eval("dataClassificado", "{0:dddd}") + " / " + Eval("dataClassificado","{0:dd/MM/yyyy}") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server"  Text='<%# Eval("dataClassificado", "{0:dddd}") + " - " + Eval("dataClassificado","{0:dd/MM/yyyy}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView> </center> 
            </div>
            <div class="FooterEnquete">
               <center> <asp:Button ID="btnClassificados" Text="            Clique aqui e veja mais ..." runat="server" BackColor="#99CCFF" 
                    CssClass="GridViewEdit" Font-Bold="True" ForeColor="Black" Width="250px" 
                    onclick="btnClassificados_OnClick"  /></center>
           
            </div>
       
      </div>
     
   <br /><br /> <br /><br /> <br /><br /> <br /><br /> <br /><br /> <br /><br /> <br /><br />
</asp:Content>
