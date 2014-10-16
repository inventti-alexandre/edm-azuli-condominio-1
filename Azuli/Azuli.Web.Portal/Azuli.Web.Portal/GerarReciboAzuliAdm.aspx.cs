using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Globalization;
using Azuli.Web.Model;
using Azuli.Web.Business;
using System.Text.RegularExpressions;

namespace Azuli.Web.Portal
{
    public partial class GerarReciboAzuliAdm : System.Web.UI.Page
    {

        DateTime data = DateTime.Now;
        Util.Util oUtil = new Util.Util();
        ReciboAguaBLL oReciboBLL = new ReciboAguaBLL();
       
        protected void Page_Load(object sender, EventArgs e)
        {

            if (oUtil.validateSessionAdmin())
            {
                if (!IsPostBack)
                {

                    // dvPesquisaByData.Visible = false;
                    this.lbtMonth1.Text = string.Format("{0:MMM}", CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(1).ToUpper());
                    this.lbtMonth2.Text = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(2).ToUpper();
                    this.lbtMonth3.Text = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(3).ToUpper();
                    this.lbtMonth4.Text = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(4).ToUpper();
                    this.lbtMonth5.Text = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(5).ToUpper();
                    this.lbtMonth6.Text = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(6).ToUpper();
                    this.lbtMonth7.Text = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(7).ToUpper();
                    this.lbtMonth8.Text = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(8).ToUpper();
                    this.lbtMonth9.Text = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(9).ToUpper();
                    this.lbtMonth10.Text = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(10).ToUpper();
                    this.lbtMonth11.Text = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(11).ToUpper();
                    this.lbtMonth12.Text = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(12).ToUpper();
                    //
                    this.lbtMonth1.Enabled = false;
                    this.lbtMonth2.Enabled = false;
                    this.lbtMonth3.Enabled = false;
                    this.lbtMonth4.Enabled = false;
                    this.lbtMonth5.Enabled = false;
                    this.lbtMonth6.Enabled = false;
                    this.lbtMonth7.Enabled = false;
                    this.lbtMonth8.Enabled = false;
                    this.lbtMonth9.Enabled = false;
                    this.lbtMonth10.Enabled = false;
                    this.lbtMonth11.Enabled = false;
                    this.lbtMonth12.Enabled = false;

                 
                 
                    preencheAno();
                    drpAno.SelectedItem.Text = data.Year.ToString();
                    showAvailableUnvailableReport();

                  
                }
            }

        }


       

        public void preencheAno()
        {

            for (int ano = data.Year -1 ; ano <= data.Year; ano++)
            {
                drpAno.Items.Add(ano.ToString());

            }
            drpAno.SelectedValue = data.Year.ToString();
        }



        /// <summary>
        /// Abre uma janela no estilo Modal Dialog
        /// </summary>
        /// <param name="NamePage">Nome da pagina que sera aberta</param>
        /// <param name="Height">Altura</param>
        /// <param name="Width">Largura</param>
        public static void OpenPopUp(string NamePage, int Height, int Width, bool ScrollBars, bool Resizable)
        {


            StringBuilder url = new StringBuilder();

            url.Append("window.open('" + NamePage + "','janela1','");
            url.Append("width =");
            url.Append(Width);
            url.Append(", height=");
            url.Append(Height);
            url.Append(", scrollbars=");
            url.Append(ScrollBars ? "yes" : "no");
            url.Append(", resizable=");
            url.Append(Resizable ? "yes" : "no");
            url.Append("');");

            JsStartUpScript(url.ToString());
        }

        /// <summary>
        /// Executa um script
        /// </summary>
        /// <param name="Script">Script que sera executado</param>
        public static void JsStartUpScript(string Script)
        {
            Page paginaAtual;
            paginaAtual = GetCurrentPage();
            paginaAtual.ClientScript.RegisterClientScriptBlock(paginaAtual.GetType(), Guid.NewGuid().ToString(), Script, true);
        }

        /// <summary>
        /// Retorna Pagina Corrente
        /// </summary>
        /// <returns></returns>
        private static Page GetCurrentPage()
        {
            return (Page)System.Web.HttpContext.Current.Handler;
        }

        

