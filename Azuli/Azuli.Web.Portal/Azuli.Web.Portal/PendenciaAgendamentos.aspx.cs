using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Azuli.Web.Business;
using Azuli.Web.Model;
using System.Globalization;

namespace Azuli.Web.Portal
{
    public partial class PendenciaAgendamentos : System.Web.UI.Page
    {
        string dataReservaOnline = "";
        string apto = "";
        string bloco = "";
        int actionStatus = 0;


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
                     Session["aptoSession"] = Request.QueryString["apto"];
                     Session["dataReservaOnline"] = Request.QueryString["data"];
                    //string status = Request.QueryString["status"];
                     Session["blocoSession"] = Request.QueryString["bloco"];
                    DvConfirma.Visible = false;

                    carregaPendencia((string)Session["dataReservaOnline"], (string)Session["aptoSession"], (string)Session["blocoSession"]);
                    lblDataReserva.Text =  dataByExtense();

                   

                }
            }


           
            

        }

        public string dataByExtense()
        {
            CultureInfo culture = new CultureInfo("pt-BR");
            DateTimeFormatInfo dtfi = culture.DateTimeFormat;
            DateTime dataReserva = new DateTime();
            dataReserva = Convert.ToDateTime(Session["dataReservaOnline"]);

            int dia = dataReserva.Day;
            int ano = dataReserva.Year;
            string mes = culture.TextInfo.ToTitleCase(dtfi.GetMonthName(dataReserva.Month));
            string diaSemana = culture.TextInfo.ToTitleCase(dtfi.GetDayName(dataReserva.DayOfWeek));

            string dataRetorno = diaSemana + ", " + dia + " de " + mes + " de " + ano;

            lblBlocoApto.Text = Session["blocoSession"] + " - " + Session["aptoSession"];

            return dataRetorno;

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
            btnCancelarChurras.Visible = false;
            lblDiasAtrasoChurras.Visible = false;
            lblValorChurras.Visible = false;


        }

        public void showControllerChurras()
        {

            lblChurras.Visible = true;
            btnConfirmaChurras.Visible = true;
            btnCancelarChurras.Visible = true;
            lblDiasAtrasoChurras.Visible = true;
            lblValorChurras.Visible = true;


        }


        public void hiddenControllerFesta()
        {

            lblSalaoFesta.Visible = false;
            btnConfirmaSalao.Visible = false;
            btnCancelaFesta.Visible = false;
            lblDiasAtrasoFesta.Visible = false;
            lblValorFesta.Visible = false;


        }

        public void showControllerFesta()
        {

            lblSalaoFesta.Visible = true;
            btnConfirmaSalao.Visible = true;
            btnCancelaFesta.Visible = true;
            lblDiasAtrasoFesta.Visible = true;
            lblValorFesta.Visible = true;


        }


        public void showAll()
        {
            lblChurras.Visible = true;
            btnConfirmaChurras.Visible = true;
            btnCancelarChurras.Visible = true;
            lblDiasAtrasoChurras.Visible = true;
            lblValorChurras.Visible = true;
            lblSalaoFesta.Visible = true;
            btnConfirmaSalao.Visible = true;
            btnCancelaFesta.Visible = true;
            lblDiasAtrasoFesta.Visible = true;
            lblValorFesta.Visible = true;
            btnCancelAll.Visible = true;
            btnConfirmALL.Visible = true;


        }

        public void hiddenAll()
        {
            lblChurras.Visible = false;
            btnConfirmaChurras.Visible = false;
            btnCancelarChurras.Visible = false;
            lblDiasAtrasoChurras.Visible = false;
            lblValorChurras.Visible = false;
            lblSalaoFesta.Visible = false;
            btnConfirmaSalao.Visible = false;
            btnCancelaFesta.Visible = false;
            lblDiasAtrasoFesta.Visible = false;
            lblValorFesta.Visible = false;
            btnCancelAll.Visible = false;
            btnConfirmALL.Visible = false;


        }

        
        protected void btnConfirmaChurras_Click(object sender, EventArgs e)
        {

            DvConfirma.Visible = true;
            dvPesquisaMorador.Visible = false;

            lblStatus.Text = "Confirmação feita com sucesso área: Churrasqueira";
            lblStatus.ForeColor = System.Drawing.Color.Green;
            lblMsg.Text = "Deseja gerar Recibo?";
            actionStatus =  ((Int32)Enum.Parse(typeof(opcaoCancelamento), opcaoCancelamento.confirmaChurrasqueira.ToString()));
            Session["status"] = actionStatus;
              
            
        }



        protected void btnCancelarChurras_Click(object sender, EventArgs e)
        {
            DvConfirma.Visible = true;
            dvPesquisaMorador.Visible = false;

            lblStatus.Text = "Cancelamento feito com sucesso área: Churrasqueira";
            lblStatus.ForeColor = System.Drawing.Color.Red;

            lblMsg.Text = "Deseja Gerar Recibo de cancelamento da Churrasqueira?";
            actionStatus = ((Int32)Enum.Parse(typeof(opcaoCancelamento), opcaoCancelamento.cancelaChurrasco.ToString()));
            Session["status"] = actionStatus;
        }

        protected void btnCancelaFesta_Click(object sender, EventArgs e)
        {
            DvConfirma.Visible = true;
            dvPesquisaMorador.Visible = false;

            lblStatus.Text = "Cancelamento feito com sucesso área: Salão de Festa";
            lblStatus.ForeColor = System.Drawing.Color.Red;

            lblMsg.Text = "Deseja Gerar Recibo de cancelamento do Salão de Festa?";
            actionStatus = ((Int32)Enum.Parse(typeof(opcaoCancelamento), opcaoCancelamento.cancelaSLFesta.ToString()));
            Session["status"] = actionStatus;

        }

        protected void btnConfirmALL_Click(object sender, EventArgs e)
        {
            DvConfirma.Visible = true;
            dvPesquisaMorador.Visible = false;

            lblStatus.Text = "Confirmação feita com sucesso área: Salão de Festa / Churrasqueira";
            lblStatus.ForeColor = System.Drawing.Color.Green;

            lblMsg.Text = "Deseja Gerar Recibo agora?";
            actionStatus = ((Int32)Enum.Parse(typeof(opcaoCancelamento), opcaoCancelamento.confimaTudo.ToString()));
            Session["status"] = actionStatus;

        }

        protected void btnCancelAll_Click(object sender, EventArgs e)
        {
            DvConfirma.Visible = true;
            dvPesquisaMorador.Visible = false;

            lblStatus.Text = "Cancelamento feito com sucesso para áreas: Salão de Festa  e Churrasqueira";

            lblStatus.ForeColor = System.Drawing.Color.Red;

            lblMsg.Text = "Deseja gerar recibo para áreas: Salão de Festa e Churrasqueira?";
            actionStatus = ((Int32)Enum.Parse(typeof(opcaoCancelamento), opcaoCancelamento.cancelaTudo.ToString()));
            Session["status"] = actionStatus;

        }

        protected void btnConfirmaSalao_Click(object sender, EventArgs e)
        {

            DvConfirma.Visible = true;
            dvPesquisaMorador.Visible = false;

            lblStatus.Text = "Confirmação feita com sucesso área: Salão de Festa";
            lblStatus.ForeColor = System.Drawing.Color.Green;

            lblMsg.Text = "Deseja Gerar Recibo agora?";
            actionStatus = ((Int32)Enum.Parse(typeof(opcaoCancelamento), opcaoCancelamento.confirmaFesta.ToString()));
            Session["status"] = actionStatus;

        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            dvPesquisaMorador.Visible = true;
            DvConfirma.Visible = false;
        }

        public enum opcaoCancelamento
        {
            confirmaChurrasqueira = 1,
            confirmaFesta = 2 ,
            cancelaSLFesta = 3,
            cancelaChurrasco = 4,
            confimaTudo = 5,
            cancelaTudo = 6

        };

        protected void btnCadastrar_Click(object sender, EventArgs e)
        {
            if (Session["status"] != "" || Session["status"] != null)
            {
                switch ((Int32)Session["status"])
                {
                    case 1:
                        ConfirmChurraqueira();
                        break;


                }
            }
        }

        public void ConfirmChurraqueira()
        {

            oApModel.apartamento = Convert.ToInt32(Session["aptoSession"]);
            oApModel.bloco = Convert.ToInt32(Session["blocoSession"]);
            oAgendaModel.ap = oApModel;
            oAgendaModel.dataConfirmacaoPagamento = DateTime.Now;
            oAgendaModel.salaoChurrasco = true;
            oAgendaModel.salaoFesta = false;
            oAgendaModel.dataAgendamento = Convert.ToDateTime(Session["dataReservaOnline"]);
            oAgendaModel.statusPagamento = "S";
            oAgendaModel.observacao = "Nada Por enquanto";

            try
            {
                //Atualiza a reserva
                oAgenda.cadastrarAgenda(oAgendaModel.dataAgendamento, oApModel, oAgendaModel);
                Session.Remove("status");
               

                // Gera Recibo

            }
            catch (Exception e)
            {
                
                throw e;
            }


            
        }

      
      
    }

    


}