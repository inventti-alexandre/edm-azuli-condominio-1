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
    public partial class ConfigurarValorReserva : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //if (e.CommandName == "Update")
            //{
            //    ConfiguraReserva oConfiguracao = new ConfiguraReserva();
            //    ConfiguracaoReservaBLL oConfigBLL = new ConfiguracaoReservaBLL();
            //    int index = int.Parse((string)e.CommandArgument);

            //    int id = Convert.ToInt32(grdConfigArea.DataKeys[index]["id_valor"]);
            //    TextBox valor = (TextBox)grdConfigArea.Rows[index].FindControl("valor");
            //    TextBox area = (TextBox)grdConfigArea.Rows[index].FindControl("area");


            //    oConfiguracao.id_valor = id;
            //    oConfiguracao.area = area.Text;
            //    oConfiguracao.valor = Convert.ToDouble(valor.Text);


            //    try
            //    {
            //        oConfigBLL.alteraConfiguracaArea(oConfiguracao);

            //        grdConfigArea.DataBind();
            //    }
            //    catch (Exception err)
            //    {

            //        throw err;
            //    }


            }


        }

}