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
    public partial class WelcomeAdmin : Util.Base
    {
       
        AgendaBLL oAgenda = new AgendaBLL();
        AgendaModel oAgendaModel = new AgendaModel();
        ApartamentoModel oApModel = new ApartamentoModel();
        Util.Util oUtil = new Util.Util();
        ApartamentoModel oAP = new ApartamentoModel();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (oUtil.validateSessionAdmin())
            {
                if (!IsPostBack)
                {
                   // lblAdmin.Text = Session["Proprie1"].ToString();

                     Session["AP"].ToString(); 
                     Session["Bloco"].ToString();
                     Session["Proprie2"].ToString(); 
                    
                }
            }
            
        }


      
        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {
            Literal litAlugado = new Literal();
            List<AgendaModel> listaAgenda = oAgenda.listaEventos();

            if (e.Day.Date < (System.DateTime.Now.AddDays(-1)))
            {

                e.Day.IsSelectable = false;
                e.Cell.Font.Strikeout = true;
                e.Cell.Font.Bold = true;

            }

            if (e.Day.IsToday)
            {
                e.Cell.Font.Bold = true;
                e.Cell.ForeColor = System.Drawing.Color.Black;

            }

            foreach (var item in listaAgenda)
            {


                if (e.Day.Date == item.dataAgendamento)
                {

                    if (item.salaoChurrasco == true & item.salaoFesta == false)
                    {
                        e.Cell.BackColor = System.Drawing.ColorTranslator.FromHtml("#FFFF01");
                    }
                    else if (item.salaoChurrasco == false & item.salaoFesta == true)
                    {
                        e.Cell.BackColor = System.Drawing.ColorTranslator.FromHtml("#BADEF4");

                    }
                    else if (item.salaoChurrasco == true & item.salaoFesta == true)
                    {

                        e.Cell.BackColor = System.Drawing.ColorTranslator.FromHtml("#AA0708");
                        e.Day.IsSelectable = false;
                    }


                }
            }
        }
    }
}