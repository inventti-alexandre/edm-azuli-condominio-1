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
    public partial class minhaReservas : Util.Base
    {

        DateTime data = DateTime.Now;
        AgendaBLL oAgenda = new AgendaBLL();
        AgendaModel oAgendaModel = new AgendaModel();
        ApartamentoModel oAP = new ApartamentoModel();
        Util.Util oUtil = new Util.Util();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (oUtil.validateSession())
            {
                if (!IsPostBack)
                {
                    hiddenControl();
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
            drpMeses.DataBind();
        }

        public void preencheAno()
        {

            for (int ano = data.Year ; ano < 2020; ano ++)
            {
                drpAno.Items.Add(ano.ToString());
            }

        }

        public void hiddenControl()
        {
            dvChurrasco.Visible = false;
            dvFesta.Visible = false;
        }

        private void consultaReserva()
        {
            oAgendaModel.dataAgendamento = Convert.ToDateTime(drpAno.SelectedItem.Value + "-" + drpMeses.SelectedItem.Value + "01");
            oAP.bloco = Convert.ToInt32(Session["Bloco"]);
            oAP.apartamento = Convert.ToInt32(Session["AP"]);

            if (drpSalao.SelectedItem.Text == "Festa")
            {
                dvFesta.Visible = true;
                dvChurrasco.Visible = false;
                grdAgendaMorador.DataSource = oAgenda.listaReservaByMoradorFesta(oAP, oAgendaModel);
                grdAgendaMorador.DataBind();
                lblMsg.Visible = false;
            }
            else if (drpSalao.SelectedItem.Text == "Churrasqueira")
            {

                grdChurras.DataSource = oAgenda.listaReservaByMorador(oAP, oAgendaModel);
                grdChurras.DataBind();
                dvChurrasco.Visible = true;
                dvFesta.Visible = false;
                lblMsg.Visible = false;
            }
        }


        protected void drpSalao_SelectedIndexChanged(object sender, EventArgs e)
        {
            consultaReserva();
            
        }

        protected void drpMeses_SelectedIndexChanged(object sender, EventArgs e)
        {
            consultaReserva();
        }

        protected void drpAno_SelectedIndexChanged(object sender, EventArgs e)
        {
            consultaReserva();

        }

        protected void grdAgendaMorador_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            
            const string  salaoFesta = "S";
            const string churrasqueira = "N";
            DateTime dataAgendamento = new DateTime();
            string bloco = "";
            string ap = "";

            

            if (e.CommandName == "Delete")
            {
                

                int index = int.Parse((string)e.CommandArgument);
                dataAgendamento = Convert.ToDateTime(grdAgendaMorador.DataKeys[index]["dataAgendamento"]);
                if (validaCancelamento(dataAgendamento))
                {
                    bloco = Session["Bloco"].ToString();
                    ap = Session["Ap"].ToString();
                    oAP.apartamento = Convert.ToInt32(ap);
                    oAP.bloco = Convert.ToInt32(bloco);


                    try
                    {
                        oAgenda.cancelaAgendamentoMorador(dataAgendamento, oAP, salaoFesta, churrasqueira);
                        grdAgendaMorador.DataBind();
                    }
                    catch (Exception)
                    {

                        throw;
                    }
                }

            }
        }

        protected void grdAgendaMorador_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void grdAgendaMorador_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            
        }

        protected void grdChurras_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            


            }

        protected void grdChurras_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            const string salaoFesta = "N";
            const string churrasqueira = "S";
            DateTime dataAgendamento = new DateTime();
            string bloco = "";
            string ap = "";


            if (e.CommandName == "Delete")
            {


                int index = int.Parse((string)e.CommandArgument);
                dataAgendamento = Convert.ToDateTime(grdChurras.DataKeys[index]["dataAgendamento"]);

                if (validaCancelamento(dataAgendamento))
                {
                    bloco = Session["Bloco"].ToString();
                    ap = Session["Ap"].ToString();
                    oAP.apartamento = Convert.ToInt32(ap);
                    oAP.bloco = Convert.ToInt32(bloco);


                    try
                    {
                        oAgenda.cancelaAgendamentoMorador(dataAgendamento, oAP, salaoFesta, churrasqueira);
                        grdChurras.DataBind();
                    }
                    catch (Exception)
                    {

                        throw;
                    }
                }
        }
        }

        public bool validaCancelamento(DateTime dataAgendamento)
        {

            TimeSpan diasAgendado;
            diasAgendado = dataAgendamento -  DateTime.Now;
            if (diasAgendado.Days > 15)
            {
                return true;
            }

            else
            {
                lblMsg.Visible = true;
                lblMsg.Text = "Só é permitido o cancelamento com 15 dias de antecedência e hoje faltam " + diasAgendado.Days + " dias para reserva, excessões procure o síndico, do seu interfone- ramal 94";
                
                return false;
            }
        }

        

      
    }
}