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
    public partial class enviaMensagemMorador : System.Web.UI.Page
    {

        ProprietarioBLL oProprietario = new ProprietarioBLL();
        ProprietarioModel oProprietarioModel = new ProprietarioModel();
        ApartamentoModel oAPmodel = new ApartamentoModel();
        Util.Util oUtil = new Util.Util();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                if (oUtil.validateSessionAdmin())
                {

                  
                }
                else
                {
                    
                   
                }
            }
        }

        protected void drpMsg_SelectedIndexChanged(object sender, EventArgs e)
        {
            buscaMorador();
        }

        protected void drpBloco_SelectedIndexChanged(object sender, EventArgs e)
        {
            buscaMorador();
        }

        public void buscaMorador()
        {
            if (drpMsg.SelectedItem.Value != "-1" && drpBloco.SelectedItem.Value != "-1")
            {
                Session.Clear();
                oAPmodel.apartamento = Convert.ToInt32(drpMsg.SelectedItem.Text);
                oAPmodel.bloco = Convert.ToInt32(drpBloco.SelectedItem.Text);

                if (oProprietario.BuscaMoradorAdmin(oAPmodel).Count > 0)
                {

                    foreach (var item in oProprietario.BuscaMoradorAdmin(oAPmodel))
                    {

                        lblMorador.Text = item.proprietario1.ToString();

                    }
                }
                else
                {
                    lblMorador.Text = "Não existe morador cadastrado!";
                }
            }
        }
    }
}