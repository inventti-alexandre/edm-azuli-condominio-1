﻿using System;
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
    public partial class ReservaDetalhadaMoradores : System.Web.UI.Page
    {
        
        DateTime data = DateTime.Now;
        AgendaBLL oAgenda = new AgendaBLL();
        AgendaModel oAgendaModel = new AgendaModel();
        ApartamentoModel oAP = new ApartamentoModel();
        Util.Util oUtil = new Util.Util();
        bool exportando = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (oUtil.validateSession())
            {
                if (!IsPostBack)
                {
                   
                    hiddenControl();
                    preencheMeses();
                  
                    preencheAno();
                    consultaReserva();

                }
            }
        }



        public void preencheMeses()
        {
            string mesCorrente = "";
            drpMeses.DataSource = Enum.GetNames(typeof(Util.Util.meses));


            mesCorrente = System.Globalization.DateTimeFormatInfo.CurrentInfo.GetMonthName(data.Month);

            drpMeses.Items.Add(mesCorrente); //drpMeses.Items.IndexOf(drpMeses.Items.FindByValue(data.Month.ToString()));
            drpMeses.SelectedIndex = data.Month - 1;
            drpMeses.DataBind();
        }

        public void preencheAno()
        {

            for (int ano = data.Year -4  ; ano < 2015; ano ++)
            {
                drpAno.Items.Add(ano.ToString());
             
            }
            drpAno.SelectedValue = data.Year.ToString();
        }

        public void hiddenControl()
        {
            dvChurrasco.Visible = false;
            dvFesta.Visible = false;
        }

        private void consultaReserva()
        {
              int ano=  Convert.ToInt32(drpAno.SelectedItem.Value);
              int mes = Convert.ToInt32(drpMeses.SelectedIndex + 1);
            

            if (drpSalao.SelectedItem.Text == "Festa")
            {
                dvFesta.Visible = true;
                dvChurrasco.Visible = false;
                grdAgendaMorador.DataSource = oAgenda.listaReservaDetalhadaFesta(ano,  mes);
                grdAgendaMorador.DataBind();
               
                lblMesAnoFesta.Text = drpMeses.SelectedItem.Text + " / " + drpAno.SelectedItem.Text;
            }
            else if (drpSalao.SelectedItem.Text == "Churrasqueira")
            {

                grdChurras.DataSource = oAgenda.listaReservaDetalhadaChurrasco(ano, mes);
                grdChurras.DataBind();
                dvChurrasco.Visible = true;
                dvFesta.Visible = false;
                
                lbMesAnoChurras.Text = drpMeses.SelectedItem.Text + " / " + drpAno.SelectedItem.Text;
            }
            else if (drpSalao.SelectedItem.Value == "1")
            {
                grdChurras.DataSource = oAgenda.listaReservaDetalhadaChurrasco(ano, mes);
                grdChurras.DataBind();
              
                dvFesta.Visible = true;
                
                lblMesAnoFesta.Text = drpMeses.SelectedItem.Text + " / " + drpAno.SelectedItem.Text;
            
                dvChurrasco.Visible = true;
                grdAgendaMorador.DataSource = oAgenda.listaReservaDetalhadaFesta( ano, mes);
                grdAgendaMorador.DataBind();
                
                lbMesAnoChurras.Text = drpMeses.SelectedItem.Text + " / " + drpAno.SelectedItem.Text;

            }

        }


        protected void drpSalao_SelectedIndexChanged(object sender, EventArgs e)
        {
            consultaReserva();
            
        }

        protected void drpMeses_SelectedIndexChanged(object sender, EventArgs e)
        {
            consultaReserva();
        }

        protected void drpAno_SelectedIndexChanged(object sender, EventArgs e)
        {
            consultaReserva();

        }

        protected void grdAgendaMorador_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            
            
        }

        protected void grdAgendaMorador_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void grdAgendaMorador_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            
        }

        protected void grdChurras_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            


            }

        protected void grdChurras_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            
        }
        

      
        

        protected void imgBtExcelFesta_Click(object sender, ImageClickEventArgs e)
        {
            if (grdAgendaMorador.Rows.Count > 0)
            {

                exportando = true;

                Response.ClearContent();

                Response.AddHeader("content-disposition", "attachment;filename=SalaoFesta" + drpMeses.SelectedItem.Text + "/" + drpAno.Text + ".xls");

                Response.Charset = "";

                // If you want the option to open the Excel file without saving than

                // comment out the line below

                Response.Cache.SetCacheability(HttpCacheability.NoCache);

                Response.ContentType = "application/ms-excel";

                Response.ContentEncoding = Encoding.UTF8;
                Response.Charset = "UTF-8";


                System.IO.StringWriter stringWrite = new System.IO.StringWriter();

                System.Web.UI.HtmlTextWriter htmlWrite = new HtmlTextWriter(stringWrite);


                grdAgendaMorador.RenderControl(htmlWrite);
                Response.Write(stringWrite.ToString());
                Response.End();

            }

        }

        protected void imgBtExcelChurras_Click(object sender, ImageClickEventArgs e)
        {


            if (grdChurras.Rows.Count > 0)
            {

                exportando = true;

                Response.ClearContent();

                Response.AddHeader("content-disposition", "attachment;filename=AreaChurrasco"+drpMeses.SelectedItem.Text+"/"+drpAno.Text+".xls");

                Response.Charset = "";

                // If you want the option to open the Excel file without saving than

                // comment out the line below
               Response.ContentEncoding = Encoding.UTF8;
                Response.Charset = "UTF-8";

                Response.Cache.SetCacheability(HttpCacheability.NoCache);

                Response.ContentType = "application/ms-excel";

                System.IO.StringWriter stringWrite = new System.IO.StringWriter();

                System.Web.UI.HtmlTextWriter htmlWrite = new HtmlTextWriter(stringWrite);


                grdChurras.RenderControl(htmlWrite);
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