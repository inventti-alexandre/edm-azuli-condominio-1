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
    public partial class CadastrarVisitante : System.Web.UI.Page
    {
        ProprietarioBLL oProprietario = new ProprietarioBLL();
        ProprietarioModel oProprietarioModel = new ProprietarioModel();
        ApartamentoModel oAPmodel = new ApartamentoModel();
        Visitante oVisitanteModel = new Visitante();
        VisitanteBLL oVisitanteBLL = new VisitanteBLL();
        Foto ofotoModel = new Foto();
        FotoBLL oFotoBll = new FotoBLL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {




            }

        }

        protected void drpBloco_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void drpMsg_SelectedIndexChanged(object sender, EventArgs e)
        {
            buscaMorador();
        }

        public void buscaMorador()
        {

            string nomeMorador = "";



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


        public void cadastarVisitante()
        {
            Dictionary<int, byte[]> lastIdFoto = new Dictionary<int, byte[]>();

            lastIdFoto = oFotoBll.lastIdFotoSaved();

            if (lastIdFoto.Keys.Count > 0)
            {


                oVisitanteModel.visitanteNome = txtBoxNome.Text;
                oVisitanteModel.visitanteRG = txtBoxRG.Text;
                oVisitanteModel.visitanteTipo = rblTipoVisita.SelectedItem.Selected.ToString();
                foreach (var item in lastIdFoto)
                {

                    ofotoModel.idFoto = item.Key;
                }

                oVisitanteModel.idFoto = ofotoModel;

                try
                {

                    oVisitanteBLL.cadastraVisitante(oVisitanteModel);
                    Image1.ImageUrl = "~/MostraFoto.ashx";
                    Session.Remove("ID_ATUAL");

                }
                catch (Exception)
                {

                    throw;
                }

            }


        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            cadastarVisitante();

        }

    }
}