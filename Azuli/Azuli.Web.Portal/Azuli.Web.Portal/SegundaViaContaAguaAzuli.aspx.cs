using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Configuration;
using System.Globalization;

namespace Azuli.Web.Portal
{
    public partial class SegundaViaContaAguaAzuli : System.Web.UI.Page
    {
        DateTime data = DateTime.Now;
        Util.Util oUtil = new Util.Util();


        protected void Page_Load(object sender, EventArgs e)
        {


            if (oUtil.validateSession())
            {
                if (!IsPostBack)
                {

                    string apartamento = Session["AP"].ToString();
                    string bloco = Session["Bloco"].ToString();
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

                    preencheAno();
                    drpAno.SelectedItem.Text = data.Year.ToString();

                    preencheAno();


                }
            }



        }
        public void preencheMeses()
        {
            string mesCorrente = "";
            // drpMeses.DataSource = Enum.GetNames(typeof(Util.Util.meses));


            mesCorrente = System.Globalization.DateTimeFormatInfo.CurrentInfo.GetMonthName(data.Month);

            // drpMeses.Items.Add(mesCorrente); //drpMeses.Items.IndexOf(drpMeses.Items.FindByValue(data.Month.ToString()));
            //drpMeses.SelectedIndex = data.Month - 1;
            //drpMeses.DataBind();
        }

        public void preencheAno()
        {

            for (int ano = data.Year - 4; ano < 2015; ano++)
            {
                drpAno.Items.Add(ano.ToString());

            }
            drpAno.SelectedValue = data.Year.ToString();
        }

        protected void btnBlocoAp_Click(object sender, EventArgs e)
        {


        }

        public void openedPoupReport()
        {

            OpenPopUp(Page.ResolveUrl("~/ReportViewer.aspx"), 700, 920, true, true);
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


        /// <summary>
        /// Calculates the percentage of all months of the year base.
        /// </summary>
        protected void showAvailableUnvailableReport()
        {


            // oFile.ano =  Convert.ToInt32(drpAno.SelectedItem.Text);

            Dictionary<int, int> qtdPublicacao = new Dictionary<int, int>();


            try
            {
                // qtdPublicacao = oFileBLL.contaArquivoByMeses(oFile);

                if (qtdPublicacao.Count > 0)
                {


                    //btnOk.Visible = true;


                    foreach (var item in qtdPublicacao)
                    {
                        //if (item.Key == 1)
                        //{

                        //    lblPercentage1.Text = item.Value.ToString();

                        //}
                        //else if (item.Key == 2)
                        //{
                        //    lblPercentage2.Text = item.Value.ToString();
                        //}
                        //else if (item.Key == 3)
                        //{
                        //    lblPercentage3.Text = item.Value.ToString();
                        //}
                        //else if (item.Key == 4)
                        //{
                        //    lblPercentage4.Text = item.Value.ToString();
                        //}
                        //else if (item.Key == 5)
                        //{
                        //    lblPercentage5.Text = item.Value.ToString();
                        //}
                        //else if (item.Key == 6)
                        //{
                        //    lblPercentage6.Text = item.Value.ToString();
                        //}
                        //else if (item.Key == 7)
                        //{
                        //    lblPercentage7.Text = item.Value.ToString();
                        //}
                        //else if (item.Key == 8)
                        //{
                        //    lblPercentage8.Text = item.Value.ToString();
                        //}
                        //else if (item.Key == 9)
                        //{
                        //    lblPercentage9.Text = item.Value.ToString();
                        //}
                        //else if (item.Key == 10)
                        //{
                        //    lblPercentage10.Text = item.Value.ToString();
                        //}
                        //else if (item.Key == 11)
                        //{
                        //    lblPercentage11.Text = item.Value.ToString();
                        //}
                        //else if (item.Key == 12)
                        //{
                        //    lblPercentage12.Text = item.Value.ToString();
                        //}

                        //dvPublicacao.Visible = true;
                        //btnOk.Visible = false;
                        //lblMsg.Visible = false;
                    }
                }

                else
                {
                    // btnOk.Visible = false;
                 //   dvPublicacao.Visible = false;
                    // dvArquivosPublicados.Visible = false;
                 //   lblMsg.Text = "Não existem arquivos publicados para este ano " + drpAno.SelectedItem.Text;
                  //  lblMsg.Visible = true;

                }




            }
            catch (Exception)
            {

                throw;
            }
        }


        protected void lbtMonth_Click(object sender, EventArgs e)
        {

            Session["mes"] = 1;
            Session["ano"] = drpAno.SelectedValue;
            openedPoupReport();



        }

        protected void lbtMonth2_Click(object sender, EventArgs e)
        {
            Session["mes"] = 2;
            Session["ano"] = drpAno.SelectedValue;
            openedPoupReport();
        }

        protected void lbtMonth3_Click(object sender, EventArgs e)
        {
            Session["mes"] = 3;
            Session["ano"] = drpAno.SelectedValue;
            openedPoupReport();

        }

        protected void lbtMonth4_Click(object sender, EventArgs e)
        {
            Session["mes"] = 4;
            Session["ano"] = drpAno.SelectedValue;
            openedPoupReport();

        }
        protected void lbtMonth5_Click(object sender, EventArgs e)
        {
            Session["mes"] = 5;
            Session["ano"] = drpAno.SelectedValue;
            openedPoupReport();

        }
        protected void lbtMonth6_Click(object sender, EventArgs e)
        {
            Session["mes"] = 6;
            Session["ano"] = drpAno.SelectedValue;
            openedPoupReport();

        }

        protected void lbtMonth7_Click(object sender, EventArgs e)
        {
            Session["mes"] = 7;
            Session["ano"] = drpAno.SelectedValue;
            openedPoupReport();
        }



        protected void lbtMonth_Click10(object sender, EventArgs e)
        {
            Session["mes"] = 8;
            Session["ano"] = drpAno.SelectedValue;
            openedPoupReport();

        }

        protected void lbtMonth_Click11(object sender, EventArgs e)
        {
            Session["mes"] = 9;
            Session["ano"] = drpAno.SelectedValue;
            openedPoupReport();

        }

        protected void lbtMonth_Click12(object sender, EventArgs e)
        {
            Session["mes"] = 10;
            Session["ano"] = drpAno.SelectedValue;
            openedPoupReport();

        }

        protected void lbtMonth_Click8(object sender, EventArgs e)
        {
            Session["mes"] = 11;
            Session["ano"] = drpAno.SelectedValue;
            openedPoupReport();

        }

        protected void lbtMonth_Click9(object sender, EventArgs e)
        {
            Session["mes"] = 12;
            Session["ano"] = drpAno.SelectedValue;
            openedPoupReport();

        }








    }
}