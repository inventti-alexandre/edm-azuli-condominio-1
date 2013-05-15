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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (oUtil.validateSession())
                {
                   // lblDescBloco.Text = Session["Bloco"].ToString();
                   // lblDescApartamento.Text = Session["AP"].ToString();
                    preencheGrid();
                    //dvAnunciar.Visible = false;
                }

            }
        }


        public void preencheGrid()
        {
            Classificados oClassificaModel = new Classificados();

            //GrupoClassificados oGrpModel = new GrupoClassificados();
            ApartamentoModel oAp = new ApartamentoModel();

            oAp.apartamento = Convert.ToInt32(Session["Ap"]);
            oAp.bloco = Convert.ToInt32(Session["Bloco"]);
            oClassificaModel.apartamentoClassificado = oAp;
            //oGrpModel.grupoClassificado = 0;
            //oClassificaModel.grpClassificado = oGrpModel;
            //oClassificaModel.dataClassificado = Convert.ToDateTime("17530101");


            grdClassificado.DataSource = oClassificado.consultaClassificado(oClassificaModel);
            grdClassificado.DataBind();



        }
    }
}