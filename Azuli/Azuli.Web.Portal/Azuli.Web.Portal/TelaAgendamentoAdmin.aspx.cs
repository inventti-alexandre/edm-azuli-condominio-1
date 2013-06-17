using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Azuli.Web.Business;
using Azuli.Web.Model;
using System.Globalization;
using System.Drawing;


namespace Azuli.Web.Portal
{
    public partial class TelaAgendamentoAdmin : Util.Base
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

                    escondeControl();
                    lblApartDesc.Text = Session["MoradorSemInternetAP"].ToString();
                    lblBlocoDesc.Text = Session["MoradorSemInternetBloco"].ToString();
                    if (Session["MoradorSemInternetNome2"].ToString() != "")
                    {
                        lblProprietarioDesc.Text = Session["MoradorSemInternetNome1"] + " & " + Session["MoradorSemInternetNome2"];
                    }
                    else
                    {
                        lblProprietarioDesc.Text = Session["MoradorSemInternetNome1"].ToString() ;
                    }

                 
                    

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


        public void escondeControl()
        {
            dvAlugar.Visible = false;
            DivConfirma.Visible = false;
           
           
        
        }
        
        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {

            List<AgendaModel> oLista = validaData(Calendar1.SelectedDate);
            lblData.Text = Calendar1.SelectedDate.ToString("dd/MM/yyyy");

            chkSalaoFesta.Visible = true;
            chkChurrascaria.Visible = true;
            
                foreach (var item in oLista)
                {

                    if (item.salaoChurrasco == false && item.salaoFesta == false)
                    {
                        chkSalaoFesta.Visible = true;
                        chkChurrascaria.Visible = true;
                    }
                    else
                    {

                        chkChurrascaria.Visible = item.salaoFesta;
                        chkSalaoFesta.Visible = item.salaoChurrasco; 
                    }



                    //if (item.salaoChurrasco == true & item.salaoFesta  == false)
                    //{
                    //    chkChurrascaria.Visible = false;
                    //    chkSalaoFesta.Visible = true;
                    //    chkSalaoFesta.Checked = true;
                    //}
                    //else if (item.salaoChurrasco == false & item.salaoFesta == true)
                    //{

                    //    chkSalaoFesta.Visible = false;
                    //    chkChurrascaria.Visible = true;
                    //    chkChurrascaria.Checked = true;

                    //}
                    //else if (item.salaoChurrasco == false & item.salaoFesta == false)
                    //{

                    //    chkSalaoFesta.Visible = false;
                    //    chkChurrascaria.Visible = false;
                    //    chkChurrascaria.Checked = false;

                    //}
                    //else if (item.salaoChurrasco == true & item.salaoFesta == true)
                    //{
                    //    chkSalaoFesta.Visible = true;
                    //    chkSalaoFesta.Visible = true;
                    //}
                }


                lblMsgData.Visible = false;
                dvAlugar.Visible = true;
                dvCalendar.Visible = false;
           
        }


        public List<AgendaModel> validaData(DateTime date)
        {
            List<AgendaModel> olistAgenda = new List<AgendaModel>();

            try
            {
                olistAgenda = oAgenda.listaEventosByData(date);

                return olistAgenda;

            }
          
            catch (Exception)
            {
                
                throw;
            }
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {

            if (chkChurrascaria.Checked || chkSalaoFesta.Checked)
            {

                bool salaoFesta = false;
                bool churrasco = false;

                if (chkSalaoFesta.Checked && chkChurrascaria.Checked)
                {
                    churrasco = true;
                    salaoFesta = true;
                }
                else if (chkSalaoFesta.Checked && !chkChurrascaria.Checked)
                {
                    salaoFesta = true;
                    churrasco = false; ;
                }

                else if (!chkSalaoFesta.Checked && chkChurrascaria.Checked)
                {
                    churrasco = true;
                    salaoFesta = false;
                }


                oAgendaModel.salaoChurrasco = churrasco;
                oAgendaModel.salaoFesta = salaoFesta;
                oApModel.apartamento = int.Parse(lblApartDesc.Text);
                oApModel.bloco = int.Parse(lblBlocoDesc.Text);


                try
                {
                    oAgenda.cadastrarAgenda(Convert.ToDateTime(lblData.Text), oApModel, oAgendaModel);

                    dvAlugar.Visible = false;
                    DivConfirma.Visible = true;
                    dvProprietario.Visible = false;

                    lblDataConfirma.Text = lblData.Text;
                    lblBlocoConfirma.Text = lblBlocoDesc.Text;
                    lblApConfirma.Text = lblApartDesc.Text;
                }
                catch (Exception error)
                {

                    throw error;
                }


              

            }
            else
            {
                lblReserva.Text = "Favor escolher uma das opções !!";
            }
        }



        protected void btnOKConfirma_Click(object sender, EventArgs e)
        {
            Response.Redirect("telaAgendamentoAdmin.aspx");
        }


        
        protected void btnSair_Click(object sender, EventArgs e)
        {
          
            Response.Redirect("telaAgendamentoAdmin.aspx");
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            HttpContext.Current.Response.Write("<script>window.print();</script>");
        }

        protected void btnOKConfirma_Click1(object sender, EventArgs e)
        {
            
            Response.Redirect("WelcomeAdmin.aspx");
        }

        protected void ImageButton1_Click1(object sender, ImageClickEventArgs e)
        {

            HttpContext.Current.Response.Write("<script>window.print();</script>");

        }

      
        protected void UpdateTimer_Tick(object sender, EventArgs e)
        {
           
        }

        protected void UpdateTimer_Tick1(object sender, EventArgs e)
        {
            try
            {

                System.Web.UI.WebControls.TableCell tabela = new TableCell();
                System.Web.UI.WebControls.CalendarDay calendario = new CalendarDay(DateTime.Now, false, false, false, false, "1");


                Calendar1_DayRender(this, new DayRenderEventArgs(tabela, calendario));

            }
            catch (Exception ex)
            {
                
                throw ex;
            }


          
            
        }

      
    

        }
        
    
}
    
