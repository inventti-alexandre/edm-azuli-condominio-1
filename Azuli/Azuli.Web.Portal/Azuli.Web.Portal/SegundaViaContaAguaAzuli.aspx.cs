using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Configuration;

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

                    string apartamento = Session["AP"].ToString() ;
                    string bloco = Session["Bloco"].ToString();
                    dvPesquisaByData.Visible = false;
                    preencheMeses();
                    preencheAno();
                    

                }
            }



        }
        public void preencheMeses()
        {
            string mesCorrente = "";
            drpMeses.DataSource = Enum.GetNames(typeof(Util.Util.meses));


            mesCorrente = System.Globalization.DateTimeFormatInfo.CurrentInfo.GetMonthName(data.Month);

            drpMeses.Items.Add(mesCorrente); //drpMeses.Items.IndexOf(drpMeses.Items.FindByValue(data.Month.ToString()));
            drpMeses.SelectedIndex = data.Month - 1;
            drpMeses.DataBind();
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

     



    }
}