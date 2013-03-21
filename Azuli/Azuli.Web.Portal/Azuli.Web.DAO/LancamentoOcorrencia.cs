using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using Azuli.Web.Model;
using System.Data;

namespace Azuli.Web.DAO
{
    public class LancamentoOcorrencia : AcessoDAO, Interfaces.ILancamentoOcorrencia
    {


        #region ILancamentoOcorrencia Members

        public listaLancamentoOcorrencia buscaOcorrenciaByMeses(LancamentoOcorrenciaModel olancamento, int mes)
        {
            string clausulaSQL = "LISTA_OCORRENCIA_MORADOR";

            try
            {
                SqlCommand comandoSQL = new SqlCommand(clausulaSQL);

                comandoSQL.Parameters.AddWithValue("@BLOCO", olancamento.oAp.bloco);
                comandoSQL.Parameters.AddWithValue("@AP", olancamento.oAp.apartamento);
                comandoSQL.Parameters.AddWithValue("@MES", mes);

                DataTable tbLancamento = new DataTable();

                tbLancamento = ExecutaQuery(comandoSQL);

                return populaOcorrencia(tbLancamento);

            }
            catch (Exception)
            {
                
                throw;
            }
        
        }


        public listaLancamentoOcorrencia populaOcorrencia(System.Data.DataTable dt)
        {
            listaLancamentoOcorrencia olist = new listaLancamentoOcorrencia();


            foreach (DataRow itemOcorrencia in dt.Rows)
            {
                LancamentoOcorrenciaModel oLancamento = new LancamentoOcorrenciaModel();
                OcorrenciaModel oOcorrencia = new OcorrenciaModel();
                oLancamento.codigoOcorrencia = Convert.ToInt32(itemOcorrencia["OCORRENCIA"]);
                oLancamento.dataOcorrencia = Convert.ToDateTime(itemOcorrencia["DATA_OCORRENCIA"]);
                oLancamento.statusOcorrencia = itemOcorrencia["STATUS"].ToString();
                oLancamento.ocorrenciaLancamento = itemOcorrencia["DESCRICAO"].ToString();
                oLancamento.dataFinalizacao = Convert.ToDateTime(itemOcorrencia["DATA_FINALIZACAO"]);
                oLancamento.dataCancelamento = Convert.ToDateTime(itemOcorrencia["DATA_CANCELAMENTO"]);
                oLancamento.descricaoOcorrencia = itemOcorrencia["DescricaoOcorrencia"].ToString();
                oLancamento.imagemEvidencia = itemOcorrencia["imagem"].ToString();

                olist.Add(oLancamento);

                
            }

            return olist;
        }

        #endregion
    }
}
