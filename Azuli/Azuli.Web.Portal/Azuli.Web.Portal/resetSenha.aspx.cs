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

        protected void btnAlteraSenha_Click(object sender, EventArgs e)
        {


            try
            {

           
                    if (txtNovaSenha.Text.Length == 6)
                    {
                        ProprietarioBLL oProprietario = new ProprietarioBLL();
                        ProprietarioModel oProprietarioModel = new ProprietarioModel();

                        oProprietarioModel.ap = new ApartamentoModel();
              
                       

                        if (txtNovaSenha.Text == txtRepitaNovaSenha.Text)
                        {
                    
                            oProprietarioModel.ap.apartamento = (int)Session["AP"];
                            oProprietarioModel.ap.bloco = (int)Session["Bloco"];
                            oProprietarioModel.senha = txtNovaSenha.Text;

                            oProprietario.alteraSenha(oProprietarioModel);


                                StringBuilder sb = new StringBuilder();
                                sb.Append("<b>A sua senha foi alterada com sucesso!</b>");

                                lblMensagem.Text = sb.ToString();
                    

                        }
                        else
                        {
                            lblMensagem.Text = "Senhas digitadas divergem, favor verificar.";
                        }
                    }
                    else
                    {
                        lblMensagem.Text = "Senha precisa ter 6 caracteres";
                    }

                    }

            catch (Exception ex)
            {

                throw ex;
            }

        }
      
    }
}