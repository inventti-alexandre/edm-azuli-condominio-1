using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrystalDecisions.CrystalReports.Engine;
using System.Configuration;
using System.Data.SqlClient;

namespace Azuli.Web.Portal
{
    public partial class ReportViewer : System.Web.UI.Page
    {
        Util.Util oUtil = new Util.Util();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (oUtil.validateSession())
            {
                if (!IsPostBack)
                {
                    ReportDocument rpt = new ReportDocument();
                    CrystalDecisions.Shared.ConnectionInfo connectionCrystal = new CrystalDecisions.Shared.ConnectionInfo();
                  
                       var conexao  = new SqlConnectionStringBuilder(ConfigurationManager.ConnectionStrings["azulli"].ConnectionString);

                    //connectionCrystal.ServerName = ConfigurationManager.ConnectionStrings["azulli"].ToString();
                    //connectionCrystal.DatabaseName = ConfigurationManager.AppSettings["azuliHomologa"];
                    //connectionCrystal.UserID = ConfigurationManager.AppSettings["userIdSomee"];
                    //connectionCrystal.Password = ConfigurationManager.AppSettings["pwdSomee"];

                    rpt.SetDatabaseLogon(conexao.UserID, conexao.Password, conexao.DataSource, conexao.InitialCatalog);
                    
                    string caminhoRelatorio = ConfigurationManager.AppSettings["ReportsPath"] + "ReciboMoradorByApBloco.rpt"; // Local 
                    rpt.Load(caminhoRelatorio);//Server.MapPath("ReciboControl.rpt")
                    //string caminhoRelatorio = Server.MapPath(ConfigurationManager.AppSettings["ReportsPath"] + "ReciboMoradorByApBloco.rpt"); //web

                    foreach (CrystalDecisions.CrystalReports.Engine.Table table in rpt.Database.Tables)
                    {
                        table.LogOnInfo.ConnectionInfo = connectionCrystal;
                    }

                    string apartamento = Session["AP"].ToString();
                    string bloco = Session["Bloco"].ToString();
                 
                  
                 
                    //string pathRelatorio = Server.MapPath("TESTE.rpt");
                    rpt.SetParameterValue("@bloco", bloco);
                    rpt.SetParameterValue("@apartamento", apartamento);
                  
                    CrystalReportViewer1.ToolPanelView = CrystalDecisions.Web.ToolPanelViewType.None;
                    CrystalReportViewer1.HasToggleGroupTreeButton = false;
                    CrystalReportViewer1.HasToggleParameterPanelButton = false;
                    rpt.SetDatabaseLogon(connectionCrystal.UserID, connectionCrystal.Password, connectionCrystal.ServerName, connectionCrystal.DatabaseName);
                    CrystalReportViewer1.ReportSource = rpt;
                    CrystalReportViewer1.RefreshReport();
                    
                }
            }
        }
    }
}