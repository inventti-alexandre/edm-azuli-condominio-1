using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Azuli.Web.Business;
using Azuli.Web.Model;
using System.Text;

namespace Azuli.Web.Portal
{
    public partial class esqueciSenha : Util.Base
    {
       

        protected void Page_Load(object sender, EventArgs e)
        {

           

        }

      
        protected void btnEsqueci_Click(object sender, EventArgs e)
        {
            string vMail = " ";

            try
            {
                Util.SendMail oEnviaEmail = new Util.SendMail();

                ProprietarioBLL oProprietario = new ProprietarioBLL();
                ProprietarioModel oProprietarioModel = new ProprietarioModel();
                StringBuilder sbMsg = new StringBuilder();

                oProprietarioModel.ap = new ApartamentoModel();

                oProprietarioModel.ap.apartamento = (int)Session["AP"];
                oProprietarioModel.ap.bloco = (int)Session["Bloco"];
                oProprietarioModel.email = txtEm.Text;

                foreach (var item in oProprietario.recuperaSenhaMorador(oProprietarioModel))
                {
                    vMail = item.senha;
                }

                if (vMail != "")
                {
                    oEnviaEmail.enviaSenha("A sua senha é " + vMail, oProprietarioModel.ap.apartamento.ToString(), oProprietarioModel.email, 1);

                    sbMsg.Append("<b>A sua senha foi enviado para o e-mail informado!</b>");
                    
                }
                else
                {
                    sbMsg.Append("<b>E-mail não cadastrado em nossa base de dados!</b>");
                }

                lblMsg.Text = sbMsg.ToString();

            }

            catch (Exception ex)
            {

                throw ex;
            }

        }

      
    }
}