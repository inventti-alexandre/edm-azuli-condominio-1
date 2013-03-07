using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Azuli.Web.Business;
using Azuli.Web.Model;
using Azuli.Web.Portal.Util;
using System.Text;

namespace Azuli.Web.Portal
{
    public partial class OcorrenciaMorador : Util.Base
    {
        ProprietarioBLL oProprietario = new ProprietarioBLL();
        ProprietarioModel oProprietarioModel = new ProprietarioModel();
        ApartamentoModel oAPmodel = new ApartamentoModel();
        Util.Util oUtil = new Util.Util();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (oUtil.validateSession())
                {
                    lblMsg.Visible = false;
                    lblDescApartamento.Text = Session["AP"].ToString();
                    lblDescBloco.Text = Session["Bloco"].ToString();

                  
                }
                else
                {


                }
            }
        }

        protected void btnOcorrencia_Click(object sender, EventArgs e)
        {

            if (drpListSubject.SelectedItem.Value != "-1")
            {
                LancamentoOcorrenciaModel oLancamento = new LancamentoOcorrenciaModel();
                ApartamentoModel oApartamento = new ApartamentoModel();
                OcorrenciaModel oOcorrencia = new OcorrenciaModel();

                oLancamento.dataOcorrencia = DateTime.Now;
                oLancamento.statusOcorrencia = Util.Util.statusChamado.aberto.ToString().ToUpper();
                oLancamento.descricaoOcorrencia = txtDescription.Text;
                oApartamento.bloco = Convert.ToInt32(Session["Bloco"]);
                oApartamento.apartamento = Convert.ToInt32(Session["AP"].ToString());
                oLancamento.oAp = oApartamento;
                oLancamento.dataFinalizacao = DateTime.Now;
                oLancamento.dataCancelamento = DateTime.Now;
                oLancamento.imagemEvidencia = "Em desenvolvimento...";//System.IO.Path.GetFullPath(fileImagem.FileName);
                oOcorrencia.codigoOcorencia = Convert.ToInt32(drpListSubject.SelectedItem.Value);
                oLancamento.oOcorrencia = oOcorrencia;


                try
                {
                    oProprietario.cadastraOcorrencia(oLancamento);
                    dvCadastro.Visible = false;
                    lblMsg.Visible = true;
                    lblMsg.Text = "Cadastro efeutado com sucesso!!";
                }
                catch (Exception)
                {

                    throw;
                }
            }
            else
            {
                lblMsg.Visible = true;
                lblMsg.Text = "Por favor esolha um assunto!!";
            }
           
            

        }
    }
}