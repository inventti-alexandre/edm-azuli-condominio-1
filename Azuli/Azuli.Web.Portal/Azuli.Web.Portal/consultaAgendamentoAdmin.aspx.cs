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
    public partial class consultaAgendamentoAdmin : System.Web.UI.Page
    {

        DateTime data = DateTime.Now;
        AgendaBLL oAgenda = new AgendaBLL();
        ApartamentoModel oAP = new ApartamentoModel();
        Util.Util oUtil = new Util.Util();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (oUtil.validateSessionAdmin())
            {
                if (!IsPostBack)
                {
                    preencheMeses();
                    drpMeses.SelectedIndex = data.Month - 1;
                    preencheAno();
                    drpAno.SelectedItem.Text = data.Year.ToString();
                }
            }
        }

        protected void drpMeses_SelectedIndexChanged(object sender, EventArgs e)
        {
            consultaReserva();
        }

        protected void drpAno_SelectedIndexChanged(object sender, EventArgs e)
        {
            consultaReserva();
        }

        protected void drpSalao_SelectedIndexChanged(object sender, EventArgs e)
        {
            consultaReserva();
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

            for (int ano = data.Year - 4; ano < 2020; ano++)
            {
                drpAno.Items.Add(ano.ToString());
            }

        }


         private void consultaReserva()
        {
            AgendaModel oAgendaModel = new AgendaModel();
    
            oAgendaModel.dataAgendamento = Convert.ToDateTime(drpAno.SelectedItem.Value + "-" + drpMeses.SelectedItem.Value + "01");
            if (drpSalao.SelectedItem.Value == "2")
            {

                oAgendaModel.salaoChurrasco = true;
                oAgendaModel.salaoFesta = false;

                grdChurrasco.DataSource = oAgenda.listaReservaByMoradorAdmin(oAgendaModel);
                grdChurrasco.DataBind();
                divChurrasco.Visible = true;
                dvFesta.Visible = false;
            }

            else if (drpSalao.SelectedItem.Value == "1")
            {
                oAgendaModel.salaoChurrasco = false;
                oAgendaModel.salaoFesta = true;
                dvFesta.Visible = true;
                divChurrasco.Visible = false;
                grdFesta.DataSource = oAgenda.listaReservaByMoradorAdmin(oAgendaModel);
                grdFesta.DataBind();
               
            }

            else if (drpSalao.SelectedItem.Value == "3")
            {
                grdChurrasco.DataSource = oAgenda.listaReservaByMoradorAdmin(oAgendaModel);
                grdChurrasco.DataBind();

                dvFesta.Visible = true;



                divChurrasco.Visible = true;
                grdFesta.DataSource = oAgenda.listaReservaByMoradorAdmin(oAgendaModel);
                grdFesta.DataBind();


            }
            }
    }
}