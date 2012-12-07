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

            drpMeses.DataSource = Enum.GetNames(typeof(Util.Util.meses));
            drpMeses.DataBind();
        }

        public void preencheAno()
        {
            for (int ano = 2012; ano < 2020; ano ++)
            {
                drpAno.Items.Add("" + ano);
            }

        }

        public void hiddenControl()
        {
            dvChurrasco.Visible = false;
            dvFesta.Visible = false;
        }

        protected void btnPesquisar_Click(object sender, EventArgs e)
        {
             oAgendaModel.dataAgendamento = Convert.ToDateTime(drpAno.SelectedItem.Value + "-" + drpMeses.SelectedItem.Value + "01");
             oAP.bloco = Convert.ToInt32(Session["Bloco"]);
             oAP.apartamento =   Convert.ToInt32(Session["AP"]);

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
    }
}