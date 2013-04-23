<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="videoajuda.aspx.cs" Inherits="Azuli.Web.Portal.videoajuda" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style2
        {
            font-size: medium;
            color: #000099;
            font-weight: bold;
        }
        .style3
        {
            background-color: #f0f0f0;
            border-left: 1px dotted #999999;
            border-right: 1px dotted #999999;
            border-bottom: 1px dotted #999999;
            padding: 5px 5px 5px 5px;
            font-family: Verdana;
            font-size: 8pt;
            color: #0033CC;
        }
        .style4
        {
            color: #0033CC;
            font-weight: bold;
        }
        .style5
        {
            background-color: #f0f0f0;
            border-left: 1px dotted #999999;
            border-right: 1px dotted #999999;
            border-bottom: 1px dotted #999999;
            padding: 5px 5px 5px 5px;
            font-family: Verdana;
            font-size: 8pt;
            color: #0033CC;
            font-weight: bold;
        }
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <br /> <br />

       <br />

       <span class="style2">Assista o video e veja como é fácil utilizar o SGC</span>
        

 <fieldset class="loginDisplayLegend">
        <legend class="style3">Como entrar no Sistema : </legend>
        <br />
        <table class="style1">
            <tr>
                
                <td>
                  <iframe width="400" height="215" src="http://www.youtube.com/embed/3ocxBCM9AbE" frameborder="0" allowfullscreen></iframe>
                </td>
            </tr>
        </table>
    </fieldset>
   

   <fieldset class="loginDisplayLegend">
        <legend class="accordionContent"><span class="style4">Como Ler as mensagen :</span> </legend>
        <br />
        <table class="style1">
            <tr>
                
                <td>
                 <iframe width="400" height="215" src="http://www.youtube.com/embed/jsUEq46q7ls" frameborder="0" allowfullscreen></iframe>
                </td>
            </tr>
        </table>
    </fieldset>

    <fieldset class="loginDisplayLegend">
        <legend class="style5">Como fazer reserva das Áreas: </legend>
        <br />
        <table class="style1">
            <tr>
                
                <td>
                 <iframe width="400" height="215" src="http://www.youtube.com/embed/_hXyYDnq2ag" frameborder="0" allowfullscreen></iframe>
                </td>
            </tr>
        </table>
    </fieldset>
    
</asp:Content>


