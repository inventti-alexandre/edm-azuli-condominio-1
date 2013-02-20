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
            }
            else if (drpSalao.SelectedItem.Text == "Churrasqueira")
            {

                grdChurras.DataSource = oAgenda.listaReservaByMorador(oAP, oAgendaModel);
                grdChurras.DataBind();
                dvChurrasco.Visible = true;
                dvFesta.Visible = false;
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

            

            if (e.CommandName == "Delete")
            {
                int index = int.Parse((string)e.CommandArgument);
                DateTime dataAgendamento = Convert.ToDateTime(grdAgendaMorador.DataKeys[index]["dataAgendamento"]);
                int bloco = Convert.ToInt32(Session["Bloco"]);
                int ap = Convert.ToInt32(Session["Ap"]);


            }
        }

        protected void grdAgendaMorador_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        

      
    }
}