

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
using System.Drawing.Printing;
using System.IO;
using System.Reflection;
using System.Text;

namespace Azuli.Web.Portal
{
    public partial class ReportViewer : System.Web.UI.Page
    {
          ApartamentoModel oAp = new ApartamentoModel();
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

        public void verificaExcenteCondominio()
        {

        }

        public class BancoExcel
        {
            public string parameters { get; set; }

            
        }
        


        public void Export(string fileName, listaSegundaViaAgua listAguaExcel)
        {






            ////The Clear method erases any buffered HTML output.
            //HttpContext.Current.Response.Clear();
            ////The AddHeader method adds a new HTML header and value to the response sent to the client.
            //HttpContext.Current.Response.AddHeader(
            //    "content-disposition", string.Format("attachment; filename={0}", fileName + ".xls"));
            ////The ContentType property specifies the HTTP content type for the response.
            //HttpContext.Current.Response.ContentType = "application/ms-excel";
            ////Implements a TextWriter for writing information to a string. The information is stored in an underlying StringBuilder.
            //using (StringWriter sw = new StringWriter())
            //{
            //    //Writes markup characters and text to an ASP.NET server control output stream. This class provides formatting capabilities that ASP.NET server controls use when rendering markup to clients.
            //    using (HtmlTextWriter htw = new HtmlTextWriter(sw))
            //    {
            //        //  Create a form to contain the List
            //        System.Web.UI.WebControls.Table table = new System.Web.UI.WebControls.Table();
            //        TableRow row = new TableRow();


            //         List<BancoExcel> listExcel = new List<BancoExcel>()
            //         {
            //             new BancoExcel{parameters="Registro"},
            //             new BancoExcel{parameters = "Apto"},
            //             new BancoExcel{parameters = "Histórico"},
            //             new BancoExcel{parameters = "Leitura Anterior"},
            //             new BancoExcel{parameters = "Leitura Atual"},
            //             new BancoExcel{parameters = "Consumo"},
            //             new BancoExcel{parameters = "Excedente M³"},
            //             new BancoExcel{parameters = "À pagar"},
            //             new BancoExcel{parameters = "Obs:"},

            //         };
 
            //        foreach(var item in  listExcel)
            //        {

            //            TableHeaderCell hcell = new TableHeaderCell();
            //            hcell.BorderColor = System.Drawing.Color.Black;
            //            hcell.Text = item.parameters;
            //            row.Cells.Add(hcell);
            //        }
                    

            //        table.Rows.Add(row);


            //        var listAprove = from listaOrd in listAguaExcel
            //                         orderby listaOrd.registro ascending
            //                         select listaOrd;

            //        //  add each of the data item to the table
            //        foreach (ReciboAgua emp in listAprove)
            //        {
            //            TableRow row1 = new TableRow();
            //            TableCell cellAge = new TableCell();
            //            cellAge.Text = "" + emp.registro;
            //            TableCell cellName = new TableCell();
            //            cellName.Text = "" + Math.Round(emp.excedenteM3diaria * 30, 0);
            //            row1.Cells.Add(cellAge);
            //            row1.Cells.Add(cellName);
            //            table.Rows.Add(row1);
            //        }
            //        //  render the table into the htmlwriter
            //        table.RenderControl(htw);
            //        //  render the htmlwriter into the response
            //        HttpContext.Current.Response.Write(sw.ToString());
            //        HttpContext.Current.Response.End();

            //        Response.Redirect("~/GerarReciboAzuliAdm.aspx");

                    
                //}
            }



       

        

