using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrystalDecisions.CrystalReports.Engine;
using System.Configuration;

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

                    string apartamento = Session["AP"].ToString();
                    string bloco = Session["Bloco"].ToString();
                    ReportDocument rpt = new ReportDocument();

                    string caminhoRelatorio = ConfigurationManager.AppSettings["ReportsPath"] + "ReciboMoradorByApBloco.rpt";

                    rpt.Load(caminhoRelatorio);//Server.MapPath("ReciboControl.rpt")

                    //string pathRelatorio = Server.MapPath("TESTE.rpt");

                    rpt.SetParameterValue("@bloco", bloco);
                    rpt.SetParameterValue("@apartamento", apartamento);

                    CrystalReportViewer1.ToolPanelView = CrystalDecisions.Web.ToolPanelViewType.None;
                    CrystalReportViewer1.HasToggleGroupTreeButton = false;
                    CrystalReportViewer1.HasToggleParameterPanelButton = false;
                    CrystalReportViewer1.ReportSource = rpt;
                    
                }
            }
        }
    }
}