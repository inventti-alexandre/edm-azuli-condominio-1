using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Azuli.Web.Business;

namespace Azuli.Web.Portal
{
    public partial class DetalheClassificado : System.Web.UI.Page
    {
        Util.Util oUtil = new Util.Util();
        ClassificadoBLL oClassificado = new ClassificadoBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (oUtil.validateSession())
                {
                    lblDescBloco.Text = Session["Bloco"].ToString();
                    lblDescApartamento.Text = Session["AP"].ToString();
                    //carregaGrupoClassificado();
                    //preencheGrid();
                    //dvAnunciar.Visible = false;
                }

            }

        }
    }
}