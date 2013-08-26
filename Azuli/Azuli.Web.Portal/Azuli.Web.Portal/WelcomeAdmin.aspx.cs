using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Azuli.Web.Business;
using Azuli.Web.Model;
using System.Drawing;
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
        string status = "";

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
                    if (item.salaoChurrasco == true & item.salaoFesta == false & item.statusPagamento != "N" )
                    {

                       // e.Cell.BackColor = System.Drawing.ColorTranslator.FromHtml("#FFFF01");
                        TextBox t1 = new TextBox();
                        t1.Font.Bold = true;
                        t1.ID = "t" + e.Day.DayNumberText + e.Day.Date.Month.ToString();
                        t1.Width = 90;
                        t1.Height = 20;
                        t1.TextMode = TextBoxMode.SingleLine;
                        t1.Font.Size = 8;
                        t1.ForeColor = Color.Black;

                        System.Web.UI.WebControls.Image imgReserva = new System.Web.UI.WebControls.Image();
                        imgReserva.Width = 20;
                        imgReserva.Height = 20;




                        TextBox t2 = new TextBox();
                        t2.Font.Bold = true;
                        t2.ID = "t" + e.Day.DayNumberText + e.Day.Date.Month.ToString();
                        t2.Width = 90;
                        t2.Height = 20;
                        t2.TextMode = TextBoxMode.SingleLine;
                        t2.Font.Size = 8;
                        t2.ForeColor = Color.Black;
                        int count = 0;
                      
                        OeventCalendar = oAgenda.listaEventos_ByCalendar(item.dataAgendamento);
                        foreach (var quemAlugou in OeventCalendar)
                        {
                            if (OeventCalendar.Count >= 2)
                                if (count == 0)
                                {
                                    if (quemAlugou.statusPagamento == "N" && quemAlugou.salaoFesta == true)
                                    {
                                        status = "SFP";
                                        t1.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                        t1.ForeColor = Color.Red;
                                        imgReserva.ImageUrl = "images/salaoFesta.jpg";
                                    }
                                    else
                                    {
                                        status = "SFR";
                                        t1.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                        t1.ForeColor = Color.Green;
                                        imgReserva.ImageUrl = "images/salaoFesta.jpg";
                                    }
                                    if (quemAlugou.statusPagamento == "N" && quemAlugou.salaoChurrasco == true)
                                    {
                                        status = "CHP";
                                        t1.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                        t1.ForeColor = Color.Red;
                                        imgReserva.ImageUrl = "images/churrasco.jpg";
                                    }
                                    else
                                    {
                                        status = "CHR";
                                        t1.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                        t1.ForeColor = Color.Green;
                                        imgReserva.ImageUrl = "images/churrasco.jpg";
                                    }
                                   // t1.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status ;
                                    count = 1;
                                }
                                else
                                {
                                    if (quemAlugou.statusPagamento == "N" && quemAlugou.salaoFesta == true)
                                    {
                                        status = "SFP";
                                        t2.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                        t2.ForeColor = Color.Red;
                                        imgReserva.ImageUrl = "images/salaoFesta.jpg";
                                    }
                                    else
                                    {
                                        status = "SFR";
                                        t2.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                        t2.ForeColor = Color.Green;
                                        imgReserva.ImageUrl = "images/salaoFesta.jpg";
                                    }
                                    if (quemAlugou.statusPagamento == "N" && quemAlugou.salaoChurrasco == true)
                                    {
                                        status = "CHP";
                                        t2.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                        t2.ForeColor = Color.Red;
                                        imgReserva.ImageUrl = "images/churrasco.jpg";

                                    }
                                    else
                                    {
                                        status = "CHR";
                                        t2.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                        t2.ForeColor = Color.Green;
                                        imgReserva.ImageUrl = "images/churrasco.jpg";
                                    }
                                   // t2.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                }
                            else
                            {

                                if (quemAlugou.statusPagamento == "N" && quemAlugou.salaoFesta == true)
                                {
                                    status = "SFP";
                                    t1.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                    t1.ForeColor = Color.Red;
                                    imgReserva.ImageUrl = "images/salaoFesta.jpg";
                                }
                                if (quemAlugou.statusPagamento == "S" && quemAlugou.salaoFesta == true)
                                {
                                    status = "SFR";
                                    t1.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                    t1.ForeColor = Color.Green;
                                    imgReserva.ImageUrl = "images/salaoFesta.jpg";
                                }
                                if (quemAlugou.statusPagamento == "N" && quemAlugou.salaoChurrasco == true)
                                {
                                    status = "CHP";
                                    t1.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                    t1.ForeColor = Color.Red;
                                    imgReserva.ImageUrl = "images/churrasco.jpg";
                                }
                                if (quemAlugou.statusPagamento == "S" && quemAlugou.salaoChurrasco == true)
                                {
                                    status = "CHR";
                                    t1.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                    t1.ForeColor = Color.Green;
                                    imgReserva.ImageUrl = "images/churrasco.jpg";
                                }
                               
                                //t1.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;

                            }

                        }

                        Panel p1 = new Panel();
                        p1.ID = "p" + e.Day.DayNumberText + e.Day.Date.Month.ToString(); ;
                        p1.Attributes.Add("style", "display:block;");
                        p1.Attributes.Add("style", "display:block;");
                        p1.Controls.Add(t1);
                        p1.Controls.Add(imgReserva);

                        if (t2.Text != "")
                        {
                            p1.Controls.Add(t2);
                        }
                        e.Cell.Controls.Add(p1);
                        e.Cell.Height = 50;
                        e.Cell.Attributes.Add("onmouseover", "ShowInfo('" + p1.ClientID + "')");
                        e.Cell.Attributes.Add("onmouseout", "HideInfo('" + p1.ClientID + "')");



                    }
                    else if (item.salaoChurrasco == false & item.salaoFesta == true & item.statusPagamento != "N")
                    {

                       // e.Cell.BackColor = System.Drawing.ColorTranslator.FromHtml("#BADEF4");
                        TextBox t1 = new TextBox();
                        t1.Font.Bold = true;
                        t1.ID = "t" + e.Day.DayNumberText + e.Day.Date.Month.ToString();
                        t1.Width = 90;
                        t1.Height = 20;
                        t1.TextMode = TextBoxMode.SingleLine;
                        t1.Font.Size = 8;
                        t1.ForeColor = Color.Black;

                        System.Web.UI.WebControls.Image imgReserva = new System.Web.UI.WebControls.Image();
                        imgReserva.Width = 20;
                        imgReserva.Height = 20;

                        TextBox t2 = new TextBox();
                        t2.Font.Bold = true;
                        t2.ID = "t" + e.Day.DayNumberText + e.Day.Date.Month.ToString();
                        t2.Width = 90;
                        t2.Height = 20;
                        t2.TextMode = TextBoxMode.SingleLine;
                        t2.Font.Size = 8;
                        t2.ForeColor = Color.Black;
                        int count = 0;

                        OeventCalendar = oAgenda.listaEventos_ByCalendar(item.dataAgendamento);
                        foreach (var quemAlugou in OeventCalendar)
                        {
                            if (OeventCalendar.Count >= 2)
                                if (count == 0)
                                {
                                    if (quemAlugou.statusPagamento == "N" && quemAlugou.salaoFesta == true)
                                    {
                                        status = "SFP";
                                        t1.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                        t1.ForeColor = Color.Red;
                                        imgReserva.ImageUrl = "images/salaoFesta.jpg";
                                    }

                                    else
                                    {
                                        status = "SFR";
                                        t1.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                        t1.ForeColor = Color.Green;
                                        imgReserva.ImageUrl = "images/salaoFesta.jpg";
                                    }
                                    if (quemAlugou.statusPagamento == "N" && quemAlugou.salaoChurrasco == true)
                                    {
                                        status = "CHP";
                                        t1.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                        t1.ForeColor = Color.Red;
                                        imgReserva.ImageUrl = "images/churrasco.jpg";
                                    }
                                    else
                                    {
                                        status = "CHR";
                                        t1.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                        t1.ForeColor = Color.Green;
                                        imgReserva.ImageUrl = "images/churrasco.jpg";
                                    }
                                   // t1.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                    count = 1;
                                }
                                else
                                {
                                    if (quemAlugou.statusPagamento == "N" && quemAlugou.salaoFesta == true)
                                    {
                                        status = "SFP";
                                        t2.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                        t2.ForeColor = Color.Red;
                                        imgReserva.ImageUrl = "images/salaoFesta.jpg";
                                    }
                                    else
                                    {
                                        status = "SFR";
                                        t2.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                        t2.ForeColor = Color.Green;
                                        imgReserva.ImageUrl = "images/salaoFesta.jpg";
                                    }
                                    if (quemAlugou.statusPagamento == "N" && quemAlugou.salaoChurrasco == true)
                                    {
                                        status = "CHP";
                                        t2.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                        t2.ForeColor = Color.Red;
                                        imgReserva.ImageUrl = "images/churrasco.jpg";
                                    }
                                    else
                                    {
                                        status = "CHR";
                                        t2.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                        t2.ForeColor = Color.Green;
                                        imgReserva.ImageUrl = "images/churrasco.jpg";
                                    }
                                    //t2.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                }
                            else
                            {
                                if (quemAlugou.statusPagamento == "N" && quemAlugou.salaoFesta == true)
                                {
                                    status = "SFP";
                                    t1.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                    t1.ForeColor = Color.Red;
                                    imgReserva.ImageUrl = "images/salaoFesta.jpg";
                                }
                                else
                                {
                                    status = "SFR";
                                    t1.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                    t1.ForeColor = Color.Green;
                                    imgReserva.ImageUrl = "images/salaoFesta.jpg";
                                }
                                if (quemAlugou.statusPagamento == "N" && quemAlugou.salaoChurrasco == true)
                                {
                                    status = "CHP";
                                    t1.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                    t1.ForeColor = Color.Red;
                                    imgReserva.ImageUrl = "images/churrasco.jpg";
                                }
                                else
                                {
                                    status = "CHR";
                                    t1.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                    t1.ForeColor = Color.Green;
                                    imgReserva.ImageUrl = "images/churrasco.jpg";
                                }
                                // t1.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;

                            }

                        }

                        Panel p1 = new Panel();
                        p1.ID = "p" + e.Day.DayNumberText + e.Day.Date.Month.ToString(); ;
                        p1.Attributes.Add("style", "display:block;");
                        p1.Attributes.Add("style", "display:block;");
                        p1.Controls.Add(t1);
                        p1.Controls.Add(imgReserva);


                        if (t2.Text != "")
                        {
                            p1.Controls.Add(t2);
                        }
                        e.Cell.Controls.Add(p1);
                        e.Cell.Height = 50;
                        e.Cell.Attributes.Add("onmouseover", "ShowInfo('" + p1.ClientID + "')");
                        e.Cell.Attributes.Add("onmouseout", "HideInfo('" + p1.ClientID + "')");


                    }
                    else if (item.salaoChurrasco == true & item.salaoFesta == true & item.statusPagamento != "N")
                    {

                      //  e.Cell.BackColor = System.Drawing.ColorTranslator.FromHtml("#AA0708");
                        TextBox t1 = new TextBox();
                        t1.Font.Bold = true;
                        t1.ID = "t" + e.Day.DayNumberText + e.Day.Date.Month.ToString();
                        t1.Width = 90;
                        t1.Height = 20;
                        t1.TextMode = TextBoxMode.SingleLine;
                        t1.Font.Size = 8;
                        t1.ForeColor = Color.Black;

                        System.Web.UI.WebControls.Image imgReserva = new System.Web.UI.WebControls.Image();
                        imgReserva.Width = 20;
                        imgReserva.Height = 20;

                        TextBox t2 = new TextBox();
                        t2.Font.Bold = true;
                        t2.ID = "t" + e.Day.DayNumberText + e.Day.Date.Month.ToString();
                        t2.Width = 90;
                        t2.Height = 20;
                        t2.TextMode = TextBoxMode.SingleLine;
                        t2.Font.Size = 8;
                        t2.ForeColor = Color.Black;
                        int count = 0;

                        OeventCalendar = oAgenda.listaEventos_ByCalendar(item.dataAgendamento);
                        foreach (var quemAlugou in OeventCalendar)
                        {
                            if (OeventCalendar.Count >= 2)
                                if (count == 0)
                                {
                                    if (quemAlugou.statusPagamento == "N" && quemAlugou.salaoFesta == true)
                                    {
                                        status = "SFP";
                                        t1.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                        t1.ForeColor = Color.Red;
                                        imgReserva.ImageUrl = "images/salaoFesta.jpg";
                                    }
                                    if (quemAlugou.statusPagamento == "S" && quemAlugou.salaoFesta == true)
                                    {
                                        status = "SFR";
                                        t1.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                        t1.ForeColor = Color.Green;
                                        imgReserva.ImageUrl = "images/salaoFesta.jpg";
                                    }
                                    if (quemAlugou.statusPagamento == "N" && quemAlugou.salaoChurrasco == true)
                                    {
                                        status = "CHP";
                                        t1.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                        t1.ForeColor = Color.Red;
                                        imgReserva.ImageUrl = "images/churrasco.jpg";
                                    }
                                    if (quemAlugou.statusPagamento == "S" && quemAlugou.salaoChurrasco == true)
                                    {
                                        status = "CHR";
                                        t1.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                        t1.ForeColor = Color.Green;
                                        imgReserva.ImageUrl = "images/churrasco.jpg";
                                    }
                                    //t1.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                    count = 1;
                                }
                                else
                                {
                                    if (quemAlugou.statusPagamento == "N" && quemAlugou.salaoFesta == true)
                                    {
                                        status = "SFP";
                                        t2.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                        t2.ForeColor = Color.Red;
                                        imgReserva.ImageUrl = "images/salaoFesta.jpg";
                                    }
                                    if (quemAlugou.statusPagamento == "S" && quemAlugou.salaoFesta == true)
                                    {
                                        status = "SFR";
                                        t2.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                        t2.ForeColor = Color.Green;
                                        imgReserva.ImageUrl = "images/salaoFesta.jpg";
                                    }
                                    if (quemAlugou.statusPagamento == "N" && quemAlugou.salaoChurrasco == true)
                                    {
                                        status = "CHP";
                                        t2.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                        t2.ForeColor = Color.Red;
                                        imgReserva.ImageUrl = "images/churrasco.jpg";
                                    }
                                    if (quemAlugou.statusPagamento == "S" && quemAlugou.salaoChurrasco == true)
                                    {
                                        status = "CHR";
                                        t2.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                        t2.ForeColor = Color.Green;
                                        imgReserva.ImageUrl = "images/churrasco.jpg";
                                    }
                                   // t2.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                }
                            else
                            {
                                if (quemAlugou.statusPagamento == "N" && quemAlugou.salaoFesta == true)
                                {
                                    status = "SFP";
                                    t2.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                    t2.ForeColor = Color.Red;
                                    t1.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                    t1.ForeColor = Color.Red;
                                    imgReserva.ImageUrl = "images/salaoFesta.jpg";
                                }
                                if (quemAlugou.statusPagamento == "S" && quemAlugou.salaoFesta == true)
                                {
                                    status = "SFR";
                                    t2.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                    t2.ForeColor = Color.Green;
                                    t1.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                    t1.ForeColor = Color.Green;
                                    imgReserva.ImageUrl = "images/salaoFesta.jpg";
                                }
                                if (quemAlugou.statusPagamento == "N" && quemAlugou.salaoChurrasco == true)
                                {
                                    status = "CHP";
                                    t2.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                    t2.ForeColor = Color.Red;
                                    t1.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                    t1.ForeColor = Color.Red;
                                    imgReserva.ImageUrl = "images/churrasco.jpg";
                                }
                                if (quemAlugou.statusPagamento == "S" && quemAlugou.salaoChurrasco == true)
                                {
                                    status = "CHR";
                                    t2.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                    t2.ForeColor = Color.Green;
                                    t1.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                    t1.ForeColor = Color.Green;
                                    imgReserva.ImageUrl = "images/churrasco.jpg";
                                }
                               // t2.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                               // t1.Text = "As duas P/";
                            }

                        }

                        Panel p1 = new Panel();
                        p1.ID = "p" + e.Day.DayNumberText + e.Day.Date.Month.ToString(); ;
                        p1.Attributes.Add("style", "display:block;");
                        p1.Attributes.Add("style", "display:block;");
                        p1.Controls.Add(t1);

                        p1.Controls.Add(imgReserva);

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

                    /// Status Pendente
                    /// 
                    else if (item.salaoChurrasco == true & item.salaoFesta == false & item.statusPagamento != "S")
                    {

                      //  e.Cell.BackColor = System.Drawing.ColorTranslator.FromHtml("#FF8000");
                        TextBox t1 = new TextBox();
                        t1.Font.Bold = true;
                        t1.ID = "t" + e.Day.DayNumberText + e.Day.Date.Month.ToString();
                        t1.Width = 90;
                        t1.Height = 20;
                        t1.TextMode = TextBoxMode.SingleLine;
                        t1.Font.Size = 8;
                        t1.ForeColor = Color.Black;


                        System.Web.UI.WebControls.Image imgReserva = new System.Web.UI.WebControls.Image();
                        imgReserva.Width = 20;
                        imgReserva.Height = 20;

                        TextBox t2 = new TextBox();
                        t2.Font.Bold = true;
                        t2.ID = "t" + e.Day.DayNumberText + e.Day.Date.Month.ToString();
                        t2.Width = 90;
                        t2.Height = 20;
                        t2.TextMode = TextBoxMode.SingleLine;
                        t2.Font.Size = 8;
                        t2.ForeColor = Color.Black;
                        int count = 0;

                        OeventCalendar = oAgenda.listaEventos_ByCalendar(item.dataAgendamento);
                        foreach (var quemAlugou in OeventCalendar)
                        {
                            if (OeventCalendar.Count >= 2)
                                if (count == 0)
                                {
                                    if (quemAlugou.statusPagamento == "N" && quemAlugou.salaoFesta == true)
                                    {
                                        status = "SFP";
                                        t1.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                        t1.ForeColor = Color.Red;
                                        imgReserva.ImageUrl = "images/salaoFesta.jpg";
                                    }
                                    if (quemAlugou.statusPagamento == "S" && quemAlugou.salaoFesta == true)
                                    {
                                        status = "SFR";
                                        t1.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                        t1.ForeColor = Color.Green;
                                        imgReserva.ImageUrl = "images/salaoFesta.jpg";
                                    }
                                    if (quemAlugou.statusPagamento == "N" && quemAlugou.salaoChurrasco == true)
                                    {
                                        status = "CHP";
                                        t1.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                        t1.ForeColor = Color.Red;
                                        imgReserva.ImageUrl = "images/churrasco.jpg";
                                    }
                                    if (quemAlugou.statusPagamento == "S" && quemAlugou.salaoChurrasco == true)
                                    {
                                        status = "CHR";
                                        t1.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                        t1.ForeColor = Color.Green;
                                        imgReserva.ImageUrl = "images/churrasco.jpg";
                                    }
                                   // t1.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                    count = 1;
                                }
                                else
                                {
                                    if (quemAlugou.statusPagamento == "N" && quemAlugou.salaoFesta == true)
                                    {
                                        status = "SFP";
                                        t2.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                        t2.ForeColor = Color.Red;
                                        imgReserva.ImageUrl = "images/salaoFesta.jpg";
                                    }
                                    if (quemAlugou.statusPagamento == "S" && quemAlugou.salaoFesta == true)
                                    {
                                        status = "SFR";
                                        t2.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                        t2.ForeColor = Color.Green;
                                        imgReserva.ImageUrl = "images/salaoFesta.jpg";
                                    }
                                    if (quemAlugou.statusPagamento == "N" && quemAlugou.salaoChurrasco == true)
                                    {
                                        status = "CHP";
                                        t2.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                        t2.ForeColor = Color.Red;
                                        imgReserva.ImageUrl = "images/churrasco.jpg";
                                    }
                                    if (quemAlugou.statusPagamento == "S" && quemAlugou.salaoChurrasco == true)
                                    {
                                        status = "CHR";
                                        t2.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                        t2.ForeColor = Color.Green;
                                        imgReserva.ImageUrl = "images/churrasco.jpg";
                                    }
                                   // t2.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                }
                            else
                            {
                                if (quemAlugou.statusPagamento == "N" && quemAlugou.salaoFesta == true)
                                {
                                    status = "SFP";
                                    t1.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                    t1.ForeColor = Color.Red;
                                    imgReserva.ImageUrl = "images/salaoFesta.jpg";
                                }
                                if (quemAlugou.statusPagamento == "S" && quemAlugou.salaoFesta == true)
                                {
                                    status = "SFR";
                                    t1.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                    t1.ForeColor = Color.Green;
                                    imgReserva.ImageUrl = "images/salaoFesta.jpg";
                                }
                                if (quemAlugou.statusPagamento == "N" && quemAlugou.salaoChurrasco == true)
                                {
                                    status = "CHP";
                                    t1.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                    t1.ForeColor = Color.Red;
                                    imgReserva.ImageUrl = "images/churrasco.jpg";
                                }
                                if (quemAlugou.statusPagamento == "S" && quemAlugou.salaoChurrasco == true)
                                {
                                    status = "CHR";
                                    t1.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                    t1.ForeColor = Color.Green;
                                    imgReserva.ImageUrl = "images/churrasco.jpg";
                                }
                                //t1.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;

                            }

                        }

                        Panel p1 = new Panel();
                        p1.ID = "p" + e.Day.DayNumberText + e.Day.Date.Month.ToString(); ;
                        p1.Attributes.Add("style", "display:block;");
                        p1.Attributes.Add("style", "display:block;");
                        p1.Controls.Add(t1);


                        p1.Controls.Add(imgReserva);
                        imgReserva.Width = 20;
                        imgReserva.Height = 20;

                        if (t2.Text != "")
                        {
                            p1.Controls.Add(t2);
                        }
                        e.Cell.Controls.Add(p1);
                        e.Cell.Height = 50;
                        e.Cell.Attributes.Add("onmouseover", "ShowInfo('" + p1.ClientID + "')");
                        e.Cell.Attributes.Add("onmouseout", "HideInfo('" + p1.ClientID + "')");



                    }
                    else if (item.salaoChurrasco == false & item.salaoFesta == true & item.statusPagamento != "S")
                    {

                       // e.Cell.BackColor = System.Drawing.ColorTranslator.FromHtml("#1B6C81");
                        TextBox t1 = new TextBox();
                        t1.Font.Bold = true;
                        t1.ID = "t" + e.Day.DayNumberText + e.Day.Date.Month.ToString();
                        t1.Width = 90;
                        t1.Height = 20;
                        t1.TextMode = TextBoxMode.SingleLine;
                        t1.Font.Size = 8;
                        t1.ForeColor = Color.Black;


                        System.Web.UI.WebControls.Image imgReserva = new System.Web.UI.WebControls.Image();
                        imgReserva.Width = 20;
                        imgReserva.Height = 20;

                        TextBox t2 = new TextBox();
                        t2.Font.Bold = true;
                        t2.ID = "t" + e.Day.DayNumberText + e.Day.Date.Month.ToString();
                        t2.Width = 90;
                        t2.Height = 20;
                        t2.TextMode = TextBoxMode.SingleLine;
                        t2.Font.Size = 8;
                        t2.ForeColor = Color.Black;
                        int count = 0;

                        OeventCalendar = oAgenda.listaEventos_ByCalendar(item.dataAgendamento);
                        foreach (var quemAlugou in OeventCalendar)
                        {
                            if (OeventCalendar.Count >= 2)
                                if (count == 0)
                                {
                                    if (quemAlugou.statusPagamento == "N" && quemAlugou.salaoFesta == true)
                                    {
                                        status = "SFP";
                                        t1.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                        t1.ForeColor = Color.Red;
                                        imgReserva.ImageUrl = "images/salaoFesta.jpg";
                                    }
                                    if (quemAlugou.statusPagamento == "S" && quemAlugou.salaoFesta == true)
                                    {
                                        status = "SFR";
                                        t1.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                        t1.ForeColor = Color.Green;
                                        imgReserva.ImageUrl = "images/salaoFesta.jpg";
                                    }
                                    if (quemAlugou.statusPagamento == "N" && quemAlugou.salaoChurrasco == true)
                                    {
                                        status = "CHP";
                                        t1.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                        t1.ForeColor = Color.Red;
                                        imgReserva.ImageUrl = "images/churrasco.jpg";
                                    }
                                    if (quemAlugou.statusPagamento == "S" && quemAlugou.salaoChurrasco == true)
                                    {
                                        status = "CHR";
                                        t1.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                        t1.ForeColor = Color.Green;
                                        imgReserva.ImageUrl = "images/churrasco.jpg";
                                    }
                                   
                                    count = 1;
                                }
                                else
                                {
                                    if (quemAlugou.statusPagamento == "N" && quemAlugou.salaoFesta == true)
                                    {
                                        status = "SFP";
                                        t2.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                        t2.ForeColor = Color.Red;
                                        imgReserva.ImageUrl = "images/salaoFesta.jpg";
                                    }
                                    if (quemAlugou.statusPagamento == "S" && quemAlugou.salaoFesta == true)
                                    {
                                        status = "SFR";
                                        t2.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                        t2.ForeColor = Color.Green;
                                        imgReserva.ImageUrl = "images/salaoFesta.jpg";
                                    }
                                    if (quemAlugou.statusPagamento == "N" && quemAlugou.salaoChurrasco == true)
                                    {
                                        status = "CHP";
                                        t2.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                        t2.ForeColor = Color.Red;
                                        imgReserva.ImageUrl = "images/churrasco.jpg";
                                    }
                                    if (quemAlugou.statusPagamento == "S" && quemAlugou.salaoChurrasco == true)
                                    {
                                        status = "CHR";
                                        t2.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                        t2.ForeColor = Color.Green;
                                        imgReserva.ImageUrl = "images/churrasco.jpg";
                                    }
                                    t2.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status; 
                                }
                            else
                            {
                                if (quemAlugou.statusPagamento == "N" && quemAlugou.salaoFesta == true)
                                {
                                    status = "SFP";
                                    t1.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                    t1.ForeColor = Color.Red;
                                    imgReserva.ImageUrl = "images/salaoFesta.jpg";
                                }
                                if (quemAlugou.statusPagamento == "S" && quemAlugou.salaoFesta == true)
                                {
                                    status = "SFR";
                                    t1.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                    t1.ForeColor = Color.Green;
                                    imgReserva.ImageUrl = "images/salaoFesta.jpg";
                                }
                                if (quemAlugou.statusPagamento == "N" && quemAlugou.salaoChurrasco == true)
                                {
                                    status = "CHP";
                                    t1.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                    t1.ForeColor = Color.Red;
                                    imgReserva.ImageUrl = "images/churrasco.jpg";
                                }
                                if (quemAlugou.statusPagamento == "S" && quemAlugou.salaoChurrasco == true)
                                {
                                    status = "CHR";
                                    t1.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                    t1.ForeColor = Color.Green;
                                    imgReserva.ImageUrl = "images/churrasco.jpg";
                                }
                            

                            }

                        }

                        Panel p1 = new Panel();
                        p1.ID = "p" + e.Day.DayNumberText + e.Day.Date.Month.ToString(); ;
                        p1.Attributes.Add("style", "display:block;");
                        p1.Attributes.Add("style", "display:block;");
                        p1.Controls.Add(t1);

                        p1.Controls.Add(imgReserva);

                        if (t2.Text != "")
                        {
                            p1.Controls.Add(t2);
                        }
                        e.Cell.Controls.Add(p1);
                        e.Cell.Height = 60;
                        e.Cell.Attributes.Add("onmouseover", "ShowInfo('" + p1.ClientID + "')");
                        e.Cell.Attributes.Add("onmouseout", "HideInfo('" + p1.ClientID + "')");


                    }
                    else if (item.salaoChurrasco == true & item.salaoFesta == true & item.statusPagamento != "S")
                    {

                       // e.Cell.BackColor = System.Drawing.ColorTranslator.FromHtml("#FB9FB7");
                        TextBox t1 = new TextBox();
                        t1.Font.Bold = true;
                        t1.ID = "t" + e.Day.DayNumberText + e.Day.Date.Month.ToString();
                        t1.Width = 90;
                        t1.Height = 20;
                        t1.TextMode = TextBoxMode.SingleLine;
                        t1.Font.Size = 8;
                        t1.ForeColor = Color.Black;


                        System.Web.UI.WebControls.Image imgReserva = new System.Web.UI.WebControls.Image();
                        imgReserva.Width = 20;
                        imgReserva.Height = 20;

                        TextBox t2 = new TextBox();
                        t2.Font.Bold = true;
                        t2.ID = "t" + e.Day.DayNumberText + e.Day.Date.Month.ToString();
                        t2.Width = 90;
                        t2.Height = 20;
                        t2.TextMode = TextBoxMode.SingleLine;
                        t2.Font.Size = 8;
                        t2.ForeColor = Color.Black;
                        int count = 0;

                        OeventCalendar = oAgenda.listaEventos_ByCalendar(item.dataAgendamento);
                        foreach (var quemAlugou in OeventCalendar)
                        {
                            if (OeventCalendar.Count >= 2)
                                if (count == 0)
                                {
                                    if (quemAlugou.statusPagamento == "N" && quemAlugou.salaoFesta == true)
                                    {
                                        status = "SFP";
                                        t1.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                        t1.ForeColor = Color.Red;
                                    }
                                    if (quemAlugou.statusPagamento == "S" && quemAlugou.salaoFesta == true)
                                    {
                                        status = "SFR";
                                        t1.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                        t1.ForeColor = Color.Green;
                                    }
                                    if (quemAlugou.statusPagamento == "N" && quemAlugou.salaoChurrasco == true)
                                    {
                                        status = "CHP";
                                        t1.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                        t1.ForeColor = Color.Red;
                                    }
                                    if (quemAlugou.statusPagamento == "S" && quemAlugou.salaoChurrasco == true)
                                    {
                                        status = "CHR";
                                        t1.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                        t1.ForeColor = Color.Green;
                                    }
                                   
                                    count = 1;
                                }
                                else
                                {
                                    if (quemAlugou.statusPagamento == "N" && quemAlugou.salaoFesta == true)
                                    {
                                        status = "SFP";
                                        t2.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                        t2.ForeColor = Color.Red;
                                    }
                                    if (quemAlugou.statusPagamento == "S" && quemAlugou.salaoFesta == true)
                                    {
                                        status = "SFR";
                                        t2.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                        t2.ForeColor = Color.Green;
                                    }
                                    if (quemAlugou.statusPagamento == "N" && quemAlugou.salaoChurrasco == true)
                                    {
                                        status = "CHP";
                                        t2.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                        t2.ForeColor = Color.Red;
                                    }
                                    if (quemAlugou.statusPagamento == "S" && quemAlugou.salaoChurrasco == true)
                                    {
                                        status = "CHR";
                                        t2.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                        t2.ForeColor = Color.Green;
                                    }
                                    
                                }
                            else
                            {
                                if (quemAlugou.statusPagamento == "N" && quemAlugou.salaoFesta == true)
                                {
                                    status = "SFP";
                                    t2.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                    t2.ForeColor = Color.Red;
                                    t1.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                    t1.ForeColor = Color.Red;
                                }
                                if (quemAlugou.statusPagamento == "S" && quemAlugou.salaoFesta == true)
                                {
                                    status = "SFR";
                                    t2.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                    t2.ForeColor = Color.Green;
                                    t1.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                    t1.ForeColor = Color.Green;
                                }
                                if (quemAlugou.statusPagamento == "N" && quemAlugou.salaoChurrasco == true)
                                {
                                    status = "CHP";
                                    t2.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                    t2.ForeColor = Color.Red;
                                    t1.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                    t1.ForeColor = Color.Red;
                                }
                                if (quemAlugou.statusPagamento == "S" && quemAlugou.salaoChurrasco == true)
                                {
                                    status = "CHR";
                                    t2.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                    t2.ForeColor = Color.Green;
                                    t1.Text = "B-" + quemAlugou.ap.bloco.ToString() + " A-" + quemAlugou.ap.apartamento + " →" + status;
                                    t1.ForeColor = Color.Green;
                                }
                             
                                //t1.Text = "As duas P/";
                            }

                        }

                        Panel p1 = new Panel();
                        p1.ID = "p" + e.Day.DayNumberText + e.Day.Date.Month.ToString(); ;
                        p1.Attributes.Add("style", "display:block;");
                        p1.Attributes.Add("style", "display:block;");
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

                    /* FIM */

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

        protected void imgReclamacai_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("ListaReclamacaoAbertaAdmin.aspx");
        }

        protected void Calendar2_SelectionChanged(object sender, EventArgs e)
        {
           Session["dataReservaAdministrador"] = Calendar2.SelectedDate.ToString("dd/MM/yyyy");
           Response.Redirect("AreaAdministrativa.aspx"); 

        
        }
    }
}