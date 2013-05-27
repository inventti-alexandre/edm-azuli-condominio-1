using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Azuli.Web.Model;
using System.Data;
using System.Data.SqlClient;

namespace Azuli.Web.DAO
{
    public class PendenciaAdminDAO:AcessoDAO,Interfaces.IPendenciaAdmin
    {
        #region IPendenciaAdmin Members

        public ListaPendenciaAdmin listaPendenciaAdmin()
        {
            string clausulaSQL = "SP_PENDENCIAS_ADM";

            try
            {

                SqlCommand comandoSQL = new SqlCommand(clausulaSQL);
                DataTable tbPendencia = new DataTable();
                tbPendencia = ExecutaQuery(comandoSQL);

                return BuscaPendenciaAdmin(tbPendencia);


            }
            catch (Exception)
            {

                throw;
            }
            
        }

        private ListaPendenciaAdmin BuscaPendenciaAdmin(DataTable dt)
        {
            ListaPendenciaAdmin oListPendAdmin = new ListaPendenciaAdmin();

            foreach (DataRow dr in dt.Rows)
            {
                PendenciaAdmin pendencia = new PendenciaAdmin();

                if (dr.Table.Columns.Contains("CONTADOR_MENSAGEM_PENDENTE"))
                    pendencia.qtdMensagemPendente = Convert.ToInt32(dr["CONTADOR_MENSAGEM_PENDENTE"]);

                if (dr.Table.Columns.Contains("CONTADOR_OCORRENCIA"))
                    pendencia.qtdOcorrenciaPendente = Convert.ToInt32(dr["CONTADOR_OCORRENCIA"]);


                if (dr.Table.Columns.Contains("CONTADOR_MORADOR"))
                    pendencia.qtdMoradorPendente = Convert.ToInt32(dr["CONTADOR_MORADOR"]);

                if (dr.Table.Columns.Contains("CONTADOR_DENTRO_PRAZO"))
                    pendencia.qtdAgendaNoPrazo = Convert.ToInt32(dr["CONTADOR_DENTRO_PRAZO"]);

                if (dr.Table.Columns.Contains("CONTADOR_FORA_PRAZO"))
                    pendencia.qtdAgendaForaPrazo = Convert.ToInt32(dr["CONTADOR_FORA_PRAZO"]);





                oListPendAdmin.Add(pendencia);

            }

            return oListPendAdmin;
        }

        #endregion
    }
}
