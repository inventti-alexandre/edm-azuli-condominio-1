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
        Visitante oVisitanteModel = new Visitante();
        VisitanteBLL oVisitante   = new VisitanteBLL();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            oVisitanteModel.visitanteNome = txtBoxNome.Text;
            oVisitanteModel.visitanteRG = txtBoxRG.Text;
            oVisitanteModel.visitanteTipo = rblTipoVisita.Text;
            oVisitante.cadastraVisitante(oVisitanteModel);

        }
    }
}