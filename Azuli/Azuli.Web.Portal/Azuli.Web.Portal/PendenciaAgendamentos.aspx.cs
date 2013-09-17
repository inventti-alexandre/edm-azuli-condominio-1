using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Azuli.Web.Business;
using Azuli.Web.Model;

namespace Azuli.Web.Portal
{
    public partial class PendenciaAgendamentos : System.Web.UI.Page
    {
        AgendaBLL oAgenda = new AgendaBLL();
        AgendaModel oAgendaModel = new AgendaModel();
        ApartamentoModel oApModel = new ApartamentoModel();
        Util.Util oUtil = new Util.Util();
        ApartamentoModel oAP = new ApartamentoModel();
        protected void Page_Load(object sender, EventArgs e)
        {

            

            if (oUtil.validateSessionAdmin())
            {
                if (!IsPostBack)
                {
                    // lblAdmin.Text = Session["Proprie1"].ToString();

                    hiddenAll();
                    string apto = Request.QueryString["apto"];
                    string data = Request.QueryString["data"];
                    //string status = Request.QueryString["status"];
                    string bloco = Request.QueryString["bloco"];
                    DvConfirma.Visible = false;
                    carregaPendencia(data, apto,bloco);

                   

                }
            }


           
            

        }

        public void carregaPendencia(string dataPen, string apto, string bloco)
        {
            oApModel.apartamento = Convert.ToInt32(apto);
            oApModel.bloco = Convert.ToInt32(bloco);
            oAgendaModel.ap = oApModel;
            oAgendaModel.dataAgendamento = Convert.ToDateTime(dataPen);
            double valorChurras = 0.0;
            double valorFesta = 0.0;
            double desconto = 0.0;


            try
            {

                foreach (var item in  oAgenda.pendentePagamento(oAgendaModel))
                {
                    if (oAgenda.pendentePagamento(oAgendaModel).Count >= 2)
                    {
                        showAll();

                        if (item.salaoFesta == true)
                        {
                            lblBloco.Text = item.ap.bloco.ToString();
                            lblApto.Text = item.ap.apartamento.ToString();
                            lblDiasAtrasoFesta.Text = item.qtdDiasPagamentoChurras.ToString();
                            lblValorFesta.Text = "R$ " + item.valorReserva.ToString();
                            valorFesta = item.valorReserva;

                        }

                        if (item.salaoChurrasco == true)
                        {
                            lblBloco.Text = item.ap.bloco.ToString();
                            lblApto.Text = item.ap.apartamento.ToString();
                            lblDiasAtrasoChurras.Text = item.qtdDiasPagamentoChurras.ToString();
                            lblValorChurras.Text = "R$ " + item.valorReserva.ToString();
                            valorChurras = item.valorReserva;
                        }

                        desconto = 20.00;
                        lblDesconto.Text = "R$ 20,00";


                        lblTotal.Text = "R$ " + Convert.ToString((valorFesta + valorChurras) - desconto);

                    }


                    else
                    {
                        if (item.salaoFesta == true)
                        {
                            hiddenControllerChurras();
                            showControllerFesta();
                            lblBloco.Text = item.ap.bloco.ToString();
                            lblApto.Text = item.ap.apartamento.ToString();
                            lblDiasAtrasoFesta.Text = item.qtdDiasPagamentoChurras.ToString();
                            lblValorFesta.Text = "R$ " + item.valorReserva.ToString();

                            lblTotal.Text = "R$ " + item.valorReserva.ToString();
                            lblDesconto.Text = "R$ 00,00";

                        }

                        if (item.salaoChurrasco == true)
                        {
                            hiddenControllerFesta();
                            showControllerChurras();
                            lblBloco.Text = item.ap.bloco.ToString();
                            lblApto.Text = item.ap.apartamento.ToString();
                            lblDiasAtrasoChurras.Text = item.qtdDiasPagamentoChurras.ToString();
                            lblValorChurras.Text = "R$ " +  item.valorReserva.ToString();

                            lblTotal.Text = "R$ " + item.valorReserva.ToString();
                            lblDesconto.Text = "R$ 00,00";
                        }
                    }
                    
                }
               

            }
            catch (Exception)
            {
                
                throw;
            }
          




        }

        public void hiddenControllerChurras()
        {
           
            lblChurras.Visible = false;
            btnConfirmaChurras.Visible = false;
            btnCancelaChurras.Visible = false;
            lblDiasAtrasoChurras.Visible = false;
            lblValorChurras.Visible = false;


        }

        public void showControllerChurras()
        {

            lblChurras.Visible = true;
            btnConfirmaChurras.Visible = true;
            btnCancelaChurras.Visible = true;
            lblDiasAtrasoChurras.Visible = true;
            lblValorChurras.Visible = true;


        }


        public void hiddenControllerFesta()
        {

            lblSalaoFesta.Visible = false;
            btnConfirmaFesta.Visible = false;
            btnCancelaFestas.Visible = false;
            lblDiasAtrasoFesta.Visible = false;
            lblValorFesta.Visible = false;


        }

        public void showControllerFesta()
        {

            lblSalaoFesta.Visible = true;
            btnConfirmaFesta.Visible = true;
            btnCancelaFestas.Visible = true;
            lblDiasAtrasoFesta.Visible = true;
            lblValorFesta.Visible = true;


        }


        public void showAll()
        {
            lblChurras.Visible = true;
            btnConfirmaChurras.Visible = true;
            btnCancelaChurras.Visible = true;
            lblDiasAtrasoChurras.Visible = true;
            lblValorChurras.Visible = true;
            lblSalaoFesta.Visible = true;
            btnConfirmaFesta.Visible = true;
            btnCancelaFestas.Visible = true;
            lblDiasAtrasoFesta.Visible = true;
            lblValorFesta.Visible = true;


        }

        public void hiddenAll()
        {
            lblChurras.Visible = false;
            btnConfirmaChurras.Visible = false;
            btnCancelaChurras.Visible = false;
            lblDiasAtrasoChurras.Visible = false;
            lblValorChurras.Visible = false;
            lblSalaoFesta.Visible = false;
            btnConfirmaFesta.Visible = false;
            btnCancelaFestas.Visible = false;
            lblDiasAtrasoFesta.Visible = false;
            lblValorFesta.Visible = false;


        }

      
      
    }

    


}