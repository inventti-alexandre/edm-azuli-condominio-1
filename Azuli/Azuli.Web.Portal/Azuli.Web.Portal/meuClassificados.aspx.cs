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
    public partial class meuClassificados : Util.Base
    {
        Util.Util oUtil = new Util.Util();
        ClassificadoBLL oClassificado = new ClassificadoBLL();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                if (oUtil.validateSession())
                {
                    preencheGrid();
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

            grdClassificado.DataSource = from listaClassificados in oClassificado.consultaClassificado(oClassificaModel)
                                         where listaClassificados.statusClassificado == "A"
                                         orderby listaClassificados.dataClassificado
                                         select listaClassificados;

            grdClassificado.DataBind();



        }
    }
}