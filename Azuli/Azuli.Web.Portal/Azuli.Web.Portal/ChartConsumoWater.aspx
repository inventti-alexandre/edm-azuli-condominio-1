<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChartConsumoWater.aspx.cs" Inherits="Azuli.Web.Portal.ChartConsumoWater" %>
<%@ Register TagPrefix="highchart"  Namespace="Highchart.UI" Assembly="Highchart" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript" src="http://code.highcharts.com/modules/exporting.js"></script>


    <title>Gráficos de Gestão de Água</title>
    <link href="~/Styles/Site.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 539px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
  
   
  <center>  <div id="container" align="center"> 
    
       <br />
            <legend class="accordionContent">CONDOMÍNIO RESIDENCIAL SPAZIO CAMPO AZULI</legend>
            <br />
     <center>  <table  align="center">
            <tr>
                <td class="style2">
    

   
   <highchart:columnchart id="hcConsumoGeral" width="500" height="400" runat="server"></highchart:columnchart>

 
                    

 
                </td>
                <td align="left"><highchart:columnchart id="hcExcedentes" width="570" height="400" runat="server"></highchart:columnchart></td>
            </tr>
            <tr>
                <td class="style2">
                   <highchart:columnchart id="hcConsumoPorBloco" width="570" height="450" runat="server"></highchart:columnchart></td>
                <td>
                    <highchart:columnchart id="hcAnormalidade" width="570" height="450" runat="server"></highchart:columnchart></td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table></center> 


  </div></center>
    </form>
</body>
</html>
