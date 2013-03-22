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
    public partial class resetSenha : Util.Base
    {
        protected void Page_Load(object sender, EventArgs e)
        {

           

        }

        protected void btnEsqueciSenha_Click(object sender, EventArgs e)
        {


            try
            {           

                ProprietarioBLL oProprietario = new ProprietarioBLL();
                ProprietarioModel oProprietarioModel = new ProprietarioModel();
                StringBuilder sbMsg = new StringBuilder();

                oProprietarioModel.ap = new ApartamentoModel();
                
                oProprietarioModel.ap.apartamento = (int)Session["AP"];
                oProprietarioModel.ap.bloco = (int)Session["Bloco"];
                
                string vMail = " ";
                vMail = oProprietarioModel.email;

                if (vMail != txtEmail.Text)
	            {                    
                    sbMsg.Append("<b>E-mail não cadastrado em nossa base de dados!</b>");
	            }
                else
                {
                    sbMsg.Append("<b>A sua senha foi enviado para o e-mail informado!</b>");
                }         
                
                lblMensagem.Text = sbMsg.ToString();
                
             }

            catch (Exception ex)
            {

                throw ex;
            }

        }

      
    }
}