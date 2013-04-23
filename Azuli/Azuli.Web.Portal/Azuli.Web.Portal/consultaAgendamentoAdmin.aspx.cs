using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Azuli.Web.Business;
using Azuli.Web.Model;
using System.Text;

namespace Azuli.Web.Portal
{
    public partial class consultaAgendamentoAdmin : Util.Base
    {

        DateTime data = DateTime.Now;
        AgendaBLL oAgenda = new AgendaBLL();
        ApartamentoModel oAP = new ApartamentoModel();
        Util.Util oUtil = new Util.Util();
        bool exportando = false;
        Label lblarea = new Label();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (oUtil.validateSessionAdmin())
            {
                if (!IsPostBack)
                {
                    preencheMeses();
                    drpMeses.SelectedIndex = data.Month - 1;
                    preencheAno();
                    drpAno.SelectedItem.Text = data.Year.ToString();
                    consultaReserva();
                }
            }
        }

        protected void drpMeses_SelectedIndexChanged(object sender, EventArgs e)
        {
            consultaReserva();
        }

        protected void drpAno_SelectedIndexChanged(object sender, EventArgs e)
        {
            consultaReserva();
        }

        protected void drpSalao_SelectedIndexChanged(object sender, EventArgs e)
        {
            consultaReserva();
        }


        public void preencheMeses()
        {
            string mesCorrente = "";
            drpMeses.DataSource = Enum.GetNames(typeof(Util.Util.meses));


            mesCorrente = System.Globalization.DateTimeFormatInfo.CurrentInfo.GetMonthName(data.Month);

            drpMeses.Items.Add(mesCorrente); //drpMeses.Items.IndexOf(drpMeses.Items.FindByValue(data.Month.ToString()));
            drpMeses.DataBind();
        }

        public void preencheAno()
        {

            for (int ano = data.Year - 4; ano < 2020; ano++)
            {
                drpAno.Items.Add(ano.ToString());
            }

        }


         private void consultaReserva()
        
        {
              int ano=  Convert.ToInt32(drpAno.SelectedItem.Value);
              int mes = Convert.ToInt32(drpMeses.SelectedIndex + 1);
            

            if (drpSalao.SelectedItem.Value == "1")
            {
                dvFesta.Visible = true;
                divChurrasco.Visible = false;
                grdFesta.DataSource = oAgenda.listaReservaDetalhadaFesta(ano,  mes);
                grdFesta.DataBind();

                lblMesAnoFesta.Text = drpMeses.SelectedItem.Text + " / " + drpAno.SelectedItem.Text;
            }
            else if (drpSalao.SelectedItem.Value == "2")
            {

                grdChurrasco.DataSource = oAgenda.listaReservaDetalhadaChurrasco(ano, mes);
                grdChurrasco.DataBind();
                divChurrasco.Visible = true;
                dvFesta.Visible = false;

                lbMesAnoChurras.Text = drpMeses.SelectedItem.Text + " / " + drpAno.SelectedItem.Text;
            }
            else if (drpSalao.SelectedItem.Value == "3")
            {
                grdChurrasco.DataSource = oAgenda.listaReservaDetalhadaChurrasco(ano, mes);
                grdChurrasco.DataBind();
              
                dvFesta.Visible = true;

                lblMesAnoFesta.Text = drpMeses.SelectedItem.Text + " / " + drpAno.SelectedItem.Text;
            
                divChurrasco.Visible = true;
                grdFesta.DataSource = oAgenda.listaReservaDetalhadaFesta( ano, mes);
                grdFesta.DataBind();

                lbMesAnoChurras.Text = drpMeses.SelectedItem.Text + " / " + drpAno.SelectedItem.Text;

            }

        }

         protected void imgBtExcelFesta_Click(object sender, ImageClickEventArgs e)
         {
             if (grdFesta.Rows.Count > 0)
             {
                 lblarea.Text = "Reserva do Salão de Festa - " + drpMeses.SelectedItem.Text + "/" + drpAno.Text;
                 exportando = true;

                 Response.ClearContent();

                 Response.AddHeader("content-disposition", "attachment;filename=SalaoFesta" + drpMeses.SelectedItem.Text + "/" + drpAno.Text + ".xls");


                 // If you want the option to open the Excel file without saving than

                 // comment out the line below

                 Response.Cache.SetCacheability(HttpCacheability.NoCache);

                 Response.ContentType = "application/ms-excel";

                 Response.ContentEncoding = System.Text.Encoding.GetEncoding("Windows-1252");
                 Response.Charset = "ISO-8859-1";
                 EnableViewState = false;

                 System.IO.StringWriter stringWrite = new System.IO.StringWriter();

                 System.Web.UI.HtmlTextWriter htmlWrite = new HtmlTextWriter(stringWrite);

                 lblarea.RenderControl(htmlWrite);
                 grdFesta.RenderControl(htmlWrite);
                 Response.Write(stringWrite.ToString());
                 Response.End();

             }

         }

         protected void imgBtExcelChurras_Click(object sender, ImageClickEventArgs e)
         {


             if (grdChurrasco.Rows.Count > 0)
             {
                 lblarea.Text = "Reserva da Churrasqueira - " + drpMeses.SelectedItem.Text + "/" + drpAno.Text;
                 exportando = true;

                 Response.ClearContent();

                 Response.AddHeader("content-disposition", "attachment;filename=AreaChurrasco" + drpMeses.SelectedItem.Text + "/" + drpAno.Text + ".xls");

                 Response.Charset = "";

                 // If you want the option to open the Excel file without saving than

                 // comment out the line below
                 Response.ContentEncoding = System.Text.Encoding.GetEncoding("Windows-1252");
                 Response.Charset = "ISO-8859-1";
                 EnableViewState = false;
                 Response.Cache.SetCacheability(HttpCacheability.NoCache);

                 Response.ContentType = "application/ms-excel";

                 System.IO.StringWriter stringWrite = new System.IO.StringWriter();

                 System.Web.UI.HtmlTextWriter htmlWrite = new HtmlTextWriter(stringWrite);

                 lblarea.RenderControl(htmlWrite);
                 grdChurrasco.RenderControl(htmlWrite);
                 Response.Write(stringWrite.ToString());
                 Response.End();

             }


         }
         /// <summary>
         /// Para nao dar Erro na Hora de Exportar....
         /// </summary>
         /// <param name="control"></param>
         public override void VerifyRenderingInServerForm(Control control)
         {
             if (!exportando)
             {
                 base.VerifyRenderingInServerForm(control);
             }
         }
        
    }
}