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
    public partial class paginaInicialMoradores : Util.Base
    {
        Util.Util oUtil = new Util.Util();
        MensagemMoradorModel oMensagemModel = new MensagemMoradorModel();
        MensagemMoradorBLL oMensagemBLL = new MensagemMoradorBLL();
       
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (oUtil.validateSession())
            {
                if (!IsPostBack)
                {
                    lblMorador.Text = Session["Proprie1"].ToString();
                    Session["AP"].ToString();
                    Session["Bloco"].ToString();
                    Session["Proprie2"].ToString();
                    listaMensagemMoradorBLL();

                    if (Session["mensagem"] != null)
                    {
                        lnkBtnMsg.Text = Session["mensagem"].ToString();
                    }
                    else
                    {
                        lnkBtnMsg.ForeColor = System.Drawing.Color.Red;
                    }
                }
            }

        }


        public void listaMensagemMoradorBLL()
        {
            try
            {
                ApartamentoModel oApModel = new ApartamentoModel();
                oApModel.apartamento = Convert.ToInt32(Session["AP"]);
                oApModel.bloco = Convert.ToInt32(Session["Bloco"]);

                oMensagemModel.oAp = oApModel;

                listaMensagemMorador listaQuantidade = new listaMensagemMorador();


                foreach (var item in oMensagemBLL.listaMensagemMorador(oMensagemModel))
                {
                     
                    Session["mensagem"] = item.qtdMsg.ToString(); 
                }

            }
            catch (Exception ex)
            {
                ex.ToString();
            }

        }

        protected void lnkBtnMsg_Click(object sender, EventArgs e)
        {
            
        }

        protected void lnkBtnMsg_Click1(object sender, EventArgs e)
        {
            if (Convert.ToInt32(Session["mensagem"]) >= 1)
            {
                Response.Redirect("listaMensagemMorador.aspx");

            }
            else
            {
                lnkBtnMsg.ForeColor = System.Drawing.Color.Red;
            }

        }
    }
}