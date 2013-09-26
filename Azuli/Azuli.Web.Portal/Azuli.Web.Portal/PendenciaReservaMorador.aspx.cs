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
    public partial class PendenciaReservaMorador : System.Web.UI.Page
    {

        ProprietarioBLL oProprietario = new ProprietarioBLL();
        ProprietarioModel oProprietarioModel = new ProprietarioModel();
        ApartamentoModel oAPmodel = new ApartamentoModel();
        AgendaModel oAgendaModel = new AgendaModel();
        AgendaBLL oAgendaBLL = new AgendaBLL();
        Util.Util oUtil = new Util.Util();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (oUtil.validateSession())
            {
                if (!IsPostBack)
                {
                     Session["aptoSession"] = Request.QueryString["apto"];
                     Session["dataReservaOnline"] = Request.QueryString["data"];
                    //string status = Request.QueryString["status"];
                     Session["blocoSession"] = Request.QueryString["bloco"];
                    preencheGridAgendamentoFuturo();
                }
            }
        }

        public void preencheGridAgendamentoFuturo()
        {

            oAgendaModel.dataAgendamento = Convert.ToDateTime(Session["dataReservaOnline"]);
            oAPmodel.bloco = Convert.ToInt32(Session["blocoSession"]);
            oAPmodel.apartamento = Convert.ToInt32(Session["aptoSession"]);

            oAgendaModel.ap = oAPmodel;



               foreach (var item in oAgendaBLL.pendentePagamento(oAgendaModel))
                {
                    if (oAgendaBLL.pendentePagamento(oAgendaModel).Count >= 2)
                    {


                        showAll();


                        if (item.salaoFesta == true)
                        {
                            grdReservaProgramadaFesta.DataSource = oAgendaBLL.pendentePagamento(oAgendaModel);
                            grdReservaProgramadaFesta.DataBind();

                        }
                        if (item.salaoChurrasco == true)
                        {
                            grdReservaProgramadaChurras.DataSource = oAgendaBLL.pendentePagamento(oAgendaModel);
                            grdReservaProgramadaChurras.DataBind();

                        }

                    }
                    else
                    {
                        if (item.salaoFesta == true)
                        {
                            grdReservaProgramadaChurras.Visible = false;
                            grdReservaProgramadaFesta.DataSource = oAgendaBLL.pendentePagamento(oAgendaModel);
                            grdReservaProgramadaFesta.DataBind();

                        }
                        if (item.salaoChurrasco == true)
                        {
                            grdReservaProgramadaFesta.Visible = false;
                            grdReservaProgramadaChurras.DataSource = oAgendaBLL.pendentePagamento(oAgendaModel);
                            grdReservaProgramadaChurras.DataBind();

                        }

                    }


                
            
        

            }


            
           
        }

        public void showAll()
        {
            grdReservaProgramadaChurras.Visible = true;
            grdReservaProgramadaFesta.Visible = true;
        }

    }
}