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
    public partial class GerenciarClassificadoMorador : System.Web.UI.Page
    {

        Util.Util oUtil = new Util.Util();
        ClassificadoBLL oClassificado = new ClassificadoBLL();
        Classificados oClassificaModel = new Classificados();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (oUtil.validateSession())
                {
                   
                    DetailsView1.ChangeMode(DetailsViewMode.Edit);
                    preencheDetailsView();
                    //dvAnunciar.Visible = false;
                }

            }
        }


        

        public void preencheDetailsView()
        {
            

       
            ApartamentoModel oAp = new ApartamentoModel();

            oAp.apartamento = Convert.ToInt32(Session["Ap"]);
            oAp.bloco = Convert.ToInt32(Session["Bloco"]);
            oClassificaModel.apartamentoClassificado = oAp;
            oClassificaModel.idClassificado = Convert.ToInt32(Request.QueryString["codigo"]);
            //oClassificaModel.dataClassificado = Convert.ToDateTime("17530101");


            DetailsView1.DataSource = oClassificado.consultaClassificado(oClassificaModel);
            DetailsView1.DataBind();



        }

        protected void DetailsView1_ItemCommand(object sender, DetailsViewCommandEventArgs e)
        {
            Classificados oClassificaModel = new Classificados();
            GrupoClassificados oGrupoModel = new GrupoClassificados();
            
            DataKey key = DetailsView1.DataKey;

            TextBox assunto = (TextBox)DetailsView1.FindControl("TextBox1");
            oClassificaModel.assuntoClassificado = assunto.Text;

            TextBox descricao = (TextBox)DetailsView1.FindControl("TextBox2");
            oClassificaModel.descricaoClassificado = descricao.Text;

            TextBox telefone = (TextBox)DetailsView1.FindControl("TextBox3");
            oClassificaModel.classificadoTelefone1 = telefone.Text;

            TextBox celular = (TextBox)DetailsView1.FindControl("TextBox4");
            oClassificaModel.classificadoTelefone2 = celular.Text;

            TextBox email = (TextBox)DetailsView1.FindControl("TextBox5");
            oClassificaModel.emailClassificadoContato = email.Text;

            TextBox valor = (TextBox)DetailsView1.FindControl("TextBox6");
            oClassificaModel.valorVendaClassificado = Convert.ToDouble(valor.Text);

            TextBox status = (TextBox)DetailsView1.FindControl("TextBox7");
            oClassificaModel.statusClassificado = status.Text;

            //TextBox grupoClassificado = (TextBox)DetailsView1.FindControl("TextBox9");
            //oGrupoModel.grupoClassificado = Convert.ToInt32(grupoClassificado.Text);
            //oClassificaModel.grpClassificado = oGrupoModel;

            TextBox img1 = (TextBox)DetailsView1.FindControl("TextBox10");
            oClassificaModel.classificadoimg1 = img1.Text;


            TextBox img2 = (TextBox)DetailsView1.FindControl("TextBox11");
            oClassificaModel.classificadoimg2 = img2.Text;


            TextBox img3 = (TextBox)DetailsView1.FindControl("TextBox12");
            oClassificaModel.classificadoimg3 = img3.Text;

            TextBox img4 = (TextBox)DetailsView1.FindControl("TextBox7");
            oClassificaModel.classificadoimg4 = img4.Text;

            oClassificaModel.idClassificado = Convert.ToInt32(key.Value);

            try
            {
                oClassificado.atualizaClassificado(oClassificaModel);
            }
            catch (Exception err)
            {
                
                throw err;
            }
          


        }
    }
}