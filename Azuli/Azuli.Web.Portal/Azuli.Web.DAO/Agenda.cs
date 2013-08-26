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

        
        public void cancelaAgendamentoMorador(DateTime dataAgendamento, ApartamentoModel ap, bool festa, bool churras)
        {
            string clausulaSQL = "CANCELA_RESERVA_MORADOR";

           
            try
            {
                SqlCommand comandoSQL = new SqlCommand(clausulaSQL);

                comandoSQL.Parameters.AddWithValue("@DATA_AGENDA", dataAgendamento);
                comandoSQL.Parameters.AddWithValue("@BLOCO", ap.bloco);
                comandoSQL.Parameters.AddWithValue("@AP", ap.apartamento);
                comandoSQL.Parameters.AddWithValue("@FESTA", festa);
                comandoSQL.Parameters.AddWithValue("@CHURRAS", churras);
               
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

        public listAgenda listaReservaDetalhadaChurrasco(int ano, int mes)
        {
            string clausulaSQL = "RESERVA_MORADOR_CHURRAS_DETALHADA";

            try
            {
                SqlCommand comandoSQL = new SqlCommand(clausulaSQL);

                comandoSQL.Parameters.AddWithValue("@ANO", ano);
                comandoSQL.Parameters.AddWithValue("@MES", mes);


                DataTable tbAgenda = new DataTable();

                tbAgenda = ExecutaQuery(comandoSQL);

                return carregaAgenda(tbAgenda);

            }
            catch (Exception error)
            {

                throw error;
            }
        }

        public listAgenda listaReservaDetalhadaFesta(int ano, int mes)
        {
            string clausulaSQL = "RESERVA_MORADOR_FESTA_DETALHADA";

            try
            {
                SqlCommand comandoSQL = new SqlCommand(clausulaSQL);

             
                comandoSQL.Parameters.AddWithValue("@ANO", ano);
                comandoSQL.Parameters.AddWithValue("@MES", mes);


                DataTable tbAgenda = new DataTable();

                tbAgenda = ExecutaQuery(comandoSQL);

                return carregaAgenda(tbAgenda);

            }
            catch (Exception error)
            {

                throw error;
            }
        }

        public listAgenda listaReservaByMoradorAdmin(AgendaModel oAgenda)
        {
            string clausulaSQL = "CONSULTA_RESERVA_MORADOR";

            try
            {
                SqlCommand comandoSQL = new SqlCommand(clausulaSQL);

               
                comandoSQL.Parameters.AddWithValue("@ANO", oAgenda.dataAgendamento.Year);
                comandoSQL.Parameters.AddWithValue("@MES", oAgenda.dataAgendamento.Month);
                comandoSQL.Parameters.AddWithValue("@AREA_CHURRAS", oAgenda.salaoChurrasco);
                comandoSQL.Parameters.AddWithValue("@AREA_FESTA", oAgenda.salaoFesta);

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


        public listAgenda listaEventos_ByCalendar(DateTime date)
        {
            string clausulaSQL = "LISTA_EVENTOS_CALENDAR";

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

                if (dr.Table.Columns.Contains("DATA_AGENDAMENTO")) 
                oAgendaModel.dataAgendamento = Convert.ToDateTime(dr["DATA_AGENDAMENTO"]);

                if (dr.Table.Columns.Contains("SALAO_CHURRASCO")) 
                oAgendaModel.salaoChurrasco = Convert.ToBoolean(dr["SALAO_CHURRASCO"]);

                if (dr.Table.Columns.Contains("SALAO_FESTA")) 
                    oAgendaModel.salaoFesta = Convert.ToBoolean(dr["SALAO_FESTA"]);
                
                oAgendaModel.ap = new ApartamentoModel();

                if (dr.Table.Columns.Contains("PROPRIETARIO_AP")) 
                 oAgendaModel.ap.apartamento =  Convert.ToInt32(dr["PROPRIETARIO_AP"]);

                if (dr.Table.Columns.Contains("PROPRIETARIO_BLOCO")) 
                oAgendaModel.ap.bloco = Convert.ToInt32(dr["PROPRIETARIO_BLOCO"]);

                if (dr.Table.Columns.Contains("ap"))
                    oAgendaModel.ap.apartamento = Convert.ToInt32(dr["ap"]);

                if (dr.Table.Columns.Contains("bloco"))
                    oAgendaModel.ap.bloco = Convert.ToInt32(dr["bloco"]);



                if (dr.Table.Columns.Contains("COUNT_FESTA"))
                   oAgendaModel.contadorFesta = Convert.ToInt32(dr["COUNT_FESTA"]);

                if (dr.Table.Columns.Contains("COUNT_CHURRAS"))
                    oAgendaModel.contadorChurrasco = Convert.ToInt32(dr["COUNT_CHURRAS"]);

                if (dr.Table.Columns.Contains("PAGO"))
                    oAgendaModel.statusPagamento = dr["PAGO"].ToString();


                oListaEventos.Add(oAgendaModel);
                               
            }

            return oListaEventos;

        }



        public listAgenda validaAgendamento(DateTime data, ApartamentoModel oAp, AgendaModel oAgenda)
        {

            string clausulaSQL = "VALIDA_CADASTRO_AGENDA";

            try
            {
                SqlCommand comandoSQL = new SqlCommand(clausulaSQL);

                comandoSQL.Parameters.AddWithValue("@DATA_AGENDA", data);
                comandoSQL.Parameters.AddWithValue("@BLOCO", oAp.bloco);
                comandoSQL.Parameters.AddWithValue("@AP", oAp.apartamento);
                comandoSQL.Parameters.AddWithValue("@FESTA", oAgenda.salaoFesta);
                comandoSQL.Parameters.AddWithValue("@CHURRAS", oAgenda.salaoChurrasco);
                
                DataTable tbAgenda = new DataTable();

                tbAgenda = ExecutaQuery(comandoSQL);

                return carregaAgenda(tbAgenda);

            }
            catch (Exception error)
            {

                throw error;
            }
           
        }

      
       


       

        #endregion
    }
}