        public void Recibo()
        {

              if (Convert.ToBoolean(Convert.ToBoolean(Session["chooseReport"]) == true))
              {
                  System.Drawing.Printing.PageSettings pg = new System.Drawing.Printing.PageSettings();
                  pg.Margins.Top = 0;
                  pg.Margins.Bottom = 0;
                  pg.Margins.Left = 0;
                  pg.Margins.Right = 0;
                  System.Drawing.Printing.PaperSize size = new System.Drawing.Printing.PaperSize();
                  size.RawKind = (int)PaperKind.Letter;
                  pg.PaperSize = size;
                  pg.Landscape = true;

                  decimal somatudo = 0;
                    ReciboAguaBLL oReciboBLL = new ReciboAguaBLL();
                    ReciboAgua oReciboModel = new ReciboAgua();
                    double totalExcedenteDinamico = 0;

                    DSrecibo dsSegundaVia = new DSrecibo();
                 

                    string mes = Session["mes"].ToString();
                    string ano = Session["ano"].ToString();



                    var oListOrdenadoByRegistro = from listaOrdenada in oReciboBLL.buscaTodosRecibosByYearAndMonth(Convert.ToInt32(ano), Convert.ToInt32(mes))
                                                  orderby listaOrdenada.registro ascending
                                                  select listaOrdenada;


                    listaSegundaViaAgua listExcel = oReciboBLL.buscaTodosRecibosByYearAndMonth(Convert.ToInt32(ano), Convert.ToInt32(mes));



                    if (Convert.ToBoolean(Session["Excel"]) == true)
                    {
                        Export(mes + "/" + ano, listExcel);
                    }

                    else
                    {
                        try
                        {
                            foreach (var item in oListOrdenadoByRegistro)
                            {

                                if (Math.Round(item.excedenteM3diaria * 30, 0, MidpointRounding.AwayFromZero) > 10)
                                {

                                    totalExcedenteDinamico += Math.Round(item.excedenteM3diaria * 30, 0, MidpointRounding.AwayFromZero) - 10;
                                }

                            }



                            foreach (var item in oListOrdenadoByRegistro)
                            {



                                DataRow drSegundaVia = dsSegundaVia.Tables[1].NewRow();

                                drSegundaVia["ID-Condomínio"] = item.idCondominio;
                                drSegundaVia["Nome do Condomínio"] = item.nomeCondominio;
                                drSegundaVia["Endereço do Condomínio"] = item.enderecoCondominio;
                                drSegundaVia["Bloco"] = item.bloco;
                                drSegundaVia["Apartamento"] = item.apartamento;
                                drSegundaVia["Registro"] = item.registro;
                                drSegundaVia["Fechamento Atual"] = item.fechamentoAtual;
                                drSegundaVia["Data leitura Anterior"] = item.dataLeituraAnterior;
                                drSegundaVia["Leitura Anterior M³"] = item.leituraAnteriorM3;
                                drSegundaVia["Data leitura Atual"] = item.dataLeituraAtual;
                                drSegundaVia["Leitura Atual M³"] = item.leituraAtualM3;

                                drSegundaVia["Consumo do Mês M³"] = Math.Round(item.excedenteM3diaria * 30, 0 , MidpointRounding.AwayFromZero);//item.consumoMesM3;// item.consumoMesM3;

                               

                                //drSegundaVia["Consumo do Mês M³"] = Math.Round(item.excedenteM3diaria * 30, 0);//item.consumoMesM3;// item.consumoMesM3;
                                drSegundaVia["Data da próxima leitura"] = item.dataProximaLeitura;
                                drSegundaVia["status"] = item.status;
                                drSegundaVia["Média"] = item.media;
                                drSegundaVia["Histórico descricação mês1"] = item.historicoDescricaoMes1;
                                drSegundaVia["Histórico mês1"] = item.historicoMes1;
                                drSegundaVia["Histórico descricação mês2"] = item.historicoDescricaoMes2;
                                drSegundaVia["Histórico mês2"] = item.historicoMes2;
                                drSegundaVia["Histórico descricação mês3"] = item.historicoDescricaoMes3;
                                drSegundaVia["Histórico mês3"] = item.historicoMes3;
                                drSegundaVia["Histórico descricação mês4"] = item.historicoDescricaoMes4;
                                drSegundaVia["Histórico mês4"] = item.historicoMes4;
                                drSegundaVia["Histórico descricação mês5"] = item.historicoDescricaoMes5;
                                drSegundaVia["Histórico mês5"] = item.historicoMes5;
                                drSegundaVia["Histórico descricação mês6"] = item.historicoDescricaoMes6;
                                drSegundaVia["Histórico mês6"] = item.historicoMes6;

                                // Virá do banco quando o consumo - se maior que 2400 fara o valor do rateio
                                //item.consumoM3pagoCondominio = 2600;
                                // o Valor pago do condominio virá do banco também...
                                //item.ConsumoValorPagoCondominio = 7900;

                                //Isto ficará fixo - Será a diferença paga entre o valor pago do consumo minimo, e o consumo e excedente
                                item.excedenteValorPagoCondominio = Math.Abs(item.ConsumoValorPagoCondominio - item.minimoValorPagoCondominio);

                                drSegundaVia["Consumo Valor"] = item.ConsumoValorPagoCondominio;
                                drSegundaVia["Consumo M³"] = item.consumoM3pagoCondominio;

                                drSegundaVia["Mínimo M³"] = item.minimoM3PagoCondominio;
                                drSegundaVia["Mínimo Valor"] = item.minimoValorPagoCondominio;

                                drSegundaVia["Excedente Valor"] = item.excedenteValorPagoCondominio;
                                drSegundaVia["Tarifa Mínima M³"] = item.tarifaMinimaM3ValorDevido;
                                drSegundaVia["Tarifa Mínima Valor"] = item.tarifaMinimaValorValorDevido;

                        

                                //var dir = System.Configuration.ConfigurationManager.AppSettings["relatorioGeral"];

                                //StreamWriter details = new StreamWriter("D:\\DZHosts\\LocalUser\\edmls34\\www.azulicondominio.com\\relatorio"+mes+ano+".txt",true,Encoding.ASCII);
                                //Se o valor do consumo do M3 for maior que o minimo M3 do condominio será feito o rateio...
                                
                                if (item.consumoM3pagoCondominio > item.minimoM3PagoCondominio)
                                {
                                    item.excedenteM3PagoCondominio = item.consumoM3pagoCondominio - item.minimoM3PagoCondominio;


                                    item.excedenteValorRateio = Convert.ToDecimal(Math.Round(Convert.ToDouble(item.excedenteValorPagoCondominio) / totalExcedenteDinamico + 0.0005, 3));
                                    item.valorPagarValorDevido = item.excedenteValorDevido *  item.excedenteValorRateio;

                                    somatudo += item.valorPagarValorDevido;

                                    drSegundaVia["ExcedentePagoPeloCondominio"] = item.excedenteM3PagoCondominio;
                                    drSegundaVia["ExcedenteValorRateio "] = item.excedenteValorRateio;
                                    drSegundaVia["a pagar"] = item.valorPagarValorDevido;


                                  
                                   

                                    //details.WriteLine(item.bloco + " " + item.apartamento + " " + item.valorPagarValorDevido);


                                }
                                //Se não mantêm o valor sem rateio..
                                else
                                {
                                    drSegundaVia["ExcedentePagoPeloCondominio"] = item.excedenteM3PagoCondominio;
                                    drSegundaVia["ExcedenteValorRateio "] = item.excedenteValorRateio;
                                    drSegundaVia["a pagar"] = item.valorPagarValorDevido;
                                }

                                //details.Close();

                                drSegundaVia["ExcedenteM3Rateio"] = totalExcedenteDinamico;
                                drSegundaVia["Geral"] = item.avisoGeralAviso;
                                drSegundaVia["Anormal"] = item.AnormalAviso;
                                drSegundaVia["Invididual"] = item.individualAviso;
                                drSegundaVia["ANORMALIDADE"] = item.anormalidadeAviso;
                                drSegundaVia["Imagem"] = item.imagem;
                                drSegundaVia["ExcedenteValorDevido"] = item.excedenteValorDevido;
                                drSegundaVia["excedenteM3Diario"] = item.excedenteM3diaria;

                                dsSegundaVia.Tables[1].Rows.Add(drSegundaVia);


                            }



                            Crystal.Relatorios.ReciboMoradorByApBloco rbSegundaVia = new Crystal.Relatorios.ReciboMoradorByApBloco();

                            rbSegundaVia.SetDataSource(dsSegundaVia);

                            rbSegundaVia.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "Recibo");
                        }

                        catch (Exception ex)
                        {

                            throw ex;
                        }
                    }

              }
            

