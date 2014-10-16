using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Azuli.Web.Model;
using Azuli.Web.Business;
using System.Text;
using System.Text.RegularExpressions;

namespace Azuli.Web.Portal
{
    public partial class reportRelatorioGeral : System.Web.UI.Page
    {

        ReciboAguaBLL oReciboBLL = new ReciboAguaBLL();
        Util.Util oUtil = new Util.Util();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Convert.ToBoolean(Session["RelGerencial"]) == true)
            {
                if (oUtil.validateSessionAdmin())
                {
                    string mes = Session["mes"].ToString();
                    string ano = Session["ano"].ToString();
                    detalheConsumo(Convert.ToInt32(ano), Convert.ToInt32(mes));
                }
            }
            
        }

        public void detalheConsumo(int mes, int ano)
        {

            string leituraAt ="";
            string leituraAnt ="";
            var listExcel = from lisExcelBl1 in oReciboBLL.buscaTodosRecibosByYearAndMonth(mes,ano)
                            orderby lisExcelBl1.registro ascending
                            select lisExcelBl1;



            listaSegundaViaAgua listExcelTratada = new listaSegundaViaAgua();
            listaSegundaViaAgua listExcelTratada1 = new listaSegundaViaAgua();

            foreach (var item in listExcel)
            {
             
                
                if (leituraAnt == "" && leituraAt == "")
                {
                   
                    leituraAnt = item.dataLeituraAnterior;
                    leituraAt = item.dataLeituraAtual;
                    
                }
                
                
            }

            
                    

            foreach (var item in listExcel)
            {
                ReciboAgua oReciboModel = new ReciboAgua();

                if (item.bloco == "1")
                {

                    oReciboModel.registro = "R" + item.registro;
                    oReciboModel.apartamento = "B" + item.bloco + "-AP" + item.apartamento;
                    oReciboModel.historicoMes1 = " " + returnNumber(item.historicoMes6) + "-" + returnNumber(item.historicoMes5) + "-" + returnNumber(item.historicoMes4) + "-" + returnNumber(item.historicoMes3) + "-" + returnNumber(item.historicoMes2) + "-" + returnNumber(item.historicoMes1) + " - (" + item.media + ")";
                    oReciboModel.leituraAnteriorM3 = item.leituraAnteriorM3;
                    oReciboModel.leituraAtualM3 = item.leituraAtualM3;
                    oReciboModel.consumoMesM3 = Math.Round(item.excedenteM3diaria * 30, 0).ToString();
                    oReciboModel.excedenteValorDevido = item.excedenteValorDevido;
                    oReciboModel.valorPagarValorDevido = item.valorPagarValorDevido;



                    item.historicoMes1 = returnNumber(item.historicoMes1).ToString();

                    if (item.status == "" || item.historicoMes1 == "")
                    {
                        oReciboModel.status = "-";
                        item.historicoMes1 = "0";
                    }
                    else
                    {

                        if (Math.Round(item.excedenteM3diaria * 30, 0) < Convert.ToInt32(item.historicoMes1))
                        {
                            oReciboModel.status = "↓ " + item.status;

                        }
                        else
                        {
                            oReciboModel.status = "↑ " + item.status;

                        }
                    }

                    listExcelTratada.Add(oReciboModel);
                }





            }

            grdDetalheConsumo.DataSource = listExcelTratada;
            grdDetalheConsumo.DataBind();

            grdDetalheConsumo.FooterRow.Cells[0].ColumnSpan = 9;
            grdDetalheConsumo.FooterRow.Cells[0].HorizontalAlign = HorizontalAlign.Center;
            grdDetalheConsumo.FooterRow.Cells[0].Font.Size = 28;
            grdDetalheConsumo.FooterRow.Cells.RemoveAt(8);
            grdDetalheConsumo.FooterRow.Cells.RemoveAt(7);
            grdDetalheConsumo.FooterRow.Cells.RemoveAt(6);
            grdDetalheConsumo.FooterRow.Cells.RemoveAt(5);
            grdDetalheConsumo.FooterRow.Cells.RemoveAt(4);
            grdDetalheConsumo.FooterRow.Cells.RemoveAt(3);
            grdDetalheConsumo.FooterRow.Cells.RemoveAt(2);
            grdDetalheConsumo.FooterRow.Cells.RemoveAt(1);
            grdDetalheConsumo.FooterRow.Cells[0].ForeColor = System.Drawing.Color.Black;

            grdDetalheConsumo.HeaderRow.Cells[6].Text = "Excedente <br> [m³]";
            grdDetalheConsumo.HeaderRow.Cells[2].Text = "Histórico de consumo 6 últimos <br> meses (média) <br> [m³]";
            grdDetalheConsumo.HeaderRow.Cells[3].Text = "Leitura <br> ant <br>" + leituraAnt.Replace("Leitura anterior (", "").Replace("):", "") + "<br>[m³]"; ;
            grdDetalheConsumo.HeaderRow.Cells[4].Text = "Leitura <br> atual <br> " + leituraAt.Replace("Leitura Atual (","").Replace("):","") + "<br>[m³]";
            grdDetalheConsumo.FooterRow.Cells[0].Text = "BLOCO 1";
        }

        public StringBuilder returnNumber(string historico)
        {
            Regex re = new Regex("[0-9]");
            StringBuilder s = new StringBuilder();

            foreach (Match m in re.Matches(historico))
            {
                s.Append(m.Value);
            }

            return s;
        }


        public int addZero(int valor)
        {
            string auxiliar = "";
            if (valor == 0 || valor == 1 || valor == 2 || valor == 3 || valor == 4 || valor == 5 || valor == 6 || valor == 7 || valor == 8 || valor == 9)
            {

                auxiliar = "0" + valor;
            }

            return Convert.ToInt32(auxiliar);

        }

        protected void grdDetalheConsumo_RowDataBound(object sender, GridViewRowEventArgs e)
        {



            // quando montar as linhas do tipo DADOS
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "consumoMesM3")) > 10)
                {
                    e.Row.Cells[5].ForeColor = System.Drawing.Color.FromName("#800000");

                }

                if (Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "consumoMesM3")) > 20)
                {
                    e.Row.Cells[5].ForeColor = System.Drawing.Color.Red;

                }
                if (DataBinder.Eval(e.Row.DataItem, "status").ToString() == "↓ Anormal")
                {

                    e.Row.Cells[8].BackColor = System.Drawing.Color.Blue;
                    e.Row.Cells[8].ForeColor = System.Drawing.Color.White;

                }

                if (DataBinder.Eval(e.Row.DataItem, "status").ToString() == "↑ Anormal")
                {

                    e.Row.Cells[8].BackColor = System.Drawing.Color.Red;
                    e.Row.Cells[8].ForeColor = System.Drawing.Color.Yellow;

                }

                grdDetalheConsumo.Columns[3].HeaderText = "TESTE";



            }
        }


    }
}