        public void openedPoupReport()
        {
            if (Convert.ToBoolean(Session["Excel"]))
            {
                Session["chooseReport"] = true;
                Response.Redirect("~/ReportViewer.aspx");
               
            }
            else
            {
                Session["Excel"] = false;
                Session["chooseReport"] = true;
                Session["ReciboAgua"] = false;
                OpenPopUp(Page.ResolveUrl("~/ReportViewer.aspx"), 700, 920, true, true);
            }

        }



        protected void lbtMonth_Click(object sender, EventArgs e)
        {
            Session["Excel"] = false;
            
            Session["mes"] = 1;
            Session["ano"] = drpAno.SelectedValue;
            openedPoupReport();



        }

        protected void lbtMonth2_Click(object sender, EventArgs e)
        {
            Session["Excel"] = false;
            Session["mes"] = 2;
            Session["ano"] = drpAno.SelectedValue;
            openedPoupReport();
        }

        protected void lbtMonth3_Click(object sender, EventArgs e)
        {



            Session["Excel"] = false;
            Session["mes"] = 3;
            Session["ano"] = drpAno.SelectedValue;
            openedPoupReport();

        }

        protected void lbtMonth4_Click(object sender, EventArgs e)
        {
            Session["Excel"] = false;
           
            Session["mes"] = 4;
            Session["ano"] = drpAno.SelectedValue;
            openedPoupReport();

        }
        protected void lbtMonth5_Click(object sender, EventArgs e)
        {
            Session["Excel"] = false;
            Session["Excel"] = false;
            Session["mes"] = 5;
            Session["ano"] = drpAno.SelectedValue;
            openedPoupReport();

        }
        protected void lbtMonth6_Click(object sender, EventArgs e)
        {
            Session["Excel"] = false;
            
            Session["mes"] = 6;
            Session["ano"] = drpAno.SelectedValue;
            openedPoupReport();

        }

        protected void lbtMonth7_Click(object sender, EventArgs e)
        {

            Session["Excel"] = false;
            Session["mes"] = 7;
            Session["ano"] = drpAno.SelectedValue;
            openedPoupReport();
        }



        protected void lbtMonth_Click10(object sender, EventArgs e)
        {

            Session["Excel"] = false;
            Session["mes"] = 10;
            Session["ano"] = drpAno.SelectedValue;

            openedPoupReport();

        }

        protected void lbtMonth_Click11(object sender, EventArgs e)
        {
            Session["Excel"] = false;
            Session["mes"] = 11;
            Session["ano"] = drpAno.SelectedValue;
            openedPoupReport();

        }

        protected void lbtMonth_Click12(object sender, EventArgs e)
        {
            Session["Excel"] = false;
            Session["mes"] = 12;
            Session["ano"] = drpAno.SelectedValue;
            openedPoupReport();

        }

        protected void lbtMonth_Click8(object sender, EventArgs e)
        {
            Session["Excel"] = false;
            Session["mes"] = 8;
            Session["ano"] = drpAno.SelectedValue;
            openedPoupReport();

        }

        protected void lbtMonth_Click9(object sender, EventArgs e)
        {
            Session["Excel"] = false;
            Session["mes"] = 9;
            Session["ano"] = drpAno.SelectedValue;
            openedPoupReport();

        }

