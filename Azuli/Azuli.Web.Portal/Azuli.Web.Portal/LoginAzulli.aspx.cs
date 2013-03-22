using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Azuli.Web.Business;
using Azuli.Web.Model;
using System.Configuration;
using Azuli.Web.Portal.Util;


namespace Azuli.Web.Portal.Account
{
    public partial class LoginAzulli : Util.Base
    {


        protected override void OnLoad(EventArgs e)
        {
            hiddenControl();
            string id = ConfigurationManager.AppSettings["GoogleAnalyticsId"];

            if (!string.IsNullOrEmpty(id))
            {
                string script = "";

                script += "<script type=\"text/javascript\">";

                script += "var _gaq = _gaq || [];";
                script += "_gaq.push(['_setAccount', '" + id + "']);";
                script += "_gaq.push(['_trackPageview']);";

                script += "(function() {";
                script += "  var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;";
                script += "  ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';";
                script += "  var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);";
                script += "})();";

                script += "</script>";






                //ScriptManager.RegisterStartupScript(this, this.GetType(), "MessageAlert",
                //  "<script language=\"JavaScript\">" + Environment.NewLine +
                //  "alert(\'" + "TEST" + "\');" + Environment.NewLine +
                //  "</script>", false);


                ScriptManager.RegisterStartupScript(this, this.GetType(), "MessageAlert", script, false);

            }
        }


        ProprietarioBLL oProprietario = new ProprietarioBLL();
        ProprietarioModel oProprietarioModel = new ProprietarioModel();
        ApartamentoModel oAPmodel = new ApartamentoModel();

        protected void Page_Load(object sender, EventArgs e)
        {
            hiddenControl();
            Session.Clear();
            Session.Abandon();
            
         
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            Session.Clear();
            
            oAPmodel.apartamento = Convert.ToInt32(txtAP.Text);
            oAPmodel.bloco = Convert.ToInt32(drpBloco.Text);
            oProprietarioModel.senha = Password.Text;
            
            Session["AP"] = Convert.ToInt32(txtAP.Text);
            Session["Bloco"] = Convert.ToInt32(drpBloco.Text);

            int valida = oProprietario.autenticaMorador(oAPmodel, oProprietarioModel);




            if (valida != 0)
            {


                foreach (var item in oProprietario.populaProprietario(oAPmodel, oProprietarioModel))
                {
                    Session["AP"] = item.ap.apartamento;
                    Session["Bloco"] = item.ap.bloco;
                    Session["Proprie1"] = item.proprietario1.ToString();
                    Session["Proprie2"] = item.proprietario2.ToString();
                    if(item.email != null)
                    Session["email"] = item.email.ToString();

                  //  Session["senha"] = item.senha.ToString();
                }

                if (Session["AP"].ToString() == "0" && Session["Bloco"].ToString() == "0")
                {
                    Response.Redirect("WelcomeAdmin.aspx");
                }
                else
                {
                    Response.Redirect("~/paginaInicialMoradores.aspx");
                }
            }
            else
            {
                FailureText.Text = "Número do Apartamento ou senha inválida";
                Session.Clear();
            }

        }

        protected void lnkBtnTeste_Click(object sender, EventArgs e)
        {
            dvDadosMorador.Visible = true;
        }

        protected void lnkBtnEsqueci_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/esqueciSenha.aspx");
        }

        protected void btnOkPesquisa_Click(object sender, EventArgs e)
        {
            SendMail enviaEmail = new SendMail();

            try
            {
                int status = 0;

                string mensagem = "Solicitação de Acesso Ap: " + txtSolicitaAP.Text + " Bloco " + txtSolicitaBloco.Text + "Email " + txtEmail.Text + " Nome " + txtNome.Text;

                enviaEmail.enviaSenha(mensagem, txtNome.Text,"edmls@ig.com.br", status);

                lblMsg.Text = "<b> <font color=green>Solicitação enviada com sucesso, em breve você receberá seu acesso por e-mail </b></font>";


            }
            catch (Exception ex)
            {
                lblMsg.Text = "<b> <font color=green>Erro ao solicitar acesso,verifique os dados e tente novamente </b></font> </br>" + ex.Message;
            }
            finally
            {
                lblMsg.Visible = true;
            }
        }

        protected void btnCancel0_Click1(object sender, EventArgs e)
        {
            hiddenControl();
        }

        public void hiddenControl()
        {
            dvDadosMorador.Visible = false;
        }
    }
}