              else
              {
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
        }

        public void crystalReport()
        {

            System.Drawing.Printing.PageSettings pg = new System.Drawing.Printing.PageSettings();
            pg.Margins.Top = 0;
            pg.Margins.Bottom = 0;
            pg.Margins.Left = 0;
            pg.Margins.Right = 0;
            System.Drawing.Printing.PaperSize size = new System.Drawing.Printing.PaperSize(); 
            size.RawKind = (int)PaperKind.Letter;
            pg.PaperSize = size;
            pg.Landscape = true;
         

            ReciboAguaBLL oReciboBLL = new ReciboAguaBLL();
            ReciboAgua oReciboModel = new ReciboAgua();

            DSrecibo dsSegundaVia = new DSrecibo();
            DataRow drSegundaVia = dsSegundaVia.Tables[1].NewRow();

            try
            {

              
              

                    string apartamento = Session["AP"].ToString();
                    string bloco = Session["Bloco"].ToString();
                    string mes = Session["mes"].ToString();
                    string ano = Session["ano"].ToString();

                    oReciboModel.bloco = bloco;
                    oReciboModel.apartamento = apartamento;
                    oReciboModel.ano = Convert.ToInt32(ano);
                    oReciboModel.mes = Convert.ToInt32(mes);




                    foreach (var item in oReciboBLL.buscaTodosRecibosByBlocoAndApto(oReciboModel))
                    {
                       
                       
                        
                        drSegundaVia["ID-Condomínio"] = item.idCondominio;
                        drSegundaVia["Nome do Condomínio"] = item.nomeCondominio;
                        drSegundaVia["Endereço do Condomínio"] = item.enderecoCondominio;
                        drSegundaVia["Bloco"] = item.bloco;
                        drSegundaVia["Apartamento"] = item.apartamento;
                        drSegundaVia["Registro"] = item.registro;
                        drSegundaVia["Fechamento Atual"] = item.fechamentoAtual;
                        drSegundaVia["Data leitura Anterior"] = item.dataLeituraAnterior;
                        drSegundaVia["Leitura Anterior M³"] = item.leituraAnteriorM3;
                        drSegundaVia["Data leitura Atual"] = item.dataLeituraAtual;
                        drSegundaVia["Leitura Atual M³"] = item.leituraAtualM3;
                        drSegundaVia["Consumo do Mês M³"] = item.consumoMesM3;
                        drSegundaVia["Data da próxima leitura"] = item.dataProximaLeitura;
                        drSegundaVia["status"] = item.status;
                        drSegundaVia["Média"] = item.media;
                        drSegundaVia["Histórico descricação mês1"] = item.historicoDescricaoMes1;
                        drSegundaVia["Histórico mês1"] = item.historicoMes1;
                        drSegundaVia["Histórico descricação mês2"] = item.historicoDescricaoMes2;
                        drSegundaVia["Histórico mês2"] = item.historicoMes2;
                        drSegundaVia["Histórico descricação mês3"] = item.historicoDescricaoMes3;
                        drSegundaVia["Histórico mês3"] = item.historicoMes3;
                        drSegundaVia["Histórico descricação mês4"] = item.historicoDescricaoMes4;
                        drSegundaVia["Histórico mês4"] = item.historicoMes4;
                        drSegundaVia["Histórico descricação mês5"] = item.historicoDescricaoMes5;
                        drSegundaVia["Histórico mês5"] = item.historicoMes5;
                        drSegundaVia["Histórico descricação mês6"] = item.historicoDescricaoMes6;
                        drSegundaVia["Histórico mês6"] = item.historicoMes6;

                        //item.consumoM3pagoCondominio = 2600;
                        // o Valor pago do condominio virá do banco também...
                        //item.ConsumoValorPagoCondominio = 7900;

                        //Isto ficará fixo - Será a diferença paga entre o valor pago do consumo minimo, e o consumo e excedente
                        item.excedenteValorPagoCondominio = Math.Abs(item.ConsumoValorPagoCondominio - item.minimoValorPagoCondominio);

                        drSegundaVia["Consumo M³"] = item.consumoM3pagoCondominio;
                        drSegundaVia["Consumo Valor"] = item.ConsumoValorPagoCondominio;
                        drSegundaVia["Mínimo M³"] = item.minimoM3PagoCondominio;
                        drSegundaVia["Mínimo Valor"] = item.minimoValorPagoCondominio;
                        drSegundaVia["Excedente Valor"] = item.excedenteValorPagoCondominio;
                        drSegundaVia["Tarifa Mínima M³"] = item.tarifaMinimaM3ValorDevido;


                        //Se o valor do consumo do M3 for maior que o minimo M3 do condominio será feito o rateio...
                        if (item.consumoM3pagoCondominio > item.minimoM3PagoCondominio)
                        {
                            item.excedenteM3PagoCondominio = item.consumoM3pagoCondominio - item.minimoM3PagoCondominio;
                            item.excedenteValorRateio = (item.excedenteValorPagoCondominio / item.excedenteM3Rateio);
                            item.valorPagarValorDevido = item.excedenteValorDevido * Math.Round(item.excedenteValorRateio, 2);

                            drSegundaVia["ExcedentePagoPeloCondominio"] = item.excedenteM3PagoCondominio;
                            drSegundaVia["ExcedenteValorRateio "] = item.excedenteValorRateio;
                            drSegundaVia["a pagar"] = item.valorPagarValorDevido;
                        }
                        //Se não mantêm o valor sem rateio..
                        else
                        {
                            drSegundaVia["ExcedentePagoPeloCondominio"] = item.excedenteM3PagoCondominio;
                            drSegundaVia["ExcedenteValorRateio "] = item.excedenteValorRateio;
                            drSegundaVia["a pagar"] = item.valorPagarValorDevido;
                        }
                        drSegundaVia["Tarifa Mínima Valor"] = item.tarifaMinimaValorValorDevido;
                        drSegundaVia["ExcedenteM3Rateio"] = item.excedenteM3Rateio;
                        drSegundaVia["Geral"] = item.avisoGeralAviso;
                        drSegundaVia["Anormal"] = item.AnormalAviso;
                        drSegundaVia["Invididual"] = item.individualAviso;
                        drSegundaVia["ANORMALIDADE"] = item.anormalidadeAviso;
                        drSegundaVia["Imagem"] = item.imagem;
                        drSegundaVia["ExcedenteValorDevido"] = item.excedenteValorDevido;
                        drSegundaVia["excedenteM3Diario"] = item.excedenteM3diaria; 
                        


                  

                     

                    }

                    dsSegundaVia.Tables[1].Rows.Add(drSegundaVia);

                    Crystal.Relatorios.ReciboMoradorByApBloco rbSegundaVia = new Crystal.Relatorios.ReciboMoradorByApBloco();

                    rbSegundaVia.SetDataSource(dsSegundaVia);

                    //CrystalReportViewer1.ReportSource = rbSegundaVia;

                    //rbSegundaVia.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "Recibo");

                    //ReportDocument rpt = new ReportDocument();
                    //CrystalDecisions.Shared.ConnectionInfo connectionCrystal = new CrystalDecisions.Shared.ConnectionInfo();
                    //connectionCrystal.ServerName = ConfigurationManager.AppSettings["azuliServerName"];
                    //connectionCrystal.DatabaseName = ConfigurationManager.AppSettings["azuliDatabase"];
                    //connectionCrystal.UserID = ConfigurationManager.AppSettings["userIdSomee"];
                    //connectionCrystal.Password = ConfigurationManager.AppSettings["pwdSomee"];
                    //connectionCrystal.Type = ConnectionInfoType.SQL;
                    //connectionCrystal.IntegratedSecurity = false;
                    // string caminhoRelatorio = ConfigurationManager.AppSettings["ReportsPath"] + "ReciboMoradorByApBloco.rpt"; // Local 
                    ////string caminhoRelatorio = Server.MapPath(ConfigurationManager.AppSettings["ReportsPath"] + "ReciboMoradorByApBloco.rpt"); //web


                    ////string caminhoRelatorio = ConfigurationManager.AppSettings["ReportsPath"] + "ReciboMoradorByApBloco.rpt"; // Local 
                    //// string caminhoRelatorio = Server.MapPath(ConfigurationManager.AppSettings["ReportsPath"] + "ReciboMoradorByApBloco.rpt"); //web   
                    ////Session["reportSource"] = caminhoRelatorio;

                    //string apartamento = Session["AP"].ToString();
                    //string bloco = Session["Bloco"].ToString();
                    //string mes = Session["mes"].ToString();
                    //string ano = Session["ano"].ToString();

                    //rpt.Load(caminhoRelatorio);
                    //rpt.SetParameterValue("bloco", bloco);
                    //rpt.SetParameterValue("apto", apartamento);
                    //rpt.SetParameterValue("mes", mes);
                    //rpt.SetParameterValue("ano", ano);
                    //SetDBLogonForReport(connectionCrystal, rpt);

                    //CrystalReportViewer1.ToolPanelView = CrystalDecisions.Web.ToolPanelViewType.None;
                    //CrystalReportViewer1.HasToggleGroupTreeButton = false;
                    //CrystalReportViewer1.HasToggleParameterPanelButton = false;
                    //rpt.SetDatabaseLogon(connectionCrystal.UserID, connectionCrystal.Password, connectionCrystal.ServerName, connectionCrystal.DatabaseName);
                    //CrystalReportViewer1.ReportSourceID = ConfigurationManager.AppSettings["reciboMorador"];


                    rbSegundaVia.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "Recibo");
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