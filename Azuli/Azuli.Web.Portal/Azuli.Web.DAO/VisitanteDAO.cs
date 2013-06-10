using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Azuli.Web.Model;
using System.Data;
using System.Data.SqlClient;

namespace Azuli.Web.DAO
{
    public class VisitanteDAO: AcessoDAO
    {

        public void cadastraVisitante(Model.Visitante oVisitante)
        {
            string clausulaSQL = "SP_VISITANTE";

            try
            {
                SqlCommand comandoSql = new SqlCommand(clausulaSQL);
                comandoSql.Parameters.AddWithValue("@VisitanteNome", oVisitante.visitanteNome);
                comandoSql.Parameters.AddWithValue("@VisitanteRG", oVisitante.visitanteRG);
                comandoSql.Parameters.AddWithValue("@VisitanteTipo", oVisitante.visitanteTipo);
                
                ExecutaComando(comandoSql);

            }
            catch (Exception e)
            {

                throw e;
            }
        }

        /// <summary>
        /// Atualiza apenas as variáveis que foram alteradas filtrada pelo ID do cliente
        /// --Autor: Leando Vilela
        /// </summary>
        /// <param name="oVisitante"></param>
        public void atualizaVisitante(Model.Visitante oVisitante)
        {
            string clausulaSQL = "SP_ATUALIZA_VISITANTE";

            try
            {
                SqlCommand comandoSql = new SqlCommand(clausulaSQL);
                comandoSql.Parameters.AddWithValue("@VisitanteId", oVisitante.visitanteId);
                comandoSql.Parameters.AddWithValue("@VisitanteNome", oVisitante.visitanteNome);
                comandoSql.Parameters.AddWithValue("@VisitanteRG", oVisitante.visitanteRG);
                comandoSql.Parameters.AddWithValue("@VisitanteTipo", oVisitante.visitanteTipo);

                ExecutaComando(comandoSql);

            }
            catch (Exception e)
            {

                throw e;
            }
        }

        /// <summary>
        /// Procura o visitante pelo RG e retorna todas as informações do cadastro em uma lista de visitantes
        /// --Autor: Leandro Vilela
        /// </summary>
        /// <param name="oVisitante"></param>
        public listaVisitante procuraVisitanteRG(Visitante oVisitante)
        {
            
            string clausulaSQL = "SP_PROCURA_VISITANTE_RG";
            

            try
            {
                SqlCommand comandoSql = new SqlCommand(clausulaSQL);
                comandoSql.Parameters.AddWithValue("@VisitanteId", oVisitante.visitanteId);
                comandoSql.Parameters.AddWithValue("@VisitanteNome", oVisitante.visitanteNome);
                comandoSql.Parameters.AddWithValue("@VisitanteRG", oVisitante.visitanteRG);
                comandoSql.Parameters.AddWithValue("@VisitanteTipo", oVisitante.visitanteTipo);

                DataTable tbVisitante = new DataTable();
                tbVisitante = ExecutaQuery(comandoSql);
                return populaVisitante(tbVisitante);
            }
            catch (Exception e)
            {

                throw e;
            }
        }

        /// <summary>
        /// Procura visitante pelo nome, pode retornar mais que um nome, pois a Stored Procedure usa Like no nome
        /// --Auto: Leandro Vilela
        /// </summary>
        /// <param name="oVisitante"></param>
        public listaVisitante procuraVisitanteNome(Model.Visitante oVisitante)
        {
            string clausulaSQL = "SP_PROCURA_VISITANTE_NOME";

            try
            {
                SqlCommand comandoSql = new SqlCommand(clausulaSQL);
                comandoSql.Parameters.AddWithValue("@VisitanteId", oVisitante.visitanteId);
                comandoSql.Parameters.AddWithValue("@VisitanteNome", oVisitante.visitanteNome);
                comandoSql.Parameters.AddWithValue("@VisitanteRG", oVisitante.visitanteRG);
                comandoSql.Parameters.AddWithValue("@VisitanteTipo", oVisitante.visitanteTipo);

                DataTable tbVisitante = new DataTable();
                tbVisitante = ExecutaQuery(comandoSql);
                return populaVisitante(tbVisitante);

            }
            catch (Exception e)
            {

                throw e;
            }
        }

        /// <summary>
        /// Cria uma lista de visitante 
        /// --Auto: Leandro Vilela
        /// </summary>
        /// <param name="dt">DataTable</param>
        /// <returns></returns>
        private listaVisitante populaVisitante(DataTable dt)
        {
            listaVisitante olistaVisitante = new listaVisitante();

            foreach (DataRow itemVisitante in dt.Rows)
            {
                Visitante oVisitante = new Visitante();

                if (itemVisitante.Table.Columns.Contains("Visitante_Id"))
                    oVisitante.visitanteId = Convert.ToInt32(itemVisitante["Visitante_id"]);

                if (itemVisitante.Table.Columns.Contains("Visitante_RG"))
                    oVisitante.visitanteRG = Convert.ToString(itemVisitante["Visitante_RG"]);

                if (itemVisitante.Table.Columns.Contains("Visitante_Nome"))
                    oVisitante.visitanteNome = Convert.ToString(itemVisitante["Visitante_Nome"]);

                if (itemVisitante.Table.Columns.Contains("VisitanteTipo"))
                    oVisitante.visitanteTipo = itemVisitante["VisitanteTipo"].ToString();

                olistaVisitante.Add(oVisitante);
                
            }

            return olistaVisitante;
        }
    }
}