        /// <summary>
        /// Check which month and year the report is available 
        /// </summary>
        protected void showAvailableUnvailableReport()
        {
            statusInicialDonwload();

            ContaAgua oContaModel = new ContaAgua();
            ContaAguaBLL oContaBLL = new ContaAguaBLL();
            ApartamentoModel oAp = new ApartamentoModel();
            oContaModel.ano = Convert.ToInt32(drpAno.SelectedValue);
            // I'm using default values to report available, only Bloco and Apto
            // Default values = 301 / 06 
            oAp.apartamento = 301;
            oAp.bloco = 06;
            oContaModel.modelAp = oAp;

            List<int> pegaMeses = new List<int>();


            try
            {
                pegaMeses = oContaBLL.validaContaMesAnoMorador(oContaModel); ;



                foreach (var item in pegaMeses)
                {
                    if (item == 1)
                    {

                        this.lbtMonth1.Enabled = true;
                        img1.ImageUrl = "~/images/verde.png";

                    }
                    else if (item == 2)
                    {
                        this.lbtMonth2.Enabled = true;
                        img2.ImageUrl = "~/images/verde.png";
                    }
                    else if (item == 3)
                    {
                        this.lbtMonth3.Enabled = true;
                        img3.ImageUrl = "~/images/verde.png";
                    }
                    else if (item == 4)
                    {
                        this.lbtMonth4.Enabled = true;
                        img4.ImageUrl = "~/images/verde.png";
                    }
                    else if (item == 5)
                    {
                        this.lbtMonth5.Enabled = true;
                        img5.ImageUrl = "~/images/verde.png";
                    }
                    else if (item == 6)
                    {
                        this.lbtMonth6.Enabled = true;
                        img6.ImageUrl = "~/images/verde.png";
                    }
                    else if (item == 7)
                    {
                        this.lbtMonth7.Enabled = true;
                        img7.ImageUrl = "~/images/verde.png";
                    }
                    else if (item == 8)
                    {
                        this.lbtMonth8.Enabled = true;
                        img8.ImageUrl = "~/images/verde.png";
                    }
                    else if (item == 9)
                    {
                        this.lbtMonth9.Enabled = true;
                        img9.ImageUrl = "~/images/verde.png";
                    }
                    else if (item == 10)
                    {
                        this.lbtMonth10.Enabled = true;
                        img10.ImageUrl = "~/images/verde.png";
                    }
                    else if (item == 11)
                    {
                        this.lbtMonth11.Enabled = true;
                        img11.ImageUrl = "~/images/verde.png";
                    }
                    else if (item == 12)
                    {
                        this.lbtMonth12.Enabled = true;
                        img12.ImageUrl = "~/images/verde.png";
                    }

                    //dvPublicacao.Visible = true;
                    //btnOk.Visible = false;
                    //lblMsg.Visible = false;
                }
            }

            catch (Exception)
            {

                throw;
            }
        }

        public void statusInicialDonwload()
        {

            this.lbtMonth1.Enabled = false;
            img1.ImageUrl = "~/images/vermelhoStatus.png";


            this.lbtMonth2.Enabled = false;
            img2.ImageUrl = "~/images/vermelhoStatus.png";


            this.lbtMonth3.Enabled = false;
            img3.ImageUrl = "~/images/vermelhoStatus.png";


            this.lbtMonth4.Enabled = false;
            img4.ImageUrl = "~/images/vermelhoStatus.png";


            this.lbtMonth5.Enabled = false;
            img5.ImageUrl = "~/images/vermelhoStatus.png";

            this.lbtMonth6.Enabled = false;
            img6.ImageUrl = "~/images/vermelhoStatus.png";

            this.lbtMonth7.Enabled = false;
            img7.ImageUrl = "~/images/vermelhoStatus.png";

            this.lbtMonth8.Enabled = false;
            img8.ImageUrl = "~/images/vermelhoStatus.png";


            this.lbtMonth9.Enabled = false;
            img9.ImageUrl = "~/images/vermelhoStatus.png";

            this.lbtMonth10.Enabled = false;
            img10.ImageUrl = "~/images/vermelhoStatus.png";
            this.lbtMonth11.Enabled = false;
            img11.ImageUrl = "~/images/vermelhoStatus.png";
            this.lbtMonth12.Enabled = false;
            img12.ImageUrl = "~/images/vermelhoStatus.png";
        }

        protected void drpAno_TextChanged(object sender, EventArgs e)
        {
            showAvailableUnvailableReport();
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
        
            detalheConsumo(1, Convert.ToInt32(drpAno.SelectedValue));

        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            Session["mes"] = 2;
            Session["ano"] = drpAno.SelectedValue;
            Session["Excel"] = true;
            openedPoupReport();
        }

        protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
        {
            Session["mes"] = 3;
            Session["ano"] = drpAno.SelectedValue;
            Session["Excel"] = true;
            openedPoupReport();
        }

        protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
        {
            Session["mes"] = 4;
            Session["ano"] = drpAno.SelectedValue;
            Session["Excel"] = true;
            openedPoupReport();

        }

        protected void ImageButton5_Click(object sender, ImageClickEventArgs e)
        {
            Session["mes"] = 5;
            Session["ano"] = drpAno.SelectedValue;
            Session["Excel"] = true;
            openedPoupReport();
        }

        protected void ImageButton6_Click(object sender, ImageClickEventArgs e)
        {
            detalheConsumo(6, Convert.ToInt32(drpAno.SelectedValue));
        }

        protected void ImageButton7_Click(object sender, ImageClickEventArgs e)
        {
            Session["mes"] = 7;
            Session["ano"] = drpAno.SelectedValue;
            Session["Excel"] = true;
            openedPoupReport();

        }

        protected void ImageButton8_Click(object sender, ImageClickEventArgs e)
        {
            Session["mes"] = 8;
            Session["ano"] = drpAno.SelectedValue;
            Session["Excel"] = true;
            openedPoupReport();

        }

        protected void ImageButton9_Click(object sender, ImageClickEventArgs e)
        {
            Session["mes"] = 9;
            Session["ano"] = drpAno.SelectedValue;
            Session["Excel"] = true;
            openedPoupReport();

        }

        protected void ImageButton10_Click(object sender, ImageClickEventArgs e)
        {
            Session["mes"] = 10;
            Session["ano"] = drpAno.SelectedValue;
            Session["Excel"] = true;
            openedPoupReport();

        }

        protected void ImageButton11_Click(object sender, ImageClickEventArgs e)
        {
            Session["mes"] = 11;
            Session["ano"] = drpAno.SelectedValue;
            Session["Excel"] = true;
            openedPoupReport();

        }

        protected void ImageButton12_Click(object sender, ImageClickEventArgs e)
        {
            Session["mes"] = 12;
            Session["ano"] = drpAno.SelectedValue;
            Session["Excel"] = true;
            openedPoupReport();

        }

        public void detalheConsumo(int mes, int ano)
        {
            listaSegundaViaAgua listExcel = oReciboBLL.buscaTodosRecibosByYearAndMonth(ano, mes);
             listaSegundaViaAgua listExcelTratada = new listaSegundaViaAgua();
           

            foreach (var item in listExcel)
            {
                ReciboAgua oReciboModel = new ReciboAgua();
                oReciboModel.registro = "R"+item.registro;
                oReciboModel.apartamento = "B" + item.bloco + "-AP" + item.apartamento;
                oReciboModel.historicoMes1 = " " + returnNumber(item.historicoMes1) + "-" + returnNumber(item.historicoMes2) + "-" + returnNumber(item.historicoMes3) + "-" + returnNumber(item.historicoMes4) + "-" + returnNumber(item.historicoMes5) + "-" + returnNumber(item.historicoMes6) + " - (" + item.media + ")";
                oReciboModel.leituraAnteriorM3 = item.leituraAnteriorM3;
                oReciboModel.leituraAtualM3 = item.leituraAtualM3;
                oReciboModel.consumoMesM3 =   Math.Round(item.excedenteM3diaria * 30, 0).ToString();
                oReciboModel.excedenteValorDevido = item.excedenteValorDevido;
                oReciboModel.valorPagarValorDevido =  item.valorPagarValorDevido;



                item.historicoMes1 = returnNumber(item.historicoMes1).ToString();

                if (item.status == "")
                {
                    oReciboModel.status = "-";
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

            grdDetalheConsumo.DataSource = listExcelTratada;
            grdDetalheConsumo.DataBind();
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

        protected void grdDetalheConsumo_RowDataBound(object sender, GridViewRowEventArgs e)
        {


            
            // quando montar as linhas do tipo DADOS
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "excedenteValorDevido")) > 10)
                {
                    e.Row.Cells[6].BackColor = System.Drawing.Color.Red;
                    
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
            }
        }


    }

   

}