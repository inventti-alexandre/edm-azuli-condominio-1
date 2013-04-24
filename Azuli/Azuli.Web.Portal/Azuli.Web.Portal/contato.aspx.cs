using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Azuli.Web.Business;

namespace Azuli.Web.Portal
{
    public partial class contato : System.Web.UI.Page
    {

        Util.Util oUtil = new Util.Util();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (oUtil.validateSession())
                {
                    lblDescBloco.Text = Session["Bloco"].ToString();
                    lblDescApartamento.Text = Session["AP"].ToString();
                }
                
            }

        }

        protected void btnCadastro_Click(object sender, EventArgs e)
        {
            MensagemMoradorBLL oMensagemMorador = new MensagemMoradorBLL();

            try
            {
                oMensagemMorador.cadastraContato(drpListSubject.SelectedItem.Text, txtDescription.Text, Convert.ToInt32(Session["Bloco"]), Convert.ToInt32(Session["AP"]));
                lblMsg.Text = "Obrigado por entrar em contato! <br> <font size='2' color='#948c8c'>Em breve entraremos em contato com você via sistema para sanar sua dúvida e/ou agradecermos o seu comentário ou sugestões! </font> ";
                txtDescription.Text = "";
                drpListSubject.SelectedIndex = -1;
            }
            catch (Exception er)
            {
                
                throw er;
            }
            
        }

        protected void btnLimpar_Click(object sender, EventArgs e)
        {
            drpListSubject.SelectedIndex = -1;
            txtDescription.Text = "";


        }
    }
}