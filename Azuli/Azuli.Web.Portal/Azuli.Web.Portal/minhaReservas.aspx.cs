﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Azuli.Web.Business;
using Azuli.Web.Model;

namespace Azuli.Web.Portal
{
    public partial class minhaReservas : Util.Base
    {

        DateTime data = DateTime.Now;
        AgendaBLL oAgenda = new AgendaBLL();
        AgendaModel oAgendaModel = new AgendaModel();
        ApartamentoModel oAP = new ApartamentoModel();
        Util.Util oUtil = new Util.Util();

        protected void Page_PreInit(object sender, EventArgs e)
        {
            if (Page.Request.ServerVariables["http_user_agent"].ToLower().Contains("safari"))
            {
                Page.ClientTarget = "uplevel";
                
            }
        }

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
            oAgendaModel.dataAgendamento = Convert.ToDateTime(drpAno.SelectedItem.Value + "-" + drpMeses.SelectedItem.Value + "01");
            oAP.bloco = Convert.ToInt32(Session["Bloco"]);
            oAP.apartamento = Convert.ToInt32(Session["AP"]);

            if (drpSalao.SelectedItem.Text == "Festa")
            {
                dvFesta.Visible = true;
                dvChurrasco.Visible = false;
                grdReservaProgramadaFesta.DataSource = oAgenda.listaReservaByMoradorFesta(oAP, oAgendaModel);
                grdReservaProgramadaFesta.DataBind();

                //lblMsg.Visible = false;
                lblMesAnoFesta.Text = drpMeses.SelectedItem.Text + " / " + drpAno.SelectedItem.Text;
            }
            else if (drpSalao.SelectedItem.Text == "Churrasqueira")
            {

                grdReservaProgramadaChurras.DataSource = oAgenda.listaReservaByMorador(oAP, oAgendaModel);
                grdReservaProgramadaChurras.DataBind();
                dvChurrasco.Visible = true;
                dvFesta.Visible = false;
              //  lblMsg.Visible = false;
                lbMesAnoChurras.Text = drpMeses.SelectedItem.Text + " / " + drpAno.SelectedItem.Text;
            }
            else if (drpSalao.SelectedItem.Value == "1")
            {
                grdReservaProgramadaChurras.DataSource = oAgenda.listaReservaByMorador(oAP, oAgendaModel);
                grdReservaProgramadaChurras.DataBind();

                grdReservaProgramadaFesta.DataSource = oAgenda.listaReservaByMoradorFesta(oAP, oAgendaModel);
                grdReservaProgramadaFesta.DataBind();
              
                dvFesta.Visible = true;
               // lblMsg.Visible = false;
                lblMesAnoFesta.Text = drpMeses.SelectedItem.Text + " / " + drpAno.SelectedItem.Text;
                lbMesAnoChurras.Text = drpMeses.SelectedItem.Text + " / " + drpAno.SelectedItem.Text;
                dvChurrasco.Visible = true;
              
              //  lblMsg.Visible = false;


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
            
            const bool  salaoFesta = true;
            const bool churrasqueira = false;
            DateTime dataAgendamento = new DateTime();
            string bloco = "";
            string ap = "";

            

            if (e.CommandName == "Delete")
            {
                

                int index = int.Parse((string)e.CommandArgument);
                dataAgendamento = Convert.ToDateTime(grdReservaProgramadaChurras.DataKeys[index]["dataAgendamento"]);
                if (validaCancelamento(dataAgendamento))
                {
                    bloco = Session["Bloco"].ToString();
                    ap = Session["Ap"].ToString();
                    oAP.apartamento = Convert.ToInt32(ap);
                    oAP.bloco = Convert.ToInt32(bloco);


                    try
                    {
                        oAgenda.cancelaAgendamentoMorador(dataAgendamento, oAP, salaoFesta, churrasqueira);
                        grdReservaProgramadaChurras.DataBind();
                    }
                    catch (Exception)
                    {

                        throw;
                    }
                }

            }
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
            const bool salaoFesta = false;
            const bool churrasqueira = true;
            DateTime dataAgendamento = new DateTime();
            string bloco = "";
            string ap = "";


            if (e.CommandName == "Delete")
            {


                int index = int.Parse((string)e.CommandArgument);
                dataAgendamento = Convert.ToDateTime(grdReservaProgramadaChurras.DataKeys[index]["dataAgendamento"]);

                if (validaCancelamento(dataAgendamento))
                {
                    bloco = Session["Bloco"].ToString();
                    ap = Session["Ap"].ToString();
                    oAP.apartamento = Convert.ToInt32(ap);
                    oAP.bloco = Convert.ToInt32(bloco);


                    try
                    {
                        oAgenda.cancelaAgendamentoMorador(dataAgendamento, oAP, salaoFesta, churrasqueira);
                        grdReservaProgramadaChurras.DataBind();
                    }
                    catch (Exception)
                    {

                        throw;
                    }
                }
        }
        }

        /// <summary>
        /// Regras para validar cancelamento de reservas de Apartamento
        /// </summary>
        /// <remarks>Autor: Edmilson
        /// data: 01/03/2013
        /// </remarks>
        /// <param name="dataAgendamento">dataAgendamento</param>
        /// <returns>True or false</returns>
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
                //lblMsg.Visible = true;
                //lblMsg.Text = "Só é permitido o cancelamento com 15 dias de antecedência e hoje faltam " + diasAgendado + " dias para reserva.";
                
                return false;
            }
        }

        

      
    }
}