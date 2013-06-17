using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Azuli.Web.Business;
using Azuli.Web.Model;
using System.Drawing;

namespace Azuli.Web.Portal
{
    public partial class WelcomeAdmin : Util.Base
    {
       
        AgendaBLL oAgenda = new AgendaBLL();
        AgendaModel oAgendaModel = new AgendaModel();
        ApartamentoModel oApModel = new ApartamentoModel();
        Util.Util oUtil = new Util.Util();
        ApartamentoModel oAP = new ApartamentoModel();
        PendenciaAdminBLL oPendenciaBLL = new PendenciaAdminBLL();

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
                     preechePendencia();
                    
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

                    listAgenda OeventCalendar = new listAgenda();
                    if (item.salaoChurrasco == true & item.salaoFesta == false)
                    {

                        e.Cell.BackColor = System.Drawing.ColorTranslator.FromHtml("#FFFF01");
                        TextBox t1 = new TextBox();
                        t1.ID = "t" + e.Day.DayNumberText + e.Day.Date.Month.ToString();
                        t1.Width = 70;
                        t1.Height = 20;
                        t1.TextMode = TextBoxMode.SingleLine;
                        t1.Font.Size = 7;
                        t1.ForeColor = Color.Black;

                        TextBox t2 = new TextBox();
                        t2.ID = "t" + e.Day.DayNumberText + e.Day.Date.Month.ToString();
                        t2.Width = 70;
                        t2.Height = 20;
                        t2.TextMode = TextBoxMode.SingleLine;
                        t2.Font.Size = 7;
                        t2.ForeColor = Color.Black;
                        int count = 0;

                        OeventCalendar = oAgenda.listaEventos_ByCalendar(item.dataAgendamento);
                        foreach (var quemAlugou in OeventCalendar)
                        {
                            if (OeventCalendar.Count >= 2)
                                if (count == 0)
                                {
                                    t1.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento;
                                    count = 1;
                                }
                                else
                                {
                                    t2.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento;
                                }
                            else
                            {
                                t1.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento;

                            }

                        }

                        Panel p1 = new Panel();
                        p1.ID = "p" + e.Day.DayNumberText + e.Day.Date.Month.ToString(); ;
                        p1.Attributes.Add("style", "display:none;");
                        p1.Attributes.Add("style", "display:none;");
                        p1.Controls.Add(t1);

                        if (t2.Text != "")
                        {
                            p1.Controls.Add(t2);
                        }
                        e.Cell.Controls.Add(p1);
                        e.Cell.Height = 50;
                        e.Cell.Attributes.Add("onmouseover", "ShowInfo('" + p1.ClientID + "')");
                        e.Cell.Attributes.Add("onmouseout", "HideInfo('" + p1.ClientID + "')");



                    }
                    else if (item.salaoChurrasco == false & item.salaoFesta == true)
                    {

                        e.Cell.BackColor = System.Drawing.ColorTranslator.FromHtml("#BADEF4");
                        TextBox t1 = new TextBox();
                        t1.ID = "t" + e.Day.DayNumberText + e.Day.Date.Month.ToString();
                        t1.Width = 70;
                        t1.Height = 20;
                        t1.TextMode = TextBoxMode.SingleLine;
                        t1.Font.Size = 7;
                        t1.ForeColor = Color.Black;

                        TextBox t2 = new TextBox();
                        t2.ID = "t" + e.Day.DayNumberText + e.Day.Date.Month.ToString();
                        t2.Width = 70;
                        t2.Height = 20;
                        t2.TextMode = TextBoxMode.SingleLine;
                        t2.Font.Size = 7;
                        t2.ForeColor = Color.Black;
                        int count = 0;

                        OeventCalendar = oAgenda.listaEventos_ByCalendar(item.dataAgendamento);
                        foreach (var quemAlugou in OeventCalendar)
                        {
                            if (OeventCalendar.Count >= 2)
                                if (count == 0)
                                {
                                    t1.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento;
                                    count = 1;
                                }
                                else
                                {
                                    t2.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento;
                                }
                            else
                            {
                                t1.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento;

                            }

                        }

                        Panel p1 = new Panel();
                        p1.ID = "p" + e.Day.DayNumberText + e.Day.Date.Month.ToString(); ;
                        p1.Attributes.Add("style", "display:none;");
                        p1.Attributes.Add("style", "display:none;");
                        p1.Controls.Add(t1);

                        if (t2.Text != "")
                        {
                            p1.Controls.Add(t2);
                        }
                        e.Cell.Controls.Add(p1);
                        e.Cell.Height = 50;
                        e.Cell.Attributes.Add("onmouseover", "ShowInfo('" + p1.ClientID + "')");
                        e.Cell.Attributes.Add("onmouseout", "HideInfo('" + p1.ClientID + "')");


                    }
                    else if (item.salaoChurrasco == true & item.salaoFesta == true)
                    {

                        e.Cell.BackColor = System.Drawing.ColorTranslator.FromHtml("#AA0708");
                        TextBox t1 = new TextBox();
                        t1.ID = "t" + e.Day.DayNumberText + e.Day.Date.Month.ToString();
                        t1.Width = 70;
                        t1.Height = 20;
                        t1.TextMode = TextBoxMode.SingleLine;
                        t1.Font.Size = 7;
                        t1.ForeColor = Color.Black;

                        TextBox t2 = new TextBox();
                        t2.ID = "t" + e.Day.DayNumberText + e.Day.Date.Month.ToString();
                        t2.Width = 70;
                        t2.Height = 20;
                        t2.TextMode = TextBoxMode.SingleLine;
                        t2.Font.Size = 7;
                        t2.ForeColor = Color.Black;
                        int count = 0;

                        OeventCalendar = oAgenda.listaEventos_ByCalendar(item.dataAgendamento);
                        foreach (var quemAlugou in OeventCalendar)
                        {
                            if (OeventCalendar.Count >= 2)
                                if (count == 0)
                                {
                                    t1.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento;
                                    count = 1;
                                }
                                else
                                {
                                    t2.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento;
                                }
                            else
                            {
                                t2.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento;
                                t1.Text = "As duas P/";
                            }

                        }

                        Panel p1 = new Panel();
                        p1.ID = "p" + e.Day.DayNumberText + e.Day.Date.Month.ToString(); ;
                        p1.Attributes.Add("style", "display:none;");
                        p1.Attributes.Add("style", "display:none;");
                        p1.Controls.Add(t1);

                        if (t2.Text != "")
                        {
                            p1.Controls.Add(t2);
                        }
                        e.Cell.Controls.Add(p1);
                        e.Cell.Height = 50;
                        e.Cell.Attributes.Add("onmouseover", "ShowInfo('" + p1.ClientID + "')");
                        e.Cell.Attributes.Add("onmouseout", "HideInfo('" + p1.ClientID + "')");

                        e.Day.IsSelectable = false;
                    }
                }
            }
        }


        public void preechePendencia()
        {
            try
            {
                foreach (var item in oPendenciaBLL.listaPendenciaAdmin())
                {
                    lblLiberarMorador.Text =  item.qtdMoradorPendente.ToString();
                    lblLiberaOcorrencia.Text = item.qtdOcorrenciaPendente.ToString();
                    lblMsgRecebida.Text = item.qtdMensagemPendente.ToString();
                    lblLiberarReserva.Text = item.qtdAgendaNoPrazo.ToString();
                    
                }


            }
            catch (Exception)
            {
                
                throw;
            }

        }

        protected void imgLiberarMorador_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("liberaAcessoAdmin.aspx");
        }
    }
}