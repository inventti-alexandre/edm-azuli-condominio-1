using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Azuli.Web.Model;
using System.Data.SqlClient;
using System.Data;

namespace Azuli.Web.DAO
{
    public class Agenda:AcessoDAO, Interfaces.IAgenda
    {



        #region IAgenda Members

		//Alterei aqui	
        public listAgenda listaReservaByMorador(ApartamentoModel oAp, AgendaModel oAgenda)
        {
            string clausulaSQL = "RESERVA_MORADOR_CHURRAS";

            try
            {
                SqlCommand comandoSQL = new SqlCommand(clausulaSQL);

                comandoSQL.Parameters.AddWithValue("@AP", oAp.apartamento);
                comandoSQL.Parameters.AddWithValue("@BLOCO", oAp.bloco);
                comandoSQL.Parameters.AddWithValue("@ANO", oAgenda.dataAgendamento.Year);
                comandoSQL.Parameters.AddWithValue("@MES", oAgenda.dataAgendamento.Month);


                DataTable tbAgenda = new DataTable();

                tbAgenda = ExecutaQuery(comandoSQL);

                return carregaAgenda(tbAgenda);

            }
            catch (Exception error)
            {

                throw error;
            }
        }

        public void cancelaAgendamentoMorador(DateTime dataAgendamento, ApartamentoModel ap)
        {
            string clausulaSQL = "CANCELA_RESERVA_MORADOR";

            try
            {
                SqlCommand comandoSQL = new SqlCommand(clausulaSQL);

                comandoSQL.Parameters.AddWithValue("@DATA_AGENDA", dataAgendamento);
                comandoSQL.Parameters.AddWithValue("@BLOCO", ap.bloco);
                comandoSQL.Parameters.AddWithValue("@AP", ap.apartamento);
               
                ExecutaQuery(comandoSQL);

            }
            catch (Exception error)
            {

                throw error;
            }


        }

        public listAgenda listaReservaByMoradorFesta(ApartamentoModel oAp, AgendaModel oAgenda)
        {
            string clausulaSQL = "RESERVA_MORADOR_FESTA";

            try
            {
                SqlCommand comandoSQL = new SqlCommand(clausulaSQL);

                comandoSQL.Parameters.AddWithValue("@AP", oAp.apartamento);
                comandoSQL.Parameters.AddWithValue("@BLOCO", oAp.bloco);
                comandoSQL.Parameters.AddWithValue("@ANO", oAgenda.dataAgendamento.Year);
                comandoSQL.Parameters.AddWithValue("@MES", oAgenda.dataAgendamento.Month);


                DataTable tbAgenda = new DataTable();

                tbAgenda = ExecutaQuery(comandoSQL);

                return carregaAgenda(tbAgenda);

            }
            catch (Exception error)
            {

                throw error;
            }
        }

        
        public void cadastrarAgenda(DateTime data,ApartamentoModel oAp, AgendaModel oAgenda)
        {
            string clausulaSQL = "CADASTRA_RESERVA_MORADOR";
            
            try
            {
                SqlCommand comandoSQL = new SqlCommand(clausulaSQL);

                comandoSQL.Parameters.AddWithValue("@DATA_AGENDA", data);
                comandoSQL.Parameters.AddWithValue("@BLOCO", oAp.bloco);
                comandoSQL.Parameters.AddWithValue("@AP", oAp.apartamento);
                comandoSQL.Parameters.AddWithValue("@FESTA", oAgenda.salaoFesta);
                comandoSQL.Parameters.AddWithValue("@CHURRAS", oAgenda.salaoChurrasco);



                ExecutaQuery(comandoSQL);

            }
            catch (Exception error)
            {
                
                throw error;
            }
        }



        public listAgenda listaEventos()
        {

            string clausulaSQL = "LISTA_EVENTOS";

            try
            {
                SqlCommand comandoSQL = new SqlCommand(clausulaSQL);


                DataTable tbAgenda = new DataTable();

                tbAgenda = ExecutaQuery(comandoSQL);

                return carregaAgenda(tbAgenda);

            }
            catch (Exception e)
            {

                throw e;
            }

        }



        public listAgenda listaEventos_ByData(DateTime date)
        {

            string clausulaSQL = "LISTA_EVENTOS_BY_DATA";

            try
            {
                SqlCommand comandoSQL = new SqlCommand(clausulaSQL);

                comandoSQL.Parameters.AddWithValue("@DATA_AGENDA", date);

                DataTable tbAgenda = new DataTable();

                tbAgenda = ExecutaQuery(comandoSQL);

                return carregaAgenda(tbAgenda);

            }
            catch (Exception e)
            {

                throw e;
            }


        }



        

        private listAgenda carregaAgenda(DataTable dt)
        {

            listAgenda oListaEventos = new listAgenda();

            foreach (DataRow dr in dt.Rows)
            {
                
                AgendaModel oAgendaModel = new AgendaModel();

                oAgendaModel.dataAgendamento = Convert.ToDateTime(dr["DATA_AGENDAMENTO"]);
                oAgendaModel.salaoChurrasco = dr["SALAO_CHURRASCO"].ToString();
                oAgendaModel.salaoFesta = dr["SALAO_FESTA"].ToString();
                oAgendaModel.ap = new ApartamentoModel();

                if (dr.Table.Columns.Contains("PROPRIETARIO_AP")) 
                 oAgendaModel.ap.apartamento =  Convert.ToInt32(dr["PROPRIETARIO_AP"]);

                if (dr.Table.Columns.Contains("PROPRIETARIO_BLOCO")) 
                oAgendaModel.ap.bloco = Convert.ToInt32(dr["PROPRIETARIO_BLOCO"]);

                oListaEventos.Add(oAgendaModel);
                               
            }

            return oListaEventos;

        }






       

        #endregion
    }
}
