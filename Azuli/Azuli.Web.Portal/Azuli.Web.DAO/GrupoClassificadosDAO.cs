using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;

namespace Azuli.Web.DAO
{
    public class GrupoClassificadosDAO:AcessoDAO, Interfaces.IGrupoClassificados
    {


        #region IGrupoClassificados Members
        string acao = "";
        public void cadastrarGrupoClassificados(Model.GrupoClassificados OgrupoClassifica)
        {
            string clausulaSQL = "SP_CLASSIFICADO_GRUPO";

            try
            {
                SqlCommand comandoSql = new SqlCommand(clausulaSQL);

                acao = "I";

                comandoSql.Parameters.AddWithValue("@Acao",acao);
                comandoSql.Parameters.AddWithValue("@Classificado_Grupo", OgrupoClassifica.grupoClassificado);
                comandoSql.Parameters.AddWithValue("@Classificado_Descricao", OgrupoClassifica.descricacaoGrupoClassificado);
                comandoSql.Parameters.AddWithValue("@Classificado_Status", OgrupoClassifica.statusClassificado);
                comandoSql.Parameters.AddWithValue("@Classificado_Grupo_Img", OgrupoClassifica.imgGrupoClassificado);

            }
            catch (Exception)
            {
                
                throw;
            }
        }

        public void alteraGrupoClassificados(Model.GrupoClassificados oGrupoClassifica)
        {
            throw new NotImplementedException();
        }

        #endregion
    }
}
