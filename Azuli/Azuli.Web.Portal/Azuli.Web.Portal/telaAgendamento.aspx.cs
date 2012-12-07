using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Azuli.Web.Business;
using Azuli.Web.Model;
using System.Globalization;
namespace Azuli.Web.Portal
{
    public partial class telaAgendamento : Util.Base
    {
           AgendaBLL oAgenda = new AgendaBLL();
           AgendaModel oAgendaModel = new AgendaModel();
           ApartamentoModel oApModel = new ApartamentoModel();
           Util.Util oUtil = new Util.Util();
           ApartamentoModel oAP = new ApartamentoModel();

        protected void Page_Load(object sender, EventArgs e)
        {


            if (oUtil.validateSession())
            {
             
                if (!IsPostBack)
                {

                    escondeControl();
                    lblApartDesc.Text = Session["AP"].ToString();
                    lblBlocoDesc.Text = Session["Bloco"].ToString();
                    lblProprietarioDesc.Text = Session["Proprie1"] + " & " + Session["Proprie2"];
                    carregaAgendaMesAtual();

                }

            }
            
        }


        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {
            Literal litAlugado = new Literal();
            List<AgendaModel> listaAgenda = oAgenda.listaEventos();

            foreach (var item in listaAgenda)
            {
               
                if (e.Day.Date ==item.dataAgendamento)
                {

                    if (item.salaoChurrasco.Trim() == "S" & item.salaoFesta.Trim() == "N")
                    {
                        e.Cell.BackColor = System.Drawing.Color.Yellow;
                    }
                    else if (item.salaoChurrasco.Trim() == "N" & item.salaoFesta.Trim() == "S")
                    {
                        e.Cell.BackColor = System.Drawing.Color.PowderBlue;
                    }
                    else if (item.salaoChurrasco.Trim() == "S" & item.salaoFesta.Trim() == "S")
                    {
                        e.Cell.BackColor = System.Drawing.Color.Red;
                        e.Day.IsSelectable = false;
                    }
                }
            }
        }


        public void escondeControl()
        {
            dvOpcao.Visible = false;
            DivConfirma.Visible = false;
           
           
        
        }
        
        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            

            List<AgendaModel> oLista = validaData(Calendar1.SelectedDate);
            lblData.Text = Calendar1.SelectedDate.ToString("dd/MM/yyyy");
            if (Calendar1.SelectedDate < DateTime.Today.Date)
            {
                lblMsgData.Text = "A data: " + lblData.Text + " não é válida para agendamento, favor escolher uma data maior ou igual a data atual: " + DateTime.Now.ToString("dd/MM/yyyy");
            }
            else
            {
                foreach (var item in oLista)
                {
                    if (item.salaoChurrasco.Trim() == "S" & item.salaoFesta.Trim() == "N")
                    {
                        chkChurrascaria.Visible = false;
                        chkSalaoFesta.Visible = true;
                        chkSalaoFesta.Checked = true;
                    }
                    else if (item.salaoChurrasco.Trim() == "N" & item.salaoFesta.Trim() == "S")
                    {

                        chkSalaoFesta.Visible = false;
                        chkChurrascaria.Visible = true;
                        chkChurrascaria.Checked = true;

                    }
                    else if (item.salaoChurrasco.Trim() == "S" & item.salaoFesta.Trim() == "S")
                    {
                        chkSalaoFesta.Visible = true;
                        chkSalaoFesta.Visible = true;
                    }
                }

                lblMsgData.Visible = false;
                dvOpcao.Visible = true;
                dvCalendar.Visible = false;
            }
        }


        public List<AgendaModel> validaData(DateTime date)
        {
            List<AgendaModel> olistAgenda = new List<AgendaModel>();

            olistAgenda =  oAgenda.listaEventosByData(date);

            return olistAgenda;
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {

            if (chkChurrascaria.Checked || chkSalaoFesta.Checked)
            {

                string salaoFesta = "";
                string churrasco = "";

                if (chkSalaoFesta.Checked && chkChurrascaria.Checked)
                {
                    churrasco = "S";
                    salaoFesta = "S";
                }
                else if (chkSalaoFesta.Checked && !chkChurrascaria.Checked)
                {
                    salaoFesta = "S";
                    churrasco = "N";
                }

                else if (!chkSalaoFesta.Checked && chkChurrascaria.Checked)
                {
                    churrasco = "S";
                    salaoFesta = "N";
                }


                oAgendaModel.salaoChurrasco = churrasco;
                oAgendaModel.salaoFesta = salaoFesta;
                oApModel.apartamento = int.Parse(lblApartDesc.Text);
                oApModel.bloco = int.Parse(lblBlocoDesc.Text);



                try
                {


               
                    oAgenda.cadastrarAgenda(Convert.ToDateTime(lblData.Text), oApModel, oAgendaModel);

                    dvOpcao.Visible = false;
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


                carregaAgendaMesAtual();
            }
            else
            {
                lblReserva.Text = "Favor escolher uma das opções !!";
            }
        }

        protected void btnOKConfirma_Click(object sender, EventArgs e)
        {
            Response.Redirect("telaAgendamento.aspx");
        }


        public void carregaAgendaMesAtual()
        {
            oAgendaModel.dataAgendamento = DateTime.Now;
            lblMesAtual.Text = (DateTime.Now.ToString("MMMM", new CultureInfo("pt-BR"))).ToUpper() + "/" + DateTime.Now.Year;
            oAP.bloco = Convert.ToInt32(Session["Bloco"]);
            oAP.apartamento = Convert.ToInt32(Session["AP"]);

            

                formVwChurrasco.DataSource = oAgenda.listaReservaByMorador(oAP, oAgendaModel);
                formVwChurrasco.DataBind();

                frvSalaoFesta.DataSource = oAgenda.listaReservaByMoradorFesta(oAP, oAgendaModel);
                frvSalaoFesta.DataBind();
           
        }

        protected void btnSair_Click(object sender, EventArgs e)
        {
          
            Response.Redirect("telaAgendamento.aspx");
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            HttpContext.Current.Response.Write("<script>window.print();</script>");
        }

        protected void btnOKConfirma_Click1(object sender, EventArgs e)
        {
            Response.Redirect("telaAgendamento.aspx");
        }

        protected void ImageButton1_Click1(object sender, ImageClickEventArgs e)
        {

            HttpContext.Current.Response.Write("<script>window.print();</script>");

        }

        protected void formVwChurrasco_PageIndexChanging(object sender, FormViewPageEventArgs e)
        {
            formVwChurrasco.PageIndex = e.NewPageIndex;
            carregaAgendaMesAtual();
        }

        protected void frvSalaoFesta_PageIndexChanging(object sender, FormViewPageEventArgs e)
        {
            frvSalaoFesta.PageIndex = e.NewPageIndex;
            carregaAgendaMesAtual();
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