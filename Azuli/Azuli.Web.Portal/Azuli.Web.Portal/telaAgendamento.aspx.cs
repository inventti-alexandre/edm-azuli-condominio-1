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
                   //// lblApartDesc.Text = Session["AP"].ToString();
                   //// lblBlocoDesc.Text = Session["Bloco"].ToString();
                   // if (Session["Proprie2"].ToString() != "")
                   // {
                   //     lblProprietarioDesc.Text = Session["Proprie1"] + " & " + Session["Proprie2"];
                   // }
                   // else
                   // {
                   //     lblProprietarioDesc.Text = Session["Proprie1"].ToString();
                   // }
                    carregaAgendaMesAtual();

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
               
               
                if (e.Day.Date ==item.dataAgendamento)
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


        public void escondeControl()
        {
            dvOpcao.Visible = false;
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
                    if (item.salaoChurrasco == true & item.salaoFesta  == false)
                    {
                        chkChurrascaria.Visible = false;
                        chkSalaoFesta.Visible = true;
                        chkSalaoFesta.Checked = true;
                    }
                    else if (item.salaoChurrasco == false & item.salaoFesta == true)
                    {

                        chkSalaoFesta.Visible = false;
                        chkChurrascaria.Visible = true;
                        chkChurrascaria.Checked = true;

                    }
                    else if (item.salaoChurrasco == false & item.salaoFesta == false)
                    {

                        chkSalaoFesta.Visible = false;
                        chkChurrascaria.Visible = false;
                        chkChurrascaria.Checked = false;

                    }
                    else if (item.salaoChurrasco == true & item.salaoFesta == true)
                    {
                        chkSalaoFesta.Visible = true;
                        chkSalaoFesta.Visible = true;
                    }
                }

                lblMsgData.Visible = false;
                dvOpcao.Visible = true;
                dvCalendar.Visible = false;
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

                //bool salaoFesta = false;
                //bool churrasco = false;

                //if (chkSalaoFesta.Checked && chkChurrascaria.Checked)
                //{
                //    churrasco = true;
                //    salaoFesta = true;
                //}
                //else if (chkSalaoFesta.Checked && !chkChurrascaria.Checked)
                //{
                //    salaoFesta = true;
                //    churrasco = false;
                //}

                //else if (!chkSalaoFesta.Checked && chkChurrascaria.Checked)
                //{
                //    churrasco = true;
                //    salaoFesta = false;
                //}



                oAgendaModel.salaoChurrasco = chkChurrascaria.Checked;
                oAgendaModel.salaoFesta = chkSalaoFesta.Checked;
                oApModel.apartamento = int.Parse(Session["AP"].ToString());
                oApModel.bloco = int.Parse(Session["Bloco"].ToString());



                try
                {


               
                    oAgenda.cadastrarAgenda(Convert.ToDateTime(lblData.Text), oApModel, oAgendaModel);

                    dvOpcao.Visible = false;
                    DivConfirma.Visible = true;
                    dvProprietario.Visible = false;

                    lblDataConfirma.Text = lblData.Text;
                    lblBlocoConfirma.Text = Session["Bloco"].ToString();
                    lblApConfirma.Text = Session["AP"].ToString();


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

        protected void frvSalaoFesta_ItemDeleted(object sender, FormViewDeletedEventArgs e)
        {

        }

        protected void formVwChurrasco_ItemDeleting(object sender, FormViewDeleteEventArgs e)
        {



            const bool salaoFesta = false;
            const bool churrasqueira = true;
            DateTime dataAgendamento = new DateTime();
            string bloco = "";
            string ap = "";
            DataKey key = formVwChurrasco.DataKey;
            dataAgendamento = Convert.ToDateTime(key.Value);
            
            if (validaCancelamento(dataAgendamento))
            {
                bloco = Session["Bloco"].ToString();
                ap = Session["Ap"].ToString();
                oAP.apartamento = Convert.ToInt32(ap);
                oAP.bloco = Convert.ToInt32(bloco);


                try
                {
                    oAgenda.cancelaAgendamentoMorador(dataAgendamento, oAP, salaoFesta, churrasqueira);
                    formVwChurrasco.DataBind();
                }
                catch (Exception)
                {

                    throw;
                }
            }
         

        }

        protected void frvSalaoFesta_ItemDeleting(object sender, FormViewDeleteEventArgs e)
        {
           


                const bool  salaoFesta = true;
                const bool churrasqueira = false;
                DateTime dataAgendamento = new DateTime();
                string bloco = "";
                string ap = "";
                DataKey key = frvSalaoFesta.DataKey;
                dataAgendamento = Convert.ToDateTime(key.Value);
                
                if (validaCancelamento(dataAgendamento))
                {
                    bloco = Session["Bloco"].ToString();
                    ap = Session["Ap"].ToString();
                    oAP.apartamento = Convert.ToInt32(ap);
                    oAP.bloco = Convert.ToInt32(bloco);


                    try
                    {
                        oAgenda.cancelaAgendamentoMorador(dataAgendamento, oAP, salaoFesta, churrasqueira);
                        frvSalaoFesta.DataBind();
                    }
                    catch (Exception)
                    {

                        throw;
                    }
                }
        }

        public bool validaCancelamento(DateTime dataAgendamento)
        {

            int diasAgendado;
          
            diasAgendado = ((TimeSpan)(dataAgendamento - DateTime.Now)).Days;
            if (diasAgendado >= 15)
            {
                return true;
            }

            else
            {
                lblMgs.Text = "Só é permitido o cancelamento com 15 dias de antecedência e hoje faltam " + diasAgendado + " dias para reserva, excessões procure o síndico ramal 94";
               
                return false;
            }
        }
        
    }
}