using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Azuli.Web.Model;
using Azuli.Web.Business;
using System.Globalization;

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
                    
                    listaOcorrenciaMes();


                }
            }
        }


        public void listaOcorrenciaMes()
        {
            

            try
            {
                olancamentoModel.codigoOcorrencia = Convert.ToInt32(Session["codigoOcorrencia"]);

                foreach (var item in olancamentoBLL.buscaOcorrenciaById(olancamentoModel))
                {
                    lblAssunto.Text = item.descricaoOcorrencia;
                    lblDataAbertura.Text =  item.dataOcorrencia.ToString();
                    lblMensagem.Text = item.ocorrenciaLancamento; 
                    lblOcorrencia.Text = item.codigoOcorrencia.ToString();
                    lblMorador.Text = Session["Proprie1"].ToString();
                    
                }



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