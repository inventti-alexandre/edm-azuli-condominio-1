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
    public partial class detalheMensagemMorador : Util.Base
    {
        Util.Util oUtil = new Util.Util();
        MensagemMoradorModel oMensagemModel = new MensagemMoradorModel();
        MensagemMoradorBLL oMensagemBLL = new MensagemMoradorBLL();
        ApartamentoModel oApModel = new ApartamentoModel();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (oUtil.validateSession())
            {
                if (!IsPostBack)
                {

                    listaMensagemMoradorBLL();
                    divGeralMsg.Visible = false;
                    btnOk.Visible = false;
                }
            }

        }



        public void listaMensagemMoradorBLL()
        {

            try
            {
               
                oApModel.apartamento = Convert.ToInt32(Session["AP"]);
                oApModel.bloco = Convert.ToInt32(Session["Bloco"]);
                oMensagemModel.oAp = oApModel;
                oMensagemModel.status = drpStatusMsg.SelectedItem.Value;


                grdMsg.DataSource =  oMensagemBLL.listaMensagemMorador(oMensagemModel);
                grdMsg.DataBind();

                //GridView1.DataSource = oMensagemBLL.listaMensagemMorador(oMensagemModel);
                //GridView1.DataBind();

            }
            catch (Exception ex)
            {
                ex.ToString();
            }

        }

        protected void grdMsg_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int codigoMensagem = 0;

            int index = int.Parse((string)e.CommandArgument);
            codigoMensagem = Convert.ToInt32(grdMsg.DataKeys[index]["codigoMsg"]);
            oMensagemModel.codigoMsg = codigoMensagem;

            try
            {
                divGeralMsg.Visible = true;
               
                grdMsg.Visible = false;


                foreach (var item in   oMensagemBLL.listaMensagemMoradorByID(oMensagemModel))
                {
                    lblDe.Text = item.deMsg;
                    lblAssunto.Text = item.assunto;
                    lblData.Text = item.data_inicio.ToString() ;
                    lblMsg.Text = item.mensagem;
                    
                }

                atualizaMensagemParaLida(oMensagemModel);

                drpStatusMsg.Visible = false;
                lblConsultaAno.Visible = false;
                btnOk.Visible = true;
              
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        protected void btnOk_Click(object sender, EventArgs e)
        {
            listaMensagemMoradorBLL();
            divGeralMsg.Visible = false;
            grdMsg.Visible = true;
            drpStatusMsg.Visible = true;
            lblConsultaAno.Visible = true;
            btnOk.Visible = false;
        }

        protected void drpStatusMsg_SelectedIndexChanged(object sender, EventArgs e)
        {
            listaMensagemMoradorBLL();
        }


        public void atualizaMensagemParaLida(MensagemMoradorModel codigoMsg)
        {
            oMensagemBLL.atualizaMSG(codigoMsg);
        }

        protected void BtnPesquisar_Click(object sender, EventArgs e)
        {
            
        }


    }
}