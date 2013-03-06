using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Azuli.Web.Model;
using Azuli.Web.Business;

namespace Azuli.Web.Portal
{
    public partial class listaOcorrenciaMorador : Util.Base
    {
        Util.Util oUtil = new Util.Util();
        DateTime data = DateTime.Now;
        LancamentoOcorrenciaModel olancamentoModel = new LancamentoOcorrenciaModel();
        LancamentoOcorrencia olancamentoBLL = new LancamentoOcorrencia();
        ApartamentoModel oAp = new ApartamentoModel();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (oUtil.validateSession())
            {
                if (!IsPostBack)
                {
                    preencheMeses();
                    drpMeses.SelectedIndex = data.Month - 1;
                    Session["mes"] = drpMeses.SelectedIndex = data.Month - 1;
                    listaOcorrenciaMes();


                }
            }
        }




        public void preencheMeses()
        {
            string mesCorrente = "";
            drpMeses.DataSource = Enum.GetNames(typeof(Util.Util.meses));
            DateTime data = DateTime.Now;

            mesCorrente = System.Globalization.DateTimeFormatInfo.CurrentInfo.GetMonthName(data.Month);

            drpMeses.Items.Add(mesCorrente); //drpMeses.Items.IndexOf(drpMeses.Items.FindByValue(data.Month.ToString()));
            drpMeses.DataBind();
        }

        public void listaOcorrenciaMes()
        {
            Util.Util.meses mesesAno;
            
            Enum.TryParse<Util.Util.meses>(drpMeses.SelectedItem.Value, out mesesAno);
            int mes = (int)mesesAno;
            oAp.apartamento =  Convert.ToInt32(Session["AP"]);
            oAp.bloco      = Convert.ToInt32(Session["Bloco"]);
            olancamentoModel.oAp = oAp;

            try
            {


                //PagedDataSource pg = new PagedDataSource();
                //pg.AllowPaging = true;

                //pg.PageSize = 12;

                //int atual = 0;
                //if (Request.QueryString["page"] != null)
                //{
                //    atual = Convert.ToInt32(Request.QueryString["page"]);
                //}
                //else
                //{
                //    atual = 1;
                //    pg.CurrentPageIndex = atual - 1;

                //}

                //if (!pg.IsFirstPage)
                //{
                //    hpAnterior.NavigateUrl = Request.CurrentExecutionFilePath + "?page=" + Convert.ToString(atual - 1);
                     
                //}
                //if (!pg.IsLastPage)
                //{
                //    hpProximo.NavigateUrl = Request.CurrentExecutionFilePath + "?page=" + Convert.ToString(atual + 1);
                    
                //}

                //if (atual == 1)
                //{
                //    hpAnterior.Visible = false;
                //}



                //if (pg.PageCount == atual)
                //{

                //    hpProximo.Visible = false;
                //}



                DataList1.DataSource = olancamentoBLL.buscaOcorrenciaByMeses(olancamentoModel, mes);
                DataList1.DataBind();
            }
            catch (Exception ex)
            {
                ex.ToString();
            }

        }

        protected void drpMeses_SelectedIndexChanged(object sender, EventArgs e)
        {
            listaOcorrenciaMes();
        }
    }
}