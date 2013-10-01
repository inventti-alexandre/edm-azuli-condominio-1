

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
using System.Data;
using Azuli.Crystal;
using Azuli.Web.Business;
using Azuli.Web.Model;

namespace Azuli.Web.Portal
{
    public partial class ReportViewer : System.Web.UI.Page
    {

        AgendaBLL oAgendaBLL = new AgendaBLL();
        AgendaModel oAgendaModel = new AgendaModel();
        Util.Util oUtil = new Util.Util();
        ConfiguracaoReservaBLL oConfigValor = new ConfiguracaoReservaBLL();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Convert.ToBoolean(Session["ReciboAgua"]) == true)
            {
                if (oUtil.validateSession())
                {
                    crystalReport();
                }
            }
            else
            {

                if (oUtil.validateSessionAdmin())
                {
                    Recibo();

                }
            }
        }


        public void Recibo()
        {

            ApartamentoModel oAp = new ApartamentoModel();

            if (Session["reciboConfirmadoNoAto"] != null && (int)Session["reciboConfirmadoNoAto"] == 1)
            {
                oAp.apartamento =  Convert.ToInt32(Session["MoradorSemInternetAP"]);
                oAp.bloco = Convert.ToInt32(Session["MoradorSemInternetBloco"]);
                oAgendaModel.dataAgendamento = Convert.ToDateTime(Session["dataReservaAdministrador"]);
                oAgendaModel.ap = oAp;

            }
            else
            {

                oAp.apartamento = Convert.ToInt32(Session["aptoSession"]);
                oAp.bloco = Convert.ToInt32(Session["blocoSession"]);
                oAgendaModel.dataAgendamento = Convert.ToDateTime(Session["dataReservaOnline"]);
                oAgendaModel.ap = oAp;
            }

            try
            {
                DSrecibo dsRecibo = new DSrecibo();
                DataRow drRecibo = dsRecibo.Tables[0].NewRow();

                foreach (var item in  oAgendaBLL.geraReciboPago(oAgendaModel))
                {
                    drRecibo["DIA"] = DateTime.Now.Day;
                    drRecibo["MES"] = System.Globalization.DateTimeFormatInfo.CurrentInfo.GetMonthName(DateTime.Now.Month);
                    drRecibo["ANO"] = DateTime.Now.Year;
                    if (item.salaoChurrasco == true && item.salaoFesta == true)
                    {
                        foreach (var Desconto in oConfigValor.oListaValorReserva())
                        {
                            if (Desconto.id_valor == 3)
                            {
                                drRecibo["VALOR_POR_EXTENSO"] = new Util.NumeroPorExtenso(Convert.ToDecimal(item.valorReserva - Desconto.valor));
                                drRecibo["VALOR"] = item.valorReserva - Desconto.valor + ",00";

                            }

                        }

                    }
                    else
                    {
                        drRecibo["VALOR_POR_EXTENSO"] = new Util.NumeroPorExtenso(Convert.ToDecimal(item.valorReserva));
                        drRecibo["VALOR"] = item.valorReserva + ",00";
                    }
                  
                    drRecibo["PROPRIETARIO"] = "0"+item.ap.bloco + " - " + item.ap.apartamento + " - " + item.ap.oProprietario.proprietario1;
                    drRecibo["Descricao"] = item.observacao;
                   
                    
                    
                }
               
              
               
               
               

                //string caminhoRelatorio = ConfigurationManager.AppSettings["ReportsPath"] + ConfigurationManager.AppSettings["reciboReserva"];
                
                //rpt.Load(caminhoRelatorio);
                
               // rpt.SetDataSource(drRecibo);

                dsRecibo.Tables[0].Rows.Add(drRecibo);

                Crystal.Relatorios.ReciboReserva rbReserva = new Crystal.Relatorios.ReciboReserva();

                rbReserva.SetDataSource(dsRecibo);

                CrystalReportViewer1.ReportSource = rbReserva;

                rbReserva.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "Recibo");




            }
            catch (Exception ex)
            {

                throw ex;
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
                //string caminhoRelatorio = Server.MapPath(ConfigurationManager.AppSettings["ReportsPath"] + "ReciboMoradorByApBloco.rpt"); //web


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