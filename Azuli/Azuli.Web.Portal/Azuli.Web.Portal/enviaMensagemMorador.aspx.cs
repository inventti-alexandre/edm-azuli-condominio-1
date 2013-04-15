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
        MensagemMoradorBLL oMensagemBLL = new MensagemMoradorBLL();
        MensagemMoradorModel oMsgModel = new MensagemMoradorModel();
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

        public string buscaMorador()
        {

            string nomeMorador = "";
            
            if (drpMsg.SelectedItem.Value != "-1" && drpBloco.SelectedItem.Value != "-1")
            {
             
                oAPmodel.apartamento = Convert.ToInt32(drpMsg.SelectedItem.Text);
                oAPmodel.bloco = Convert.ToInt32(drpBloco.SelectedItem.Text);

                if (oProprietario.BuscaMoradorAdmin(oAPmodel).Count > 0)
                {

                    foreach (var item in oProprietario.BuscaMoradorAdmin(oAPmodel))
                    {

                        lblMorador.Text = item.proprietario1.ToString();
                        nomeMorador = item.proprietario1.ToString();


                    }
                }
                else
                {
                    nomeMorador = "Não existe morador cadastrado!";
                    lblMorador.Text = "Não existe morador cadastrado!";
                }
            }

            return nomeMorador; 
        }

        protected void btnMensagem_Click(object sender, EventArgs e)
        {
            if (drpBloco.SelectedItem.Value != "-1" && drpMsg.SelectedItem.Value != "-1")
            {

                oAPmodel.apartamento = Convert.ToInt32(drpMsg.SelectedItem.Text);
                oAPmodel.bloco = Convert.ToInt32(drpBloco.SelectedItem.Text);
                if (oProprietario.BuscaMoradorAdmin(oAPmodel).Count > 0)
                {
                    ApartamentoModel oAp = new ApartamentoModel();
                    oMsgModel.ativo = "S";
                    oMsgModel.status = "NL";
                    oMsgModel.mensagem = txtDescription.Text;
                    oMsgModel.assunto = txtAssunto.Text;
                    oAp.apartamento = Convert.ToInt32(drpMsg.SelectedItem.Value);
                    oAp.bloco = Convert.ToInt32(drpBloco.SelectedItem.Value);
                    oMsgModel.deMsg = "Mensagem Automática - Administrador do Condominio";
                    oMsgModel.oAp = oAp;


                    try
                    {
                        oMensagemBLL.enviaMensagemMorador(oMsgModel);
                        lblMsg.Text = "Mensagem enviada com sucesso!!";
                        txtAssunto.Text = "";
                        txtDescription.Text = "";
                    }
                    catch (Exception)
                    {

                        throw;
                    }
                }
                else
                {
                    lblMsg.Text = "Não existem morador cadastrado para o Bloco/Apartamento!";

                }

            }
            else
            {
                lblMsg.Text = "Para envio da mensagem escolher o bloco/Apartamento!";

            }

        }
    }
}