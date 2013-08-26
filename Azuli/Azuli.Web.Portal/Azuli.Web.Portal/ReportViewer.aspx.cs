

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrystalDecisions.CrystalReports.Engine;
using System.Configuration;
using System.Data.SqlClient;
using CrystalDecisions.Shared;

namespace Azuli.Web.Portal
{
    public partial class ReportViewer : System.Web.UI.Page
    {
        Util.Util oUtil = new Util.Util();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (oUtil.validateSession())
            {
                crystalReport();
            }
        }




        public void crystalReport()
        {

            try
            {
                ReportDocument rpt = new ReportDocument();
                CrystalDecisions.Shared.ConnectionInfo connectionCrystal = new CrystalDecisions.Shared.ConnectionInfo();
                connectionCrystal.ServerName = ConfigurationManager.AppSettings["azuliServerName"];
                connectionCrystal.DatabaseName = ConfigurationManager.AppSettings["azuliDatabase"];
                connectionCrystal.UserID = ConfigurationManager.AppSettings["userIdSomee"];
                connectionCrystal.Password = ConfigurationManager.AppSettings["pwdSomee"];
                connectionCrystal.Type = ConnectionInfoType.SQL;
                connectionCrystal.IntegratedSecurity = false;
                 string caminhoRelatorio = ConfigurationManager.AppSettings["ReportsPath"] + "ReciboMoradorByApBloco.rpt"; // Local 
                // string caminhoRelatorio = Server.MapPath(ConfigurationManager.AppSettings["ReportsPath"] + "ReciboMoradorByApBloco.rpt"); //web


                //string caminhoRelatorio = ConfigurationManager.AppSettings["ReportsPath"] + "ReciboMoradorByApBloco.rpt"; // Local 
                // string caminhoRelatorio = Server.MapPath(ConfigurationManager.AppSettings["ReportsPath"] + "ReciboMoradorByApBloco.rpt"); //web   
                //Session["reportSource"] = caminhoRelatorio;

                string apartamento = Session["AP"].ToString();
                string bloco = Session["Bloco"].ToString();
                string mes = Session["mes"].ToString();
                string ano = Session["ano"].ToString();

                rpt.Load(caminhoRelatorio);
                rpt.SetParameterValue("bloco", bloco);
                rpt.SetParameterValue("apto", apartamento);
                rpt.SetParameterValue("mes", mes);
                rpt.SetParameterValue("ano", ano);
                SetDBLogonForReport(connectionCrystal, rpt);

                //CrystalReportViewer1.ToolPanelView = CrystalDecisions.Web.ToolPanelViewType.None;
                //CrystalReportViewer1.HasToggleGroupTreeButton = false;
                //CrystalReportViewer1.HasToggleParameterPanelButton = false;
                //rpt.SetDatabaseLogon(connectionCrystal.UserID, connectionCrystal.Password, connectionCrystal.ServerName, connectionCrystal.DatabaseName);
                //CrystalReportViewer1.ReportSourceID = ConfigurationManager.AppSettings["reciboMorador"];

                
                
                rpt.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "Recibo");

                rpt.Refresh();


            }
            catch (Exception ex)
            {

                throw ex;
            }


        }

        private void SetDBLogonForReport(ConnectionInfo myConnectionInfo, ReportDocument myReportDocument)
        {
            Tables myTables = myReportDocument.Database.Tables;
            foreach (CrystalDecisions.CrystalReports.Engine.Table myTable in myTables)
            {
                TableLogOnInfo myTableLogonInfo = myTable.LogOnInfo;
                myTableLogonInfo.ConnectionInfo = myConnectionInfo;
                myTable.ApplyLogOnInfo(myTableLogonInfo);
            }
        }


    }
}